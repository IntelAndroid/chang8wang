<?php

namespace app\common\model;

use think\Db;

class Meetroom
{
    private $iqbtStr = null;

    public function __construct()
    {
        $this->iqbtStr = session("user.iqbtId");
    }

    // 获取所有会议室名称
    public function getNameList()
    {
        try {
            $con['a.iqbtId'] = ['in', $this->iqbtStr];
            $type = session("user.type");
            $list = getDataList('mtroom', $con, 'a.id,a.name,b.name as buildName,c.floor as floor','',[['build b','a.buildId=b.id and b.isDelete=0','left'],['floor c','a.floorId=c.id and c.isDelete=0','left']]);
            if ($list['code'] == 0) {
                throw new \think\Exception('获取会议室列表出错' . $list['msg']);
            } else if (!$list['data']) {
                $list['data'] = null;
            } else{
                foreach($list['data'] as $k=>$v){
                    $list['data'][$k]['name'] = $v['buildName'].'-'.$v['floor'].'-'.$v['name'];
                }
            }

            $list['etprsName'] = getField('etprs', array('id' => session("user.etprsId")), 'name');
            return $list;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取会议室列表
    public function getMeetroomList()
    {
        try {
            $con = $this->getCondition();
            //分页条件
            $limit = !empty(input("limit")) ? input("limit") : '';
            $offset =!empty(input("offset")) ? input("offset") : '';
            // 需单独处理日期查询
            $mtAplCon['a.starttime'] = $con['starttime'];
//            $mtAplCon['a.endtime'] = $con['a.endtime'];
            //$mtAplCon['a.status'] = '7001002';
            $curDate = $con['date'];
            unset($con['date']);
            unset($con['starttime']);
            unset($con['a.endtime']);
            // 收藏表的查询条件  关联adduserId
            $join = [
                ['build b', 'a.buildId=b.id', 'left'],
                ['floor d', 'a.floorId=d.id', 'left'],
                ['SysDict c', 'a.accept=c.code', 'left'],
                ['MtroomColect e','a.id=e.mtroomId and e.isDelete=0 and e.adduserId='.session("userId"),'left'],
            ];
            $field = 'a.id,a.name as mtrName,a.buildId,b.name as buildName,
            d.floor,a.accept,a.price,a.audit,a.publish,c.name as acceptName,e.mtroomId as isCollect';
            $list = getDataList('Mtroom', $con, $field, 'e.addtime desc,a.addtime desc', $join,'',$limit,$offset);
            if ($list['code'] == '0') {
                throw new \think\Exception($list['msg']);
            }
            $list = $list['data'];
            $mtAplField = 'a.id as aplId,a.starttime,a.endtime,a.etprsId,a.status,d.name as etprsName,e.name as aplStatusName';
            $mtAplJoin = [['etprs d', 'a.etprsId=d.id', 'left'], ['SysDict e', 'a.status=e.code', 'left']];
            foreach ($list as $index => $row) {
                // 左侧完整名称
                $fullyName = $row['buildName'] . '-' . $row['floor'] . '-' . $row['mtrName'];
                $list[$index]['fullyName'] = $fullyName;
                if($row['price'] >= 0){
                    $list[$index]['price'] = $row['price']*100/100;
                }
                // 容纳最大人数
                if (strpos($row['acceptName'], '-') !== false) {
                    $str = substr($row['acceptName'], 0, strlen($row['acceptName']) - 1);
                    $arr = explode("-", $str);
                    $list[$index]['max'] = intval($arr[1]);
                } else {
                    $list[$index]['max'] = intval($row['acceptName']);
                }
                $mtAplCon['mtroomId'] = $row['id'];
                if(session("user.type") == '6019002'){
                    // $mtAplCon['a.etprsId'] = session("user.etprsId");
                }
//                 不要已经拒绝的会议室申请(取消的也不要)
//                $mtAplCon['a.status'] = ['<>','7001003'];
                $mtAplCon['a.status'] = ['not in','7001003,7001000'];
//                 查询会议室预订数据
                $mtRoomApl = getDataList('MtroomApl', $mtAplCon, $mtAplField, 'a.starttime asc', $mtAplJoin);
                if ($mtRoomApl['code'] == '1') {
                    $total = 0;
                    $mtRoomApl = $mtRoomApl['data'];
                    foreach ($mtRoomApl as $item => $value) {
                        // 计算需要审核数量
                        if ($value['status'] == '7001001') {
                            $total++;
                        }
                        // $list[$index]['timeLine'][] = $value;
                        foreach ($value as $curIndex => $curRow) {
                            // 这里循环每个时间段，并且把starttime在此时间段内的数据放入 data单元中
                            $value['mtroomName'] = $row['mtrName'];
                            switch ($curIndex) {
                                case 'starttime':
                                    $mtRoomApl[$item]['starttimeStr'] = date("H:i", $curRow);
                                    break;
                                case 'endtime':
                                    $mtRoomApl[$item]['endtimeStr'] = date("H:i", $curRow);
                                    break;
                                default:
                                    break;
                            }
                        }
//                        dump($value);
                        $list[$index]['timeLine'][] = $mtRoomApl[$item];
                    }
                    // 审核总数
//                    $list[$index]['number'] = $total;
                    $list[$index]['number'] =   getRecordNum('MtroomApl',['mtroomId'=>$list[$index]['id'],'status'=>7001001,'endtime'=>['>',time()]]) ;
                } else {
                    return $mtRoomApl;
                }
            }
            return array('code' => 1, 'msg' => '会议室数据', 'data' => $list, 'curDate' => $curDate);
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 新增会议室
    public function addRoom($data)
    {
        Db::startTrans();
        try {
            if (!is_array($data)) {
                return array('code' => 0, 'msg' => '数据格式错误');
            }
            $data['iqbtId'] = $this->iqbtStr;
            $data['floorId'] = $data['floor'];
            unset($data['floor']);
            $result = saveData('mtroom', $data);
            if($result['code'] == 0){
                throw new \think\Exception('会议室新增失败'.$result['msg']);
            }
            // 写入日志
            $logRes = saveLog('6012033','新增会议室',$result['data'],'mtroom',session("user.etprsId"));
            if($logRes['code'] == 0){
                throw new \think\Exception('会议室新增日志记录失败');
            }
            Db::commit();
            return $result;
        } catch (\Exception $e) {
            Db::rollback();
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取审核数据
    public function getMtroomApl($id = 0)
    {
        try {
            if ($id) {
                $con['a.id'] = $id;
            }
            $con = $this->getAplCon();
//            dump($con);
            $field = 'a.id,a.status,a.name as mtName,d.name as mtroomName,d.free,e.name as buildName,d.price as sprice,f.floor,c.name as etprsName,c.contact,c.mobile,a.starttime,a.endtime,d.price,a.paid,b.name as statusName';
            $join = [
                ['SysDict b', 'a.status=b.code', 'left'],
                ['etprs c', 'a.etprsId=c.id', 'left'],
                ['mtroom d', 'a.mtroomId=d.id', 'left'],
                ['build e', 'd.buildId=e.id', 'left'],
                ['floor f', 'd.floorId=f.id', 'left'],
            ];
            //分页条件
            $limit = !empty(input("limit")) ? input("limit") : '';
            $offset = !empty( input("offset")) ? input("offset"): '';
            $list = getDataList('MtroomApl', $con, $field, 'a.addtime desc', $join,'',$limit,$offset); //var_dump($list); die;
            $list1 = getDataList('MtroomApl', $con, $field, 'a.addtime desc', $join,'');
            //dump($list);die;
            if ($list['code'] == '0') {
                throw new \think\Exception($list['msg']);
            }
            foreach ($list['data'] as $k => $v) {
            	$list['data'][$k]['sprice']=$list['data'][$k]['sprice'].'元/小时';
                $hour=($list['data'][$k]['endtime']-$list['data'][$k]['starttime'])/3600;//会议时间
                $list['data'][$k]['Ymd']=date('Y-m-d',$list['data'][$k]['starttime']);
                $list['data'][$k]['timeLen']=date('H:i',$list['data'][$k]['starttime']).'-'.date('H:i',$list['data'][$k]['endtime']).' ('.$hour.'h)';
                $list['data'][$k]['hour']=$hour.'h';
                foreach ($v as $item => $value) {
                    switch ($item) {
                        case 'starttime':
                            $list['data'][$k]['startstamp'] = $list['data'][$k][$item]*1000;
                            $list['data'][$k][$item] = date('Y-m-d H:i', $value);
                            break;
                        case 'endtime':
                            $list['data'][$k]['endstamp'] = $list['data'][$k][$item]*1000;
                            $list['data'][$k][$item] = date('Y-m-d H:i', $value);
                            break;
                        case 'price':
                            $list['data'][$k][$item] = $value * 100 / 100*$hour;
                            break;
                        case 'paid':
                            $list['data'][$k][$item] = $value * 100 / 100;
                            break;
                        case 'free':
                            if ($value == '7002001') {
                                $list['data'][$k][$item] = '是';
                                $list['data'][$k]['freeName'] = '是';
                            } else {
                                $list['data'][$k][$item] = '否';
                                $list['data'][$k]['freeName'] = '否';
                            }
                            break;
                        default:
                            break;
                    }
                }
            }
            //echo '<pre>';print_r($list);echo '</pre>';exit();
            return array('total' => count($list1['data']), 'rows' => $list['data']);
        } catch (\Exception $e) {
            c_Log($e);
            return array('total' => 0, 'rows' => [], 'msg' => $e->getMessage());
        }
    }

    // 导出申请数据
    public function export()
    {
        try {
            vendor("PHPExcel");
            vendor("PHPExcel.Writer.Excel2007");
            vendor("PHPExcel.IOFactory");
            $header = array('会议室名称', '是否免费', '楼座', '楼层', '申请企业名称', '开始时间', '结束时间', '应缴金额（元）','实缴金额（元）', '会议室状态');

            $data = $this->getMtroomApl();

            if ($data['total'] > 0) {
                foreach ($data['rows'] as $k => $v) {
//                    unset($data['rows'][$k]['paid']);
                    unset($data['rows'][$k]['id']);
                    unset($data['rows'][$k]['status']);
                    unset($data['rows'][$k]['endstamp']);
                    unset($data['rows'][$k]['freeName']);
                }
                // 写入日志
                $logRes = saveLog('6012038','导出会议室申请记录','','mtroomApl',session("user.etprsId"));
                if($logRes['code'] == 0){
                    throw new \think\Exception('导出会议室申请记录-日志记录失败');
                }
                getExcel("会议室审核", $header, $data['rows']);
            } else {
                throw new \think\Exception('没有可以导出的数据');
            }
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage(), 'data' => []);
        }
    }

    // 会议室详情
    public function mtDetail($id = 0)
    {
        try {
            $field = 'a.id,a.buildId,a.iqbtId,a.name,a.accept,a.floorId,b.name as acceptName,a.facility,a.desc,a.free,a.price,a.audit,a.publish,c.name as buildName,d.floor,e.mtroomId as isCollect';
            $join = [
                ['SysDict b', 'a.accept=b.code', 'left'],
                ['build c', 'a.buildId=c.id', 'left'],
                ['floor d', 'a.floorId=d.id', 'left'],
                ['MtroomColect e','a.id=e.mtroomId and e.isDelete=0 and e.adduserId='.session("userId"),'left'],
            ];
            $row = findById('mtroom', array('a.id' => $id), $field, '', $join);
            if ($row['code'] == '0') {
                throw new \think\Exception('会议室信息获取失败' . $row['msg']);
            }
            $row['data']['rqst_build'] = $row['data']['buildId'];
            $row['data']['rqst_floor'] = $row['data']['floorId'];
            unset($row['data']['buildId']);
            foreach ($row['data'] as $k => $v) {
                switch ($k) {
                    case 'acceptName':
                        // 容纳最大人数
                        if (strpos($v, '-') !== false) {
                            $str = substr($v, 0, strlen($v) - 1);
                            $arr = explode("-", $str);
                            $row['data']['max'] = intval($arr[1]);
                        } else {
                            $row['data']['max'] = intval($v);
                        }
                        break;
                    case 'free':
                        if ($v == '7002001') {
                            $row['data']['freeName'] = '是';
                        } else {
                            $row['data']['freeName'] = '否';
                        }
                        break;
                    case 'audit':
                        if ($v == '7002001') {
                            $row['data']['auditName'] = '是';
                        } else {
                            $row['data']['auditName'] = '否';
                        }
                        break;
                    case 'publish':
                        if ($v == '7002001') {
                            $row['data']['publishName'] = '是';
                        } else {
                            $row['data']['publishName'] = '否';
                        }
                        break;
                    case 'facility':
                        $fac = array();
                        $value = explode(",", $v);
                        foreach ($value as $codeId) {
                            $name = getField('SysDict', array('code' => $codeId), 'name');
                            if ($name) {
                                $fac[] = $name;
                            }
                        }
                        $row['data']['facilityName'] = implode(",", $fac);
                        $row['data']['mtrFacility'] = $v;
                        break;
                    default:
                        break;
                }

            }
            return $row;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 会议室预定详情
    public function getMtOrder($id = 0)
    {
        try {
            $field = 'a.id,a.etprsId,a.addtime,a.mtroomId,a.name as meetName,a.starttime,a.endtime,a.payable,a.paid
        ,a.status,b.name as mtroomName,b.free,b.price,c.name as etprsName,d.name as statusName,e.realname';
            $join = [
                ['mtroom b', 'a.mtroomId=b.id', 'left'],
                ['etprs c', 'a.etprsId=c.id', 'left'],
                ['SysDict d', 'a.status=d.code', 'left'],
                ['user e', 'a.adduserId=e.id', 'left'],
            ];
            $row = findById('MtroomApl', array('a.id' => $id), $field, 'a.addtime desc', $join);
            if ($row['code'] == '0') {
                throw new \think\Exception('会议室预定信息不存在');
            }
            foreach ($row['data'] as $k => $v) {
                switch ($k) {
                    case 'addtime':
                        $row['data']['addtime'] = date('Y-m-d H:i', $v);
                        break;
                    case 'starttime':
                        $row['data']['starttime'] = date('Y-m-d H:i', $v);
                        break;
                    case 'endtime':
                        $row['data']['endstamp'] =  $row['data']['endtime']*1000;
                        $row['data']['endtime'] = date('Y-m-d H:i', $v);
                        break;
                    case 'free':
                        if ($v == '7002001') {
                            $row['data']['free'] = '是';
                            $row['data']['freeName'] = '是';
                        } else {
                            $row['data']['free'] = '否';
                            $row['data']['freeName'] = '否';
                        }
                        break;
                    case 'price':
                        $row['data']['price'] = $v * 100 / 100;
                        $row['data']['od-price'] = $v * 100 / 100;
                        break;
                    case 'payable':
                        $row['data']['payable'] = $v * 100 / 100;
                        $row['data']['od-payable'] = $v * 100 / 100;
                        break;
                    case 'paid':
                        $row['data']['paid'] = $v * 100 / 100;
                        $row['data']['od-paid'] = $v * 100 / 100;
                        break;
                }
            }
            return $row;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 审核详情
    public function getReview($id = 0)
    {
        try {
            // 申请信息
            $data = $this->getMtOrder($id);
            // 会议室信息
            if ($data['code'] == '0') {
                return $data;
            }
            $mtData = $this->mtDetail($data['data']['mtroomId']);
            $mtData['mtrId'] = $mtData['data']['id'];
            unset($mtData['data']['id']);
            $data['data'] = array_merge($data['data'], $mtData['data']);
            return $data;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 会议室审核列表查询条件
    public function getAplCon()
    {
        try {
            $con = array();
            $buildId = input("build");
            $floor = input("floor");
            $id=input("id");
//            $mrId = input("id");
            $mrId = !empty($id)?$id:'';
            $mtName = input('mtName');
            $start = strtotime(input("start"));
            $end = strtotime(input("end"));
            $type = session("user.type");
            $status = input("status");
            $date = input('date');
//            if($date){
//                $con['a.starttime'] = ['between',[strtotime($date),strtotime($date)+60*60*24]];
//                $con['a.endtime'] = ['>',time()];
//            }
            if ($status) {
                $con['a.status'] = $status;
                if($status==7001001){
                    $con['a.endtime']=['>',time()];
                }
                //-me  工作台-已完成-会议室申请使用
                if ($status==23) {
                	$con['a.status']=array('<>','7001001');
                }
                //---
            }
            if ($type == '6019001') {
                $con['d.iqbtId'] = ['in', session('user.iqbtId')];
            }
            if ($type == '6019002') {
                $con['a.etprsId'] = session('user.etprsId');
            }
            if ($start && $end) {
                if ($start == $end) {
                    $con['a.starttime'] = ['>', $start];
                } else {
                    $con['a.starttime'] = ['>', $start];
                    $con['a.starttime'] = ['<', $end + 60 * 60 * 24];
                }
            }
            if ($start && !$end) {
                $con['a.starttime'] = ['>', $start];
            }
            if (!$start && $end) {
                $con['a.starttime'] = ['<', $end + 60 * 60 * 24];
            }
            if ($mtName) {
                $con['a.name'] = ['like', "%$mtName%"];
            }
            if (!empty($mrId)) {
                $con['a.mtroomId'] = $mrId;
            }
            if ($buildId) {
                $con['d.buildId'] = $buildId;
            }
            if ($floor) {
                $con['d.floorId'] = $floor;
            }
            return $con;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 查询条件  会议室列表
    public function getCondition()
    {
        try {
            $con['a.iqbtId'] = ['in', $this->iqbtStr];
            $buildId = input("build");
            $floor = input("floor");
            $id = input("id");

            $con['date'] = input('date') ? input('date') : date('Y-m-d', time());
            // 筛选日期 如果选择了日期查询 mtroomApl表中开始时间为该天的数据
            $begin = input('date') ? strtotime(input('date')) : strtotime(date('Y-m-d', time()));

            $end = $begin + 60 * 60 * 24;
            $con['starttime'] = ['between', $begin . ',' . $end];
            // 没选默认当前
            if ($id) {
                $con['a.id'] = $id;
            }
            if ($buildId) {
                $con['a.buildId'] =$buildId;
            }
            if ($floor) {
                $con['a.floorId'] = $floor;
            }

            return $con;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

}
