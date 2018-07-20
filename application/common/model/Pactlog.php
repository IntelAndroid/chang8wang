<?php

namespace app\common\model;

use think\Db;
use think\Log;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/2
 * Time: 13:06
 */
class Pactlog
{
    /**
     * 分配房间
     * 修改企业状态为 6008004  签约入驻
     * 并且把房间状态更改为 1 （已占用），
     * 并且将被分配房间的etprsId都更改为此企业ID
     * 并且插入 etprsPactlog表数据
     */

    public function savePactlog($data, $isChange = false)
    {
        Db::startTrans();
        try {
            // 修改企业状态  - 分配房间
            if (!$isChange) {
                $globalRoomStatus = 1;
                $etprsData['status'] = 6008004;
                $etprsData['id'] = $data['etprsId'];
                $etprsRes = saveData("etprs", $etprsData);
                if ($etprsRes['code'] == 0) {
                    throw new \think\Exception('企业状态修改失败' . $etprsRes['msg']);
                }
            } else {
                //房间变更
                $globalRoomStatus = 2;
                // 获取旧房间
                $roomList = getDataList('room', ['etprsId' => $data['etprsId']], 'a.id,a.roomNo,b.name as buildName', 'a.addtime', [['build b', 'a.buildId=b.id', 'left']]);
                $roomIds = array();
                if ($roomList['code'] == 0) {
                    throw new \think\Exception('旧房获取失败' . $roomList['msg']);
                }
                $roomList = $roomList['data'];
                $dataRoom = explode(',', $data['roomInfo']);
                foreach ($dataRoom as $k => $v) {
                    $dataRoom[$k] = (int)$v;
                }
                foreach ($roomList as $k => $v) {
                    $roomIds[] = $v['id'];
                }
                if (count(array_diff($dataRoom, $roomIds)) == 0 && count($dataRoom) == count($roomIds)) {
                    throw new \think\Exception('没有可以变更的房间');
                }
            }
            $roomIdStr = explode(",", $data['roomInfo']);
            // 计算合同生效时间
//            $startdate = strtotime($data['pact_start']);
//            $enddate = strtotime($data['pact_end']);
//            $data['pact_start'] = $startdate;
//            $data['pact_end'] = $enddate;
            foreach ($roomIdStr as $rId) {
                $curRoom = findById('room', ['id' => $rId], 'area,num,unit,price,status,etprsId,roomNo,selfuse,iqbtId');
                if ($curRoom['code'] == 0) {
                    throw new \think\Exception('房间信息不存在' . $curRoom['msg']);
                }
                $curRoom = $curRoom['data'];

                // 把即将分配的房间状态更改为正常使用  并且标记此房间为此企业在使用
                $roomData['id'] = $rId;
                $roomData['status'] = $globalRoomStatus;
                $roomData['etprsId'] = $data['etprsId'];
                $roomRes = saveData('room', $roomData);
                if ($roomRes['code'] == 0) {
                    throw new \think\Exception('房间信息修改失败' . $roomRes['msg']);
                }
                // 需要插入RoomRcd表   对此房间的操作记录
                // 判断这条记录是否存在
                $rcdCon['etprsId'] = $data['etprsId'];
                $rcdCon['roomId'] = $rId;
                $existRcd = findById('RoomRcd', $rcdCon, 'id', 'endTime desc');
                // 如果存在 更新记录
                if ($existRcd['code'] == 1) {
                    $rcdData['status'] = 1;
                    $rcdData['id'] = $existRcd['data']['id'];
                    $exiRcdRes = saveData('RoomRcd', $rcdData);
                    if ($exiRcdRes['code'] == 0) {
                        throw new \think\Exception('房间变更记录表更新失败' . $exiRcdRes['msg']);
                    }
                } else {
                    $roomRcd['etprsId'] = $data['etprsId'];
                    $roomRcd['roomId'] = $rId;
                    // 此房间对应的iqbtId
                    $roomRcd['iqbtId'] = $curRoom['iqbtId'];
//                    $roomRcd['startTime'] = $startdate;
//                    $roomRcd['endTime'] = $enddate;
                    $roomRcd['status'] = 1;
                    $rcdRes = saveData("RoomRcd", $roomRcd);
                    if ($rcdRes['code'] == 0) {
                        throw new \think\Exception('房间记录信息表新增失败' . $rcdRes['msg']);
                    }
                }
            }
            // 记录 EtprsChangelog
            $logData['adduserId'] = session("user.id");
            $logData['etprsId'] = $data['etprsId'];
            if (!$isChange) {
                // 添加企业房间变更记录   对应表  EtprsChangelog
                $logData['newIds'] = $data['roomInfo'];
                $changeRes = saveData("EtprsChangelog", $logData);
                if ($changeRes['code'] == 0) {
                    throw new \think\Exception('企业变更信息记录失败' . $changeRes['msg']);
                }
                // 写入日志
                $logRes = saveLog('6012009', '正式分配房间', $data['etprsId'], 'etprs', $data['etprsId']);
                if ($logRes['code'] == 0) {
                    throw new \think\Exception('操作日志新增失败' . $logRes['msg']);
                }
                // 写入日志:入驻状态修改
                $logRes = saveLog(6012041, "入驻客户状态变化",$data['etprsId'], 'etprs', $data['etprsId'],6008003,6008004);
                if ($logRes['code'] == 0) {
                    throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                }
            } else {
                // 变更房间 需要记录  新增了哪个房间  撤销了哪个房间
                $logData['newIds'] = $data['roomInfo'];
                // 新增的房间
                $newIds = explode(",", $data['roomInfo']);
                $logData['oldIds'] = implode(",", $roomIds);
                $changeRes = saveData("EtprsChangelog", $logData);
                if ($changeRes['code'] == 0) {
                    throw new \think\Exception('企业变更信息记录失败' . $changeRes['msg']);
                }
                // 旧的房间
                $oldIds = $roomIds;
                // 1，2 =》 3，4
                // 变更后,需要找需要用的房间 以及弃用的房间ID
                if (count($oldIds) < count($newIds)) {
                    $intersect = array_diff($newIds, $oldIds);
                    $needUseIds = array();
                    // 搜集需要还原的房间ID
                    foreach ($intersect as $interId) {
                        foreach ($oldIds as $item) {
                            if ($item != $interId && !in_array($item, $oldIds)) {
                                $needUseIds[] = $item;
                            }
                        }
                    }
                } else {
                    $intersect = array_diff($oldIds, $newIds);
                    $needUseIds = $intersect;
                }
                // 需要把之前占用而现在不用的房间设置为正常使用状态
                foreach ($needUseIds as $reducId) {
                    // 找这个正在使用的房间 获取数据ID
                    $curLockRoom = findById('room', ['id' => $reducId], 'id,iqbtId');
                    if (isset($curLockRoom['data']) && $curLockRoom['data']) {
                        // 更改房间修改记录表
                        $rcdId = getField('roomRcd', ['etprsId' => $data['etprsId'], 'roomId' => $reducId], 'id');
                        if ($rcdId) {
                            $reduction['id'] = $rcdId;
                        }
                        $reduction['status'] = 2;
                        // 需要插入RoomRcd表   对此房间的操作记录
                        $reduction['etprsId'] = $data['etprsId'];
                        $reduction['roomId'] = $reducId;
                        // 此房间对应的iqbtId
                        $reduction['iqbtId'] = $curLockRoom['data']['iqbtId'];
//                        $reduction['startTime'] = $startdate;
//                        $reduction['endTime'] = $enddate;
                        $reducRes = saveData("roomRcd", $reduction);
                        if ($reducRes['code'] == 0) {
                            throw new \think\Exception('在还原房间变更记录时出错' . $reducRes['msg']);
                        }
                        // 更改房间信息表  还原此房间状态为空闲 清空企业ID
                        $roomData['id'] = $reducId;
                        $roomData['etprsId'] = 0;
                        $roomData['status'] = 0;
                        $backRoom = saveData('room', $roomData);
                        if ($backRoom['code'] == 0) {
                            throw new \think\Exception('在还原房间时出错' . $backRoom['msg']);
                        }
                    }
                }
                // 写入日志
                $logRes = saveLog('6012007', '房间变更', $data['etprsId'], 'etprs', $data['etprsId']);
                if ($logRes['code'] == 0) {
                    throw new \think\Exception('企业变更信息记录失败' . $logRes['msg']);
                }
            }
            // 生成合同记录
            unset($data['roomInfo']);
            $pactRes = saveData('EtprsPactlog', $data);
            if ($pactRes['code'] == 0) {
                throw new \think\Exception('合同记录生成失败' . $pactRes['msg']);
            }
            Db::commit();
            $pactRes['msg'] = '房间分配成功';
            return $pactRes;
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 生成合同编号  暂时不知道以什么样的格式 先搞个时间
    private function createPactNumber()
    {
        return 'C8' . date('YmdHis', time()) . mt_rand(1, 99999);
    }

    // 获取企业合同
    public function getEtprsPact($etprsId)
    {
        // 先查开始时间 小于当前时间  结束时间大于当前时间
        $beforCon['a.pact_start'] = ['<', time()];
        $beforCon['a.pact_end'] = ['>', time()];
        $beforCon['a.etprsId'] = $etprsId;
        $firRow = findById('EtprsPactlog', $beforCon, 'a.*,b.fileName as pactFile','',[['SysFile b','a.pact=b.id and b.isDelete=0','left']]);
        // 存在  查询最大结束时间
        if ($firRow['code'] != 0) {
            //\think\Log::notice('找到了有效合同');
            //\think\Log::notice($firRow);
            $midCon['a.pact_end'] = ['>', time()];
            $midCon['a.etprsId'] = $etprsId;
            $secRow = findById('EtprsPactlog', $midCon, 'a.pact_end,a.id,a.pact,b.fileName as pactFile','a.pact_end desc',[['SysFile b','a.pact=b.id and b.isDelete=0','left']]);
            if ($secRow['code'] != 0) {
                //\think\Log::notice('找到了最大结束时间的合同');
                //\think\Log::notice($secRow);
                // 写入最大的合同结束时间
                $firRow['data']['pact_end'] = $secRow['data']['pact_end'];
                // 写入最大的合同Id
                $firRow['data']['id'] = $secRow['data']['id'];
                $firRow['data']['pact'] = $secRow['data']['pact'];
                $firRow['data']['pactFile'] = $secRow['data']['pactFile'];
                return $firRow;
            }
            return $firRow;
        } else {
            //\think\Log::notice('没找到有效合同');
            // 如果不在有效时间内 查询所有记录
            $endRow = getDataList('EtprsPactlog', array('a.etprsId' => $etprsId), 'a.*,b.fileName as pactFile', 'a.pact_start asc,a.pact_end desc',[['SysFile b','a.pact=b.id and b.isDelete=0','left']]);
            //\think\Log::notice('所以我去查所有相关企业的合同');
            if ($endRow['code'] != 0) {
                \think\Log::notice($endRow);
                if(count($endRow['data']) == 1){
                    //\think\Log::notice('只有一条合同,那开始时间结束时间就不用对比了');
                    return array('code'=>1,'msg'=>'','data'=>$endRow['data'][0]);
                }
                // Log::notice($endRow);
                $trueRow = array();
                $trueRow['code'] = 1;
                $trueId = null;
                $trueRow['data']['pact_start'] = $endRow['data'][0]['pact_start'];
                $trueEnd = 0;
                foreach($endRow['data'] as $k=>$v){
                    if($v['pact_end'] > $trueEnd){
                        $trueRow['data']['pact_end'] = $v['pact_end'];
                        $trueRow['data']['id'] = $v['id'];
                        $trueRow['data']['pact'] = $v['pact'];
                        $trueRow['data']['pactFile'] = $v['pactFile'];
                    }
                    $trueEnd = $v['pact_end'];
                }
                //Log::notice('合同多个时候');
                //Log::notice($trueRow);
                return $trueRow;
            } else {
                return array('code' => 0, 'msg' => '合同数据不存在');
            }
        }
    }
}