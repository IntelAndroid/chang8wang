<?php
namespace app\activity\controller;
use think\Controller;
use think\Db;
use app\wechat\controller\User;
use app\common\controller\Common;
use think\image\Exception;
header("Access-Control-Allow-Origin: *");

/**
 * 2018-02-27 活动模块
 */
class Activity extends common{
    public function _initialize()
    {
//        if(empty(session('userId'))) {
//            session('iqbtId', 1);
//            session('user.type', 6019001);
//        }
        parent::_initialize();
        //nav
//        $this->assign("nav", 'activity');
    }
    /**
     * 活动列表 bootstraptable列表获取
     */
    public function getActList()
    {
        try{
            $postData = input('');
            $con=[];
            //分页条件
            $limit = !empty($postData["limit"]) ? $postData["limit"] : '';
            $offset =!empty($postData["offset"]) ? $postData["offset"] : '';
            //排序
            if (!empty($postData['sort'])) {
                if (!empty($postData['order'])) {
                    $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
                } else {
                    $order = 'a.' . $postData['sort'] . ' asc';
                }
            } else {
                $order = 'a.starttime desc,a.addtime desc';//默认排序
            }
            //搜索框
            if (!empty($postData['search'])) {
                $con['a.name'] = array('like', '%' . $postData['search'] . "%");
            }
            //时间筛选://转化为时间戳
            $postData['start'] = !empty($postData['start'])?strtotime($postData['start']):'';
            $postData['end'] = !empty($postData['start'])? strtotime($postData['end']) + 86400-1:'';//结束时间为end第二天的0点
            if (!empty($postData['start'])&&!empty($postData['end'])) {//开始结束都存在
                if($postData['start']>$postData['end']){
                    throw new \think\Exception('开始时间不能大于结束时间');
                }
                $con['a.starttime'] = array('between', [$postData['start'], $postData['end']]);
            }else if(empty($postData['start'])&&!empty($postData['end'])){//开始为空
                $con['a.starttime'] = ['<', $postData['end']];
            }else if(!empty($postData['start'])&&empty($postData['end'])){//结束为空
                $con['a.starttime'] =['>', $postData['start']];
            }
            //echo $postData["status"];
            //状态框:时间查询逻辑
            if (isset($postData["status"])&&$postData["status"]!='') {
                $con['a.draft'] = "7002002";//非草稿
                switch($postData["status"]){
                    case'0'://未开始
                        if(!empty($postData['start']) && !empty($postData['end'])){//se都有
                            if($postData['end']<=time()){//e小于t  无解
                                $con['a.starttime']='';
                            }else if($postData['start']>=time()){//s大于t
                                $con['a.starttime']=['between',$postData['start'],$postData['end']];
                            }else{//s<t  e>t
                                $con['a.starttime']=['between',time(),$postData['end']];
                            }
                        }else if(empty($postData['start']) && !empty($postData['end'])){//s为空
                            if($postData['end']<=time()){//e小于t  无解
                                $con['a.starttime']='';
                            }else if($postData['end']>time()){//e大于t
                                $con['a.starttime']=['between',time(),$postData['end']];
                            }
                        }else if(!empty($postData['start']) && empty($postData['end'])) {//e为空
                            if ($postData['start'] <= time()) {//s小于t
                                $con['a.starttime'] = ['>', time()];
                            } else if ($postData['start'] > time()) {//s大于t
                                $con['a.starttime'] = ['>', $postData['start']];
                            }
                        }else {
                            $con['a.starttime'] = ['>', time()];
                        }
                        break;
                    case'1'://进行中
                        if(!empty($postData['start']) && !empty($postData['end'])) {//se都有
                            if ($postData['end'] <= time()) {//e小于t  无解
                                $con['a.starttime'] = '';
                            } else if ($postData['start'] >= time()) {//s大于t 无解
                                $con['a.starttime'] = '';
                            } else {//s<t  e>t
                                $con['a.starttime'] = ['>', $postData['start']];
                                $con['a.endtime'] = ['>', time()];
                            }
                        }else if(empty($postData['start']) && !empty($postData['end'])) {//s为空
                            if ($postData['end'] <= time()) {//e小于t
                                $con['a.starttime'] = ['<', $postData['end']];
                                $con['a.endtime'] = ['>', time()];
                            } else if ($postData['end'] > time()) {//e大于t
                                $con['a.starttime'] = ['<=', time()];
                                $con['a.endtime'] = ['>', time()];
                            }
                        }else if(!empty($postData['start']) && empty($postData['end'])) {//e为空
                            if ($postData['start'] <= time()) {//s小于t
                                $con['a.starttime'] = ['>',$postData['start']];
                                $con['a.endtime'] = ['>', time()];
                            } else if ($postData['start'] > time()) {//s大于t 无解
                                $con['a.starttime'] ='';
                            }
                        }else {
                            $con['a.starttime']=['<=',time()];
                            $con['a.endtime']=['>',time()];
                        }
                        break;
                    case'2'://已结束
                        if(!empty($postData['start']) && !empty($postData['end'])) {//se都有
                            if ($postData['end'] <= time()) {//e小于t
                                $con['a.starttime'] = ['between',$postData['start'],$postData['end']];
                                $con['a.endtime'] = ['<', time()];
                            } else if ($postData['start'] >= time()) {//s大于t 无解
                                $con['a.starttime'] = '';
                            } else {//s<t  e>t
                                $con['a.starttime'] = ['between', $postData['start'],time()];
                                $con['a.endtime'] = ['>', time()];
                            }
                        }else if(empty($postData['start']) && !empty($postData['end'])) {//s为空
                            if ($postData['end'] <= time()) {//e小于t
                                $con['a.starttime'] = ['<', $postData['end']];
                                $con['a.endtime'] = ['>', time()];
                            } else if ($postData['end'] > time()) {//e大于t
                                $con['a.starttime'] = ['<', time()];
                                $con['a.endtime'] = ['<', time()];
                            }
                        }else if(!empty($postData['start']) && empty($postData['end'])) {//e为空
                            if ($postData['start'] <= time()) {//s小于t
                                $con['a.starttime'] = ['>',$postData['start']];
                                $con['a.endtime'] = ['<', time()];
                            } else if ($postData['start'] > time()) {//s大于t 无解
                                $con['a.starttime'] ='';
                            }
                        }else {
                            $con['a.endtime'] = ['<', time()];
                        }
                        break;
                    case'3'://草稿:
                        $con['a.draft']="7002001";//草稿
                        break;
                    default:
                        break;
                }
            }

            //如果是企业端
            if(session('user.type')=="6019002") {
                $con['a.draft']="7002002";//只查询非草稿活动
    //            $con['a.status']="7001002";//审核状态:已通过;暂时不用
            }
            //空间id
            $con['a.iqbtId']=['in',session('iqbtId')];  //var_dump($con);
            //数据总数
            $totalrecord = getRecordNum('activity', $con);
            $field='a.id,a.audit,a.total,a.name,a.starttime,a.endtime,a.draft,a.sumtitle,b.savePath as poster,a.districtId,a.address';
            $join=[['sysFile b','a.poster=b.id and b.isDelete=0','left']];
            $actList=getDataList('activity',$con,$field,$order,$join,'',$offset,$limit);  //var_dump($actList); //获取活动列表
            if($actList['code']!=1){
                throw new \think\Exception('获取活动列表失败:'.$actList['msg']);
            }
            foreach($actList['data'] as $k=>$v){
                //所在地区
                if (!empty($v['districtId'])) {//如果地址不为空
                    $cityArr=getDataList('region',['a.id' => ['in',[substr($v['districtId'], 0, 2),substr($v['districtId'], 0, 4),$v['districtId']]]],'name');
                    if($cityArr['code']!=1){
                        throw new \think\Exception("获取地址名称失败:".$cityArr['msg']);
                    }
                    $citystr=$cityArr['data'];
                    $citystr=$citystr[0]['name'].'/'.$citystr[1]['name'].'/'.$citystr[2]['name'];//拼接省市区地址
//                    $actList['data'][$k]['districtCode'] = $v['districtId'];//input hidden填充 code
                    $actList['data'][$k]['districtId'] = $citystr;//省市区地址
//                    $actList['data'][$k]['addressStr'] =$citystr. '/' .$v['address'];//完整地址
                }else{
                    $actList['data'][$k]['districtId']='';
                }
                //如果是管理端活动的  报名人数
                if(session('user.type')=="6019001") {
                    $num = findById('activityApl', ['actId' => $v['id']], 'sum(case when a.status="7001002"  then num else 0 end) as passnum,sum(case when a.status=7001001 then num else 0 end) as checknum');
                    if($num['code']!=1){
                        throw new \think\Exception('获取活动报名人数失败:'.$num['msg']);
                    }
                    $actList['data'][$k]['passnum'] = $num['data']['passnum']?$num['data']['passnum']:0;
                    $actList['data'][$k]['checknum'] = $num['data']['checknum']?$num['data']['checknum']:0;
                    $join=[['activity b','a.actId=b.id','left']];
                    $check=getRecordNum('activityApl',['actId' => $v['id'],'a.status'=>7001001,'b.endtime'=>['>',time()]],$join);
                    $actList['data'][$k]['check'] = $check;
                }

                //如果是企业用户,查出该用户对应该活动的  报名状态
                if(session('user.type')=="6019002") {
                    $con=['a.adduserId'=>session('userId')];
                    $con['actId']=$v['id'];
                    $sign=findById('activityApl',$con,'status,id','addtime desc');
                    if(!empty($sign['data'])){//如果报过该活动
                        $actList['data'][$k]['signId']=$sign['data']['id'];
                        $actList['data'][$k]['sign']=$sign['data']['status'];
                        switch($sign['data']['status']){
                            case'7001001':
                                $actList['data'][$k]['signstatus']='待审核';
                                break;
                            case'7001002':
                                $actList['data'][$k]['signstatus']='报名成功';
                                break;
                            case'7001003':
                                $actList['data'][$k]['signstatus']='已拒绝';
                                break;
                            case'7001000':
                                $actList['data'][$k]['signstatus']='已取消';
                                break;
                            default:
                                break;
                        }
                    }
                }
                //活动状态
                if($v['draft']=="7002001"){
                    $actList['data'][$k]['status']="草稿";
                }else{
                    if($v['starttime']>time()){
                        $actList['data'][$k]['status']='未开始';
                    }else if($v['endtime']<time()){
                        $actList['data'][$k]['status']='已结束';
                    }else{
                        $actList['data'][$k]['status']='进行中';
                    }
                }
                //格式化时间戳
                $actList['data'][$k]['starttime']=$v['starttime']?date('Y-m-d H:i',$v['starttime']):'';
                $actList['data'][$k]['endtime']=$v['endtime']?date('Y-m-d  H:i',$v['endtime']):'';
                //检测海报是否存在
                if(!is_file(ROOT_PATH."/public".$v['poster'])){
                    $actList['data'][$k]['poster']='';
                }
            }
//                dump($actList['data']);exit;
                return json (array('total' => $totalrecord, 'rows' => $actList['data']));
        }catch(\Exception $e){
            c_Log($e);
            return array('total'=>0,'rows'=>[],'msg'=>$e->getMessage());
        }

    }

    /**
     * 活动详情
     * @param int $id 活动id
     * @return array|null
     *
     */
    public function getActInfo($id=0)
    {
        try {
            $field = 'a.id,a.name,a.districtId,a.address,a.starttime,a.endtime,a.total,a.poster as posterId,a.tags,a.detail,a.free,a.price,a.audit,a.contact,a.mobile,a.email,a.publish,a.draft,b.savePath as poster';
            $join = [['sysFile b', 'a.poster=b.id and b.isDelete=0', 'left']];
            $info = findById('activity', ['a.id' => $id], $field, '', $join);//获取活动详情
            if($info['code']!=1){
                throw new \think\Exception("获取活动详情失败:".$info['msg']);
            }
            //获取字典名称
            $tmplist = $this->getDictStr('*', 'Activity');
            $info['data'] = $this->setObjIdText($info['data'], $tmplist);
            //处理数据
            $info['data']['starttime'] = $info['data']['starttime']?date('Y-m-d H:i', $info['data']['starttime']):'';//开始时间
            $info['data']['endtime'] = $info['data']['endtime']?date('Y-m-d H:i', $info['data']['endtime']):'';
            $info['data']['timeStr'] = $info['data']['starttime']. ' 至 ' .  $info['data']['endtime'];//活动详情 时间拼接
//            $info['data']['startdate'] = $info['data']['starttime'] ? date('Y-m-d', $info['data']['starttime']) : '';//开始日期
//            $info['data']['enddate'] = $info['data']['endtime'] ? date('Y-m-d', $info['data']['endtime']) : '';
            $info['data']['detail'] = $info['data']['detail'] ? $info['data']['detail'] : '';
            $info['data']['price'] = $info['data']['price'] *100/100;
            //所在地区
            if (!empty($info['data']['districtId'])) {//如果地址不为空
                $cityArr=getDataList('region',['a.id' => ['in',[substr($info['data']['districtId'], 0, 2),substr($info['data']['districtId'], 0, 4),$info['data']['districtId']]]],'name');
                if($cityArr['code']!=1){
                    throw new \think\Exception("获取地址名称失败:".$cityArr['msg']);
                }
                $citystr=$cityArr['data'];
                $citystr=$citystr[0]['name'].'/'.$citystr[1]['name'].'/'.$citystr[2]['name'];//拼接省市区地址
                $info['data']['districtCode'] = $info['data']['districtId'];//input hidden填充 code
                $info['data']['districtId'] = $citystr;//省市区地址
                $info['data']['addressStr'] =$citystr. '/' . $info['data']['address'];//完整地址
            }else{
                $info['data']['districtId']='';
            }
            //海报是否存在
            if (!is_file(ROOT_PATH . "/public" . $info['data']['poster'])) {
                $info['data']['poster'] = '';
            }
            //初始化标签复选框
            $info['data']['tagsCheck'] = $info['data']['tags'];
            return json($info);
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'data'=>[],'msg'=>$e->getMessage());
        }
    }
    /**
     * 导出活动excel
     */
    public function exportAct()
    {
        try {
            $postData = input('', null, 'trim');
            //excel表格title
            $title = '';
            //查询条件
            $con = [];
            $con['a.iqbtId']=session('iqbtId');
            if (!empty($postData['search'])) {
                $con['a.name'] = array('like', '%' . $postData['search'] . "%");
            }
            //时间筛选://转化为时间戳
            $postData['start'] = !empty($postData['start'])?strtotime($postData['start']):'';
            $postData['end'] = !empty($postData['start'])? strtotime($postData['end']) + 86400-1:'';//结束时间为end第二天的0点
            if (!empty($postData['start'])&&!empty($postData['end'])) {//开始结束都存在
                if($postData['start']>$postData['end']){
                    throw new \think\Exception('开始时间不能大于结束时间');
                }
                $con['a.starttime'] = array('between', [$postData['start'], $postData['end']]);
            }else if(empty($postData['start'])&&!empty($postData['end'])){//开始为空
                $con['a.starttime'] = ['<', $postData['end']];
            }else if(!empty($postData['start'])&&empty($postData['end'])){//结束为空
                $con['a.starttime'] =['>', $postData['start']];
            }
            //状态框:时间查询逻辑
            if (isset($postData["status"])&&$postData["status"]!='') {
                $con['a.draft'] = "7002002";//非草稿
                switch($postData["status"]){
                    case'0'://未开始
                        if(!empty($postData['start']) && !empty($postData['end'])){//se都有
                            if($postData['end']<=time()){//e小于t  无解
                                $con['a.starttime']='';
                            }else if($postData['start']>=time()){//s大于t
                                $con['a.starttime']=['between',$postData['start'],$postData['end']];
                            }else{//s<t  e>t
                                $con['a.starttime']=['between',time(),$postData['end']];
                            }
                        }else if(empty($postData['start']) && !empty($postData['end'])){//s为空
                            if($postData['end']<=time()){//e小于t  无解
                                $con['a.starttime']='';
                            }else if($postData['end']>time()){//e大于t
                                $con['a.starttime']=['between',time(),$postData['end']];
                            }
                        }else if(!empty($postData['start']) && empty($postData['end'])) {//e为空
                            if ($postData['start'] <= time()) {//s小于t
                                $con['a.starttime'] = ['>', time()];
                            } else if ($postData['start'] > time()) {//s大于t
                                $con['a.starttime'] = ['>', $postData['start']];
                            }
                        }else {
                            $con['a.starttime'] = ['>', time()];
                        }
                        break;
                    case'1'://进行中
                        if(!empty($postData['start']) && !empty($postData['end'])) {//se都有
                            if ($postData['end'] <= time()) {//e小于t  无解
                                $con['a.starttime'] = '';
                            } else if ($postData['start'] >= time()) {//s大于t 无解
                                $con['a.starttime'] = '';
                            } else {//s<t  e>t
                                $con['a.starttime'] = ['>', $postData['start']];
                                $con['a.endtime'] = ['>', time()];
                            }
                        }else if(empty($postData['start']) && !empty($postData['end'])) {//s为空
                            if ($postData['end'] <= time()) {//e小于t
                                $con['a.starttime'] = ['<', $postData['end']];
                                $con['a.endtime'] = ['>', time()];
                            } else if ($postData['end'] > time()) {//e大于t
                                $con['a.starttime'] = ['<=', time()];
                                $con['a.endtime'] = ['>', time()];
                            }
                        }else if(!empty($postData['start']) && empty($postData['end'])) {//e为空
                            if ($postData['start'] <= time()) {//s小于t
                                $con['a.starttime'] = ['>',$postData['start']];
                                $con['a.endtime'] = ['>', time()];
                            } else if ($postData['start'] > time()) {//s大于t 无解
                                $con['a.starttime'] ='';
                            }
                        }else {
                            $con['a.starttime']=['<=',time()];
                            $con['a.endtime']=['>',time()];
                        }
                        break;
                    case'2'://已结束
                        if(!empty($postData['start']) && !empty($postData['end'])) {//se都有
                            if ($postData['end'] <= time()) {//e小于t
                                $con['a.starttime'] = ['between',$postData['start'],$postData['end']];
                                $con['a.endtime'] = ['<', time()];
                            } else if ($postData['start'] >= time()) {//s大于t 无解
                                $con['a.starttime'] = '';
                            } else {//s<t  e>t
                                $con['a.starttime'] = ['between', $postData['start'],time()];
                                $con['a.endtime'] = ['>', time()];
                            }
                        }else if(empty($postData['start']) && !empty($postData['end'])) {//s为空
                            if ($postData['end'] <= time()) {//e小于t
                                $con['a.starttime'] = ['<', $postData['end']];
                                $con['a.endtime'] = ['>', time()];
                            } else if ($postData['end'] > time()) {//e大于t
                                $con['a.starttime'] = ['<', time()];
                                $con['a.endtime'] = ['<', time()];
                            }
                        }else if(!empty($postData['start']) && empty($postData['end'])) {//e为空
                            if ($postData['start'] <= time()) {//s小于t
                                $con['a.starttime'] = ['>',$postData['start']];
                                $con['a.endtime'] = ['<', time()];
                            } else if ($postData['start'] > time()) {//s大于t 无解
                                $con['a.starttime'] ='';
                            }
                        }else {
                            $con['a.endtime'] = ['<', time()];
                        }
                        break;
                    case'3'://草稿:
                        $con['a.draft']="7002001";//草稿
                        break;
                    default:
                        break;
                }
            }
            vendor("PHPExcel");
            vendor("PHPExcel.Writer.Excel2007");
            vendor("PHPExcel.IOFactory");
            //列名
            $header = array('活动名称', '状态', '活动开始时间', '活动结束时间', '已报名(人)', '待审核');
            $field = 'a.id,a.name,a.starttime,a.endtime,a.draft,b.savePath as poster';
            $join = [['sysFile b', 'a.poster=b.id and b.isDelete=0', 'left']];
            $actList = getDataList('activity', $con, $field, '', $join);//获取活动列表
            if($actList['code']!=1){
                throw new \think\Exception("获取活动列表失败:".$actList['msg']);
            }
            foreach ($actList['data'] as $k => $v) {
                //报名人数
                $num = findById('activityApl', ['actId' => $v['id']], 'sum(case when status="7001002" then num else 0 end) as passnum,sum(case when status=7001001 then num else 0 end) as checknum');
                $actList['data'][$k]['passnum'] = $num['data']['passnum'] ? $num['data']['passnum'] : 0;
                $actList['data'][$k]['checknum'] = $num['data']['checknum']  ? $num['data']['checknum'] : 0;
                //活动状态
                $name = $v['name'];
                unset($actList['data'][$k]['name']);
                if ($v['draft'] == "7002001") {
                    array_unshift($actList['data'][$k], '草稿');
                } else {
                    if ($v['starttime'] > time()) {
                        array_unshift($actList['data'][$k], '未开始');
                    } else if ($v['endtime'] < time()) {
                        array_unshift($actList['data'][$k], '已结束');
                    } else {
                        array_unshift($actList['data'][$k], '进行中');
                    }
                }
                array_unshift($actList['data'][$k], $name);
                //格式化时间戳
                $actList['data'][$k]['starttime'] = $v['starttime'] ? date('Y-m-d H:i', $v['starttime']) : '';
                $actList['data'][$k]['endtime'] = $v['endtime'] ? date('Y-m-d H:i', $v['endtime']) : '';
                //删除无关变量
                unset($actList['data'][$k]['id']);
                unset($actList['data'][$k]['poster']);
                unset($actList['data'][$k]['draft']);
            }
            if (!empty($actList["data"])) {
                $logRes = saveLog('6012027', '导出活动列表', 0, 'etprs', 0);
                if ($logRes['code'] != 1) {
                    throw new \think\Exception("新增-导出活动列表-操作记录失败".$logRes['msg']);
                }
//            dump($actList["data"]);exit;
                getExcel("活动_" . $title, $header, $actList["data"]);
            } else {
//                throw new \think\Exception("没有相关数据");
//                $logRes = saveLog('6012004', '导出活动-没有数据', 0, 'etprs', 0);
//                if ($logRes['code'] != 1) {
//                    throw new \think\Exception("新增-导出活动-操作记录失败");
//                }
//                $data = [];
                return "没有相关数据";
            }
        }catch(\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'data' => [], 'msg' => $e->getMessage());
        }
    }

    /**
     * 保存活动
     *  @param id 活动id
     */
    public function saveAct(){
        try {
            $postData=input('request.',null,'trim');
            if(!empty($postData['price'])) {
                $postData['price'] = $postData['price'] * 100 / 100;//转化成数字类型,待校验
            }
            //判断新增还是编辑
            if(empty($postData['id'])){
                $vld = $this->validate($postData, 'Act');//新增校验
            }else if(!empty($postData['wx'])){
                $vld = $this->validate($postData, 'Act.wechat');//微信端校验
            }else{
                $vld = $this->validate($postData, 'Act.edit');//编辑校验
            }
            if(!empty($postData['draft']) && $postData['draft']==7002001){//如果保存的是草稿,只校验活动名;
                if(empty($postData['name'])){
                    throw new \think\Exception("活动名称不能为空");
                }
                $vld=true;
            }else{
                $postData['draft']='';
            }

            if($vld===true){
//                /*时间处理*/
//                $time=['starttime'=>$postData['starttime'],'endtime'=>$postData['endtime']];
//                //处理时间  上午 12:30
//                foreach($time as $k=>$v){
//                    $apM=substr($v,0,6);
//                    if($apM=='上午'){
//                        $hour=substr($v,6,2);
//                        if($hour==12){
//                            $hour=00;
//                        }
//                        $postData[$k] = $hour.substr($v,8);
//                    }else if($apM=='下午'){
//                        $mao=strpos(substr($v,6),':');
//                        $hour=substr($v,6,$mao);
//                        if($hour!=12){
//                            $hour+=12;
//                        }
//                        $postData[$k] = $hour.substr($v,6+$mao);
//                    }
//                }
                //整体时间处理
                $postData['starttime']=strtotime($postData['starttime']);
                $postData['endtime']=strtotime($postData['endtime']);
                //活动时间不能为过去时间
                if(empty($postData['draft']) && $postData['starttime']<time()){
                    throw new \think\Exception('活动开始时间不能为过去时间');
                }
                //活动时间不能为过去时间
                if(empty($postData['draft']) && $postData['starttime']>$postData['endtime']){
                    throw new \think\Exception('活动开始时间不能大于结束时间');
                }
                //活动时间不能为过去时间
                if(empty($postData['draft']) && $postData['starttime']==$postData['endtime']){
                    throw new \think\Exception('活动开始时间不能等于结束时间');
                }
                //如果是收费,单价不能为空
                if(empty($postData['draft'])&&$postData['free']==7002002 && $postData['price']=='0'){
                    throw new \think\Exception('收费活动,单价不能为0');
                }
                //如果是收费,单价不能为空
                if(empty($postData['draft'])&&$postData['free']==7002002 && empty($postData['price'])){
                    throw new \think\Exception('收费活动,单价不能为空');
                }
                //如果是收费,审核不能为否
                if(empty($postData['draft'])&&$postData['free']==7002002 && $postData['audit']==7002002){
                    throw new \think\Exception('收费活动,必须审核');
                }
                //新增且没有勾选协议框时候
                if(empty($postData['draft']) && empty($postData['id']) && empty($postData['agree'])){
                    throw new \think\Exception('请勾选已阅读并同意《服务协议》');
                }
                //活动人数未填写时
                if(empty($postData['draft']) && $postData['total']==''){
                    throw new \think\Exception('total');//前端根据返回信息弹窗
                }
                //如果更改审核状态为不审核,校验时候有未通过审核的报名,如果有提示
                if(empty($postData['draft']) && !empty($postData['id']) && $postData['audit']==7002002){
                    $num=getRecordNum('activityApl',['actId'=>$postData['id'],'status'=>'7001001']);
                    if($num>0){
                        throw new \think\Exception('audit');//前端根据返回信息弹窗
                    }
                }
                unset($postData['agree']);
                //如果免费,单价清零
                if($postData['free']==7002001){
                    $postData['price']=0;
                }
                //保存设置非草稿
                if(empty($postData['draft'])){
                    $postData['draft']=7002002;
                }
                //iqbtID
                $postData['iqbtId']=session('iqbtId');
                //判断新增还是编辑
                if(empty($postData['id'])){
                    $logName="发布活动";
                    $logcode=6012026;
                }else{
                    $logName="修改活动信息";
                    $logcode=6012028;
                }
                //保存活动
                $res = saveData('activity', $postData);
                if($res['code']==1){
                    //写入日志
                    $logRes = saveLog($logcode, $logName, $res['data'], 'activity');
                    if ($logRes['code'] != 1) {
                        throw new \think\Exception("新增-".$logName."-操作记录失败".$logRes['msg']);
                    }
                }else{
                    throw new \think\Exception("保存活动-失败:".$res['msg']);
                }

            }else{
                throw new \think\Exception($vld);//返回校验错误信息
            }
            return $res;
        }catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }
    /**
     *报名管理列表 bootstraptable
     */
    public function getSignList()
    {
        try {
//            $postData = input('request.', null, 'trim');
            $postData = input('');
//            session('actId',input('id'));
//            dump( session('actId'));
//            dump($postData);
            //分页条件
            $limit = isset($postData["limit"]) ? $postData["limit"] : '';
            $offset = isset($postData["offset"]) ? $postData["offset"] : '';
            //排序
            if (isset($postData['sort']) && !empty($postData['sort'])) {
                if (!empty($postData['order'])) {
                    $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
                } else {
                    $order = 'a.' . $postData['sort'] . ' asc';
                }
            } else {
//                $order = 'a.status asc,a.addtime desc';//默认排序
                $order = "FIELD(a.status,'7001001','7001002','7001003','7001000')";//默认排序
            }
            //查询条件
            $con['actId'] = $postData['id'];
            $join = [['sysDict b', 'a.status=b.code and b.isDelete=0', 'left'],['user c', 'a.adduserId=c.id and c.isDelete=0', 'left'],['etprs d', 'c.etprsId=d.id and d.isDelete=0', 'left'],['activity e', 'e.id=a.actId and a.isDelete=0', 'left']];
            $field = 'a.id,a.actId,a.serialNo,a.etprs,a.name,a.mobile,a.num,a.total,a.addtime,b.name as status,d.status as enterstatus,e.endtime*1000 as endtime';
            if (!empty($postData['status'])) {
                $con['a.status'] =$postData['status'];//报名状态筛选
            }
//            dump($con);
//            $sign = getDataList('activityApl', $con, $field, $order, $join, '', $offset, $limit); //dump($sign);die;//取出报名信息
            $sign = getDataList('activityApl', $con, $field, $order, $join); //dump($sign);die;//取出报名信息
            if ($sign['code'] != 1) {
                throw new  \think\Exception("获取报名信息失败:" . $sign['msg']);
            }
            unset($con['e.iqbtId']);
            $totalrecord=getRecordNum('activityApl',$con);//获取数据总数
            $data = $sign['data'];
            //处理数据
            foreach ($data as $k => $v) {
                $data[$k]['addtime'] = $v['addtime'] ? date('Y-m-d H:i', $v['addtime']) : '';//时间转换
                $data[$k]['total'] = $v['total'] ? ($v['total'] * 100 / 100).'元': '';//价格去.00
                $data[$k]['free']= $data[$k]['total'] ? "否":'是';
                $data[$k]['price']= !empty($data[$k]['price'])?$data[$k]['price'].'元/人':'';//todo::work
            }
//            return json (array('total' => $totalrecord, 'rows' => $data));
            return $data;
        } catch (\Exception $e) {
            c_Log($e);
            return json(array('total' => 0, 'rows' => [], 'msg' => $e->getMessage()));
        }
    }

    /**
     * 导出活动报名excel
     */
    public function exportSign()
    {
        try{
            vendor("PHPExcel");
            vendor("PHPExcel.Writer.Excel2007");
            vendor("PHPExcel.IOFactory");
            $postData = input('', null, 'trim');
            //excel表格title
            $title = '';
            //查询条件
            $con['actId']=$postData['id'];
            if(!empty($postData['status'])) {
                $con['status'] =$postData['status'];//报名状态筛选
            }
            //排序
            if (isset($postData['sort']) && !empty($postData['sort'])) {
                if (!empty($postData['order'])) {
                    $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
                } else {
                    $order = 'a.' . $postData['sort'] . ' asc';
                }
            } else {
        //            $order = 'a.backlog desc,a.cstmstatus asc,a.addtime asc,a.flowtime asc';//默认排序
                $order = '';//默认排序
            }

            //列名
            $header = array('订单编号', '报名人', '联系方式', '数量', '金额(元)', '报名时间','报名状态');
            $field='a.serialNo,a.name,a.mobile,a.num,a.total,a.addtime,a.status';
//            $join=[['sysDict b','a.status=b.code and b.isDelete=0','left']];
            $sign=getDataList('activityApl',$con,$field,$order);//取出报名信息
            if($sign['code']!=1){
                throw new \think\Exception("获取报名信息失败:".$sign['msg']);
            }
            $data=$sign['data'];
            //处理数据
            foreach($data as $k=>$v){
                $data[$k]['addtime']=$v['addtime']?date('Y-m-d H:i',$v['addtime']):'';//时间转换
                $data[$k]['serialNo']=$v['serialNo']?$v['serialNo']*100/100:'';//价格去.00
                switch($data[$k]['status']){
                    case'7001000':
                        $data[$k]['status']='已取消';
                        break;
                    case'7001001':
                        $data[$k]['status']='待审核';
                        break;
                    case'7001002':
                        $data[$k]['status']='已通过';
                        break;
                    default:
                        $data[$k]['status']='已拒绝';
                        break;
                }
            }
            if (!empty($data)) {
                $logRes = saveLog('6017027', '导出报名信息', 0, 'activity',0);
                if ($logRes['code'] != 1) {
                    throw new \think\Exception("新增-导出报名信息-操作记录失败".$logRes['msg']);
                }
        //            dump($data);exit;
                getExcel("报名信息_" . $title, $header,$data);
            } else {
                $data = [];
                return "没有相关数据";
            }
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }

    }
    /**
     * 保存报名信息
     */
    public function saveSign(){
        try {
            Db::startTrans();
            $postData=input('request.',null,'trim');
            if (empty($postData['id'])) {//如果是新增报名
                //判断原来报名状态
//                if(!empty($postData['signstatus']) && $postData['signstatus']==7001001||$postData['signstatus']==7001002){
//                    throw new \think\Exception("已经报名,请勿重复提交");
//                }
                $signNum=findById('activityApl',['adduserId'=>session('userId'),'actId'=>$postData['actId'],'status'=>['between',[7001001,7001002]]],'count(id) as num');
                if($signNum['data']['num']!=0){
                    throw new \think\Exception("已经报名,请勿重复提交");
                }
                unset($postData['signstatus']);
                unset($postData['signId']);
                $vld = $this->validate($postData, 'Sign');//校验
                if($vld===true) {
                    //是否大于剩余名额()
                    if($postData['total']!=0) {
                        $num = findById('activityApl', ['actId' => $postData['actId'],'status'=>"7001002"], 'sum( num) as passnum');
                        if ($num['code'] != 1) {
                            throw new \think\Exception('获取活动报名人数失败:' . $num['msg']);
                        }
                        $num = $num['data']['passnum']? $num['data']['passnum'] : 0;
                        $remain = $postData['total'] - $num;
                        if ($postData['num'] > $remain) {
                            throw new \think\Exception("报名人数超过剩余名额:" . $remain . '人');
                        }
                    }
                    //订单总额
                    $price=findById('activity',['id'=>$postData['actId']],'price,name');
                    if($price['code']!=1){
                        throw new \think\Exception('获取活动报名费失败:'.$price['msg']);
                    }
                    $actname=$price['data']['name'];
                    $postData['total']=$postData['num']*$price['data']['price'];
                   //如果活动不需要审核
                    if( $postData['audit']==7002002){
                        $postData['status']=7001002;//报名直接通过
                    }
                    unset($postData['audit']);
                    $res = saveData('activityApl', $postData);//保存报名信息(新增;
                    if ($res['code'] != 1) {
                        throw new \think\Exception("新增报名失败:".$res['msg']);
                    }
                    //生成订单编号(日期+四位活动id+五位报名信息id)
                    $postData['serialNo'] = date('Ymd', time()) . sprintf("%04d", $postData['actId']) . sprintf("%05d", $res['data']);
                    $postData['id'] = $res['data'];
                    $res = saveData('activityApl', $postData);//保存订单编号
                    if ($res['code'] != 1) {
                        throw new \think\Exception("填充订单号失败:".$res['msg']);
                    }
                    //写入日志
                    $logRes = saveLog('6012029', '活动报名', $res['data'], 'activityApl',session('user.etprsId'));
                    if ($logRes['code'] != 1) {
                        throw new \think\Exception("新增-活动报名-操作记录失败".$logRes['msg']);
                    }
                    /*//发送通知*/
                    $user=new User();
                    $wxurl=config('wxdomain').'/wechat/test/emdetails?id='.$res['data'];
                    $openIdArr=searchRoleUser(9);//查询需要发送的用户 todo 确定menuId
                    if($openIdArr['code']==0){
                        throw new \think\Exception('查找权限G失败'.$vld);//获取权限失败
                    }
                    //保存消息
                    $msgPost['title']=$actname.'-有1条新的报名';
                    $msgPost['content']='';
                    $msgPost['usertype']='';
//                    $msgPost['iqbtId ']=session('user.iqbtId');
                    $msgPost['usertype']='';
                    $res=saveData('msg',$msgPost);
                    if($res['code']==0){
                        throw new \think\Exception('保存消息失败'.$res['msg']);
                    }
                    /*发送消息并保存消息记录*/
                    /*foreach($openIdArr['data'] as $k=>$v){
                        $msg=$user->applyAdit1( $msgPost['title'],$v['openId'],'活动报名',$postData['name'],session('user.etprsName'),$postData['mobile'],$postData['num'],$wxurl);
                        $msgstatus=empty($msg['code'])?'6024002':'6024003';
                        $rcdRes=saveMsgRcd($res['data'],$v['openId'],$msgstatus);
                        if($rcdRes['code']==0){
                            throw new \think\Exception('保存消息失败'.$rcdRes['msg']);
                        }
                    }*/
                }else{
                    throw new \think\Exception($vld);//返回校验错误信息
                }
            } else {//如果是修改报名状态(审核)
                //如果是通过,校验报名人数
                if($postData['status']==7001002){
                    $total=findById('activity',['a.id'=>$postData['actId']],'total');//查询活动人数上限
                    if($total['code']!=1){
                        throw new \think\Exception("获取活动总人数失败:".$total['msg']);
                    }
                    if($total['data']['total']!=0) {//如果活动人数有上限
                        $passnum = findById('activityApl', ['a.actId' => $postData['actId'],'a.status'=>7001002], 'sum(num) as passnum');//该活动通过的人数
                        if ($passnum['code'] != 1) {
                            throw new \think\Exception("获取报名通过人数失败:" . $passnum['msg']);
                        }
                        $num = $total['data']['total'] - $passnum['data']['passnum'];
                        if ($postData['num'] > $num) {
                            throw new \think\Exception("不能通过,人数超过剩余名额:" . $num);
                        }
                    }
                    $logname="报名审核通过";
                    $logcode="6012031";
                }else{
                    $logname="报名审核拒绝";
                    $logcode="6012032";
                }
                unset($postData['actId']);
                $res = saveData('activityApl', $postData);//保存报名信息(修改);
                if ($res['code'] != 1) {
                    throw new \think\Exception("修改报名状态失败:".$res['msg']);
                }
                /*//发送通知*/
                $user=new User();
                $wxurl=config('wxdomain').'/wechat/test/index';
                //查询该条报名的用户id
                $join=[['user b','a.adduserId=b.id','left']];
                $userId=getDataList('activityApl',['a.id'=>$postData['id']],'b.id,b.openId','',$join);
                if($userId['code']==0){
                    throw new \think\Exception('查找用户id失败'.$userId['msg']);//获取权限失败
                }
                //保存消息
                $msgPost['title']=$logname;
                $msgPost['content']='';
                $msgPost['usertype']='';
//                    $msgPost['iqbtId ']=session('user.iqbtId');
                $msgPost['usertype']='';
                $res=saveData('msg',$msgPost);
                if($res['code']==0){
                    throw new \think\Exception('保存消息失败'.$res['msg']);
                }
                /*发送消息并保存消息记录*/
                $msg=$user->actAuditMsg( $msgPost['title'],$userId['data'][0]['openId'],'活动报名','',session('user.etprsName'),'','',$wxurl);
                $msgstatus=empty($msg['code'])?'6024002':'6024003';
                $res=saveMsgRcd($res['data'],$userId['data'][0]['openId'],$msgstatus,$userId['data'][0]['id']);
                if($res['code']==0){
                    throw new \think\Exception('保存消息失败'.$res['msg']);
                }

                //写入日志
                $logRes = saveLog($logcode, $logname, $res['data'], 'activityApl',session('user.etprsId'));
                if ($logRes['code'] != 1) {
                    throw new \think\Exception("新增-".$logname."-操作记录失败:".$logRes['msg']);
                }
            }
            Db::commit();
            return $res;
        }catch(\Exception $e){
            c_Log($e);
            Db::rollback();
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }

    /**
     * 取消报名
     */
    public function cancelSign($id=0){
        try {
            $data['id']=$id;
            $data['status']=7001000;
            $res = saveData('activityApl', $data);//保存报名信息(修改);
            if ($res['code'] != 1) {
                throw new \think\Exception("取消报名失败:".$res['msg']);
            }
            //写入日志
            $logRes = saveLog('6012030', '取消报名', $res['data'], 'activityApl');
            if ($logRes['code'] != 1) {
                throw new \think\Exception("新增-取消报名-操作记录失败".$logRes['msg']);
            }
            return $res;
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }
    /**
     * 报名详情
     */
    public function getSignInfo($signId=0){
        try {
            $con['id']=$signId;
            $aplInfo=findById('activityApl',$con,'id as signId,actId,serialNo,name,mobile,sex,num,addtime,total,status');
            if($aplInfo['code']!=1){
                throw new \think\Exception("获取报名信息失败:".$aplInfo['msg']);
            }
            $aplInfo['data']['addtime']=date('Y-m-d H:i',$aplInfo['data']['addtime']);
            $aplInfo['data']['total']=$aplInfo['data']['total']*100/100;
//            $aplInfo['data']['sex']=getField('sysDict',['code'=>$aplInfo['data']['sex']],'name');
            return $aplInfo;
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }
    /**
     * 保存活动总结
     */
    public function saveActSum(){
        try{
            $data = input("request.",null,'trim');
            if (empty($data['id'])){
               throw new \think\Exception('活动id不存在');
            };
            if (empty($data['sumtitle'])){
                throw new \think\Exception('标题不能为空');
            };
            if (empty($data['summary'])){
                throw new \think\Exception('内容不能为空');
            };
            $res=saveData("activity", $data);
            if($res['code']==0){
                throw new \think\Exception('活动总结保存失败');
            }
            $logRes = saveLog('6012042', '活动总结', $data['id'], 'activity', $data['id'],'','');
            if ($logRes['code'] == 0) {
                throw new \think\Exception("操作记录失败");
            }
            return $res;
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }
    /**
     * 获取活动总结
     */
    public function getActSum(){
        try{
            $data = input("request.",null,'trim');
            if (empty($data['id'])){
                throw new \think\Exception('活动id不存在');
            };
            $res=getDataList("activity",['id'=>$data['id']],'sumtitle,summary,lastupdateTime');
            if($res['code']==0){
                throw new \think\Exception('获取活动总结信息失败'.$res['msg']);
            }
            $res['data'][0]['lastupdateTime']=date('Y年m月d日 H:i',$res['data'][0]['lastupdateTime']);
//            if($res['data'][0]['actfiles']){
//                $result['code'] = 1;
//                $result['str'] = $res['data'][0]['actfiles'];
//                $result['summary'] = $res['data'][0]['summary'];
//                $pics = explode(",",$res['data'][0]['actfiles']);
//                $path = array();
//                foreach ($pics as $fId)
//                {
//                    $file = getField('SysFile',array('id'=>$fId),'savePath');
//                    if(is_file(ROOT_PATH.'/public'.$file)){
//                        $cur['img']  = $file;
//                        $cur['id'] = $fId;
//                        $path[] = $cur;
//                    }
//                }
//                $result['path'] = $path;
//            }else{
//                $result['code'] = 1;
//                $result['str'] = '';
//                $result['path'] = null;
//            }
            return $res;
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }
    /**
     * 微信端接口-获取各状态活动数量
     * @param int $id
     */
    public function getActNum(){
        try{
            //空间id
            $con['a.iqbtId']=['in',session('iqbtId')];
            //数据总数
            $stamp=time().' and draft=7002002';
            //如果是企业端
            if(session('user.type')=="6019002") {
                $field='sum(case when starttime>'.$stamp.' then 1 else 0 end)as wnum,
            sum(case when starttime<'.$stamp. ' and endtime > '.$stamp. ' then 1 else 0 end)as jnum,
            sum(case when endtime<'.$stamp. ' then 1 else 0 end) as ynum';
            }else {
                $field = 'sum(case when starttime>' . $stamp . ' then 1 else 0 end)as wnum,sum(case when starttime<' . $stamp . ' and endtime > ' . $stamp . ' then 1 else 0 end)as jnum,
            sum(case when endtime<' . $stamp . ' then 1 else 0 end)as ynum,sum(case when draft= 7002001 then 1 else 0 end)as cnum';
            }
            $numRes = getDataList('activity', $con,$field);//huoqu shuju
            if($numRes['code']==0){
                throw new \think\Exception($numRes['msg']);
            }
            return json ($numRes);
        }catch(\Exception $e){
            c_Log($e);
            return array('total'=>0,'rows'=>[],'msg'=>$e->getMessage());
        }

    }
    /**
     * 微信端接口-获取各报名状态人数
     * @param int $id
     */
    public function getSignNum($id=0){
        try{
            $con['actId'] = $id;
            $field='sum(case when status=7001001 then 1 else 0 end)as dnum,sum(case when status=7001002 then 1 else 0 end)as tnum,
            sum(case when status=7001003 then 1 else 0 end)as jnum,sum(case when status=7001000 then 1 else 0 end)as qnum';
            $totalrecord=getDataList('activityApl',$con,$field);//获取数据总数
            if($totalrecord['code']==0){
                throw new \think\Exception($totalrecord['msg']);
            }
            foreach($totalrecord['data'][0] as $k => $v){
                if ($v==null)
                    $totalrecord['data'][0][$k]=0;
            }
            return json($totalrecord);
        }catch(\Exception $e){
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }

    /**
     * 工作台-获取所有待审核活动(未过期的)
     */
    public function getAllActApl()
    {
        try {
            $postData = input('');
            //分页条件
            $limit = isset($postData["limit"]) ? $postData["limit"] : '';
            $offset = isset($postData["offset"]) ? $postData["offset"] : '';
            //排序
            if (isset($postData['sort']) && !empty($postData['sort'])) {
                if (!empty($postData['order'])) {
                    $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
                } else {
                    $order = 'a.' . $postData['sort'] . ' asc';
                }
            } else {
                $order = 'a.addtime desc';//默认排序
            }
            $con['e.iqbtId'] = session('iqbtId');
            
/*             $con['a.status'] = 7001001;
            $con['e.endtime'] = ['>',time()]; */
            
            //-me  
            if ($postData['status']==23) {  //工作台-已完成-会议室申请使用
            	$con['a.status']=array('<>','7001001');
            }else{
            	$con['a.status'] = $postData['status'];
            	$con['e.endtime'] = ['>',time()];
            }
            //---
            
            $join = [['sysDict b', 'a.status=b.code and b.isDelete=0', 'left'],['user c', 'a.adduserId=c.id and c.isDelete=0', 'left'],['etprs d', 'c.etprsId=d.id and d.isDelete=0', 'left'],['activity e', 'e.id=a.actId and e.isDelete=0', 'left']];
            $field = 'a.id,a.actId,a.serialNo,a.etprs,a.name,a.mobile,a.num,a.total,a.addtime,b.name as status,d.status as enterstatus,e.name as actName,e.price';
            $sign = getDataList('activityApl', $con, $field, $order, $join, '', $offset, $limit); //dump($sign);die;//取出报名信息
            //dump($sign);die;
            if ($sign['code'] != 1) {
                throw new  \think\Exception("获取报名信息失败:" . $sign['msg']);
            }
            $totalrecord=count(getDataList('activityApl', $con, $field, $order, $join)['data']);//获取数据总数
            $data = $sign['data'];
            //处理数据
            foreach ($data as $k => $v) {
                $data[$k]['addtime'] = $v['addtime'] ? date('Y-m-d H:i', $v['addtime']) : '';//时间转换
                $data[$k]['total'] = $v['total'] ? ($v['total'] * 100 / 100).'元': '';//价格去.00
                $data[$k]['free']= $data[$k]['total'] ? "否":'是';
                $data[$k]['price']= !empty($data[$k]['price'])?$data[$k]['price'].'元/人':'';//todo::work
            }
            return json (array('total' => $totalrecord, 'rows' => $data));
        } catch (\Exception $e) {
            c_Log($e);
            return json(array('total' => 0, 'rows' => [], 'msg' => $e->getMessage()));
        }

    }
}