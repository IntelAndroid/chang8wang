<?php

namespace app\wechat\controller;
use app\common\controller\Common;
use think\Log;
use think\Request;
use \wechat\pay\Wxpay;
use \wechat\sdk\Jsapi;

class Test extends Wxbase
{
    public function  _initialize(){
//        dump(session(''));
      /*  if(!session("openId")){
//            $this->redirect(url('wechat/Auth/oauth2_access'));
        }
        $openId=session("openId");
        Log::notice("session里的：".json_encode($openId));
        if (empty(session('user'))) {
               $msg = findById("user", array("name|mobile" =>'18888888888'), "id,password,iqbtId,etprsId,type,avatar,status,name,realname,mobile,validTime");
               if (!empty($msg['data'])) {
                   //用户头像。
                   $avatarId = $msg["data"]["avatar"];
                   $msg["data"]["avatarpath"] = "";
                   $msg2 = findById("sysFile", array("id" => $avatarId), "savePath");
                   if (!empty($msg2['data'])) {
                       $path = ROOT_PATH . 'public' . "/" . $msg2["data"]["savePath"];
                       if (file_exists($path)) {
                           $msg["data"]["avatarpath"] = $msg2["data"]["savePath"];
                       }
                   }
                   //不把密码存储到session里
                   unset($msg["data"]["password"]);
                   //如果是企业用户
                   if (!empty($msg['data']['etprsId'])) {
                       $msg['data']['etprsName'] = getField('etprs', ['id' => $msg['data']['etprsId']], 'name');
                   }
                   //将 用户信息记录到session
                   session('user', $msg["data"]);
                   session('userId', $msg["data"]["id"]);
                   session('iqbtId', $msg["data"]["iqbtId"]);
                   if (session('user.status') != 6018004) {
                       $iqbtname = getField("incubator", array("id" => $msg["data"]["iqbtId"]), "name");
                       session('iqbtName', $iqbtname);
                   }
               }
           }*/
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    public function index(){
        if(session('user.type')==6019001) {
            return view('');
        }else if(session('user.type')==6019002){
            return view('bhd-index');
        }else{
            if(empty(session(''))){
                return '没有登录';
            }else{
                return "系统管理员页面正在建设中...";
            }
        }
    }
    public function attract()
    {
        $jsapi = new Jsapi();
        // 获取签名的时候必须在当前方法中获取,要不签名会失败
        $jsConfig = $jsapi->getSignPackage();
        return view('',['sign'=>$jsConfig]);
    }

    /**
     * 微信base64转图标保存
     * @return array
     */
    public function baseToIamge()
    {
        if (request()->isPost()) {
            header('Content-type:text/html;charset=utf-8');
            $base64_image_content = $_POST['imgBase'];
            //将base64编码转换为图片保存
            if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)) {
                $type = $result[2];
                $new_file = ROOT_PATH.'/public/files/cutimg/';
                if (!is_dir($new_file)) {
                    //检查是否有该文件夹，如果没有就创建，并给予最高权限
                    mkdir($new_file, 0700);
                }
                $img=time() . ".{$type}";
                $new_file = $new_file . $img;
                //将图片保存到指定的位置
                if (file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64_image_content)))) {
                    // 将图片保存
                    $data['fileName'] = 'cut';
                    $data['savePath'] = '/files/cutimg/'.$img;
                    // 存储图片
                    $fileId = 5;
                    // 存储图片
                    return array('code'=>1,'msg'=>'base64转图片成功','data'=>$fileId);
                }else{
                    return array('code'=>0,'msg'=>'base64转图片出错');
                }
            }else{
                return array('code'=>0,'msg'=>'上传失败,请重试');
            }

        }
    }

    /**
     * 发起支付
     * @param $out_trade_no
     * @return array
     */
    public function getPayParam($out_trade_no)
    {
        if(empty($out_trade_no)){
            return ['code'=>0,'msg'=>'订单号不能为空'];
        }
        $wxpay = new Wxpay();
        $result = $wxpay->getParameters($out_trade_no);
        return $result;
    }

    /**
     * 微信支付回调
     */
    public function notify(){
        $wxpay=new Wxpay();
        $result=$wxpay->notify();
        // 记录每次支付后返回的数据
        trace(json_encode($result,true),'info');
        if ($result) {
            // 支付成功,写自己的业务逻辑
        }

    }
}
