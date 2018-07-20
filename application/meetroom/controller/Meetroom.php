<?php

namespace app\meetroom\controller;

use app\common\controller\Common;
use app\wechat\controller\User;
use think\Db;
header("Access-Control-Allow-Origin: *");

class Meetroom extends Common
{
    public $iqbtStr = null;
    public $model = null;

    public function __construct()
    {
        parent::__construct();
        $this->iqbtStr = session("user.iqbtId");
        $this->model = model("Meetroom");
        $this->assign("nav",'mtroom');
    }

    // 会议室列表   分管理端和企业端
    public function getMtroomList()
    {
        return json($this->model->getMeetroomList());
    }

    public function echoTest()
    {

    }

    // 新增会议室
    public function saveMtroom()
    {
        try {
            $data = input('request.', null, 'trim');
            $valiMsg = $this->validate($data, 'Meetroom.insert');
            if ($valiMsg === true) {
                // 收费但是有没有价格
                if ($data['free'] == '7002002') {
                    if($data['price'] <= 0){
                        throw new \think\Exception('收费会议室必须填写价格');
                    }
                    if($data['audit'] == '7002002'){
                        throw new \think\Exception('收费会议室必须审核');
                    }
                }
                return $this->model->addRoom($data);
            }
            return array('code' => 0, 'msg' => $valiMsg);
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }

    }

    // 单个会议室审核数据
    public function getAplList()
    {
        $id = input("mtroomId");
        return json($this->model->getMtroomApl($id));
    }

    // 导出会议室审核数据
    public function exportApl()
    {
        return $this->model->export();
    }

    // 会议室详情
    public function getMtroomDetail()
    {
        $id = input("mtroomId");
        return json($this->model->mtDetail($id));
    }

    // 会议室预定详情
    public function orderDetail()
    {
        $id = input("mtAplId");
        return $this->model->getMtOrder($id);
    }

    // 审核详情  
    public function review()
    {
        $id = input("mtAplId");
        return $this->model->getReview($id);
    }

    //-me 清理session.work
    public function clearSessWork()
    {
    	$res= \think\Session::clear('work'); //dump($res);
    	//var_dump(session('userId')); var_dump(session('work'));die;
    	return true;
    }
    
    // 更改审核状态
    public function saveAplstatus()
    {
        Db::startTrans();
        try {
            $data = input("post.",null,'trim');
            $valiMsg = $this->validate($data, 'Mtroomapl.change');
            $payable = findById('MtroomApl',array('id'=>$data['id']),'payable');
            if($payable['code'] == 0){
                throw new \think\Exception("申请数据不存在".$payable['msg']);
            }
            if ($valiMsg === true) {
                // 判断是否是收费
                if ($data['free'] == '7002002') {
                    if (!$data['paid']) {
                        throw new \think\Exception("收费会议室必须填写实付金额");
                    }
                    if ($data['paid'] != $payable['data']['payable']) {
                        // 金额不一致也可以提交
                        // throw new \think\Exception('实缴金额与会议室金额不一致');
                    }
                }
                $aplData['id'] = $data['id'];
                $aplData['status'] = $data['status'];
                $aplData['paid'] = $data['paid'];
                $result = saveData('MtroomApl', $aplData); 
                 if($result['code'] == 0){
                    throw new \think\Exception('会议室审核状态修改失败');
                } 
                if($data['status'] == '7001002'){
                    $code = '6012036';
                    $desc = '会议室审核通过';
                }
                if($data['status'] == '7001003'){
                    $code = '6012037';
                    $desc = '会议室审核拒绝';
                }
                // 写入日志
                $logRes = saveLog($code,$desc,$result['data'],'mtroomApl',session("user.etprsId"));
                if($logRes['code'] == 0){
                    throw new \think\Exception('会议室审核-日志记录失败');
                } 
                /*//发送通知*/
                $user=new User();
                $wxurl=config('wxdomain').'/wechat/test/bhd-my-meeting';
                //查询该条报名的用户id
                $join=[['user b','a.adduserId=b.id','left']];
                $userId=getDataList('MtroomApl',['a.id'=>$data['id']],'b.id,b.openId','',$join);
                if($userId['code']==0){
                    throw new \think\Exception('查找用户id失败'.$userId['msg']);//获取权限失败
                }
                //保存消息
                $msgPost['title']=$desc;
                $msgPost['content']='';
                $msgPost['usertype']='';
//                    $msgPost['iqbtId ']=session('user.iqbtId');
                $msgPost['usertype']='';
                $res=saveData('msg',$msgPost);
                 if($res['code']==0){
                    throw new \think\Exception('保存消息失败'.$res['msg']);
                } 
                //保存消息日志
                $logRes=saveLog('6012051','会议室申请审核结果消息',$res['data'],'msg',session('userId'));
                 if($logRes['code']==0){
                    throw new \think\Exception('日志记录失败'.$logRes['msg']);
                } 
                /*发送消息并保存消息记录*/
                $msg=$user->mtroomAuditMsg( $desc,$userId['data'][0]['openId'],'会议室申请通过','',session('user.etprsName'),'','',$wxurl);
                $msgstatus=empty($msg['code'])?'6024002':'6024003';
                $res=saveMsgRcd($res['data'],$userId['data'][0]['openId'],$msgstatus,$userId['data'][0]['id']);
                 if($res['code']==0){
                    throw new \think\Exception('保存消息失败'.$res['msg']);
                }
                Db::commit();
               // dump($result);die;
                return $result;
            }
            return array('code' => 0, 'msg' => $valiMsg);
        } catch (\Exception $e) {
            Db::rollback();
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 编辑会议室-保存
    public function saveEditmtroom()
    {
        Db::startTrans();
        try {
            $data = input("request.", null, 'trim');
            $valiMsg = $this->validate($data, 'Meetroom.edit');
            if ($valiMsg === true) {
                // 收费但是有没有价格
                if ($data['free'] == '7002002' && $data['price'] <= 0) {
                    throw new \think\Exception("收费会议室必须填写价格");
                }
                if ($data['free'] == '7002002' && $data['audit'] == '7002002') {
                    throw new \think\Exception('收费会议室必须审核');
                }
                $data['buildId'] = $data['buildId'];
                $data['floorId'] = $data['floor'];
                unset($data['floor']);
                $result = saveData('mtroom', $data);
                if($result['code'] == 0){
                    throw new \think\Exception('会议室修改失败');
                }
                // 写入日志
                $logRes = saveLog('6012039','编辑会议室信息',$result['data'],'mtroom',session("user.etprsId"));
                if($logRes['code'] == 0){
                    throw new \think\Exception('编辑会议室信息-日志记录失败');
                }
                Db::commit();
                return $result;
            }
            return array('code' => 0, 'msg' => $valiMsg);
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    // 获取所有会议室名称  id,name
    public function getAllname()
    {
        return $this->model->getNameList();
    }

    // 企业端会议室预定    面板数据
    public function reserveData()
    {
        // 会议室ID
        $mtRoomId = input("mtRoomId");
        if(!$mtRoomId){
            return array('code'=>0,'msg'=>'缺少mtRoomId参数');
        }
        // 当前用户的企业ID
        $etprsId = 1;//session("user.etprsId");
        // 会议室基本数据
        $row = findById('mtroom',['id'=>$mtRoomId],'a.name,a.free,a.price,a.id as mtroomId');
        if($row['code'] == '0'){
            return array('code'=>0,'msg'=>'会议室信息获取失败'.$row['msg']);
        }
        if($row['data']['free'] == '7002001'){
            $row['data']['free'] = '是';
        }else{
            $row['data']['free'] = '否';
        }
        $row['data']['price'] = $row['data']['price']*100/100;
        $row['data']['etprsName'] = getField('etprs',array('id'=>$etprsId),'name');
        $row['data']['etprsId'] = $etprsId;
        return $row;
    }

    // 企业端会议室预定
    public function reserve()
    {
        Db::startTrans();
        try{
            // 会议室ID   企业ID    会议名称  开始        结束事件   以及金额
            // mtroomId  -etprsId   name    starttime  endtime   payable
            $data = input("post.");
//            dump(session(''));
//            dump($data);exit;
            if(!empty($data['date'])){
                $data['starttime']=$data['date'].''.$data['starttime'];
                $data['endtime']=$data['date'].''.$data['endtime'];
                unset($data['date']);
            }else {
                // 判断是上午还是下午 不包括12点
                $old = array('上', '下', '午');
                $new = array('', '', ' ');
                if (strpos($data['starttime'], '上') === false) {
                    $data['starttime'] = str_replace($old, $new, $data['starttime']);
                    $data['starttime'] = $this->getTrueTime($data['starttime']);
                } else {
                    $data['starttime'] = str_replace(array('上', '下', '午', '12:'), array('', '', ' ', '00:'), $data['starttime']);
                }
                if (strpos($data['endtime'], '上') === false) {
                    $data['endtime'] = str_replace($old, $new, $data['endtime']);
                    $data['endtime'] = $this->getTrueTime($data['endtime']);
                } else {
                    $data['endtime'] = str_replace($old, $new, $data['endtime']);
                }
            }
//            dump($data);exit;
            $valiMsg = $this->validate($data,'Mtroomapl.insert');
            if($valiMsg === true){
                $msgData=$data;
                $data['starttime'] = strtotime($data['starttime']);
                $data['endtime'] = strtotime($data['endtime']);
                $row = getField('mtroom',array('id'=>$data['mtroomId']),'free');
                if($data['starttime'] == $data['endtime']){
                    throw new \think\Exception('结束时间不能等于开始时间');
                }
                if($data['starttime'] > $data['endtime']){
                    throw new \think\Exception('开始时间不能大于结束时间');
                }
                if($data['starttime']<time()){
                    throw new \think\Exception('请不要预订过去的时间');
                }
                if($row == '7002002'){
                    if($data['payable'] <= 0){
                        throw new \think\Exception('收费会议室需填写缴费金额');
                    }
                }
                $data['etprsId'] = session("user.etprsId");
                $isTrue = $this->checkMtroom($data['starttime'],$data['endtime'],$data['mtroomId']);
                if($isTrue === true){
                    $audit = getField('mtroom',array('id'=>$data['mtroomId']),'audit');//判断该会议室是否需要审核
                    if($audit == '7002002'){
                        $data['status']=7001002;
                    }
                    $result = saveData('mtroomApl',$data);
                    if($result['code'] == 0){
                        throw new \think\Exception('会议室预定失败');
                    }
                    // 写入日志
                    $logRes = saveLog('6012035','预定会议室',$result['data'],'mtroomApl',session("user.etprsId"));
                    if($logRes['code'] == 0){
                        throw new \think\Exception('预定会议室-日志记录失败');
                    }
                    /*//发送通知*/
                    $user=new User();
                    $wxurl=config('wxdomain').'/wechat/test/audit-detail?id='.$result['data'];
                    $openIdArr=searchRoleUser(10);//查询需要发送的用户 todo 确定menuId
                    if($openIdArr['code']==0){
                        throw new \think\Exception('查找权限G失败'.$openIdArr['msg']);//获取权限失败
                    }
                    //保存消息
                    $msgPost['title']='新的会议室预订申请';
                    $msgPost['content']='';
//                    $msgPost['iqbtId ']=session('user.iqbtId');
                    $msgPost['msgType']='6012046';
                    $res=saveData('msg',$msgPost);
                    if($res['code']==0){
                        throw new \think\Exception('保存消息失败'.$res['msg']);
                    }
                    //保存消息日志
                    $logRes=saveLog('6012046','会议室申请消息',$res['data'],'msg',session('userId'));
                    if($logRes['code']==0){
                        throw new \think\Exception('日志记录失败'.$logRes['msg']);
                    }
                    /*发送消息并保存消息记录*/
                    foreach($openIdArr['data'] as $k=>$v){
                        $msg=$user->mtroomAplMsg( $msgPost['title'],$v['openId'],'会议室预订',session('user.etprsName'),session('user.etprsName'),$msgData['starttime'].'-'.$msgData['endtime'],$data['name'],$wxurl);
                        $msgstatus=empty($msg['code'])?'6024002':'6024003';
                        $rcdRes=saveMsgRcd($res['data'],$v['openId'],$msgstatus,$v['id']);
                        if($rcdRes['code']==0){
                            throw new \think\Exception('保存消息失败'.$rcdRes['msg']);
                        }
                    }
                    Db::commit();
                    return $result;
                }
                throw new \think\Exception($isTrue);
            }
            throw new \think\Exception($valiMsg);
        }catch(\Exception $e){
            Db::rollback();
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }

    private function getTrueTime($time){
        $curDate = explode(" ",$time);
        $curTime = explode(":",$curDate[1]);
        $trueTime = '';
        switch($curTime[0]){
            case '1':
                $trueTime = $curDate[0].' '.'13'.':'.$curTime[1];
                break;
            case '2':
                $trueTime = $curDate[0].' '.'14'.':'.$curTime[1];
                break;
            case '3':
                $trueTime = $curDate[0].' '.'15'.':'.$curTime[1];
                break;
            case '4':
                $trueTime = $curDate[0].' '.'16'.':'.$curTime[1];
                break;
            case '5':
                $trueTime = $curDate[0].' '.'17'.':'.$curTime[1];
                break;
            case '6':
                $trueTime = $curDate[0].' '.'18'.':'.$curTime[1];
                break;
            case '7':
                $trueTime = $curDate[0].' '.'19'.':'.$curTime[1];
                break;
            case '8':
                $trueTime = $curDate[0].' '.'20'.':'.$curTime[1];
                break;
            case '9':
                $trueTime = $curDate[0].' '.'21'.':'.$curTime[1];
                break;
            case '10':
                $trueTime = $curDate[0].' '.'22'.':'.$curTime[1];
                break;
            case '11':
                $trueTime = $curDate[0].' '.'23'.':'.$curTime[1];
                break;
            case '12':
                $trueTime = $curDate[0].' '.'12'.':'.$curTime[1];
                break;
        }
        return $trueTime;
    }

    // 会议室合法性检测
    private function checkMtroom($start,$end,$mtRoomId)
    {
        // 判断此开始时间是否在已有预定中时间段
        $condition['mtroomId'] = $mtRoomId;
        $condition['starttime'] = ['between',$start.','.$end];
        // 限制 状态为 审核中和预定成功
        $condition['status'] = ['in','7001001,7001002'];
        $isAlready = findById('mtroomApl',$condition,'id');
        if($isAlready['code'] == 1){
            return '此时间段包含被预定时间段,请重试';
        }
        return true;
    }

    // 会议室取消预定
    public function cancelReserve()
    {
        Db::startTrans();
        try{
            $id = input("id");
            $row = findById('MtroomApl',array('id'=>$id),'mtroomId');
            if($row['code'] == 0){
                throw new \think\Exception('预定的会议室信息出错'.$row['msg']);
            }
            $mtList = findById('mtroom',array('id'=>$row['data']['mtroomId']),'free');
            if($mtList['code'] == 0){
                throw new \think\Exception('会议室查询出错'.$mtList['msg']);
            }
            if($mtList['data']['free'] == '7002002'){
                throw new \think\Exception('收费会议室不可取消预定');
            }
            $data['id'] = $id;
            // 已经取消
            $data['status'] = '7001000';
            $result = saveData('mtroomApl',$data);
            if($result['code'] == 0){
                throw new \think\Exception('会议室状态修改失败'.$result['msg']);
            }
            // 写入日志
            $logRes = saveLog('6012035','取消预定',$result['data'],'mtroomApl',session("user.etprsId"));
            if($logRes['code'] == 0){
                throw new \think\Exception('取消预定-日志记录失败:'.$logRes['msg']);
            }
            Db::commit();
            return $result;
        }catch(\Exception $e){
            Db::rollback();
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage(),'data'=>[]);
        }
    }

    // 企业端会议室收藏
    public function mtCollect()
    {
        Db::startTrans();
        try{

            $data = input("mtroomId",null,'trim');
            $check['mtroomId'] = $data;
            $valiMsg = $this->validate($check,'Mtroomcollect.insert');
            if($valiMsg === true){
                $col['mtroomId'] = $data;
                $con['adduserId'] = session("userId");
                $con['mtroomId'] = $data;
                $isExists = getField('MtroomColect',$con,'id');
                if($isExists){
                    $result = deleteData('MtroomColect',$isExists);
                    if($result['code'] == 0){
                        throw new \think\Exception('会议室收藏数据删除失败'.$result['msg']);
                    }
                    $result['msg'] = '取消收藏';
                }else{
                    $result = saveData('MtroomColect',$col);
                    if($result['code'] == 0){
                        throw new \think\Exception('会议室收藏数据保存失败'.$result['msg']);
                    }
                    $result['msg'] = '收藏成功';
                }
                // 写入日志
                $logRes = saveLog('6012034',$result['msg'],$result['data'],'MtroomColect',session("user.etprsId"));
                if($logRes['code'] == 0){
                    throw new \think\Exception('收藏会议室-日志记录失败');
                }
                Db::commit();
                return $result;
            }else{
                throw new \think\Exception($valiMsg);
            }
        }catch(\Exception $e){
            Db::rollback();
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }
}