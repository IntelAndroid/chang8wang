<?php
namespace app\wechat\controller;

use think\Controller;
/* use think\Log;
use think\Request;
use think\Db;
use think\Cache; */
use Hooklife\ThinkphpWechat\Wechat;
use org\weixin\MyWechat;
use org\weixin\Jssdk;
use org\weixin\WechatPush;

class Weixin extends Controller
{
	//公众号接口
	public function index()
	{
		$data = input();
		//  Log::notice('`````````````微信token认证``````````````');
		//   Log::notice($data);
		/*if(isset($data['echostr'])){
			echo $data['echostr'];
		}*/
		if(config('weixin.token')){
			$token = config('weixin.token');
		}else{
			$token = 'qdzlhy88888888';
		}
		$wechat = new MyWechat($token, true);
		$wechat->run();
	}


	//菜单查询接口
	public function getMenu(){
		$jssdk = new Jssdk();
		$res = $jssdk->getMenu();
		print_r($res);
	}

	public function makeImg(){
		//  $uids = getFieldArrry('user',array('userCate'=>'1011001','status'=>'1012001'),'id');
		$userinfomsg = getDataList('user',array('userCate'=>'1011001'),'id,qr_img');
		if($userinfomsg['code']==1 &(!empty($userinfomsg['data']))){
			$userinfo = $userinfomsg['data'];
		}
		//  print_r($userinfo);exit();
		$jssdk = new Jssdk();
		$str ='未获取图片id:';
		foreach($userinfo as $value){
			if(empty($value['qr_img'])){
				$img = $jssdk->makeqr($value['id']);
				if(!$img){
					$str .=$value.',';
				}
			}

		}
		echo $str;

	}


	public function token(){
		$data = input();
		//  Log::notice('`````````````微信token认证``````````````');
		//   Log::notice($data);
		if(isset($data['echostr'])){
			echo $data['echostr'];
		}
	}
	
	public function weixincs(){
		$users=Wechat::user()->lists();
		//echo '<pre>';print_r($users);echo '</pre>';exit();
	}
}
