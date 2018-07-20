<?php
namespace app\user\controller;


use app\common\controller\Common;
use think\Config;
use think\Controller;
use think\Log;
use think\Db;
use org\weixin\Jssdk;
class Login extends  Common
{
    /*public function login()
    {
        $data=array("code"=>"6012001",'desc'=>"用户登录6",'rcdId'=>1,'table'=>"User",'userId'=>1);
        $msg= saveDataByCon("log",$data,array("id"=>24),"更新日志");
        return view();
    }*/

    /***
     * 用户登录
     * @return array
     */
    function access(){
        //Log::notice(json_encode("登录"));
        $data=input("request.");
        try {
            $name=$data["name"];
            $password=$data["password"];
            //校验用户登录信息
            $vld = $this->validate($data, 'User.login');
            if ($vld === true) {
                //开启事务
                Db::startTrans();
                //根据用户名查询到用户密码、id等信息
                $msg=findById("user",array("a.name"=>$name),"a.id,a.password,a.iqbtId,a.etprsId,a.type,a.avatar,a.status,a.name,a.realname,a.mobile,a.roleId,a.openId,a.qr_img,b.validTime","a.id",[['incubator b',"a.iqbtId=b.id","left"]]);
//                $msg2=findById2("user",array("a.name"=>$name),"a.id,a.password,a.iqbtId,a.etprsId,a.type,a.avatar,a.status,a.name,a.realname,a.mobile,a.roleId,a.openId,a.qr_img,b.validTime","a.id",[['incubator b',"a.iqbtId=b.id","left"]]);
//                Log::notice(json_encode($msg));
                if(!empty($msg['data'])){
                    if($msg["data"]["status"]=='6018003'){
                        throw new \think\Exception("当前用户已被冻结");
                    }
                    /*if($msg["data"]["status"]=='6018005'){
                        throw new \think\Exception("您的使用申请正在审核中,请耐心等待");
                    }*/
                    if(!empty($msg['data']['validTime'])){
                        if($msg['data']['validTime']<time()){
                            throw new \think\Exception("您的账号已过期,请购买或续费之后再登录");
                        }
                    }
                    //比较用户密码是否一致
                    if($msg["data"]["password"]==md5($password)){
                        //修改最后登录时间
                        $loginmsg=saveData("user",array("id"=>$msg["data"]["id"],'lastloginTime'=>time()),"用户登录");
                        if(empty($loginmsg["data"])){
                            throw new \think\Exception("修改登录时间错误");
                        }
                        //用户头像。
                        $avatarId=$msg["data"]["avatar"];
                        $msg["data"]["avatarpath"]="";
                        $msg2=findById("sysFile",array("id"=>$avatarId),"savePath");
                        if(!empty($msg2['data'])){
                            $path=ROOT_PATH . 'public' . "/" . $msg2["data"]["savePath"];
                            if(file_exists($path)){
                                $msg["data"]["avatarpath"]=$msg2["data"]["savePath"];
                            }
                        }
                        //不把密码存储到session里
                        unset($msg["data"]["password"]);
                        //如果是企业用户
                        if(!empty($msg['data']['etprsId'])){
                            $msg['data']['etprsName']=getField('etprs',['id'=>$msg['data']['etprsId']],'name');
                        }
                        //将 用户信息记录到session
                        session('user',$msg["data"]);
                        session('userId',$msg["data"]["id"]);
                        session('iqbtId',$msg["data"]["iqbtId"]);
                        if(session('user.status')!=6018004) {
                            $iqbtname = getField("incubator", array("id" => $msg["data"]["iqbtId"]), "name");
                            $districtId = getField("incubator", array("id" => $msg["data"]["iqbtId"]), "districtId");
                            session('iqbtName',$iqbtname);
                            session('districtId',$districtId);
                        }
                        //添加登录日志
                        $logmsg=saveLog("6012001","用户登录",session("userId"),"User"); //saveData("log",array("userId"=>$msg["data"]["id"],'code'=>"login"),"保存登录日志");
                        //dump($logmsg);die;
                        if($logmsg["code"]==='0'){
                            throw new \think\Exception("写入日志错误");
                        }
                        //事务提交
                        Db::commit();
                        //获取跳转到的页面。跳转到第一个菜单页面
                        $jump = url('/user/User/userinfo');
                        if(session('user.status')!=6018004) {
                            $mmsg = self::initmenu();
//                            Log::notice(json_encode($mmsg));
                            if (!empty($mmsg)) {
                            	$mmsg = json_decode(json_encode($mmsg), true); //dump($mmsg);die;
                                if(isset($mmsg[0]["children"][0]["url"])){
                                    $jump = $mmsg[0]["children"][0]["url"];
                                }
                            }
                        }
//                        Log::notice(json_encode($msg));
                        if(empty($msg["data"]["openId"])&&empty($msg["data"]["qr_img"])){
                            //如果没有生成过二维码，生成二维码
                            self::mkqr($msg["data"]["id"]);
                        }
                        return array("code" => 1, "msg" =>'登录成功','data'=>$msg["data"],'url'=>$jump,"token"=>$msg["data"]["openId"],'qr'=>$msg["data"]["qr_img"]);
                    }else{
                        throw new \think\Exception("密码错误");
                    }
                }else{
                    throw new \think\Exception("用户不存在");
                }
            } else {
                throw new \think\Exception("校验失败：" . $vld);
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            Db::rollback();
            return array("code" => 0, "msg" =>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     *
     */
    function mkqr($id)
    {
        try {
            $jssdk = new Jssdk();
            $jssdk->makeqr($id);
            $qrimg=getField("user",array("id"=>$id),"qr_img");
//            Log::notice(json_encode("生成二维码".$qrimg));
            return $qrimg;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return "";
        }
    }

    /***
     *
     */
    function getdata(){
        $msg=getDataList("User",array());
        if(!empty($msg['data'])){
            $tmplist=self::getDictStr("*","User");
//            Log::notice(json_encode($tmplist));
            $msg['data']=$this->setListIdText($msg['data'],$tmplist);
        }
        return $msg["data"];
    }

    /***
     *
     */
    function logout()
    {
        \think\Session::clear();
        $this->redirect(url('/user/Login/login'));
    }


    /***
     *
     */
    function getUrl()
    {
        $id=session("userId");
        $url=url("/user/rgst/register",array("uid"=>$id));
        $sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';

        return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$url;
    }

    /***
     *
     */
    function checkbind()
    {
        try {
            $uid=session('userId');
            $msg=findById("user",array("id"=>$uid),"openId");
            if(!empty($msg["data"])){
                $openId=$msg["data"]["openId"];
                if(!empty($openId)){
                    return json(array('code' => '1', 'msg' => "绑定成功", 'data' => []));
                }else{
                    return json(array('code' => '0', 'msg' => "没有绑定", 'data' => []));
                }
            }else{
                return json(array('code' => '0', 'msg' => "没有绑定", 'data' => []));
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return json(array('code' => '0', 'msg' => $e->getMessage(), 'data' => []));
        }
    }



}
