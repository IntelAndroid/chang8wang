<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/26
 * Time: 9:53
 */
namespace app\user\controller;
use app\common\controller\Common;
use think\Config;
use app\iqbt\controller\Iqbt;
use think\Controller;
use think\image\Exception;
use think\Log;
use think\Db;
use org\weixin\Jssdk;
class Rgst extends Controller
{
    /**
     * 注册用户
     * @param string $action
     * @return \think\response\Json|\think\response\View
     */
    public function reg(){
        //事务开始
        Db::startTrans();
        try{
            //获取数据
            $data = input("request.");
            //验证
            $validateResult = $this->validate($data,'Register.res');
            if($validateResult !== true){
                throw new \think\Exception($validateResult);
            }else{
                if(!isset($data['action'])){//注册的时候
                    $data['status'] = '6018005';
                    $data['type'] = '6019001';//用户类型：孵化器管理员
                }
                //核对验证码  UserCode
                $codeRes = $this->checkMobileCode($data['mobile'],$data['code']);
                //验证码错误
                if(!$codeRes){
                    throw new \think\Exception("验证码错误");
                }else{
                    //判断是否失效
                    if($codeRes['code'] == 0){
                        throw new \think\Exception($codeRes['msg']);
                    }else{
                        unset($data['repassword']);
                        unset($data['code']);
                        unset($data['action']);
                        $inc=array('status'=>"6026003");
                        if(!empty($data["saleId"])){
                            $inc["saleId"]=$data["saleId"];
                        }
                        $rlt=saveData("incubator",$inc);//保存孵化器
                        if($rlt["code"]==='0'){
                            throw new \think\Exception("注册失败");
                        }else{
                            $data["iqbtId"]=$rlt["data"];
                        }


                        $data['password'] = md5($data['password']);
                        $data['name'] = $data['mobile'];
                        $data["roleId"]=2;
                        unset($data['saleId']);
                        $msg=saveData("User",$data);//保存用户信息

                        if($msg['code'] != 1){
//                            Log::notice(json_encode($msg));
                            throw new \think\Exception("注册失败");
                        }
                        $post['id']=$msg['data'];
                        $post['mobile']=$data['mobile'];
                    }
                }
            }
            Db::commit();
            return json(array('code'=>1,'msg'=>"注册成功",'data'=>$post));
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            Db::rollback();
            return array('code'=>0,'msg'=>'注册失败');
        }
    }
    public function _empty($name){
        return view($name);
    }

    /***
     *
     */
    function rgstiqbt($uid=0)
    {
        return view("",array("uid"=>$uid));
    }
    function register($uid=0)
    {
        return view("",array("saleId"=>$uid));
    }

    /*
     * 注册孵化器页面
     */
    public function saveIqbt(){
        $data=input('request.',null,'trim');
        $username=$data["mobile"];
        $msg=findById("user",array("name"=>$username),"id");
        if(!empty($msg['data'])){
             return array('code'=>'0','msg'=>'当前手机号已注册用户！','data'=>[]);
        }
        if(!empty($data["saleId"])){
            $data["saleId"]=$data["saleId"];
        }
        $data["validTime"]=strtotime("+7 day",time());
        $data["status"]="6026006";//审核中
        //事务开始
        Db::startTrans();
        try{
            $info=saveData("incubator",$data);
            if($info["code"]==='1'){
                $umsg=saveData("user",array("name"=>$data["mobile"],'password'=>md5("888888"),'realname'=>$data["contact"],"iqbtId"=>$info["data"],'type'=>'6019001','roleId'=>2,'status'=>'6018005'));
                if($umsg["code"]==='0'){
                    throw new \think\Exception("申请失败");
                }
                //生成二维码
                $jssdk = new Jssdk();
                $path=$jssdk->makeqr($umsg["data"]);
//                Log::notice(json_encode($path));
                if(!$path){
                    Log::notice(json_encode("生成绑定二维码失败"));
                    $path="";
                }
            }else{
//                Log::notice(json_encode($info));
                throw new \think\Exception("申请失败");
            }

            Db::commit();
            return array('code'=>'1','msg'=>'申请成功','data'=>['path'=>$path]);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            Db::rollback();
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }
    }

    public function saveIqbtinfo(){
        $data=input('request.',null,'trim');
        $uid=session("userId");
        $msg=findById("user",array("id"=>$uid),"openId");
        if(empty($msg['data']["openId"])){
            return array('code'=>'0','msg'=>'请先绑定微信公众号！','data'=>[]);
        }

        $data["validTime"]=strtotime("+7 day",time());
        $data["status"]="6026006";//审核中
        //事务开始
        Db::startTrans();
        try{
            $info=saveData("incubator",$data);
            Log::notice(json_encode($info));
            if($info["code"]==='1'){
                //修改用户状态
//                $rlt=saveData("user",array("id"=>$uid,"status"=>'6018001'));
            }else{
//                Log::notice(json_encode($info));
                throw new \think\Exception("完善信息失败");
            }

            Db::commit();
            return array('code'=>'1','msg'=>'申请成功','data'=>[]);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            Db::rollback();
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }
    }
    public function checkMobile(){
        try {
            $postData = input('request.',null,'trim');
            $vld = $this->validate($postData, 'Register.mobile');
            if ($vld !==true) {
                throw new \think\Exception ($vld);
            }else{
                return array('code'=>1);
            }
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }


    /**
     * 验证码
     * @params $mobiel  用户手机号
     * @return array     状态
     */
    public function createMobileCode($mobile,$isReg='1')
    {
        try {
            $postData = input('request.',null,'trim');
            if($isReg=='1') {
                $vld = $this->validate($postData, 'Register.mobile');
            }else{
                $vld = $this->validate($postData, 'Forget.mobile');
            }
            if ($vld !== true) {
                throw new \think\Exception ($vld);
            }
            //如果存在 提示已经注册?
            if($isReg == '1'){
                $data = findById('User',array('mobile'=>$mobile));
                if($data['data']){
                    return json(array('code'=>0,'msg'=>'此手机号已经注册'));
                }
            }else{
                $data = findById('User',array('mobile'=>$mobile));
                if(!$data['data']){
                    return json(array('code'=>0,'msg'=>'此手机号尚未注册'));
                }
            }
            //这里开始发送
            $code = $this->createCode(4);
            if($isReg == '1') {
            $smsRes = alsms($tplId = 'SMS_122287876', $mobile, array('code' => $code));
            }else{
                $smsRes = alsms($tplId = 'SMS_122287876', $mobile, array('code' => $code));
            }
            if($smsRes['code'] == 1){
//            if($code){

                $codeData['addtime'] = time();
                $codeData['mobile'] = $mobile;
                $codeData['msg'] = $code;
                if($curent = Db::name('SmsLog')->where('mobile',$mobile)->find()){
//                    dump($curent);
                    $codeData['id'] = $curent['id'];
                    $codeData['addtime'] = time();
                    $result = Db::name('SmsLog')->update($codeData);
                }else{
                    $result =  Db::name('SmsLog')->insert($codeData);
                }
                //记录发送日志
                $logRes = saveLog('6000000','用户获取短信'.$codeData['mobile'],0, 'smsLog', $result,0,$codeData['msg']);
                if ($logRes['code'] == 0) {
                    throw new \think\Exception("操作记录失败");
                }
            }else{
                return json(array('code'=>0,'msg'=>'短信发送失败,请稍后再试'));
            }
            return json(array('code'=>1,'msg'=>'短信发送成功'));
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }

    /**
     * @parmas $length 长度
     * @return 随机数字 暂时用来生产验证码
     */
    public function createCode($length)
    {
        $chars_array = array(
            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        );
        $charsLen = count($chars_array) - 1;
        $outputstr = "";
        for ($i=0; $i<$length; $i++)
        {
            $outputstr .= $chars_array[mt_rand(0, $charsLen)];
        }
        return $outputstr;
    }

    /**
     * 核对验证码
     * @params $mobile
     * @params $code
     * @return bool
     */
    public function checkMobileCode($mobile,$code){
        $return = array();
        $trueCode = getField("SmsLog",array('mobile'=>$mobile),'msg');
        $sendTime = getField("SmsLog",array('mobile'=>$mobile),'addtime');
        //判断下验证码是否过期(暂定位30分钟)
        if((time() - $sendTime) > 60*30){
            $return['code'] = 0;
            $return['msg'] = '验证码已经过期';
            return $return;
        }
        if($code == $trueCode){
            $return['code'] = 1;
            return $return;
        }
        return false;
    }
}