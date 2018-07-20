<?php

namespace app\common\model;

use app\common\controller\Common;
use think\Log;
use think\Model;
use think\Db;
use think\Controller;

class Room extends Model
{
    private $iqbtStr = null;

    public function __construct()
    {
        $iqbtStr = session("user.iqbtId");
        $this->iqbtStr = $iqbtStr;
    }


    public function getAllRooms()
    {
        try {
            $con = $this->getStatusCondition();
            $postData = input('get.');
            $offset = $postData['offset'];
            $limit = $postData['limit'];
            $order = 'a.addtime desc';
            // 搜索  默认是get传来字段名以及要搜索的值
            unset($postData['offset']);
            unset($postData['limit']);
            unset($postData['order']);
            if (isset($postData['search']) && !empty($postData['search'])) {
                $con['a.name'] = array('like', '%' . $postData['search'] . '%');
                unset($postData['search']);
            }

            // 查询条件
            if (isset($postData['sort']) && !empty($postData['sort'])) {
                if (!empty($postData['order'])) {
                    $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
                } else {
                    $order = 'a.' . $postData['sort'] . ' asc';
                }
                unset($postData['sort']);
            }
            if(!empty($con['floorId'])){
                $floorId=$con['floorId'];
                unset($con['floorId']);
            }
            $field = 'a.id,a.type,a.roomPics,a.area,a.num,a.status,a.roomNo,a.price,a.unit,a.total,a.dection,e.name as etprsName,f.name as buildName,h.pic as buildPicId,h.floor,g.savePath as buildImage';
            $join = [['Etprs e', 'a.etprsId=e.id and e.isDelete=0', 'left'], ['build f', 'a.buildId=f.id and f.isDelete=0', 'left'], ['floor h', 'a.floorId=h.id and h.isDelete=0', 'left'],['SysFile g','h.pic=g.id and g.isDelete=0','left']];
            //+a.prtRoomId
            $list = getDataList('room', $con, $field, $order, $join,'a.prtRoomId', $limit,$offset); //dump($list);die;
            //-me 总数
            $total = getDataList('room', $con, $field, $order, $join,'a.prtRoomId');
            
            if ($list['code'] == 0) {
                throw new \think\Exception($list['msg']);
            }
            $com = new Common();
            //获取字典表字段名称
            $tmplist=$com->getDictStr('type,unit,dection','Room','Name');
            $list['data']=$com->setListIdText($list['data'],$tmplist);
            // 获取房间图片
            foreach ($list['data'] as $k => $v) {
                // 楼座层图片
                if (is_file(ROOT_PATH . '/public' . $v['buildImage'])) {
                    $list['data'][$k]['buildImg'] = $v['buildImage'];
                }else{
                    $list['data'][$k]['buildImg'] = null;
                }
                foreach ($list['data'][$k] as $k2 => $v2) {
                    if ($k2 == 'price' || $k2 == 'total' || $k2 == 'area') {
                        $list['data'][$k][$k2] = $v2 * 100 / 100;
                    }
                }
                $pics = explode(",", $v['roomPics']);
                foreach ($pics as $item) {
                    $path = getField('SysFile', ['id' => $item], 'savePath');
                    if (is_file(ROOT_PATH . '/public' . $path)) {
                        $list['data'][$k]['roomPics'] = $path;
                        break;
                    } else {
                        $list['data'][$k]['roomPics'] = '暂无图片';
                    }
                }
            }
            if(!empty($con['f.id'])){
                $con['buildId']=$con['f.id'];
                unset( $con['f.id']);
            }
            if(!empty( $floorId)){
                $con['floorId']= $floorId;
                unset( $con['h.floor']);
            }
            $totalrecord = getRecordNum('room', $con);
            $list['total'] = $totalrecord;

            return array('total' => count($total['data']), 'rows' => $list['data']);
        } catch (\Exception $e) {
            c_Log($e);
            return array('total' => 0, 'rows' => [],'msg'=>$e->getMessage());
        }
    }

    // 导出
    public function export()
    {
        $con = $this->getStatusCondition();
        vendor("PHPExcel");
        vendor("PHPExcel.Writer.Excel2007");
        vendor("PHPExcel.IOFactory");
        $header = array('楼座', '楼层', '房间类型', '编号', '面积', '工位数量', '单价', '单位', '月租', '装修', '入驻企业');
        $field = 'f.name as buildName,h.floor,b.name as typeName,a.roomNo,a.area,a.num,a.price,c.name as unitName,a.total,d.name as dectonName,e.name as etprsName';
        $join = [['SysDict b', 'a.type=b.code', 'left'], ['SysDict c', 'a.unit=c.code', 'left'], ['SysDict d', 'a.dection=d.code', 'left'], ['Etprs e', 'a.etprsId=e.id', 'left'], ['build f', 'a.buildId=f.id', 'left'], ['floor h', 'a.floorId=h.id', 'left']];
        $list = getDataList('room', $con, $field, 'f.id asc,f.floor asc', $join);
        if (!empty($list['data'])) {
            $data = $list['data'];
        } else {
            echo '没有可以导出的数据';
            exit;
        }
        // 写入日志
        $logRes = saveLog('6012019','导出房间信息','','room',session("user.etprsId"));
        if($logRes['code'] == 0){
            echo '日志记录失败';
            exit();
        }
        getExcel("房间信息" . date("Y-m-d H:i:s"), $header, $data);
    }

    // 返回入驻状态查询条件
    public function getStatusCondition()
    {
        // 当前管理员下的所有孵化器
        if(input("iqbtId")){
            $con['a.iqbtId'] = input("iqbtId");
        }else{
            $con['a.iqbtId'] = ['in', $this->iqbtStr];
        }
        $status = input('status');
        $buildId = input("build");
        $floor = input("floor");
        $roomNo = input("roomNo");
        if ($status != null) {
            $con['a.status'] = $status;
        }
        if ($buildId) {
            $con['f.id'] = $buildId;

        }
        if ($floor) {
            $con['floorId'] = $floor;
            $floor = getField('floor', ['id' => $floor], 'floor');
            $con['h.floor'] = $floor;
        }
        if ($roomNo) {
            $con['a.roomNo'] = $roomNo;
        }
        return $con;
    }


    /**
     *  获取字典表
     * $code 1000 或者 1000,1011,2001.....
     * return name,code
     * */
    public function getDic($code = '')
    {
        // code是否为空
        if (!empty($code)) {
            // 多个code
            if (strpos($code, ',') !== false) {
                // 多个code转数组
                $codeArr = explode(',', $code);
                // 是否为数组
                if (is_array($codeArr)) {
                    $res = '';
                    // foreach遍历查询
                    foreach ($codeArr as $k => $v) {
                        // code不为空再查询，为空不查询
                        if (!empty($v)) {
                            $resFor = getDataList('sysDict', array('code' => ['like', $v . '%']), 'name,code');
                            if ($resFor['code'] == 1) {
                                $res[$v] = $resFor['data'];
                            } else {
                                $res[$v] = $resFor['msg'];
                            }
                        }
                    }
                    return ['code' => 1, 'msg' => 'SUCCESS', 'data' => $res];
                } else {
                    return ['code' => 0, 'msg' => 'ERROR:code样式错误'];
                }
            } else {
                // 一个code直接搜索
                $res = getDataList('sysDict', array('code' => ['like', $code . '%']), 'name,code');
                return $res;
            }
        } else {
            return ['code' => 0, 'msg' => 'ERROR:code为空'];
        }
    }

    // 添加房间 - 对应楼座楼层
    public function addRoom($data = '')
    {
        if (!is_array($data)) {
            return array('code' => 0, 'msg' => '房间数据格式错误');
        }
        // 楼座名称
        $buildName = $data['buildName'];
        unset($data['buildName']);
        // 楼层名称
        $floor = $data['floor'];
        unset($data['floor']);
        // 房间编号
        // $roomNo = $data['roomNo'];
        Db::startTrans();
        try {
            // 查找此楼座-楼层是否存在
            $map['a.iqbtId'] = ['in', $this->iqbtStr];
            $map['name'] = $buildName;
            //查询楼座是否存在
//            $buildInfo = getDataList('build', $map, 'id,iqbtId,name,floor');
            $buildInfo = findById('build', $map, 'id,iqbtId,name');
            // 是否存在该楼座
            if ($buildInfo['code'] == 1 && !empty($buildInfo['data'])) {//楼座存在
                // 楼座存在,看是否需要新增此楼层
                $isExists = false;
                $buildId = false;
//                foreach ($buildInfo['data'] as $k => $v) {
//                    if ($v['floor'] == $floor) {
//                        $isExists = true;
//                        $buildId = $v['id'];
//                    }
//                }
                //查询该楼座下是否有此楼层
                $map['buildId'] = $buildInfo['data']['id'];
                $map['floor'] = $floor;
                unset ($map['name']);
                $floorInfo = findById('floor', $map, 'id,floor');//查询该楼座下是否有此楼层
                //楼层存在,检测是否存在房间???不用校验???validata应该校验过了
                if (empty($floorInfo['data'])) {//如果楼层不存在
                    $floorData['iqbtId'] = $this->iqbtStr;
                    $floorData['buildId'] =$buildInfo['data']['id'];
                    $floorData['floor'] =$floor;
                    $floorRes = saveData('floor', $floorData);
                    if ($floorRes['code'] == 0) {
                        throw new \think\Exception('楼层新增失败' . $floorRes['msg']);
                    }
                    // 新增房间
                    $data['buildId'] = $buildInfo['data']['id'];
                    $data['iqbtId'] = $this->iqbtStr;
                    $data['floorId'] = $floorRes['data'];//新生成的楼层id
                    $result = saveData('room', $data);
                    if ($result['code'] == 0) {
                        throw new \think\Exception('房间新增失败' . $floorRes['msg']);
                    }
                } else {//如果楼层存在
                    // 新增房间就好
                    $data['buildId'] = $buildInfo['data']['id'];
                    $data['iqbtId'] = $this->iqbtStr;
                    $data['floorId'] = $floorInfo['data']['id'];//
                    $result = saveData('room', $data);
                    if ($result['code'] == 0) {
                        throw new \think\Exception('房间新增失败' . $result['msg']);
                    }
                }
            } else {
                // 没有此楼座 新增楼座
                $buildData['iqbtId'] = $this->iqbtStr;
                $buildData['name'] = $buildName;
                $buildRes = saveData('build', $buildData);
                if ($buildRes['code'] == 0) {
                    throw new \think\Exception('楼座新增失败' . $buildRes['msg']);
                }
                //新增楼层
                $floorData['iqbtId'] = $this->iqbtStr;
                $floorData['buildId'] = $buildRes['data'];
                $floorData['floor'] = $floor;
                $floorRes = saveData('floor', $floorData);
                if ($floorRes['code'] == 0) {
                    throw new \think\Exception('楼座新增失败' . $floorRes['msg']);
                }
                // 新增房间
                $data['buildId'] = $buildRes['data'];
                $data['floorId'] = $floorRes['data'];
                $data['iqbtId'] = $this->iqbtStr;
                $result = saveData('room', $data);
            }
            if ($result['code'] == 0) {
                throw new \think\Exception('房间新增失败' . $result['msg']);
            }
            // 写入日志
            $logRes = saveLog('6012017','添加房间',$result['data'],'room',session("user.etprsId"));
            if($logRes['code'] == 0){
                throw new \think\Exception('房间新增日志记录失败');
            }
            Db::commit();
            return $result;
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 添加房间图片
    public function saveRoomPic()
    {
        try{
            $data = input("post.");
            if (!$data['id'] || !$data['roomPics']) {
                return array('code' => 0, 'msg' => '房间/图片不能为空');
            }
            /*$oldPic = getField('room', ['id' => $data['id']], 'roomPics');
            if ($oldPic) {
                $pic = explode(",", $oldPic);
                array_unshift($pic, $data['roomPics']);
                $data['roomPics'] = implode(',', $pic);
            }*/
            return saveData("room", $data);
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }

    // 删除一个房间
    public function removeOne()
    {
        Db::startTrans();
        try {
            $id = input("id", false);
            if (!$id) {
                throw new \think\Exception('请选择要删除的房间ID');
            }
            // 获取此房间数据
            $curRoom = findById('room', array('id' => $id), 'id,selfuse,status,buildId,floorId,roomNo');
            if ($curRoom['code'] == 0) {
                throw new \think\Exception('房间不存在'.$curRoom['msg']);
            }
            $curRoom = $curRoom['data'];
            $buildName = getField('build', array('id' => $curRoom['buildId']), 'name');
            // 是否在占用
            if ($curRoom['status'] != 0) {
                // 自用房间
                if ($curRoom['status'] == 3) {
                    throw new \think\Exception('此房间为自用房间,确定删除吗？');
                }else{
                    throw new \think\Exception('此房间正在被占用,不可删除');
                }
            }
            $floorId = $curRoom['floorId'];
            // 是否存在会议室  20180323 0917 新增判断
            $hasMtRoom = findById('mtroom',['floorId'=>$floorId],'id');
            if($hasMtRoom['code'] != 0){
                throw new \think\Exception('楼层下存在会议室,不可删除');
            }
            // 是否存在分配记录
            $logCon['roomId'] = $curRoom['id'];
            $record = findById("RoomRcd", $logCon, 'id');
            if (isset($record['data']) && $record['data']) {
                throw new \think\Exception('此房间存在分配记录,不可删除');
            }
            // 此楼层是否只有这一个房间
            $buildList = getDataList('room', array('floorId' => $floorId), 'id');
            if($buildList['code'] == 0){
                throw new \think\Exception('楼层下房间信息查询出错'.$buildList['msg']);
            }
            //如果该楼层只有这一个房间
            if (isset($buildList['data']) && count($buildList['data']) == 1) {
                //throw new \think\Exception($buildName . ' 楼层只有房间 ' . $curRoom['roomNo'] . '，如果删除 ' . $curRoom['roomNo'] . '房间,那么楼层 ' . $buildName . ' 也将会被删除');
                //查询该楼层所属楼座下的所有楼层,是否只有这一个楼层,如果是,删除楼座
                $floorList=getDataList('floor', array('buildId' => $curRoom['buildId']), 'id');
                if($floorList['code'] == 0){
                    throw new \think\Exception('楼座下楼层信息查询出错'.$floorList['msg']);
                }
                //是否只有这一个楼层,如果是,删除楼座
                if (isset($floorList['data']) && count($floorList['data']) == 1) {
                    // 删除楼座
                    $buildRes = deleteData('build', $curRoom['buildId']);
                    if($buildRes['code'] == 0){
                        throw new \think\Exception('楼座删除失败'.$buildRes['msg']);
                    }
                }
                // 删除楼层
                $floorRes = deleteData('floor', $floorId);
                if($floorRes['code'] == 0){
                    throw new \think\Exception('楼层删除失败'.$floorRes['msg']);
                }
                // 删除房间
                $result = deleteData('room', $id);

            }
            //如果该层有多个房间
            if (isset($buildList['data']) && count($buildList['data']) > 1) {
                $result = deleteData('room', $id);
            }
            if($result['code'] == 0){
                throw new \think\Exception('房间删除失败'.$result['msg']);
            }
            // 写入日志
            $logRes = saveLog('6012021','删除房间',$result['data'],'room',session("user.etprsId"));
            if($logRes['code'] == 0){
                throw new \think\Exception('删除房间-日志记录失败');
            }
            Db::commit();
            return $result;
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取一条房间信息
    public function getOne($id = 0)
    {
        if (!$id) {
            return array('code' => 0, 'msg' => '此房间信息不存在');
        }
        $join = [['Etprs b', 'a.etprsId=b.id', 'left'], ['build c', 'a.buildId=c.id', 'left'],['floor d', 'a.floorId=d.id', 'left']];
        $data = findById('room', ['a.id' => $id], 'a.*,a.status as selfuse,a.type as roomType,b.name as etprsName,c.name as buildName,d.floor,a.unit,a.type', 'a.roomNo asc', $join);
        if ($data['code'] == 0) {
            return $data;
        }
        return $data;
    }
}