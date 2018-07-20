<?php
namespace app\user\controller;

use app\common\controller\Common;
use think\Controller;
use think\Db;
use think\Log;

class User extends  Common
{
    /***
     * 当前孵化器用户列表
     *
     */
    function iqbtUserList($type='etprs')
    {
        $con["a.iqbtId"]=['in',session("iqbtId")];
        $users=$this->getUserList($con,$type);
        return $users;
    }

    /***
     * 所有孵化器用户列表
     *
     */
    function userList($type='etprs')
    {
        $con=[];
        $users=$this->getUserList($con,$type);
        return $users;
    }

    /***
     * 我录入的孵化器用户列表
     *
     */
    function myUserList($type='etprs')
    {
        $con["a.adduserId"]=session("userId");
        $users=$this->getUserList($con,$type);
        return $users;
    }

    /***
     *
     */
    function getUserList($con=[],$type='')
    {
      /*孵化器管理员	6019001
        企业用户    	6019002
        系统维护员  	6019003*/
//        dump(session(''));
        $con["a.type"]="6019002";
        if(empty($type)){
            return [];
        }else if($type=='iqbt'){
            $con["a.type"]="6019001";
        }else if ($type=="sys"){
            $con["a.type"]="6019003";
        }
        $postData=input("request.");
        $offset = $postData['offset'];
        $limit = $postData['limit'];
        $order = 'a.addtime desc';
        // 搜索  默认是get传来字段名以及要搜索的值
        if (isset($postData['sort']) && !empty($postData['sort'])) {
            if (!empty($postData['order'])) {
                $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
            } else {
                $order = 'a.' . $postData['sort'] . ' asc';
            }
        }
        try{
//            dump($con);
            $join = [['etprs c', 'a.etprsId = c.id', 'left'],['incubator d', 'a.iqbtId = d.id', 'left']];
            $totalrecord = getRecordNum('user', $con, $join);
            $msg=getDataList("user",$con,"a.id,a.name,a.realname,a.addtime,a.type,a.status,a.mobile,c.name as etprsname,d.name as iqbtname",$order,$join,'',$limit,$offset);

            /*$tmp=getDataList2("user",$con,"a.id,a.name,a.realname,a.addtime,a.type,c.name as etprsname,d.name as iqbtname","a.addtime desc",$join);
            Log::notice(json_encode($tmp["data"]));*/
            if($msg["code"]==='1'){
                foreach ($msg["data"] as $index => $item) {
                    $msg["data"][$index]["addtime"]=empty($msg["data"][$index]["addtime"])?"":date("Y-m-d H:i",$msg["data"][$index]["addtime"]);
                }
                $tmplist=self::getDictStr("*","User");
                $msg['data']=$this->setListIdText($msg['data'],$tmplist);
                return array('total' => $totalrecord, 'rows' => $msg["data"]);
            }else{
                throw new \think\Exception($msg["msg"]);
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return array('total' => 0, 'rows' => [],'msg'=>$e->getMessage());
        }
    }

    /***
     *冻结 解冻用户
     */
    function frzy($userId=0,$status='')
    {
        /*197	正常	6018001	2		0	0	0	0
        198	异常	6018002	2		0	0	0	0
        199	冻结	6018003	2		0	0	0	0*/
        /*204	冻结用户	6012024	2		0	0	0	0
        205	解冻用户	6012025	2		0	0	0	0*/
        try{
            Db::startTrans();
            if(empty($userId)||empty($status)){
                throw new \think\Exception("参数错误");
            }
            $msg=saveData("user",array("id"=>$userId,'status'=>$status),"冻结/解冻用户");
            if(empty($msg['data'])){
                throw new \think\Exception("冻结/解冻用户失败");
            }else{
                $code="6012025";
                if($status=='6018001'){
                    $code="6012024";
                }

                $logmsg=saveLog($code,"冻结/解冻用户",$userId,"User");
                if($logmsg["code"]==='0'){
                    throw new \think\Exception("写入日志错误");
                }
            }
            //事务提交
            Db::commit();
            return array("code" => 1, "msg" =>"操作成功",'data'=>[]);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            Db::rollback();
            return array("code" => 0, "msg" =>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     * 新增用户
     */
    function saveUser()
    {
        $data=input("request.");
        $data["name"]=$data["mobile"];
        $data["status"]="6018001";
        $data["password"]=md5("888888");
        try{
            $chk=findById("user",array("mobile|name"=>$data["mobile"]),"id");
            if(!empty($chk['data'])){
                throw new \think\Exception('校验失败:已经存在当前用户');
            }
            $valiRes = $this->validate($data, 'User.add');
            if($valiRes!==true){
                throw new \think\Exception('校验失败:'.$valiRes);
            }
            $msg=saveData("user",$data);
            if(!empty($msg['data'])){
                 return $msg;
            }else{
                throw new \think\Exception('保存用户信息失败:'.$msg["msg"]);
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     * 新增用户
     */
    function saveiqbtUser()
    {
        $data=input("request.");
        $data["name"]=$data["mobile"];
        $data["status"]="6018001";
        $data["password"]=md5("888888");
        $data["iqbtId"]=session("iqbtId");
        try{
            $chk=findById("user",array("mobile|name"=>$data["mobile"]),"id");
            if(!empty($chk['data'])){
                throw new \think\Exception('校验失败:已经存在当前用户');
            }
            $valiRes = $this->validate($data, 'User.add');
            if($valiRes!==true){
                throw new \think\Exception('校验失败:'.$valiRes);
            }
            $msg=saveData("user",$data);
            if(!empty($msg['data'])){
                return $msg;
            }else{
                throw new \think\Exception('保存用户信息失败:'.$msg["msg"]);
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }

    }

    /***
     * 完善用户信息
     */
    function saveInfo()
    {
        $data=input("request.");
        try{
            $userId=session("userId");
            $data["name"]=$data["name"];
            $data["id"]=session("userId");
            if(empty($userId)){
                throw new \think\Exception('请重新登录');
            }
            $chk=findById("user",array("name"=>$data["name"],'id'=>['<>',$userId]),"id");
            Log::notice(json_encode($chk));
            if(!empty($chk['data'])){
                throw new \think\Exception('校验失败:已存在当前登录名');
            }

            $valiRes = $this->validate($data, 'User.info');
            if($valiRes!==true){
                throw new \think\Exception('校验失败:'.$valiRes);
            }
            $msg=saveData("user",$data);
            if(!empty($msg['data'])){
                return $msg;
            }else{
                throw new \think\Exception('保存用户信息失败:'.$msg["msg"]);
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     *
     */
    function getuserinfo()
    {

        try{
            $userId=session("userId");
            if(empty($userId)){
                throw new \think\Exception('请重新登录');
            }
//            $msg=findById("user",array("id"=>$userId),"id,iqbtId,etprsId,type,avatar,status,name,realname,mobile,avatar,roleId");
            $msg=findById("user",array("a.id"=>$userId),"a.id,a.iqbtId,a.etprsId,a.type,a.avatar,a.status,a.name,a.realname,a.mobile,a.roleId,a.token,a.qr_img,b.validTime","a.id",[['incubator b',"a.iqbtId=b.id","left"]]);
//Log::notice(json_encode($msg));
            if(!empty($msg['data'])){

                //将 用户信息记录到session
                session('user',$msg["data"]);
                session('userId',$msg["data"]["id"]);
                session('iqbtId',$msg["data"]["iqbtId"]);

                //用户头像。
                $avatarId=$msg["data"]["avatar"];
                $msg2=findById("sysFile",array("id"=>$avatarId),"savePath");
                $msg["data"]["avatarpath"]="";
                if(!empty($msg2['data'])){
                    $path=ROOT_PATH . 'public' . "/" . $msg2["data"]["savePath"];
                    if(file_exists($path)){
                        $msg["data"]["avatarpath"]=$msg2["data"]["savePath"];
                    }
                }
                return json(array('code'=>'1','msg'=>'','data'=>$msg["data"]));
            }else{
                throw new \think\Exception("用户不存在");
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]));
        }


    }

    /**
     * 重置密码
     */
    function resetpwd(){
        $data=input("request.");
        if(empty($data["password"])){
            return json(array('code'=>'0','msg'=>'原密码不能为空','data'=>[]));
        }
        if(empty($data["newpassword"])){
            return json(array('code'=>'0','msg'=>'新密码不能为空','data'=>[]));
        }
        $msg=findById("user",array("id"=>session("userId")),"id,password");
        if(!empty($msg["data"])){
            if($msg["data"]["password"]==md5($data["password"])){
                $umsg=saveData("user",array("id"=>session("userId"),'password'=>md5($data["newpassword"])));
                if($umsg["code"]==='1'){
                    \think\Session::clear();
                    return json(array('code'=>'1','msg'=>'密码修改成功','data'=>[]));
                }else{
                    return json(array('code'=>'0','msg'=>'密码修改失败','data'=>[]));
                }
            }else{
                return json(array('code'=>'0','msg'=>'原密码错误','data'=>[]));
            }
        }else{
            return json(array('code'=>'0','msg'=>'用户信息获取失败','data'=>[]));
        }
    }



}
