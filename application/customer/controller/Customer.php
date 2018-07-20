<?php
namespace app\customer\controller;
use think\Controller;
use think\Request;
use think\Db;
use app\common\controller\Common;
use think\image\Exception;
use think\Log;
//header("Access-Control-Allow-Origin: *");
/**
 * 2018-01-31 客户管理模块/场地管理模块
 */
class Customer extends Common
{
    private $userId = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->userId = session("userId");
//        if(request()->isMobile()) {
            if (empty(session("iqbtId"))) {
                session("iqbtId", 1);
            }
//        }
        //nav
//        $this->assign("nav", 'customer');
    }

    /*public function index()
    {
        $msgList = [['messageId' => 1, 'title' => 'bia'], ['messageId' => 2, 'title' => 'bia'], ['messageId' => 1, 'title' => 'bia']];
        $this->assign('msgList', $msgList);
        return view();
    }*/

    /**
     * 客户列表-各标签及角标数量
     */
    public function cusNumber()
    {
        try {
            $field = 'sum(case when cstmstatus = 6002001 then 1 else 0 end)as qnum,sum(case when cstmstatus = 6002002 then 1 else 0 end)as ynum,sum(case when cstmstatus = 6002003 then 1 else 0 end)as nnum,sum(case when cstmstatus = 6002004 then 1 else 0 end)as wnum,sum(case when backlog = 1 then 1 else 0 end)as newnum,count(id)as totalnum';
            $numArr = getDataList('Etprs', ['iqbtId' => ['in', session("iqbtId")], 'a.status' => ['<=', 6008002]], $field);//求出各状态数量
            if ($numArr['code'] == 0) {
                throw new \think\Exception('获取各状态客户数量失败' . $numArr['msg']);
            }
            $numArr = $numArr['data'][0];
//            dump($numArr);exit;
            foreach($numArr as $k=>$v){
                $numArr[$k] =$v?$v:'0';//数量
            }
            $nameArr = ['潜在客户', '意向客户', '拟入驻客户', '无效客户', '待办', '全部'];//名称数组
            $data = [];
            $key = array_keys($numArr);
            for ($i = 0; $i < 6; $i++) {
                $data['data'][$i]['name'] = $nameArr[$i];//名称
                $data['data'][$i]['code'] = '600200'.$i+1;//code
                $data['data'][$i]['num'] = $numArr[$key[$i]];//数量
                $data['data'][$key[$i]] = $numArr[$key[$i]];//pc端待渲染数据
            }
            $data['data'][5]['code'] = '';
            /*待办0不显示角标*/
            if ($numArr['newnum'] == 0) {
                unset($data['data']['newnum']);
            }
//            dump($data);
            return json($data);
        } catch (\Exception $e) {
            c_Log($e);//记录事务
            return array('code' => 0, 'msg' => $e->getMessage(), 'data' => []);
        }
    }

    /**
     * 客户列表获取
     * @param status 状态条件
     * @param start 创建时间-起
     * @param end   创建时间-止
     * @param search 客户名称或者手机号
     * @return array| total=>总数 data=>数据
     */
    public function getCusList()
    {
        $con = [];
        $con['a.iqbtId'] = ['in', session("iqbtId")];
        $postData = input('');
        //分页条件
        $limit = !empty($postData["limit"]) ? $postData["limit"] : '';
        $offset = !empty($postData["offset"]) ? $postData["offset"] : '';
        //状态条件
        if (!empty($postData["status"])) {
            $con["a.cstmstatus"] = $postData["status"];
        }
        //入驻状态(只查发起入驻前,和发起入驻的);
        $con["a.status"] = ['<=', 6008002];
        //排序
        if (!empty($postData['sort'])) {
            //转化排序字段
            switch ($postData['sort']) {
                case"sourceText":
                    $postData['sort'] = 'source';
                    break;
                case"cstmstatusText":
                    $postData['sort'] = 'cstmstatus';
                    break;
                case"realname":
                    $postData['sort'] = 'cstmstatus';
                    break;
                default:
                    break;
            }
            if (!empty($postData['order'])) {
                $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
            } else {
                $order = 'a.' . $postData['sort'] . ' asc';
            }
        } else {
//            $order = 'a.backlog desc,a.cstmstatus asc,a.addtime asc,a.flowtime asc';//默认排序
            $order = 'a.backlog desc,a.cstmstatus asc,a.flowtime desc';//默认排序
        }
        //搜索框
        if (isset($postData['search']) && !empty($postData['search'])) {
            $con['a.name|a.mobile'] = array('like', '%' . $postData['search'] . "%");
        }
        try {
            //时间筛选://转化为时间戳
            $postData['start'] = !empty($postData['start']) ? strtotime($postData['start']) : '';
            $postData['end'] = !empty($postData['start']) ? strtotime($postData['end']) + 86400 - 1 : '';//结束时间为end第二天的0点
            if (!empty($postData['start']) && !empty($postData['end'])) {//开始结束都存在
                if ($postData['start'] > $postData['end']) {
                    throw new \think\Exception('开始时间不能大于结束时间');
                }
                $con['a.addtime'] = array('between', [$postData['start'], $postData['end']]);
            } else if (empty($postData['start']) && !empty($postData['end'])) {//开始为空
                $con['a.addtime'] = ['<', $postData['end']];
            } else if (!empty($postData['start']) && empty($postData['end'])) {//结束为空
                $con['a.addtime'] = ['>', $postData['start']];
            }
            //数据总数
            $totalrecord = getRecordNum('etprs', $con);
            //获取数据
            $msg = getDataList('etprs', $con, "a.id,a.name,a.addtime,a.backlog,a.contact,a.mobile,a.source,a.cstmstatus,a.flowtime", $order, [], '', $limit,$offset);
            if ($msg['code'] != 1) {
                throw new \think\Exception('获取客户列表数据失败:' . $msg['msg']);
            } else {
                if (!empty($msg['data'])) {
                    //获取字典表字段名称
                    $tmplist = $this->getDictStr('*', 'Etprs');
                    $msg['data'] = $this->setListIdText($msg['data'], $tmplist);
                    //格式化时间戳
                    foreach ($msg['data'] as $k => $v) {
                        //跟进人
                        $res=Db::query('select realname from ibt_user where id=(select adduserId from ibt_flow where etprsId ='.$v['id'].' order by addtime desc limit 0,1)');
//                        dump($res);
                        $msg['data'][$k]['realname']=!empty($res[0]['realname'])?$res[0]['realname']:'';
                        $msg['data'][$k]['addtime'] = empty($v['addtime']) ? '' : date('Y-m-d', $v['addtime']);
                        $msg['data'][$k]['flowtime'] = empty($v['flowtime']) ? '' : date('Y-m-d', $v['flowtime']);
                    }
                }
            }
//            dump($msg['data']);
            return json(array('total' => $totalrecord, 'rows' => $msg['data']));
        } catch (\Exception $e) {
            c_Log($e);
            return array('total' => 0, 'rows' => [], 'msg' => $e->getMessage());
        }
    }

    /**
     * 编辑时候获取客户数据
     * @param int $id 要查找的客户Id
     * @return array|null
     */
    public function cusInfo($id = 0)
    {
        try {
            $join = [['user b', 'a.adduserId=b.id and b.isDelete=0', 'left']];
            $field = 'a.id,a.name,a.type,a.contact,a.mobile,a.source,a.cstmstatus,a.iqbtId,a.backlog,a.rqst_build,a.rqst_floor,a.rqst_roomNo,a.rqst,a.rqst_start,a.rqst_end,a.addtime as addtime,b.realname as addUser';
            //获取当前客户数据
            $data = findById('etprs', ['a.id' => $id], $field, '', $join);
//            dump($data);
            if ($data['code'] != 1) {
                throw new \think\Exception('获取客户信息失败:' . $data['msg']);
            }
            //格式化时间戳
            $data['data']['rqst_start'] = empty($data['data']['rqst_start']) ? '' : date('Y-m-d', $data['data']['rqst_start']);
            $data['data']['rqst_end'] = empty($data['data']['rqst_end']) ? '' : date('Y-m-d', $data['data']['rqst_end']);
            $data['data']['addtime'] = empty($data['data']['addtime']) ? '' : date('Y-m-d', $data['data']['addtime']);
            /*******微信公众号:拼 需求房间*******/
            $roomStr='';
            if(!empty($data['data']['rqst_build'])){//如果楼座不为空
                $build=findById('build',['id'=>$data['data']['rqst_build']],'name');
                $roomStr=$build['data']['name'];
                if($build['code']==0){
                    throw new \think\Exception('获取楼座名失败'.$build['msg']);
                }
                if(!empty($data['data']['rqst_floor'])){//如果楼层也不为空
                    $floor=findById('floor',['id'=>$data['data']['rqst_floor']],'floor');
                    if($floor['code']==0){
                        throw new \think\Exception('获取楼层名失败'.$floor['msg']);
                    }
                    $roomStr.='/'.$floor['data']['floor'].'层';
                }
            }
            //如果房间不为空
            if(!empty($data['data']['rqst_roomNo'])){
                $roomStr=empty($roomStr)?$data['data']['rqst_roomNo']:$roomStr.'/'.$data['data']['rqst_roomNo'];
            }
            $data['data']['rqst_room']=$roomStr;
            return json($data);
        } catch (\Exception $e) {
            c_log($e);
            return json(array('code' => 0, 'msg' => $e->getMessage(), 'data' => []));
        }
    }

    /**
     * 保存用户信息(编辑/新增)
     * @return array
     */
    public function saveCusInfo()
    {
        $infoData = input('post.', null, 'trim');
        try {
            //如果意向楼座不为空,获取空间id
            if (empty($infoData['iqbtId'])) {//下一版有空间选择,直接传值,不需要以下操作
                if(!empty($infoData['rqst_build'])){
                    $infoData['iqbtId'] = getField('build', ['id' => $infoData['rqst_build']], 'iqbtId');//意向楼座的所属空间id
                }else{
                    $infoData['iqbtId'] = session('iqbtId');
                }
                if($infoData['iqbtId'] == ''){
                    throw new \think\Exception("获取意向楼座所属空间id失败");
                }
            }
            $statuslog = false;//是否修改跟进状态
            //判断编辑还是新增
            if (!empty($infoData['id'])) {
                $logcode = 6012002;//日志代码:编辑
                $logname = "编辑客户信息";//日志名称:编辑
                $vld = $this->validate($infoData, 'Cstm.edit');
                if ($vld !== true) {
                    throw new \think\Exception($vld);
                }
                //如果是编辑 :判断是否修改状态
                $cstm = findById('etprs', ['id' => $infoData['id']], 'cstmstatus');
                if ($cstm['code'] == 0) {
                    throw new \think\Exception('获取原状态失败:' . $cstm['msg']);
                }
                if ($cstm['data']['cstmstatus'] != $infoData['cstmstatus']) {
                    $province = $cstm['data']['cstmstatus'];
                    $statuslog = true;//状态修改,需要添加状态修改日志
                }
            } else {
                $infoData['datafrom'] = 6023001;//数据来源
                $logcode = 6012006;//日志代码:新增
                $logname = "新增客户";//日志名称:新增
                $vld = $this->validate($infoData, 'Cstm.insert');
                if ($vld !== true) {
                    throw new \think\Exception($vld);
                }
            }
            //如果更改状态为 拟入驻 6002003 将客户入驻状态(status)改为 发起入驻 6008002,其他都为发起入驻前6008001;
            $infoData['status'] = $infoData['cstmstatus'] == 6002003 ? 6008002 : 6008001;
            //日期转化为时间戳
            $infoData['rqst_start'] = !empty($infoData['rqst_start']) ? strtotime($infoData['rqst_start']) : 0;
            $infoData['rqst_end'] = !empty($infoData['rqst_end']) ? strtotime($infoData['rqst_end']) : 0;
            //开始事务
            Db::startTrans();
            //保存客户信息
            $data = saveData('etprs', $infoData);
            if ($data['code'] == 1) {
                // 写入日志:新增/编辑客户
                $logRes = saveLog($logcode, $logname, $data['data'], 'etprs', $data['data']);
                if ($logRes['code'] == 0) {
                    throw new \think\Exception("新增-" . $logname . "-操作记录失败:" . $logRes['msg']);
                }
                //如果是新增客户,保存跟进状态信息
                if ($logname == '新增客户') {
                    // 写入日志:状态修改
                    $logRes = saveLog(6012040, "招商客户状态变化", $data['data'], 'etprs', $data['data'], 0, $infoData['cstmstatus']);
                    if ($logRes['code'] == 0) {
                        throw new \think\Exception("新增-招商客户状态变化-操作记录失败:" . $logRes['msg']);
                    }
                    // 写入日志:入驻状态修改
                    $logRes = saveLog(6012041, "入驻客户状态变化", $data['data'], 'etprs', $data['data'], 0, $infoData['status']);
                    if ($logRes['code'] == 0) {
                        throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                    }
                }
                //如果修改了跟进状态(编辑)
                if ($statuslog) {
                    // 写入日志:状态修改
                    $logRes = saveLog(6012040, "招商客户状态变化", $data['data'], 'etprs', $data['data'], $province, $infoData['cstmstatus']);
                    if ($logRes['code'] == 0) {
                        throw new \think\Exception("新增-招商客户状态变化-操作记录失败:" . $logRes['msg']);
                    }
                    //如果是改为拟入驻了,新增日志
                    if ($infoData['status'] == 6008002) {
                        // 写入日志:入驻状态修改
                        $logRes = saveLog(6012041, "入驻客户状态变化", $data['data'], 'etprs', $data['data'], 6008001, 6008002);
                        if ($logRes['code'] == 0) {
                            throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                        }
                    }
                    //如果修改为其他状态,要判断原状态是否是拟入驻
                    if ($province == 6002003) {
                        // 写入日志:入驻状态修改
                        $logRes = saveLog(6012041, "入驻客户状态变化", $data['data'], 'etprs', $data['data'], 6008002, 6008001);
                        if ($logRes['code'] == 0) {
                            throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                        }
                    }
                }
            } else {
                throw new \think\Exception("保存客户信息失败:" . $data['msg']);
            }
            Db::commit();
            $data['url'] = "{:url('customer/Customer/index')}";
            return $data;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    /**
     * 跟进列表
     * @param int $id 客户id
     * @return array
     */
    function flowList($id = 0)
    {
        try {
            $con['a.etprsId'] = $id;;
            $join = [['user d', 'a.adduserId =d.id and d.isDelete=0', 'left']];
            //获取跟进信息
            $data = getDataList('flow', $con, 'a.reason,a.cstmstatus,a.addtime,a.adduserId,a.desc,d.realname as adduserId', 'a.addtime desc', $join);
            if ($data['code'] != 1) {
                throw new \think\Exception('获取客户跟进列表失败:' . $data['msg']);
            } else if (!empty($data['data'])) {
                //获取字典表字段名称
                $tmplist = $this->getDictStr('*', 'Flow');
                $data['data'] = $this->setListIdText($data['data'], $tmplist);
                //格式化时间戳
                foreach ($data['data'] as $k => $v) {
                    $data['data'][$k]['addtime'] = empty($v['addtime']) ? '' : date('Y-m-d H:i', $v['addtime']);
                }
            }
            return json($data);
        } catch (\Exception $e) {
            c_Log($e);
            return json(array('code' => 0, 'msg' => $e->getMessage()));
        }
    }

    /**
     * 保存跟进信息
     */
    function saveFlowInfo()
    {
        $infoData = input('post.', null, 'trim');
        $vld = $this->validate($infoData, 'cstm.flow');//校验
        //新增跟进信息
        try {
            if ($vld === true) {
                Db::startTrans();
                $statuslog = false;
                //查询客户原状态
                $cstm = findById('etprs', ['id' => $infoData['etprsId']], 'cstmstatus');
                if ($cstm['code'] == 0) {
                    throw new \think\Exception('获取原状态失败:' . $cstm['msg']);
                }
                //判断状态是否有修改
                if ($cstm['data']['cstmstatus'] != $infoData['cstmstatus']) {
                    $statuslog = true;//状态修改了,需要添加状态修改日志
                }
                //保存跟进信息
                $data = saveData('flow',$infoData);
                if ($data['code'] == 1) {
                    //写入日志
                    $logRes = saveLog('6012003', '跟进客户', $data['data'], 'flow', $infoData['etprsId']);
                    if ($logRes['code'] != 1) {
                        throw new \think\Exception("新增-跟进客户-操作记录失败:" . $logRes['msg']);
                    }
                    /*客户表数据更新*/
                        //客户表要保存的信息
                    $cstmInfo['id'] = $infoData['etprsId'];
                    $cstmInfo['flowtime'] = time();//跟进时间
                    $cstmInfo['backlog'] = 0;//待办改为0
                    if ($statuslog) {//如果修改了客户状态
                        $cstmInfo['cstmstatus'] = $infoData['cstmstatus'];
                        $cstmInfo['status']=$infoData['cstmstatus'] == 6002003?6008002:6008001; //如果更改状态为 拟入驻 6002003 将客户入驻状态(status)改为 发起入驻 6008002
                    }
                    $cstmres = saveData('etprs', $cstmInfo);//保存客户表数据
                    if ($cstmres['code'] == 0) {
                        throw new \think\Exception("更新客户表失败:" . $cstmres['msg']);
                    }
                    // 写入日志:状态修改
                    if ($statuslog) {
                        $logRes = saveLog(6012040, "招商客户状态变化", $cstmInfo['id'], 'etprs', $cstmInfo['id'], $cstm['data']['cstmstatus'], $infoData['cstmstatus']);
                        if ($logRes['code'] == 0) {
                            throw new \think\Exception("新增-招商客户状态变化-操作记录失败:" . $logRes['msg']);
                        }
                        //如果是改为拟入驻了,新增入驻状态日志
                        if ($cstmInfo['status'] == 6008002) {
                            // 写入日志:入驻状态修改
                            $logRes = saveLog(6012041, "入驻客户状态变化", $cstmInfo['id'], 'etprs', $cstmInfo['id'], 6008001, 6008002);
                            if ($logRes['code'] == 0) {
                                throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                            }
                        }
                        //如果修改为其他状态,要判断原状态是否是拟入驻
                        if ($cstm['data']['cstmstatus'] == 6002003) {
                            // 写入日志:入驻状态修改
                            $logRes = saveLog(6012041, "入驻客户状态变化", $cstmInfo['id'], 'etprs', $cstmInfo['id'], 6008002, 6008001);
                            if ($logRes['code'] == 0) {
                                throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                            }
                        }
                    }
                } else {
                    throw new \think\Exception("保存跟进信息失败:" . $data['msg']);
                }
            } else {
                throw new \think\Exception($vld);//返回校验错误信息
            }
            Db::commit();
            return $data;
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    /**
     * 导出excel
     */
    public function exportCus()
    {
        try {
            $postData = input('', null, 'trim');
            //excel表格title
            $title = '';
            //查询条件
            $con = [];
            $con['iqbtId'] = ['in', session('iqbtId')];
            if (!empty($postData['search'])) {
                $con['a.name|a.mobile'] = array('like', '%' . $postData['search'] . "%");
            }
            //状态条件
            if (!empty($postData["status"])) {
                $con["a.cstmstatus"] = $postData["status"];
                $title = getField('sysDict', ['code' => $postData["status"]], 'name');
            }
            //时间筛选://转化为时间戳
            $postData['start'] = !empty($postData['start']) ? strtotime($postData['start']) : '';
            $postData['end'] = !empty($postData['start']) ? strtotime($postData['end']) + 86400 : '';//结束时间为end第二天的0点
            if (!empty($postData['start']) && !empty($postData['end'])) {//开始结束都存在
                if ($postData['start'] > $postData['end']) {
                    throw new \think\Exception('开始时间不能大于结束时间');
                }
                $con['a.addtime'] = array('between', [$postData['start'], $postData['end']]);
            } else if (empty($postData['start']) && !empty($postData['end'])) {//开始为空
                $con['a.addtime'] = ['<', $postData['end']];
            } else if (!empty($postData['start']) && empty($postData['end'])) {//结束为空
                $con['a.addtime'] = ['>', $postData['start']];
            }
            //入驻状态为6008001-2
            $con['a.status'] = ['<=', 6008002];
            vendor("PHPExcel");
            vendor("PHPExcel.Writer.Excel2007");
            vendor("PHPExcel.IOFactory");
            //列名
            $header = array('客户类型', '客户名称', '创建时间', '联系人', '联系电话', '详细需求', '来源渠道', '客户状态', '跟进时间');
            $join = [['sysDict b', 'a.type=b.code  and b.isDelete=0', 'left'], ['sysDict c', 'a.source=c.code  and c.isDelete=0', 'left'], ['sysDict d', 'a.cstmstatus=d.code and d.isDelete=0', 'left']];
            $order = 'a.backlog desc,a.cstmstatus asc,a.flowtime desc';//默认排序
            //取出数据
            $list = getDataList('Etprs', $con, 'b.name as type,a.name,a.addtime,a.contact,a.mobile,a.rqst,c.name as source,d.name as cstmstatus,a.flowtime', $order, $join, '', 1000);
//        dump($list);exit;
            if (!empty($list["data"])) {
                $data = $list['data'];
                //格式化时间戳
                foreach ($data as $k => $v) {
                    $data[$k]['addtime'] = $v['addtime'] ? date('Y-m-d', $v['addtime']) : '';
                    $data[$k]['flowtime'] = $v['flowtime'] ? date('Y-m-d', $v['flowtime']) : '';
                }
                $logRes = saveLog('6012004', '导出客户', 0, 'etprs', 0);
                if ($logRes['code'] != 1) {
                    throw new \think\Exception("新增-导出客户-操作记录失败:" . $logRes['msg']);
                }
                getExcel("客户信息_" . $title, $header, $data);

            } else {
                $data = [];
                return "没有相关数据";
            }
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }

    }

    /*
     * 导入excel
     */
    public function inportCus()
    {
        $res = upload($dir = "customer", $extarr = array('xlsx', 'xls'), $dftsize = 20);
        if (!is_numeric($res['data'])) {
            return array('code' => 0, 'msg' => '文件上传失败');
        }
        $path = getField('SysFile', array('id' => $res['data']), 'savepath');
        $data['path'] = '/public' . $path;
        $data['id'] = $res['data'];
        //存到临时表
        return $data;
    }

    /**
     * 客户图表数据
     *
     */
    public function getCstmData()
    {
        try {
            // 基础替换字符串
            $request = Request::instance();
            $base = $request->root();
            $root = strpos($base, '.') ? ltrim(dirname($base), DS) : $base;
            if ('' != $root) {
                $root = '/' . ltrim($root, '/');
            }
            $data = [];
            $con = [];
            /*各客户数量*/
            $cstmNum = [];
            $colorArr = ['#2591d1', '#f49c45', '#4cb556', '#e85656', '#8d60a5'];//颜色数组
            $nameArr = ['潜在客户', '意向客户', '拟入驻客户', '入驻客户', '无效客户'];//名称数组
            $field = 'sum(case when cstmstatus=6002001 then 1 else 0 end) as qnum,sum(case when cstmstatus=6002002 and a.status <6008003 then 1 else 0 end) as ynum,sum(case when cstmstatus=6002003 and a.status <6008003 then 1 else 0 end) as nnum,sum(case when a.status >=6008003 and a.status <=6008005 then 1 else 0 end) as rnum,sum(case when cstmstatus=6002004 then 1 else 0 end) as wnum';
            $numArr = getDataList('Etprs', ['iqbtId' => ['in', session('iqbtId')]], $field);//查出各状态客户数量
            if ($numArr['code'] == 0) {
                throw new \think\Exception('获取客户数量失败:' . $numArr['msg']);
            }
            $key = array_keys($numArr['data'][0]);
            //将列表展现所需数据填充到数组中
            for ($i = 0; $i < 5; $i++) {
                $cstmNum[$i]['name'] = $nameArr[$i];//名称
                $cstmNum[$i]['num'] = $numArr['data'][0][$key[$i]]?$numArr['data'][0][$key[$i]]:'0';//数量
                $cstmNum[$i]['pic'] = $root . '/public/files/default/default-' . substr($key[$i], 0, 1) . 'cstm.png';//图片
                $cstmNum[$i]['color'] = $colorArr[$i];//颜色
            }
//            dump($cstmNum);
            $data['cstmNum'] = $cstmNum;
            /*客户转化率*/
//        getRecordNum('etprs',['datafrom'=>['in','6023001,6023002'],'status'=>6008005]);//正式入驻
            $field = 'sum(case when status>6008002 and status<=6008005 then 1 else 0 end)as enter,sum(case when status=6008006 then 1 else 0 end)as quit,sum(case when status=6008001 then 1 else 0 end)as uncon ';
            $cvs = findById('etprs', ['iqbtId' => session('iqbtId')], $field);//求出各状态客户数
            if ($cvs['code'] == 0) {
                throw new \think\Exception('获取客户转化率数据失败:' . $cvs['msg']);
            }
            $cvs = $cvs['data'];
            foreach ($cvs as $k => $v) {
                $con[$k]['num'] = $v;
            }
            $con['enter']['color'] = "#f4a048";
            $con['enter']['name'] = "入驻";
            $con['quit']['color'] = '#599cd3';
            $con['quit']['name'] = '退租';
            $con['uncon']['color'] = '#48b44f';
            $con['uncon']['name'] = '未转化';
            $data['con'] = $con;
            /*/无效客户统计/*/
            $invalidId = getDataList('etprs', ["a.iqbtId" => session('iqbtId'), 'a.cstmstatus' => 6002004], 'id');//无效客户id数组
            $colors = ['#e85656', '#49bfe5', '#f5aa4f', '#f6c952', '#9c70af', '#3b77bd', '#51b65a', '#dc73ab', '#e34f89'];//颜色
            $invalid = [];
            for ($i = 2004001; $i <= 2004009; $i++) {
                $invalid[$i]['num'] = 0;
                $invalid[$i]['color'] = $colors[$i - 2004001];
                $invalid[$i]['name'] = getField('sysDict', ['code' => '600' . $i]);//字典表名称
            }
            foreach ($invalidId['data'] as $k => $v) {//遍历所有无效客户,收集原因
                $reason = findById('flow', ["etprsId" => $v['id'], 'cstmstatus' => '6002004'], 'reason', 'a.addtime desc');
                if ($reason['code'] != 0) {
                    $reason = substr($reason['data']['reason'], 3);
                    $invalid[$reason]['num'] += 1;
                }
            }
            $data['invalid'] = $invalid;
            /*/客户变化趋势/*/
            $field = 'addtime';
            $month = $this->monthList(strtotime('2018-01-01'), strtotime('2018-12-31'));
            $new = [];
            $xAxis = [];
            foreach ($month as $k => $v) {
                //查出每个月的数量
                $cstmTrend = [];//折线图数组(招商)
                for ($i = 0; $i < 5; $i++) {
                    $cstmTrend[$i]['num'] = 0;
                    $cstmTrend[$i]['code'] = '600200' . $i;
                    $cstmTrend[$i]['name'] = getField('sysDict', ['code' => '600200' . $i], 'name');
                }
                $cstmTrend['5']['num'] = 0;
                $cstmTrend['5']['name'] = '入驻客户';
                $cstmTrend['0']['name'] = '客户总数';
                $cur = [];
                $xAxis[] = $v;
                $cur['name'] = $v;
                $end = strtotime("$v +1 month -1 day") + 60 * 60 * 24 - 1;
                $condition[$field] = ['between', strtotime($v) . ',' . $end];
                // 查询数据
                // 6012002:编辑客户信息
                // 6012006:新增客户(招商新建)
                // 6012040:招商客户状态变化

                // 6012041:入驻客户状态变化
                // 6012010:发起入驻-新增入驻客户
//            $con='lastupdateTime < '.$end.' and code in (6012006,6012010,6012040) and iqbtId=' .session('iqbtId');//招商管理
//            $con='lastupdateTime < '.$end.' and code in (6012041,6012010) and iqbtId=' .session('iqbtId');//入驻管理
                $con = 'lastupdateTime < ' . $end . ' and code in (6012006,6012010,6012040,6012041)  and iqbtId=' . session('iqbtId');
                $result = Db::query('SELECT after from (SELECT * from ibt_log where ' . $con . ' ORDER BY addtime desc) tab GROUP BY etprsId ;');
                foreach ($result as $v2) {
                    if (!empty($v2['after'])) {
                        if ($v2['after'] != 6008006) {
                            $cstmTrend['0']['num'] += 1;
                        }
                        if (is_numeric($v2['after']) && strpos($v2['after'], '00200')) {
                            if (substr($v2['after'], -1) <= 5) {
                                $cstmTrend[substr($v2['after'], -1)]['num'] += 1;
                            }
                        }
                        if (is_numeric($v2['after']) && strpos($v2['after'], '00800')) {
                            if (substr($v2['after'], -1) > 2 && substr($v2['after'], -1) < 6) {
                                $cstmTrend[5]['num'] += 1;
                            }
                        }
                    }
                }
//            $month[$k]['cstmTrend']=$cstmTrend;
                // 客户总数
                $cur['cstmTrend'] = $cstmTrend;
                $new[] = $cur;
            }
            $data['cstmTrend'] = $new;
//            dump($data);
            return json($data);
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    /**
     * 入驻客户图表数据
     *
     */
    public function getEtprsData()
    {
        try {
            $data = [];
            $con = [];
            // 基础替换字符串
            $request = Request::instance();
            $base = $request->root();
            $root = strpos($base, '.') ? ltrim(dirname($base), DS) : $base;
            if ('' != $root) {
                $root = '/' . ltrim($root, '/');
            }
            /*各客户数量*/
            $cstmNum = [];
            $colorArr = ['#2591d1', '#f49c45', '#4cb556', '#e85656', '#8d60a5'];//颜色数组
            $nameArr = ['发起入驻客户', '待分配客户', '待签约客户', '正式入驻客户', '已毕业客户'];//名称数组
            $field = 'sum(case when status=6008002 then 1 else 0 end) as qnum,sum(case when status=6008003 then 1 else 0 end) as ynum,sum(case  when status=6008004 then 1 else 0 end) as nnum,sum(case  when status=6008005 then 1 else 0 end) as rnum,sum(case when status=6008006 then 1 else 0 end) as wnum';
            $numArr = getDataList('Etprs', ['iqbtId' => ['in', session('iqbtId')]], $field);//查出各状态客户数量
            if ($numArr['code'] == 0) {
                throw new \think\Exception('获取客户数量失败:' . $numArr['msg']);
            }
            $key = array_keys($numArr['data'][0]);
            //将列表展现所需数据填充到数组中
            for ($i = 0; $i < 5; $i++) {
                $cstmNum[$i]['name'] = $nameArr[$i];//名称
                $cstmNum[$i]['num'] = $numArr['data'][0][$key[$i]]?$numArr['data'][0][$key[$i]]:'0';//数量
                $cstmNum[$i]['pic'] = $root . '/public/files/default/default-' . substr($key[$i], 0, 1) . 'cstm.png';//图片
                $cstmNum[$i]['color'] = $colorArr[$i];//颜色
            }
            $data['cstmNum'] = $cstmNum;
            //客户变化趋势
            $field = 'addtime';
            $month = $this->monthList(strtotime('2018-01-01'), strtotime('2018-12-31'));
            $new = [];
            $xAxis = [];
            foreach ($month as $k => $v) {//查出每个月的数量
                $etprsTrend = [];//折线图数组(入驻)
                $etprsTrend['0']['num'] = 0;
                //入驻的数组
                for ($i = 1; $i < 6; $i++) {
                    $etprsTrend[$i]['num'] = 0;
                    $etprsTrend[$i]['code'] = '600800' . ($i + 1);
                    $etprsTrend[$i]['name'] = getField('sysDict', ['code' => '600800' . ($i + 1)], 'name');
                }
                $etprsTrend['0']['name'] = '客户总数';
                $cur = [];
                $xAxis[] = $v;
                $cur['name'] = $v;
                $end = strtotime("$v +1 month -1 day") + 60 * 60 * 24 - 1;
                $condition[$field] = ['between', strtotime($v) . ',' . $end];
                // 查询数据
                // 6012002:编辑客户信息
                // 6012006:新增客户(招商新建)
                // 6012040:招商客户状态变化

                // 6012041:入驻客户状态变化
                // 6012010:发起入驻-新增入驻客户
                $con = 'lastupdateTime < ' . $end . ' and code in (6012041,6012010) and iqbtId=' . session('iqbtId');//入驻管理
                $result = Db::query('SELECT after from (SELECT * from ibt_log where ' . $con . ' ORDER BY addtime desc) tab  GROUP BY etprsId ;');
                foreach ($result as $v2) {
                    if (!empty($v2['after'])) {
                        if ($v2['after'] != 6008001) {
                            $etprsTrend['0']['num'] += 1;
                        }
                        if (is_numeric($v2['after']) && strpos($v2['after'], '00800') && (substr($v2['after'], -1)) > 1) {
                            $etprsTrend[substr($v2['after'], -1) - 1]['num'] += 1;
                        }
                    }
                }
                // 客户总数
                $cur['etprsTrend'] = $etprsTrend;
                $new[] = $cur;
            }
            $data['etprsTrend'] = $new;
//            dump($data);
            return json($data);
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    /**
     * 生成从开始月份到结束月份的月份数组
     * @param int $start 开始时间戳
     * @param int $end 结束时间戳
     */
    public function monthList($start, $end)
    {
        if (!is_numeric($start) || !is_numeric($end) || ($end <= $start)) return '';
        $start = date('Y-m', $start);
        $end = date('Y-m', $end);
        //转为时间戳
        $start = strtotime($start . '-01');
        $end = strtotime($end . '-01');
        $i = 0;
        $d = array();
        while ($start <= $end) {
            //这里累加每个月的的总秒数 计算公式：上一月1号的时间戳秒数减去当前月的时间戳秒数
            $d[$i] = trim(date('Y-m', $start), ' ');
            $start += strtotime('+1 month', $start) - $start;
            $i++;
        }
        return $d;
    }


}
