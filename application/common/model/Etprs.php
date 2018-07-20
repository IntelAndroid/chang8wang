<?php

namespace app\common\model;
use think\Db;
use think\Log;
use app\common\controller\Common;
/**
 * 2018-01-31 sass入驻管理model操作
 * 表名  etprs
 */
class Etprs
{

    private $iqbtStr = null;

    public function __construct()
    {
        //下面这个是为了微信测试加的  不用记得删了
        if(request()->isMobile()) {
            $iqbtStr = 1;
        }else{
            $iqbtStr = session("user.iqbtId");
        }
        $this->iqbtStr = $iqbtStr;
    }

    public function getEtprsRecord()
    {
        try {
            $con = $this->getStatusCondition();
            $totalrecord = getRecordNum('etprs', $con);
            return array('total' => $totalrecord);
        } catch (\Exception $e) {
            c_Log($e);
            return array('total' => 0, 'rows' => [],'msg'=>$e->getMessage());
        }
    }
    /**
     * @parma $status
     * 64	发起入驻前	6008001
        65	发起入驻	6008002
        66	房间分配	6008003
        67	签约合同	6008004
        68	正式入驻	6008005
        69	已毕业	6008006
     * @return  bootstrape 服务端分页
     */
    public function getAllEtprs()
    {
        try {
            $con = $this->getStatusCondition();
            $postData = input();
            $offset = !empty($postData['offset'])?$postData['offset']:0;
            $limit = !empty($postData['limit'])?$postData['limit']:10;
            if( input('status')==1){
                $order = 'a.status asc,a.addtime desc';
            }else {
                $order = 'a.status desc,a.addtime desc';
            }
            // 搜索  默认是get传来字段名以及要搜索的值
            unset($postData['offset']);
            unset($postData['limit']);
            unset($postData['order']);
            if (isset($postData['search']) && !empty($postData['search'])) {
                $con['a.name'] = array('like', '%' . $postData['search'] . '%');
                unset($postData['search']);
            }
            $field = 'a.id,a.name,a.addtime,a.contact,a.type,a.source,a.mobile,a.legalname,a.status,a.apltime,f.addtime as quitTime';
            $totalrecord = getRecordNum('etprs', $con);
            $join = [['EtprsQuit f','a.id=f.etprsId and f.isDelete=0','left']];
            // bootstrape 需要的数据
            $list = getDataList('etprs', $con, $field, $order, $join, '',$limit,$offset);
            if($list['code'] == '0'){
                throw new \think\Exception('数据获取失败'.$list['msg']);
            }
            foreach ($list['data'] as $k => $v) {
                // 修改下时间格式
                $list['data'][$k]["addtime"] = $list['data'][$k]["addtime"] ? date('Y-m-d H:i', $list['data'][$k]["addtime"]) : '-';
                $list['data'][$k]["apltime"] = $list['data'][$k]["apltime"] ? date('Y-m-d H:i', $list['data'][$k]["apltime"]) : '-';
                $list['data'][$k]["quitTime"] = $list['data'][$k]["quitTime"] ? date('Y-m-d H:i', $list['data'][$k]["quitTime"]) : '-';
                // 如果状态为签约合同
                if ($v['status'] > '6008004') {
                    // 获取企业合同信息
                    $pactInfo = model("Pactlog")->getEtprsPact($v['id']);
                    if($pactInfo['code'] == 1){
                        $list['data'][$k]['pactId'] = $pactInfo['data']['id'];
                        $list['data'][$k]['pact_start'] = date("Y-m-d", $pactInfo['data']['pact_start']);
                        $list['data'][$k]['pact_end'] = date("Y-m-d", $pactInfo['data']['pact_end']);
                    }
                    if ($v['status'] == '6008005') {
                        // 获取已经分配的房间
                        $roomList = getDataList('room', ['etprsId' => $v['id']], 'a.id,a.roomNo,b.name as buildName', 'a.addtime', [['build b', 'a.buildId=b.id', 'left']]);
                        $roomInfo = array();
                        $roomList = $roomList['data'];
                        foreach ($roomList as $k2 => $v2) {
                            $roomInfo[] = $v2['buildName'] . ' - ' . $v2['roomNo'];
                        }
                        $list['data'][$k]['roomInfo'] = $roomInfo;
                    }
                }
            }
            //获取字典表字段名称
            $com = new Common();
            $tmplist=$com->getDictStr('*','Etprs','Name');
            $list['data']=$com->setListIdText($list['data'],$tmplist);
            return array('total' => $totalrecord, 'rows' => $list['data']);
        } catch (\Exception $e) {
            c_Log($e);
            return array('total' => 0, 'rows' => [],'msg'=>$e->getMessage());
        }
    }

    // excle 读取文件-获取数据-新增或者修改数据
    public function importCustomer($file, $cols)
    {
        // 获取数据
        $data = xlsData($file, $cols);
        // 把企业的ID换成当前用户所属的iqbtId  因为暂时一个用户有一个孵化器,以后多了也用默认的第一个？
        $iqbtId = $this->iqbtStr;
        //return $data;
        Db::startTrans();
        try {
            $newRow = 0;
            $updateRow = 0;
            foreach ($data as $column => $row) {
                // 导入客户 数据来源 60123005
                $row['dataform'] = 6023005;
                // 入驻时间
                $row['entertime'] = time();
                $row['iqbtId'] = $iqbtId;
                if ($oldRow = Db::name("etprs")->where('isDelete', 0)->where('name', $row['name'])->find()) {
                    $row['id'] = $oldRow['id'];
                    $updateRow++;
                } else {
                    $newRow++;
                }
                $res = saveData("etprs", $row);
                if($res['code'] == 0){
                    throw new \think\Exception('导入数据失败'.$res['msg']);
                }
                // 生成user 
            }
            Db::commit();
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
        return array('code' => 1, 'msg' => '入驻客户信息导入成功', 'update' => $updateRow, 'new' => $newRow);
    }

    public function exportEtprs($con = [])
    {
        $con = $this->getStatusCondition();
        //$con['status'] = ['not in','6008005,6008006,6008001'];
        //$con["iqbtId"] = ['in',$this->iqbtStr];
        vendor("PHPExcel");
        vendor("PHPExcel.Writer.Excel2007");
        vendor("PHPExcel.IOFactory");
        $header = array('客户名称', '联系人', '联系电话', '法人或者负责人', '客户类型', '来源', '状态');
        $join = [['SysDict b', 'a.type=b.code', 'left'], ['SysDict c', 'a.source=c.code', 'left']];

        $field = 'a.name,a.contact,a.mobile,a.legalname,b.name as typeName,c.name as sourceName,a.status';

        $list = getDataList('etprs', $con, $field, 'a.status desc,a.addtime desc', $join);
        if (!empty($list['data'])) {
            $data = $list['data'];
        } else {
            return array('code' => 0, 'msg' => '没有数据可以导出');
        }
        for ($i = 0; $i < count($data); $i++) {
            $status = $data[$i]["status"];
            if ($status < 6008005 && $status > 6008001) {
                $data[$i]["status"] = "待入驻";
            }
            if ($status == 6008005) {
                $data[$i]["status"] = "已入驻";
            }
            if ($status == 6008006) {
                $data[$i]["status"] = "已毕业";
            }
        }
        getExcel("客户信息", $header, $data);
    }

    public function getEtprsBase($id = 0, $field, $join = [])
    {
        try {
            if ($id) {
                $curEtprs = findById('etprs', array('a.id' => $id), $field, '', $join);
                if ($curEtprs['code'] == 0) {
                    throw new \think\Exception('企业数据获取失败'.$curEtprs['msg']);
                }
                $curEtprs['data']['buslic'] = $curEtprs['data']['buslic'] . ',' . $curEtprs['data']['busFile'];
                $curEtprs['data']['bp'] = $curEtprs['data']['bp'] . ',' . $curEtprs['data']['bpFile'];
                unset($curEtprs['data']['bpFile']);
                unset($curEtprs['data']['busFile']);
                if ($curEtprs['data']['rqst_start']) {
                    $curEtprs['data']['rqst_start'] = date('Y-m-d', $curEtprs['data']['rqst_start']);
                } else {
                    $curEtprs['data']['rqst_start'] = date('Y-m-d', time());
                }
                if ($curEtprs['data']['rqst_end']) {
                    $curEtprs['data']['rqst_end'] = date('Y-m-d', $curEtprs['data']['rqst_end']);
                } else {
                    $curEtprs['data']['rqst_end'] = date('Y-m-d', time());
                }
                $com = new Common();
                //获取字典表字段名称
                $tmplist=$com->getDictStr('*','Etprs','Name');
                $curEtprs['data']=$com->setObjIdText($curEtprs['data'],$tmplist);
                return $curEtprs;
            }else{
                throw new \think\Exception('企业ID不能为空');
            }
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    /**
     * 获取楼座/楼层/第一个楼座下的      楼层对应房间数据
     * @param $etprsId  企业ID       房间分配以及房间变更需要传etprsId  图形化展示无需传任何数据
     * @param $isChange 变更         默认为 false   如果为变更则为true
     */
    public function getIqbtRoom2Old($etprsId = 0, $isChange = false)
    {
        try {
            $request = \think\Request::instance();
            $base    = $request->root();
            $root    = strpos($base, '.') ? ltrim(dirname($base), DS) : $base;
            if ('' != $root) {
                $root = '/' . ltrim($root, '/');
            }
            $PUBLIC = $root.'/public';
            $con['a.iqbtId'] = ['in', $this->iqbtStr];
            $getBuild = input("build");
            $getFloor = input("floor");
            $getRoom = input("room");
            // 获取孵化器对应的楼座楼层信息
            $buildFloord = getDataList('build', $con,'a.name,b.id as floorId,b.floor,a.iqbtId,a.id', 'a.name asc,b.floor asc',[['floor b', 'a.id=b.buildId and b.isDelete=0', 'left']]);
            if ($buildFloord['code'] == 0) {
                return $buildFloord;
            }
            $buildFloord = $buildFloord['data'];
            $defaultBuild = array();
            foreach ($buildFloord as $K => $v) {
                if (!in_array($v['name'], $defaultBuild) && $v['name']) {
                    $defaultBuild[] = $v['name'];
                }
            }
            // 有选择楼座
            if ($getBuild) {
                $con['a.name'] = $getBuild;
            } else {
                // 获取第一个楼座
                if ($defaultBuild) {
                    $con['a.name'] = $defaultBuild[0];
                }
            }
            if ($getFloor && $getFloor != '选择楼层') {
                $con['b.floor'] = $getFloor;
            }
            if ($getRoom) {
                $con['c.roomNo'] = $getRoom;
            }
            if (input("status") || input("status") == '0') {
                if (input("status") == '5') {
                    $con['c.selfuse'] = 7002001;
                } else {
                    $con['c.status'] = input("status");
                }
            }
            $return = array();
            if ($etprsId) {
                if (!$isChange) {
                    // 写入日志  这里不该记录日志
                    // saveLog('6012009','房间分配',$etprsId,'etprs',$etprsId);
                }
                // 当前要分配的企业信息    findById('etprs',['id'=>$etprsId],'id,name');
                $etprsInfo = findById('etprs', ['id' => $etprsId], 'id,name,status');
                if ($etprsInfo['code'] == 0) {
                    $etprsInfo['msg'] = '企业数据不存在';
                    return $etprsInfo;
                }
                $etprsInfo['data']['eId'] = $etprsInfo['data']['id'];
                $return['etprsInfo'] = $etprsInfo['data'];
            }
            // 如果是房间变更。先检查此房间是否满足条件
            if ($isChange) {
                if ($etprsInfo['data']['status'] != 6008005) {
                    $error['code'] = 0;
                    $error['msg'] = '正在操作的企业尚未正式入驻,无法进行房间分配操作,请检查入驻流程!';
                    return $error;
                } else {
                    // 获取企业合同信息
                    $pactInfo = model("Pactlog")->getEtprsPact($etprsId);
                    if($pactInfo['code'] == 0){
                        $pact['msg'] = '正式入驻签约合同数据不存在,请重试';
                        return $pact;
                    }
                    $pact = $pactInfo['data'];
                    $etprsInfo['data']['pactId'] = $pact['id'];
                    $etprsInfo['data']['pact_start'] = date('Y-m-d', $pact['pact_start']);
                    $etprsInfo['data']['pact_end'] = date('Y-m-d', $pact['pact_end']);
                    // 获取已经分配的房间
                    $roomList = getDataList('room', ['etprsId' => $etprsId], 'a.id,a.roomNo,b.name as buildName,a.area', 'a.roomNo asc', [['build b', 'a.buildId=b.id and b.isDelete=0', 'left']]);
                    $roomInfo = array();
                    $roomList = $roomList['data'];
                    foreach ($roomList as $k => $v) {
                        $merge['string'] = $v['buildName'] . ' - ' . $v['roomNo'] . ':' . $v['area'] . '㎡';
                        $merge['id'] = $v['id'];
                        $roomInfo[] = $merge;
                    }
                    $etprsInfo['data']['roomInfo'] = $roomInfo;
                }
                $return['etprsInfo'] = $etprsInfo['data'];
            }
            // 获取孵化器对应的楼座楼层信息   order ,a.name asc,a.floor asc
//            $buildFloor = getDataList('build', $con, 'a.name,a.floor,a.iqbtId,a.id,h.savePath as pic,b.*,b.roomNo,b.id as roomId,(case when status = 0 then "空闲" when status = 1 then "已占用" when status = 2 then "已入驻" else "自用" end) as statusName', 'b.roomNo asc', [['SysFile h', 'a.pic=h.id', 'left'], ['room b', 'a.id=b.buildId and b.isDelete=0', 'left']]);
            $filed='a.name,a.iqbtId,a.id,b.floor,h.savePath as pic,c.*,c.roomNo,c.id as roomId,(case when status = 0 then "空闲" when status = 1 then "已占用" when status = 2 then "已入驻" else "自用" end) as statusName';
            $join=[['floor b','a.id=b.buildId and b.isDelete=0','left'],['SysFile h', 'b.pic=h.id', 'left'],['room c', 'c.floorId=b.id and c.isDelete=0', 'left']];
            $buildFloor = getDataList('build',$con,$filed,'c.roomNo asc',$join);
            if ($buildFloor['code'] == 0) {
                throw new \think\Exception('楼座信息获取失败:::'.$buildFloor['msg']);
            }
            $buildFloor = $buildFloor['data'];
            //获取字典表字段名称
            $com = new Common();
            $tmplist=$com->getDictStr('*','Room','Name');
            $buildFloor=$com->setListIdText($buildFloor,$tmplist);
            $floor = array();
            $roomNo = array();
            $allRoom = array();
            foreach ($buildFloor as $k => $v) {
                if (!in_array($v['floor'], $floor) && $v['floor'] && $v['roomId']) {
                    $floor[] = $v['floor'];
                }
                if (!in_array($v['roomNo'], $roomNo) && $v['roomNo'] && $v['roomId']) {
                    $roomNo[] = $v['roomNo'];
                }
                if ($v['roomId']) {
                    $curRoom['id'] = $v['roomId'];
                    // 20180310 1459 说楼层数字显示即可
                    // $curRoom['floor'] = number2chinese($v['floor']);
                    $curRoom['floor'] = $v['floor'];
                    $curRoom['buildId'] = $v['buildId'];
                    $curRoom['buildName'] = $v['name'];
                    $curRoom['etprsId'] = $v['etprsId'];
                    $curRoom['roomNo'] = $v['roomNo'];
                    $curRoom['area'] = $v['area'] * 100 / 100;
                    $curRoom['num'] = $v['num'];
                    $curRoom['type'] = $v['type'];
                    $curRoom['typeName'] = $v['typeName'];
                    $curRoom['status'] = $v['status'];
                    $curRoom['statusName'] = $v['statusName'];
                    $curRoom['unit'] = $v['unit'];
                    $curRoom['unitName'] = $v['unitName'];
                    $curRoom['price'] = $v['price'] * 100 / 100;
                    $curRoom['total'] = $v['total'] * 100 / 100;
                    $curRoom['selfuse'] = $v['selfuse'];
                    // 如果此房间被占用,获取企业信息  以及合同信息
                    if ($v['status'] == 2) {
                        // 企业
                        $curEtprs = findById('etprs', array('id' => $v['etprsId']), 'id,name');
                        if (isset($curEtprs['data']) && $curEtprs['data']) {
                            $curRoom['etprsName'] = $curEtprs['data']['name'];
                        }
                        // 获取企业合同信息
                        $pactInfo = model("Pactlog")->getEtprsPact($v['etprsId']);
                        if($pactInfo['code'] == 1){
                            $curRoom['pact_start'] = date('Y-m-d', $pactInfo['data']['pact_start']);
                            $curRoom['pact_end'] = date("Y-m-d", $pactInfo['data']['pact_start']);
                        }
                    } else {
                        $curRoom['etprsName'] = null;
                    }
                    if (is_file(ROOT_PATH . '/public' . $v['pic'])) {
                        $allRoom[$v['floor']]['pic'] = $PUBLIC . $v['pic'];
                    }
                    if ($v['type'] != 6011002&& $v['type'] != 6011003) {
                        $allRoom[$v['floor']]['office'][] = $curRoom;
                    } else {
                        $allRoom[$v['floor']]['station'][] = $curRoom;
                    }
                }
            }
            // 楼座
            $return['build'] = $defaultBuild;
            // 楼层
            $return['floor'] = $floor;
            // 房间号
            $return['roomNo'] = $roomNo;
            // 第一楼座对应的 楼层以及房间数据
            $return['floorRoom'] = $allRoom;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
        return $return;
    }
    public function getIqbtRoom2($etprsId = 0, $isChange = false)
    {
        try {
            $request = \think\Request::instance();
            $base    = $request->root();
            $root    = strpos($base, '.') ? ltrim(dirname($base), DS) : $base;
            if ('' != $root) {
                $root = '/' . ltrim($root, '/');
            }
            $PUBLIC = $root.'/public';
            $con['a.iqbtId'] = ['in', $this->iqbtStr];
            $getBuild = input("build");
            $getFloor = input("floor");
            $getRoom = input("room");
            // 获取孵化器对应的楼座楼层信息
            $buildFloord = getDataList('build', $con,'a.name,b.id as floorId,b.floor,a.iqbtId,a.id', 'a.name asc,b.floor asc',[['floor b', 'a.id=b.buildId and b.isDelete=0', 'left']]);
            if ($buildFloord['code'] == 0) {
                return $buildFloord;
            }
            $buildFloord = $buildFloord['data'];
            $defaultBuild = array();
            foreach ($buildFloord as $K => $v) {
                if (!in_array($v['name'], $defaultBuild) && $v['name']) {
                    $defaultBuild[] = $v['name'];
                }
            }
            // 有选择楼座
            if ($getBuild) {
                $con['a.name'] = $getBuild;
            } else {
                // 获取第一个楼座
                if ($defaultBuild) {
                    $con['a.name'] = $defaultBuild[0];
                }
            }
            if ($getFloor && $getFloor != '选择楼层') {
                $con['b.floor'] = $getFloor;
            }
            if ($getRoom) {
                $con['c.roomNo'] = $getRoom;
            }
            if (input("status") || input("status") == '0') {
                if (input("status") == '5') {
                    $con['c.selfuse'] = 7002001;
                } else {
                    $con['c.status'] = input("status");
                }
            }
            $return = array();
            if ($etprsId) {
                $con['c.type']=['<','6011004'];//分配房间时不显示公用和自用房间
//                $con['c.status']=0;//分配房间时只显示空闲房间
                if (!$isChange) {
                    // 写入日志  这里不该记录日志
                    // saveLog('6012009','房间分配',$etprsId,'etprs',$etprsId);
                }
                // 当前要分配的企业信息    findById('etprs',['id'=>$etprsId],'id,name');
                $etprsInfo = findById('etprs', ['id' => $etprsId], 'id,name,status');
                if ($etprsInfo['code'] == 0) {
                    $etprsInfo['msg'] = '企业数据不存在';
                    return $etprsInfo;
                }
                $etprsInfo['data']['eId'] = $etprsInfo['data']['id'];
                $return['etprsInfo'] = $etprsInfo['data'];
            }
            // 如果是房间变更。先检查此房间是否满足条件
            if ($isChange) {
                if ($etprsInfo['data']['status'] != 6008005) {
                    $error['code'] = 0;
                    $error['msg'] = '正在操作的企业尚未正式入驻,无法进行房间分配操作,请检查入驻流程!';
                    return $error;
                } else {
                    // 获取企业合同信息
                    $pactInfo = model("Pactlog")->getEtprsPact($etprsId);
                    if($pactInfo['code'] == 0){
                        $pact['msg'] = '正式入驻签约合同数据不存在,请重试';
                        return $pact;
                    }
                    $pact = $pactInfo['data'];
                    $etprsInfo['data']['pactId'] = $pact['id'];
                    $etprsInfo['data']['pact_start'] = date('Y-m-d', $pact['pact_start']);
                    $etprsInfo['data']['pact_end'] = date('Y-m-d', $pact['pact_end']);
                    // 获取已经分配的房间
                    $roomList = getDataList('room', ['etprsId' => $etprsId], 'a.id,a.roomNo,b.name as buildName,a.area', 'a.roomNo asc', [['build b', 'a.buildId=b.id and b.isDelete=0', 'left']]);
                    $roomInfo = array();
                    $roomList = $roomList['data'];
                    foreach ($roomList as $k => $v) {
                        $merge['string'] = $v['buildName'] . ' - ' . $v['roomNo'] . ':' . $v['area'] . '㎡';
                        $merge['id'] = $v['id'];
                        $roomInfo[] = $merge;
                    }
                    $etprsInfo['data']['roomInfo'] = $roomInfo;
                }
                $return['etprsInfo'] = $etprsInfo['data'];
            }
            // 获取孵化器对应的楼座楼层信息   order ,a.name asc,a.floor asc
//            $buildFloor = getDataList('build', $con, 'a.name,a.floor,a.iqbtId,a.id,h.savePath as pic,b.*,b.roomNo,b.id as roomId,(case when status = 0 then "空闲" when status = 1 then "已占用" when status = 2 then "已入驻" else "自用" end) as statusName', 'b.roomNo asc', [['SysFile h', 'a.pic=h.id', 'left'], ['room b', 'a.id=b.buildId and b.isDelete=0', 'left']]);
            $filed='a.name,a.iqbtId,a.id,b.floor,h.savePath as pic,c.*,c.roomNo,c.id as roomId,(case when status = 0 then "空闲" when status = 1 then "已占用" when status = 2 then "已入驻" else "自用" end) as statusName';
            $join=[['floor b','a.id=b.buildId and b.isDelete=0','left'],['SysFile h', 'b.pic=h.id', 'left'],['room c', 'c.floorId=b.id and c.prtroomId=c.id and c.isDelete=0', 'left']];
            $buildFloor = getDataList('build',$con,$filed,'c.roomNo asc',$join);
            if ($buildFloor['code'] == 0) {
                throw new \think\Exception('楼座信息获取失败:::'.$buildFloor['msg']);
            }
            $buildFloor = $buildFloor['data'];
            //获取字典表字段名称
            $com = new Common();
            $tmplist=$com->getDictStr('*','Room','Name');
            $buildFloor=$com->setListIdText($buildFloor,$tmplist);
            $floor = array();
            $roomNo = array();
            $allRoom = array();
            foreach ($buildFloor as $k => $v) {
                //如果房间是办公室(工位) 6011003 获取该房间下的工位塞到该单元下,
                if($v['type']==6011003){
//                    if ($etprsId) {//分配
//                        $cubicle = getDataList('room', ['prtroomId' => $v['id'], 'id' => ['<>', $v['id']],'status'=>0 ], 'id,etprsId,roomNo,area,unit,price,total');//查找该房间下工位
//                    }else{//管理
                        $cubicle = getDataList('room', ['prtroomId' => $v['id'], 'id' => ['<>', $v['id']]], 'id,etprsId,roomNo,area,unit,price,total,status');//查找该房间下工位
//                    }
                    if ($cubicle['code'] == 0) {
                        throw new \think\Exception('房间下工位列表获取失败:'.$cubicle['msg']);
                    }
                    $buildFloor[$k]['cubicle']=$cubicle['data'];
                    $buildFloor[$k]['cubicleNum']=count($cubicle['data']);
//                    dump($buildFloor);exit;
                }
                if (!in_array($v['floor'], $floor) && $v['floor'] && $v['roomId']) {
                    $floor[] = $v['floor'];
                }
                if (!in_array($v['roomNo'], $roomNo) && $v['roomNo'] && $v['roomId']) {
                    $roomNo[] = $v['roomNo'];
                }
                if ($v['roomId']) {
                    $curRoom['id'] = $v['roomId'];
                    // 20180310 1459 说楼层数字显示即可
                    // $curRoom['floor'] = number2chinese($v['floor']);
                    $curRoom['floor'] = $v['floor'];
                    $curRoom['buildId'] = $v['buildId'];
                    $curRoom['buildName'] = $v['name'];
                    $curRoom['etprsId'] = $v['etprsId'];
                    $curRoom['roomNo'] = $v['roomNo'];
                    $curRoom['area'] = $v['area'] * 100 / 100;
                    $curRoom['num'] = $v['num'];
                    $curRoom['type'] = $v['type'];
                    $curRoom['typeName'] = $v['typeName'];
                    $curRoom['status'] = $v['status'];
                    $curRoom['statusName'] = $v['statusName'];
                    $curRoom['unit'] = $v['unit'];
                    $curRoom['unitName'] = $v['unitName'];
                    $curRoom['price'] = $v['price'] * 100 / 100;
                    $curRoom['total'] = $v['total'] * 100 / 100;
                    $curRoom['selfuse'] = $v['selfuse'];
                    if( !empty($buildFloor[$k]['cubicle'])){//如果房间下有工位
                        $curRoom['cubicle']=$buildFloor[$k]['cubicle'];
                        $curRoom['cubicleNum']=$buildFloor[$k]['cubicleNum'];
                    }
                    // 如果此房间被占用,获取企业信息  以及合同信息
                    if ($v['status'] == 2) {
                        // 企业
                        $curEtprs = findById('etprs', array('id' => $v['etprsId']), 'id,name');
                        if (isset($curEtprs['data']) && $curEtprs['data']) {
                            $curRoom['etprsName'] = $curEtprs['data']['name'];
                        }
                        // 获取企业合同信息
                        $pactInfo = model("Pactlog")->getEtprsPact($v['etprsId']);
                        if($pactInfo['code'] == 1){
                            $curRoom['pact_start'] = date('Y-m-d', $pactInfo['data']['pact_start']);
                            $curRoom['pact_end'] = date("Y-m-d", $pactInfo['data']['pact_start']);
                        }
                    } else {
                        $curRoom['etprsName'] = null;
                    }
                    if (is_file(ROOT_PATH . '/public' . $v['pic'])) {
                        $allRoom[$v['floor']]['pic'] = $PUBLIC . $v['pic'];
                    }
                    if ($v['type'] != 6011002) {
                        $allRoom[$v['floor']]['office'][] = $curRoom;
                    } else {
                        $allRoom[$v['floor']]['station'][] = $curRoom;
                    }
                }
            }
            // 楼座
            $return['build'] = $defaultBuild;
            // 楼层
            $return['floor'] = $floor;
            // 房间号
            $return['roomNo'] = $roomNo;
            // 第一楼座对应的 楼层以及房间数据
            $return['floorRoom'] = $allRoom;
            return $return;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }
    // 申请入驻
    public function saveEtprsStep($step = 1, $table, $data)
    {
        $id = input("id") ? input('id') : 0;
    }


    // 返回入驻状态查询条件
    public function getStatusCondition()
    {
        try {
            $con['iqbtId'] = ['in', $this->iqbtStr];
            $start = input("start") ? strtotime(input("start")) : false;
            $end = input("end") ? strtotime(input("end")) : false;
            if (input('name')) {
                $con['a.name|a.mobile'] = ['like', '%' . input("name") . '%'];
            }
            if ($start && $end) {
                if ($start == $end) {
                    $con['a.entertime'] = ['>', $start];
                } else {
                    $con['a.entertime'] = ['between', $start.','.($end + 60 * 60 * 24)];
                }
            }
            if ($start && !$end) {
                $con['a.entertime'] = ['>', $start];
            }
            if (!$start && $end) {
                $con['a.entertime'] = ['<', $end + 60 * 60 * 24];
            }
            switch (input('status')){
                case '1':
                    $con['a.status'] = ['in', '6008002,6008003,6008004,6008005,6008006'];
                    break;
                case '2':
                    $con['a.status'] = ['in', '6008006'];
                    break;
                case '3':
                    $con['a.status'] = ['in', '6008005'];
                    break;
                case '4':
                    $con['a.status'] = ['in', '6008002,6008003,6008004'];
                    break;
            }

            return $con;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage(),'data'=>[]);
        }
    }

    // 获取企业详细信息
    public function getEtprsDetail($etprsId, $pactId = false)
    {
        try {
            $status = getField("etprs", ['id' => $etprsId], 'status');
            if(!$status){
                throw new \think\Exception('企业状态获取失败');
            }
            // 企业信息
            $field = 'a.id,a.name,a.type,a.contact,a.mobile,a.source,a.rqst,a.status,a.cstmstatus,g.name as rqst_build,h.floor as rqst_floor,a.rqst_roomNo,a.rqst_start,a.rqst_end,a.legalname,a.buslic,a.bp,e.savePath as buslicPath,e.fileName as busFile,f.savePath as bpPath,f.fileName as bpFile';
//            $field = 'a.id,a.name,a.type,a.contact,a.mobile,a.source,a.rqst,a.status,a.cstmstatus,a.rqst_build,a.rqst_floor,a.rqst_roomNo,a.rqst_start,a.rqst_end,a.legalname,a.buslic,a.bp,e.savePath as buslicPath,e.fileName as busFile,f.savePath as bpPath,f.fileName as bpFile';
            $join = [['SysFile e', 'a.buslic=e.id and e.isDelete=0', 'left'], ['SysFile f', 'a.bp=f.id and f.isDelete=0', 'left'], ['build g', 'a.rqst_build=g.id and g.isDelete=0', 'left'],['floor h', 'a.rqst_floor=h.id and h.isDelete=0', 'left']];
            $detail = findById('etprs', array('a.id' => $etprsId), $field, '', $join);
//            dump($detail);
            if($detail['code'] == 0){
                throw new \think\Exception('企业信息获取失败'.$detail['msg']);
            }
            $com = new Common();
            $tmplist=$com->getDictStr('*','Etprs','Name');
            $detail['data']=$com->setObjIdText($detail['data'],$tmplist,'Name');
            if(!empty($detail['data']['rqst_build'])){//如果意向楼座不为空
                if (!empty($detail['data']['rqst_floor'])){
                    $detail['data']['rqst_floor'] = $detail['data']['rqst_floor'] . '层';
                }
                if (!empty($detail['data']['rqst_roomNo'])) {
                    $detail['data']['rqst_roomNo'] = $detail['data']['rqst_roomNo'] . '房间';
                }
                $detail['data']['rqst_build_name'] = $detail['data']['rqst_build'] . '/' . $detail['data']['rqst_floor'] . '/' . $detail['data']['rqst_roomNo'];

            }
//            unset($detail['data']['rqst_floor']);
            if($detail['data']['rqst_start']){
                $detail['data']['rqst_start'] = date('Y-m-d', $detail['data']['rqst_start']);
            }else{
                $detail['data']['rqst_start'] = '';
            }
            if($detail['data']['rqst_end']){
                $detail['data']['rqst_end'] = date('Y-m-d', $detail['data']['rqst_end']);
            }else{
                $detail['data']['rqst_end'] = '';
            }
            if($detail['data']['rqst_start'] && $detail['data']['rqst_end']){
                $detail['data']['rqst_start'] = $detail['data']['rqst_start']. " 至";
            }

            $detail['data']['bp'] = $detail['data']['bp'] . ',' . $detail['data']['bpFile'];
            unset($detail['data']['bpFile']);
            $detail['data']['buslic'] = $detail['data']['buslic'] . ',' . $detail['data']['busFile'];
            unset($detail['data']['busFile']);
            if ($pactId) {
                // 以及合同信息
                $pactInfo = findById('EtprsPactlog', ['a.id' => $pactId], 'a.id,a.pact_start,a.pact_end,a.pactNo,a.pact,b.fileName as pactFile','',[['SysFile b','a.pact=b.id and b.isDelete=0','left']]);
                if (empty($pactInfo['data'])) {
                    throw new \think\Exception('合同数据获取失败');
                }
                $pactInfo = $pactInfo['data'];
                $detail['data']['pactId'] = $pactInfo['id'];
                $detail['data']['pact_start'] = $pactInfo['pact_start'] ? date('Y-m-d', $pactInfo['pact_start']) : '';
                $detail['data']['pact_end'] = $pactInfo['pact_end'] ? date('Y-m-d', $pactInfo['pact_end']) : '';
                $detail['data']['pactNo'] = $pactInfo['pactNo'];
                $detail['data']['pact'] = $pactInfo['pact'] . ',' . $pactInfo['pactFile'];
            }
            // 获取已经分配的房间  +status  12
            $roomCon['etprsId'] = $etprsId;
            $roomCon['status'] = ['<>','0'];
            $roomList = getDataList('room', $roomCon, 'a.id,a.roomNo,b.name as buildName', 'a.addtime', [['build b', 'a.buildId=b.id', 'left']]);
            if ($roomList['code'] == 0) {
                throw new \think\Exception($roomList['msg']);
            }
            $roomInfo = array();
            $rommInfoArr = array();
            $roomIds = array();
            $roomIdNames = array();
            $roomList = $roomList['data'];
            foreach ($roomList as $k => $v) {
                $roomInfo[] = $v['buildName'] . ' - ' . $v['roomNo'];
                $roomIds[] = $v['id'];
                $rommInfoArr[] = $v['buildName'] . ' - ' . $v['roomNo'];
                $roomIdNames[] = $v['id'] . ',' . $v['buildName'] . ' - ' . $v['roomNo'];
            }
            $detail['data']['roomList'] = implode(";", $roomInfo);
            $detail['data']['roomListArr'] = $rommInfoArr;
            $detail['data']['roomIds'] = implode(",", $roomIds);
            $detail['data']['roomIdNames'] = $roomIdNames;
            $extraInfo = $this->getEtprsInfo($etprsId);
            if ($extraInfo['code'] == 1) {
                $detail['data'] = array_merge($detail['data'], $extraInfo['data']);
            } else {
                $detail['data']['etprsName'] = $detail['data']['name'];
                $detail['data']['etprsId'] = $detail['data']['id'];
            }
//            dump($detail);
            return $detail;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取扩展信息
    public function getEtprsInfo($etprsId)
    {
        try {
            // 获取企业扩展信息
            $extraInfo = findById('EtprsInfo', ['a.etprsId' => $etprsId], 'a.id as extraId,b.id as etprsId,b.legalname,a.isRgstHere,b.addtime,b.bp,b.buslic,a.isMerger,a.isMigrate,b.status as proStatus,b.name as etprsName,a.etprsStatus,a.industry,b.addtime,a.rgstment,a.iqbtarea,a.tax,a.highetprs as highetprsName,a.roFinace,a.valuation,a.income,a.profit,a.total,a.junior,a.doctor,a.overseas,a.iprapl,a.soft,a.cadut,a.industry,a.etprsStatus,a.roFinace', '', [ ['etprs b', 'a.etprsId=b.id', 'left']]);
            if ($extraInfo['code'] == 1) {
                $extraInfo['data']['buslic'] = $extraInfo['data']['buslic'] . ',' . getField('SysFile', ['id' => $extraInfo['data']['buslic']], 'fileName');
                $extraInfo['data']['bp'] = $extraInfo['data']['bp'] . ',' . getField('SysFile', ['id' => $extraInfo['data']['bp']], 'fileName');
                if ($extraInfo['data']['proStatus'] == '6008006') {
                    $extraInfo['data']['isQuit'] = '是';
                    $extraInfo['data']['cadut'] = 1;
                } else {
                    $extraInfo['data']['isQuit'] = '否';
                    $extraInfo['data']['cadut'] = 0;
                }
                $extraInfo['data']['addtime'] = date('Y-m-d H:i:s', $extraInfo['data']['addtime']);
                $extraInfo['data']['highetprs'] = $extraInfo['data']['highetprsName'];
                $extraInfo['data']['highetprsName'] = $extraInfo['data']['highetprsName'] == '7002001' ? '是' : '否';
                $extraInfo['data']['isMigrateName'] = $extraInfo['data']['isMigrate'] == '7002001' ? '是' : '否';
                $extraInfo['data']['isMergerName'] = $extraInfo['data']['isMerger'] == '7002001' ? '是' : '否';
                $extraInfo['data']['isEnterHere'] = $extraInfo['data']['isRgstHere'] == '7002001' ? '是' : '否';
                $extraInfo['data']['iqbtarea'] = $extraInfo['data']['iqbtarea']*100/100;
                $extraInfo['data']['valuation'] = $extraInfo['data']['valuation']*100/100;
                $extraInfo['data']['income'] = $extraInfo['data']['income']*100/100;
                $extraInfo['data']['profit'] = $extraInfo['data']['profit']*100/100;
                $extraInfo['data']['tax'] = $extraInfo['data']['tax']*100/100;
                $com = new Common();
                //获取字典表字段名称
                $tmplist=$com->getDictStr('*','EtprsInfo','Name');
                $extraInfo['data']=$com->setObjIdText($extraInfo['data'],$tmplist);
            } else {
                $row = findById('etprs', array('a.id' => $etprsId), 'a.id,a.name,a.addtime,a.legalname,a.bp,a.buslic,b.savePath as busPath,b.fileName as busName,c.savePath as bpPath,c.fileName as bpName','',[['SysFile b','a.buslic=b.id and b.isDelete=0','left'],['SysFile c','a.bp=c.id and c.isDelete=0','left']]);
                if($row['code'] == 0){
                    throw new \think\Exception('企业信息获取失败'.$row['msg']);
                }
                $extraInfo['data'] = null;
                $extraInfo['etprsName'] = $row['data']['name'];
                $extraInfo['etprsId'] = $row['data']['id'];
                $extraInfo['addtime'] = date('Y-m-d',$row['data']['addtime']);
                $extraInfo['legalname'] = $row['data']['legalname'];
                $extraInfo['bp'] = $row['data']['bp'] . ',' . $row['data']['bpName'];
                $extraInfo['buslic'] = $row['data']['buslic'] . ',' . $row['data']['busName'];
            }
            return $extraInfo;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取企业操作记录
    public function getRecord($id = 0)
    {
        if (!$id) {
            return array('code' => 0, 'msg' => '未获取到企业ID');
        }
        $list = getDataList("EtprsChangelog", ['etprsId' => $id], 'a.id,FROM_UNIXTIME(addtime,"%Y-%m-%d %H:%i:%S") as addtime,FROM_UNIXTIME(lastupdateTime,"%Y-%m-%d %H:%i:%S") as lastupdateTime,a.oldIds,a.newIds', 'a.lastupdateTime desc', '', '');
        if ($list['code'] == 0) {
            return $list;
        }
        return $list['data'];
    }


    // 获取所有楼座以及对应楼层  下拉框效果
    public function getBuilds()
    {
        try {
            $return = array();
            if(input("iqbtId") && is_numeric(input("iqbtId"))){
                $con['a.iqbtId'] = input("iqbtId");
            }else{
                $con['a.iqbtId'] = ['in', $this->iqbtStr];
            }
            $getBuild = input("build");
            $getFloor = input("floor");
            if (!empty($getBuild)) {
                $con['a.id'] = $getBuild;
            }
            if ($getFloor != '') {
                $con['a.floor'] = $getFloor;
            }
            // 获取孵化器对应的楼座楼层信息
            // $buildFloor = getDataList('build', $con, 'a.name,b.id,b.floor,a.iqbtId,a.id as bId,c.*,c.roomNo,c.id as roomId', 'a.iqbtId asc,b.floor asc,c.roomNo asc', [['floor b', 'a.id=b.buildId and b.isDelete=0', 'left'],['room c', 'c.floorId=b.id and c.isDelete=0', 'left']]);
            $buildFloor = getDataList('build', $con, 'a.name,b.id as floorId,b.floor,a.iqbtId,a.id as bId', 'a.iqbtId asc,b.floor asc', [['floor b', 'a.id=b.buildId and b.isDelete=0', 'left']]);
            if ($buildFloor['code'] == 0) {
                return $buildFloor;
            }
            $buildFloor = $buildFloor['data'];
            $build = array();
            $floor = array();
            foreach ($buildFloor as $k => $v) {
                $curIqbt = findById('incubator', ['id' => $v['iqbtId']],'name');
                $curFully = $curIqbt['data']['name'] . '-' . $v['name'];
                if (!in_array($curFully , $build) && $v['name'] ) {
                    $build[$v['bId']] = $curFully;
                }
                if (!in_array($v['floor'], $floor) && $v['floor']) {
                    $floor[$v['floorId']] = $v['floor'];
                }
            }
            $return['build'] = $build;
            $return['floor'] = $floor;
            return $return;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 保存扩展信息
    public function saveExtra($data)
    {
        if (!is_array($data)) {
            return array('code' => 0, 'msg' => '数据错误');
        }
        Db::startTrans();
        try {
            $map['id'] = ['<>', $data['etprsId']];
            $map['name'] = $data['name'];
            // 先更新etprs表
            /*$etprs['name'] = $data['name'];
            unset($data['name']);
            $etprs['legalname'] = $data['legalname'];
            $data['lealPerson'] = $data['legalname'];
            unset($data['legalname']);
            if(!$etprs['legalname']){
                throw new \think\Exception('法人或团队负责人必填');
            }
            $etprs['buslic'] = $data['buslic'];
            unset($data['buslic']);
            $etprs['bp'] = $data['bp'];
            if(!$etprs['bp']){
                throw new \think\Exception('请上传项目计划书');
            }
            unset($data['bp']);
            $etprs['id'] = $data['etprsId'];
            $already = findById('etprs', $map, 'id');
            if ($already['code'] == 1) {
                throw new \think\Exception('客户名称重复,请重试');
            }
            $etprsRes = saveData('etprs', $etprs);
            if($etprsRes['code'] == 0){
                throw new \think\Exception('企业表更新失败'.$etprsRes['msg']);
            }
            */

            unset($data['name']);
            $result = saveData('EtprsInfo', $data);
            if($result['code'] == 0){
                throw new \think\Exception('企业扩展信息更新失败'.$result['msg']);
            }
            Db::commit();
            return $result;
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }
}