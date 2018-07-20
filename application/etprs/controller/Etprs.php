<?php

namespace app\etprs\controller;

use think\Controller;
use think\Db;
use app\common\controller\Common;
use app\customer\controller\Customer;
use app\wechat\controller\User;
use think\Log;

header("Access-Control-Allow-Origin: *");

/**
 * 2018-01-31 入驻管理相关控制器
 */
class Etprs extends Common
{
    private $model = null;
    public $iqbtStr = null;

    public function _initialize()
    {
        parent::_initialize();
        //todo::下面这个是为了微信测试加的  不用记得删了
        if(request()->isMobile()) {
            $iqbtStr = 1;
        }else{
            $iqbtStr = session("user.iqbtId");
        }
        $this->iqbtStr = $iqbtStr;
        $this->model = model("Etprs");
        //nav
        $this->assign("nav", 'etprs');
    }

    public function test()
    {
       echo $_SERVER['REMOTE_ADDR'],'<br />';
       echo gethostbyname($_SERVER['SERVER_NAME']);
    }

    private $progressFuc = array(
        '1' => 'saveCustomerBase',
        '2' => 'saveRoomAllocation',
        '3' => 'saveContract',
    );

    public function etprsListNum()
    {
        try {
            //各种状态对应的总数据
            $extraCon['a.iqbtId'] = ['in', $this->iqbtStr];
            $beStatus = array('6008002', '6008003', '6008004');
            $allCon['a.status'] = ['in', '6008002,6008003,6008004,6008005,6008006'];
            $beforeCon['a.status'] = ['in', $beStatus];
            $hasCon['a.status'] = '6008005';
            $quitCon['a.status'] = '6008006';
            $before = getField('etprs', array_merge($extraCon, $beforeCon), 'count(id)');
            $has = getField('etprs', array_merge($extraCon, $hasCon), 'count(id)');
            $quit = getField('etprs', array_merge($extraCon, $quitCon), 'count(id)');
            $total = getField('etprs', array_merge($extraCon, $allCon), 'count(id)');
            $data['code'] = 1;
            $data['data']['wait'] = $before ;
            $data['data']['settled'] = $has;
            $data['data']['quit'] = $quit;
            $data['data']['total'] = $total;
            return json($data);
        } catch (\Exception $e) {
            c_Log($e);
            return json(array('code' => 0, 'msg' => $e->getMessage()));
        }
    }

    public function getExportNum()
    {
        return $this->model->getEtprsRecord();
    }
    // 获取入驻管理列表
    public function getEtprsList()
    {
        return json($this->model->getAllEtprs());
    }

    // 导入 入驻excle
    public function importData()
    {
        // 获取要导入的excle文件
        $excleInfo = $this->uploadEtprsExcle();
        if (isset($excleInfo['code']) && $excleInfo['code'] == 0) {
            return $excleInfo;
        }
        $file = ROOT_PATH . $excleInfo['path'];
        $cols = array('name', 'contact', 'source', 'mobile', 'status');
        return $this->model->importCustomer($file, $cols);
    }

    // 导出 excle demo
    public function exportEtprs()
    {
        $con["status"] = ['>', '6008001'];//发起入驻前所有客户列表
        return $this->model->exportEtprs($con);
    }

    /**
     * 发起入驻
     * @param $step 默认1->填写基本信息以及企业信息
     * 场景    点击发起入住->进入基本信息填写页面(name,type,contact,mobile,source为必填项,本页下一步按钮携带事件step==1)
     */
    public function getRow()
    {
        // 携带点击etprs ID  如果ID为0 则是新增,否则需要带出信息
        $id = input("id");
        $join = [['SysFile b', 'a.buslic=b.id', 'left'], ['SysFile c', 'a.bp=c.id', 'left']];
        // 当第一步的时候需要拉取基本信息  对应表 etprs  不需要保存数据操作
        $field = 'a.id,a.name as name1,a.type,a.contact,a.mobile,a.source,a.status,a.rqst_build,a.rqst_floor,a.rqst_roomNo,a.rqst_start,a.rqst_end,a.rqst,a.legalname,a.buslic,a.bp,b.savePath as buslicPath,b.fileName as busFile,c.savePath as bpPath,c.fileName as bpFile';
        return $this->model->getEtprsBase($id, $field, $join);
    }

    public function getRowByname()
    {
        try{
            $name = input("name");
            $join = [['SysFile b', 'a.buslic=b.id', 'left'], ['SysFile c', 'a.bp=c.id', 'left']];
            $field = 'a.id,a.name as name1,a.type,a.contact,a.mobile,a.source,a.status,a.rqst_build,a.rqst_floor,a.rqst_roomNo,a.rqst_start,a.rqst_end,a.rqst,a.legalname,a.buslic,a.bp,b.savePath as buslicPath,b.fileName as busFile,c.savePath as bpPath,c.fileName as bpFile';
            $curEtprs = findById('etprs', array('a.name' => $name), $field, '', $join);
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
        }catch(\Exception $e){
            c_Log($e);
            return ['code'=>0,'msg'=>$e->getMessage()];
        }
    }

    /**
     * 发起入驻 生成企业数据-改变企业为发起入住状态-生成用户-获取返回的企业表自增ID 跳转到分配房间
     */
    public function saveEtprsInfo()
    {
        $data = input('request.', null, 'trim');
//        $data['status'] = '6008002';
        $data['name'] = $data['name1'];
        unset($data['name1']);

        $data['rqst_start'] = strtotime($data['rqst_start']);
        $data['rqst_end'] = strtotime($data['rqst_end']);
        $data['iqbtId'] = $this->iqbtStr;
        // 对新增和编辑做不同的校验
        if (isset($data['id']) && $data['id']) {
            $valiRes = $this->validate($data, 'Etprs.edit');
        } else {
            $data['cstmstatus'] = '6002003';
            $valiRes = $this->validate($data, 'Etprs.insert');
        }
        if ($valiRes === true) {
            Db::startTrans();
            try {
                // 新增企业  发起入住时候需要将入驻状态更改为6008003（房间分配）
                $data['status'] = 6008003;
                // 发起入驻 客户数据来源 6023004
                $data['datafrom'] = 6023004;
                // 增加入驻时间
                $data['entertime'] = time();
                $result = saveData("etprs", $data);
                if ($result["code"] == 0) {
                    throw new \think\Exception("企业发起入驻失败:".$result['msg']);
                }
                $isUser = findById('user', array('mobile|name' => $data['mobile']), 'id');
                // 当新增并且此手机号尚未注册
                /*if ($isUser['code'] == 0 && !$data['id']){
                    // 新增扩展信息表
                    //$extra['iqbtId'] = $this->iqbtStr;
                    //$extra['etprsId'] = $result['data'];
                    //$result = saveData('EtprsInfo', $extra);
                    //Log::notice(json_encode($result));
                    // 新增用户
                    $user['name'] = $data['mobile'];
                    $user['mobile'] = $data['mobile'];
                    $user['password'] = md5(888888);
                    $user['etprsId'] = $result['data'];
                    $user['status'] = '6018001';
                    $user['type'] = '6019002';//用户类型：企业用户
                    $user['realname'] = $data['contact']; //联系人作为真实姓名
                    $allIqbt = explode(',',$this->iqbtStr);
                    $user['iqbtId'] = $allIqbt[0];

                    $userRes = saveData('user', $user);
                    if ($userRes['code'] == 0) {
                        throw new \think\Exception('用户新增失败'.$userRes['msg']);
                    }
                }else if($isUser['code'] == 1 && !$data['id']){
                    throw new \think\Exception('此手机号已经注册,请重试');
                }*/
                if (empty($data['id'])) {
                    // 添加 6012010 日志
                    $logRes = saveLog('6012010', '发起入驻-新增入驻客户', $result['data'], 'etprs', $result['data'],0,6008003);
                    if ($logRes['code'] == 0) {
                        throw new \think\Exception("操作记录失败");
                    }
                } else {
                    // 添加 6012010 日志
                    $logRes = saveLog('6012014', '编辑入驻客户信息', $result['data'], 'etprs',$result['data']);
                    if ($logRes['code'] == 0) {
                        throw new \think\Exception("操作记录失败");
                    }
                    // 写入日志:入驻状态修改
                    $logRes = saveLog(6012041, "入驻客户状态变化",$result['data'], 'etprs', $result['data'],6008002,6008003);
                    if ($logRes['code'] == 0) {
                        throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                    }
                }
                Db::commit();
                // 跳转第二步 进行房间分配
                $return['msg'] = '保存成功,正在跳转至房间分配页面';
                $return['etprsId'] = $result['data'];
                $return['code'] = 1;
                return $return;
            } catch (\Exception $e) {
                c_Log($e);
                Db::rollback();
                return array('code' => 0, 'msg' => $e->getMessage());
            }
        } else {
            return array('code' => 0, 'msg' => $valiRes);
        }
    }

    public function saveEditEtprs()
    {
        Db::startTrans();
        try {
            $data = input("post.");
            $data['name'] = $data['name1'];
            unset($data['name1']);
            if(!empty($data['rqst_start'])){
                $data['rqst_start'] = strtotime($data['rqst_start']);
            }
            if(!empty($data['rqst_start'])) {
                $data['rqst_end'] = strtotime($data['rqst_end']);
            }
            if(!empty($data['rqst_start']) && !empty($data['rqst_end'])){
                if($data['rqst_start'] > $data['rqst_end']){
                    throw new \think\Exception('需求开始时间不能大于结束时间');
                }
            }
            if(session('user.type')==6019002){
                $valiRes = $this->validate($data, 'Etprs.etprs');//如果是企业端
            }else {
                $valiRes = $this->validate($data, 'Etprs.detail');
            }
            if ($valiRes === true) {
                //保存合同信息
                if(!empty($data['pactNo']) ||!empty($data['pact'])){
                    $pactData['pactNo']=$data['pactNo'];
                    $pactData['pact']=$data['pact'];
                    $pactData['etprsId']=$data['id'];
                    //获取员合同信息id
                    $id=getDataList('etprsPactlog',['etprsId'=>$data['id']],'id');
                    if(!empty($id['data'][0]['id'])){
                        $pactData['id']=$id['data'][0]['id'];
                    }
                    $result=saveData('etprsPactlog',$pactData);//保存合同
                    if ($result['code'] == 0) {
                        throw new \think\Exception('企业合同更新失败' . $result['msg']);
                    }
                }
                unset($data['pactNo']);
                unset($data['pact']);
                $result = saveData('etprs', $data);
                if ($result['code'] == 0) {
                    throw new \think\Exception('企业信息更新失败' . $result['msg']);
                }
                $logRes = saveLog("6012002", "编辑客户信息", $data['id'], "etprs", $data['id']);
                if ($logRes['code'] == 0) {
                    throw new \think\Exception('日志新增失败' . $logRes['msg']);
                }

                Db::commit();
                return $result;
            }
            return array('code' => 0, 'msg' => $valiRes);
        } catch (\Exception $e) {
            Db::rollback();
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }

    }

    /**
     * 正式分配房间
     * @param $etprsId 企业ID
     * @param $pact_start  合同开始时间
     * @param $pact_end    合同结束时间
     * @param $roomInfo    分配的房间信息
     */
    public function allocation()
    {
        $data = input("post.");
//        $pactVal = $this->validate($data, "Pactlog.insert");
//        if ($pactVal === true) {
            $isTrueRoom = $this->checkRoom($data['roomInfo']);
            if ($isTrueRoom['code'] == 0) {
                return $isTrueRoom;
            }

            $pactRes = model("Pactlog")->savePactlog($data);
            if ($pactRes['code'] == 1) {
                $pactRes['etprsId'] = $data['etprsId'];
            }
            return $pactRes;
//        }
//        return array('code' => 0, 'msg' => $pactVal);
    }

    /**
     * @param  $id 入驻方ID
     * 这个页面 有五个搜索条件（楼座，楼层，房间编号，出租状态（空闲/已入住/已占用/自用））
     * @return 当前管理员下孵化器对应的楼座  对应的楼层 所有的房间编号
     * @return 楼层=》房间（房间编号,房间状态，工位数，面积，单价）
     */
    public function roomAlloction()
    {
        $id = input("id/d");
        $roomInfo = $this->model->getIqbtRoom2($id);
        $roomInfo['pactStart'] = date('Y-m-d',time());
        $roomInfo['pactEnd'] = date('Y-m-d ',strtotime('+1 year -1day'));
        return $roomInfo;
    }

    /**
     * 确定签约  需要将企业状态更改为 6008004 签约合同
     * @param id  合同新增后的自增ID
     * @param etprsId  要签约的企业ID
     */
    public function confirmSign($id, $etprsId)
    {
        // 获取企业基本信息
        $allInfo = $this->model->getEtprsDetail($etprsId, $id);
        if($allInfo['code'] == 0){
            return $allInfo;
        }
        $allInfo['data']['rqst_build_list'] = $this->initBuildFloor();
        return $allInfo;
    }

    /**
     * 签约页面保存  更新合同数据
     * 需要将此企业状态更改为6008005  正式入驻
     */
    public function saveSign()
    {
        $data = input("post.");
        $pactVal = $this->validate($data, "Pactlog.complete");
        if ($pactVal === true) {
            Db::startTrans();
            try {
                // 获取企业ID
                $etprsId = getField('EtprsPactlog', ['id' => $data['id']], 'etprsId');
                if (!$etprsId) {
                    throw new \think\Exception('企业ID获取失败');
                }
                // 把房间更改为正常使用  status=2
                $roomCon['etprsId'] = $etprsId;
                $roomData['status'] = 2;
                $roomRes = saveDataByCon('room',$roomData,$roomCon);
                if($roomRes['code'] == 0){
                    throw new \think\Exception('房间状态修改失败'.$roomRes['msg']);
                }
                // 写入日志
                $logRes = saveLog('6012008','发起入驻-签约合同',$etprsId,'etprs',$etprsId);
                if($logRes['code'] == 0){
                    throw new \think\Exception('日志记录失败'.$logRes['msg']);
                }
                // 写入日志:入驻状态修改
                $logRes = saveLog(6012041, "入驻客户状态变化",$etprsId, 'etprs', $etprsId,6008004,6008005);
                if ($logRes['code'] == 0) {
                    throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                }
                $etprsData['id'] = $etprsId;
                $etprsData['status'] = 6008005;
                $etprsRes = saveData("etprs", $etprsData);
                if ($etprsRes['code'] == 0) {
                    throw new \think\Exception("企业状态保存失败" . $etprsRes['msg']);
                }
                $result = saveData('EtprsPactlog', $data);
                if ($result['code'] == 0) {
                    throw new \think\Exception("签约合同保存失败" . $result['msg']);
                }else{
                    //成功之后新增用户,user表插入一条,用户名为电话,密码默认 888888
                    // 获取企业电话
                    $etprsInfo = findById('etprs', ['id' => $etprsId], 'mobile,contact');
                    if ($etprsInfo['code']!=1) {
                        throw new \think\Exception('企业电话获取失败:'.$etprsInfo['msg']);
                    }
                    $etprsInfo=$etprsInfo['data'];
                    $userInfo['name'] = $etprsInfo['mobile'];
                    $userInfo['realname'] = $etprsInfo['contact'];
                    $userInfo['mobile'] = $etprsInfo['mobile'];
                    $userInfo['etprsId'] = $etprsId;//取刚刚生成的客户id
                    $userInfo['password'] = md5(888888);
                    $userInfo['iqbtId'] = session('iqbtId');//孵化器id
                    $userInfo['status'] = '6018001';
                    $userInfo['type'] = '6019002';//用户类型：企业用户
                    $userInfo['roleId'] = '3';//用户类型：企业用户
                    $vld = $this->validate($userInfo, 'Autoadduser');
                    if ($vld !== true) {
                        throw new \think\Exception($vld);
                    }
                    //user表插入数据
                    $user = saveData('user', $userInfo);
                    if ($user['code'] == 0) {
                        throw new \think\Exception("新建用户失败:".$user['msg']);
                    }
//                    // 写入日志:新增/编辑客户
//                    $logRes=saveLog(6012006,'新增客户',$etprsId,'etprs',$data['data']);
//                    if($logRes['code']==0){
//                        throw new \think\Exception("新增-新增客户操作记录失败:".$logRes['msg']);
//                    }
                }
                Db::commit();
                return $result;
            } catch (\Exception $e) {
                c_Log($e);
                Db::rollback();
                return array('code' => 0, 'msg' => $e->getMessage());
            }
        }
        return array('code' => 0, 'msg' => $pactVal);
    }

    // 上传客户信息 exlce   return id+path
    public function uploadEtprsExcle()
    {
        try {
            $res = upload($dir = "customer", $extarr = array('xlsx', 'xls'), $dftsize = 20);
            if (!is_numeric($res['data'])) {
                return array('code' => 0, 'msg' => '文件上传失败');
            }
            $path = getField('SysFile', array('id' => $res['data']), 'savepath');
            if (!$path) {
                throw new \think\Exception('图片获取失败');
            }
            $data['path'] = '/public' . $path;
            $data['id'] = $res['data'];
            return $data;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 把系统字典信息写入JS文件
    public function echoTest()
    {
        $list = getDataList('SysDict', '', 'name,code,level');
        $fileName = ROOT_PATH . '/public/js/sysDict.js';
        /*if (!is_file($fileName)) {
            mkdir(ROOT_PATH . '/public/js/sysDict.js');
        }*/
        file_put_contents($fileName, 'var sysData = ' . json_encode($list['data']));
    }
    // 把系统字典信息写入JS文件:改良
    public function newSysDict()
    {
        $list = getDataList('SysDict', ['level'=>1], 'name,code,level');
        $newArr=[];
        foreach($list['data'] as $k=>$v){
            $newArr[$v['code']]='';
        }
        foreach($newArr as $k=>$v){
            $res=getDataList('sysDict', ['level'=>2,'code'=>['like',$k.'%']],'name,code,level');
            $newArr[$k]=$res['data'];
        }
        $fileName = ROOT_PATH . '/public/js/newsysDict.js';
        /*if (!is_file($fileName)) {
            mkdir(ROOT_PATH . '/public/js/sysDict.js');
        }*/
        file_put_contents($fileName, 'var sysData = ' . json_encode($newArr));
    }

    // 客户检索
    public function searchEtprs()
    {
        try {
            $name = input("name", '');
            $condition = array();
            if ($name) {
                $condition['name'] = ['like', "%$name%"];
                $condition['status'] = ['in', '6008002'];
                $list = getDataList('etprs', $condition, 'id,name', 'a.addtime');
                return $list;
            }
            return array('code' => 0, 'msg' => '没有相关客户数据');
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 客户详细信息
    public function getEtprs()
    {
        return $this->model->getEtprsDetail();
    }

    // 房间变更  数据获取
    public function changeRoom()
    {
        $etpsId = input("etprsId");
        $this->assign("etprsId", $etpsId);
        $roomInfo = $this->model->getIqbtRoom2($etpsId, true);
        return $roomInfo;
    }

    // 房间变更 确认操作
    public function confirmChange()
    {
        try {
            $data = input("post.");
            // 去除相同的房间ID
            if (!empty($data['roomInfo'])) {
                $newRoom = array();
                $oldRoom = explode(",", $data['roomInfo']);
                foreach ($oldRoom as $v) {
                    if (!in_array($v, $newRoom)) {
                        $newRoom[] = $v;
                    }
                }
                $data['roomInfo'] = implode(',', $newRoom);
            }
            // 检查房间
            $roomRes = $this->checkRoom($data['roomInfo'], $data['etprsId']);
            if ($roomRes['code'] == 0) {
                throw new \think\Exception($roomRes['msg']);
            }
            $pactValidate = validate("Pactlog");
            if (!$pactValidate->scene('update')->check($data)) {
                throw new \think\Exception($pactValidate->getError());
            }
            $pactRes = model("Pactlog")->savePactlog($data, true);
            if($pactRes['code'] == 0){
                throw new \think\Exception($pactRes['msg']);
            }
            return $pactRes;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 校验房间信息
    public function checkRoom($value, $etprsId = false)
    {
        try {
            $list = explode(",", $value);
            foreach ($list as $item) {
                if (!is_numeric($item)) {
                    throw new \think\Exception('请正确分配房间');
                }
                $curRoom = findById('room',['id'=>$item],'id,status,roomNo,etprsId');
                if ($curRoom['code'] == 0) {
                    throw new \think\Exception('房间信息获取失败'.$curRoom['msg']);
                }
                $curRoom = $curRoom['data'];
                if ($curRoom['status'] == 3) {
                    throw new \think\Exception($curRoom['roomNo'] . '号房间为孵化器自用房间,请重新选择房间');
                }
                if ($etprsId) {
                    if ($curRoom['etprsId'] && $curRoom['etprsId'] != $etprsId) {
                        throw new \think\Exception($curRoom['roomNo'] . '号房间已经占用,请重新选择房间');
                    }
                } else {
                    if ($curRoom['etprsId']) {
                        throw new \think\Exception($curRoom['roomNo'] . '号房间已经占用,请重新选择房间');
                    }
                }
            }
            return array('code' => 1, 'msg' => '房间信息校验通过');
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 合同续约 数据获取
    public function renew()
    {
        $etprsId = input("etprsId");
        // 续约不用管之前的合同记录
        $con['etprsId'] = $etprsId;
        $detail = $this->model->getEtprsDetail($etprsId);//, $pactId['data']['id']
        if($detail['code'] == 0){
            return $detail;
        }
        $pactInfo = model("Pactlog")->getEtprsPact($etprsId);
        if($pactInfo['code'] != 0){
            unset($pactInfo['data']['pact']);
            $pactInfo['data']['pact_start'] = date('Y-m-d',$pactInfo['data']['pact_start']);
            $pactInfo['data']['pact_next'] = date('Y-m-d',$pactInfo['data']['pact_end']+60*60*24);
            $pactInfo['data']['pact_end'] = date('Y-m-d',$pactInfo['data']['pact_end']);
            $detail['data'] = array_merge($detail['data'],$pactInfo['data']);
            $detail['data']['id'] = $etprsId;
        }
        return $detail;
    }

    // 确认续约
    public function saveRenew()
    {
        $data = input("post.");
//        dump($data);exit;
        Db::startTrans();
        try {
            $pactValidate = validate("Pactlog");
            if (!$pactValidate->scene('renew')->check($data)) {
                throw new \think\Exception($pactValidate->getError());
            }
            $data['pact_start'] = strtotime($data['pact_start']);
            $data['pact_end'] = strtotime($data['pact_end']);
            $curPact = findById('EtprsPactlog', ['etprsId' => $data['etprsId']], 'pact_start,pact_end','pact_end desc');
            if ($curPact['code'] == 0) {
                throw new \think\Exception('合同信息不存在' . $curPact['msg']);
            }
            $nextStart = date('Y-m-d',$curPact['data']['pact_end']+60*60*24);
            if ($data['pact_start'] != $curPact['data']['pact_end']+60*60*24) {
                throw new \think\Exception('续约开始时间应是'.$nextStart);
            }
            if ($data['pact_start'] > $data['pact_end']) {
                throw new \think\Exception('续约结束时间不能小于合同开始时间');
            }
            // 续约是新增一条合同记录
            // $pactData['id'] = $data['id'];
            $pactData['etprsId'] = $data['etprsId'];
            $pactData['pact_start'] = $data['pact_start'];
            $pactData['pact_end'] = $data['pact_end'];
            $pactData['pactNo'] = $data['pactNo'];
            $pactData['pact'] = $data['pact'];
            // 更改合同表数据
            $pactRes = saveData("EtprsPactlog", $pactData);
            if ($pactRes['code'] == 0) {
                throw new \think\Exception('合同信息更新失败' . $pactRes['msg']);
            }
            // 新增续约表信息
            $renewData['etprsId'] = $data['etprsId'];
            $renewData['pactId'] = $pactRes['data'];
            $renewData['roomIds'] = $data['roomInfo'];
            $renewRes = saveData('EtprsRenew', $renewData);
            if ($renewRes['code'] == 0) {
                throw new \think\Exception('企业续约记录添加失败' . $renewRes['msg']);
            }
            // 如果续约的房间少于之前的房间呢？ 需要把没有续约的房间状态修改为正常使用
            // 获取旧房间
            $roomList = getDataList('room', ['etprsId' => $data['etprsId']], 'a.id,a.roomNo,b.name as buildName', 'a.addtime', [['build b', 'a.buildId=b.id', 'left']]);
            if ($roomList['code'] == 0) {
                throw new \think\Exception('旧房间获取失败' . $roomList['msg']);
            }
            $roomIds = array();
            $roomList = $roomList['data'];
            foreach ($roomList as $k => $v) {
                $roomIds[] = $v['id'];
            }
            // 生成房间记录数据  以及修改房间状态
            foreach($roomIds as $rId){
                $new = explode(',', $data['roomInfo']);
                //
                if(in_array($rId,$new)){
                    // 房间记录表 房间状态  使用
                    $reduction['status'] = 1;
                }else{
                    // 这个还要判断合同过期时间吗？暂时先不管了，因为没过期应该不能续约把
                    // 放开房间
                    $openRoomData['id'] = $rId;
                    // 空闲
                    $openRoomData['status'] = 0;
                    $openRoomData['etprsId'] = 0;
                    $rRoomRes = saveData("room", $openRoomData);
                    if ($rRoomRes['code'] == 0) {
                        throw new \think\Exception('房间重置出错' . $rRoomRes['msg']);
                    }
                    // 房间记录表 房间状态  空闲
                    $reduction['status'] = 2;
                }
                // 房间信息记录
                // 这里续约是续约之前分配的房间
                $rcdCon['etprsId'] = $data['etprsId'];
                $rcdCon['roomId'] = $rId;
                $existRcd = findById('RoomRcd',$rcdCon,'id','endTime desc');
                if($existRcd['code'] == 1){
                    $reduction['id'] = $existRcd['data']['id'];
                }
                // 房间信息记录
                $reduction['etprsId'] = $data['etprsId'];
                $reduction['roomId'] = $rId;
                $reduction['iqbtId'] = getField('room',array('id'=>$rId),'iqbtId');
                $reduction['startTime'] = $data['pact_start'];
                $reduction['endTime'] = $data['pact_end'];
                $rcdRes = saveData("roomRcd", $reduction);
                if ($rcdRes['code'] == 0) {
                    throw new \think\Exception('房间记录表更新失败' . $rcdRes['msg']);
                }
            }
            // 企业分配房间的变更记录
            $changeData['oldIds'] = implode(',',$roomIds);
            $changeData['newIds'] = $data['roomInfo'];
            $changeData['etprsId']= $data['etprsId'];
            $changeRes = saveData("EtprsChangelog",$changeData);
            if($changeRes['code'] == 0){
                throw new \think\Exception('房间变更房间数据记录出错' . $changeRes['msg']);
            }
            // 操作记录
            $logRes = saveLog('6012011', '企业续约', $data['etprsId'], 'etprs', $data['etprsId']);
            if ($logRes['code'] == 0) {
                throw new \think\Exception('操作日志新增失败' . $logRes['msg']);
            }

            /*//发送通知*/
            $user=new User();
            $wxurl=config('wxdomain').'/wechat/test/index';
            //查询该条报名的用户id
//				$join=[['user b','a.adduserId=b.id','left']];
            $userId=getDataList('user',['a.etprsId'=>$data['etprsId']],'a.id,a.openId');
            if($userId['code']==0){
                throw new \think\Exception('查找用户id失败'.$userId['msg']);//获取权限失败
            }
            //保存消息
            $msgPost['title']='续约成功通知';
            $msgPost['content']='';
            $msgPost['usertype']='';
//                    $msgPost['iqbtId ']=session('user.iqbtId');
            $msgPost['usertype']='';
            $res=saveData('msg',$msgPost);
            if($res['code']==0){
                throw new \think\Exception('保存消息失败'.$res['msg']);
            }
            /*发送消息并保存消息记录*/
            $msg=$user->operationSuc1($userId['data'][0]['openId']);
            $msgstatus=empty($msg['code'])?'6024002':'6024003';
            $res=saveMsgRcd($res['data'],$userId['data'][0]['openId'],$msgstatus,$userId['data'][0]['id']);
            if($res['code']==0){
                throw new \think\Exception('保存消息失败'.$res['msg']);
            }
            Db::commit();
            return array('code' => 1, 'msg' => '续约完成~');
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 毕业  数据
    public function quit()
    {
        try {
            $etprsId = input("id");
            $pactId = findById('EtprsPactlog', array('etprsId' => $etprsId), 'id', 'pact_start desc');
            if ($pactId['code'] == 0) {
                throw new \think\Exception('企业合同获取失败' . $pactId['msg']);
            }
            return $this->model->getEtprsDetail($etprsId, $pactId['data']['id']);
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 确定毕业
    public function saveQuit()
    {
        $data = input("post.");
        Db::startTrans();
        try {
            /*演示账号不能毕业*/
            if($data['etprsId']==3){
                throw new \think\Exception('该账号为演示账号,不能毕业');
            }
            // 把房间置为空闲
            $roomList = explode(",", $data['roomIds']);
            $roomCon['id'] = ['in',$roomList];
            $roomData['etprsId'] = 0;
            $roomData['status'] = 0;
            $roomRes = saveDataByCon('room', $roomData,$roomCon);
            if ($roomRes['code'] == 0) {
                throw new \think\Exception('房间重置失败' . $roomRes['msg']);
            }
            $rcdCon['roomId'] = ['in',$roomList];
            $rcdCon['etprsId'] = $data['etprsId'];
            $rcdData['status'] = 2;
            $rcdRes = saveDataByCon('RoomRcd', $rcdData,$rcdCon);
            if ($rcdRes['code'] == 0) {
                throw new \think\Exception('房间记录重置失败' . $rcdRes['msg']);
            }

            $etprsData['id'] = $data['etprsId'];
            $etprsData['status'] = 6008006;
            $etprsRes = saveData('etprs', $etprsData);
            if ($etprsRes['code'] == 0) {
                throw new \think\Exception('企业状态更新失败' . $etprsRes['msg']);
            }
            $curEtprs = findById("etprs", ['id' => $data['etprsId']], 'contact,mobile');
            if ($curEtprs['code'] == 1 && $curEtprs['data']) {
                $data['contact'] = $curEtprs['data']['contact'];
                $data['mobile'] = $curEtprs['data']['mobile'];
                $data['quitdate'] = date('Y-m-d H:i:s', time());
            } else {
                throw new \think\Exception('企业数据不存在' . $curEtprs['msg']);
            }
            $res = saveData("EtprsQuit", $data);
            if ($res['code'] == 0) {
                throw new \think\Exception('企业退出表数据生成失败' . $res['msg']);
            }
            // 操作记录
            $logRes = saveLog('6012012', '客户毕业', $data['etprsId'], 'etprs', $data['etprsId']);
            if ($logRes['code'] == 0) {
                throw new \think\Exception('操作记录失败' . $logRes['msg']);
            }
            // 写入日志:入驻状态修改
            $logRes = saveLog(6012041, "入驻客户状态变化",$data['etprsId'], 'etprs', $data['etprsId'],6008005,6008006);
            if ($logRes['code'] == 0) {
                throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
            }
            Db::commit();
            return $res;
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取用户详细信息
    public function getAllDetail()
    {
        try {
            $id = input("");
            $id = $id['id'];
            $con['etprsId'] = $id;
            // liang hui   1 starttime
            $pactCon['etprsId'] = $id;
            $pactCon['pact_start'] = ['<',time()];
            $pactCon['pact_end'] = ['>',time()];
            $first = findById('EtprsPactlog', $pactCon, 'id', 'pact_end desc');
            if($first['code'] == 0){
                // 获取最近合同
                $pactId = findById('EtprsPactlog', $con, 'id', 'pact_end desc');
                if($pactId['code'] == 1){
                    $pId = $pactId['data']['id'];
                }
            }else{
                $pId = $first['data']['id'];
            }
            $pId = (isset($pId) && $pId)  ? $pId : false;
            $detail = $this->model->getEtprsDetail($id,$pId);//pactFile
            if($detail['code'] == 0){
                return $detail;
            }
//            //意向需求拼接
//            if(!empty($detail['data']['rqst_build'])){
//                $floorstr = $detail['data']['rqst_floor'] ? '/' . $detail['data']['rqst_floor'] : '';
//                $roomstr = $detail['data']['rqst_roomNo'] ? '/' . $detail['data']['rqst_roomNo'] : '';
//                $detail['data']['rqst_build_name'] = $detail['data']['rqst_build'] . $floorstr . $roomstr;
//            }
            unset($detail['data']['rqst_roomNo']);
            unset($detail['data']['rqst_floor']);
            /*// 获取跟进信息
            $customer = new Customer();
            $visitInfo = $customer->flowInfo($id);
            $detail['follow'] = $visitInfo['data'];
            // 获取操作记录  现在先拉取合同变更表数据
            $detail['record'] = $this->model->getRecord($id);*/
            return $detail;
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取跟进信息
    public function getRecord()
    {
        try {
            $id = input("id");
            $con['a.etprsId'] = $id;
            $field = 'b.name,a.id,a.desc,b.mobile,a.addtime,b.realname';
            $join = [['user b', 'a.adduserId = b.id', 'left']];
            $order = 'a.addtime desc';
            $record = getDataList('Log', $con, $field, $order, $join);
            if ($record['data']) {
                foreach ($record['data'] as $k => $v) {
                    $record['data'][$k]['addtime'] = date('Y-m-d H:i', $v['addtime']);
                }
            }
            return $record['data'];
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 变化楼座对应的楼层
    public function changeBuild($fdefault = '')
    {
        $list = $this->model->getBuilds();
        $floorHtml = "<option value=''>选择楼层</option>";
        $floor = $list['floor'];
        return $floor;
        foreach ($floor as $k => $v) {
            $floorHtml .= "<option value='$k' " . ($fdefault == $k ? 'selected' : '') . ">$v</option>";
        }
        return $floorHtml;
    }

    // 下载
    public function download()
    {
        downfile();
    }

    // 上传  20180309 默认大小为500KB
    public function ajaxUploads()
    {
        $dir = input("dir") ? input("dir") : "default";
        if (input("ext")) {
            $extarr = explode(',', input("ext"));
        } else {
            $extarr = array('jpg', 'JPG', 'gif', 'GIF', 'png', 'PNG', 'jpeg', 'GPEG');
        }
        if (input("size")) {
            $dftsize = input("size");
        } else {
            $dftsize = 0.5;
        }
        if (is_string($extarr)) {
            $extarr = [$extarr];
        }
        $res = upload($dir, $extarr, $dftsize);
        if ($res['code'] != 1) {
            return json(array('code' => 0, 'msg' => $res['msg']));
        }
        $path = findById('SysFile', array('id' => $res['data']), 'id,fileName,savePath');
        $data['path'] =  $path['data']['savePath'];
        $data['id'] = $path['data']['id'];
        $data['fileName'] = $path['data']['fileName'];
        $data['code'] = 1;
        return json($data);
    }

    // 获取楼层
    function initBuildFloor($bd = ''){
        $optHtml = "<option value=''>选择楼座</option>";
        $list = model('Etprs')->getBuilds();
        $build = $list['build'];
        return $build;
        foreach ($build as $k => $v) {
            $v = str_replace("'", '"', $v);
            $optHtml .= "<option value='$k' " . ($bd == $k ? 'selected' : '') . " >$v</option>";
        }
        $floorHtml = "";
//        $floor = $list['floor'];
//        foreach ($floor as $k=>$v) {
//            $floorHtml .= "<option value='$k' " . ($bd == $k ? 'selected' : '') . ">$v</option>";
//        }
        return $optHtml;
    }

    // 退出客户 将status 修改为 6008001  如果有房间,房间置空
    function backCus()
    {
        try {
            Db::startTrans();
            $id = input("id");
            $status=input("status");
            $statusRes=findById('etprs',['id'=>$id],'status');
            if($statusRes['code']==0){
                throw new \think\Exception('获取原状态码失败' . $statusRes['msg']);
            }
            $data['id'] = $id;
            $data['status'] = 6008001;
            $data['cstmstatus'] = 6002004;
            $res=saveData('etprs', $data);
            if($res['code']==0){
                throw new \think\Exception('更改状态重置失败' . $res['msg']);
            }
            // 写入日志:跟进状态修改
            $logRes = saveLog(6012040, "招商客户状态变化",$id, 'etprs', $id,6002003,6002004);
            if ($logRes['code'] == 0) {
                throw new \think\Exception("新增-招商客户状态变化-操作记录失败:" . $logRes['msg']);
            }
            // 写入日志:入驻状态修改
            $logRes = saveLog(6012041, "入驻客户状态变化",$id, 'etprs', $id,$statusRes['data']['status'],6008001);
            if ($logRes['code'] == 0) {
                throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
            }
            // 如果是已分配房间 把房间置为空闲
            if($status==6008004) {
                $roomlist=getDataList('room',['etprsId'=>$id],'id');
                if ($roomlist['code'] == 0) {
                    throw new \think\Exception('获取占用房间id失败' . $roomlist['msg']);
                }
                $roomIdArr=[];
                foreach($roomlist['data'] as $k=>$v){
                    $roomIdArr[]=$v['id'];
                }
                $roomIdStr=implode(',',$roomIdArr);
                $roomCon['id'] = ['in', $roomIdStr];
                $roomData['etprsId'] = 0;
                $roomData['status'] = 0;
                $roomRes = saveDataByCon('room', $roomData, $roomCon);
                if ($roomRes['code'] == 0) {
                    throw new \think\Exception('房间重置失败' . $roomRes['msg']);
                }
                $rcdCon['roomId'] = ['in',$roomIdStr];
                $rcdCon['etprsId'] =$id;
                $rcdData['status'] = 2;
                $res = saveDataByCon('RoomRcd',$rcdData,$rcdCon);
                if ($res['code'] == 0) {
                    throw new \think\Exception('房间记录重置失败' . $res['msg']);
                }
            }
            Db::commit();
            return $res;
        }catch(\Exception $e){
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    /***
     *
     */
    function initXlsRecord($code = '')
    {
        $con['a.code'] = $code;
        $con['a.iqbtId'] = ['in', session("iqbtId")];
        $field = 'b.name,b.realname,a.id,a.desc,b.mobile,a.addtime';
        $join = [['user b', 'a.adduserId = b.id', 'left']];
        $order = 'a.addtime desc';
        $record = getDataList('Log', $con, $field, $order, $join);
        if ($record['data']) {
            foreach ($record['data'] as $k => $v) {
                $record['data'][$k]['addtime'] = date('Y-m-d H:i', $v['addtime']);
            }
        }
        return $record['data'];
    }

    public function cutImg()
    {
        return cutImage();
    }

    // 获取扩展信息
    public function getEtprsInfo()
    {
        $etprsId = input("etprsId");
        return $this->model->getEtprsInfo($etprsId);
    }

    // 更新扩展信息
    public function saveEtprsExtra()
    {
        $data = input("post.");
        return $this->model->saveExtra($data);
    }
}