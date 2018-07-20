<?php
namespace app\wechat\controller;

use think\Controller;
use think\Log;
use think\Request;
use think\Db;
use think\Cache;
use Hooklife\ThinkphpWechat\Wechat;


class User extends Controller
{
	// 申请（注册）页面
	public function register(){
		$openId=session('openId');
		//空间类型
		$con['code']=array('like','6004%');
		$con['level']=2;
		$iqbttype=getDataList('sysDict',$con,'code,name');
		$iqbttype=$iqbttype['data']; //dump($iqbttype);exit;
		//        return view('',['openId'=>$openId,'tempId'=>$tempId]);
		return view('',['openId'=>$openId,'iqbttype'=>$iqbttype]);
	}
	public function test(){
		return view();
	}
	// 申请（注册）页面  提交
	public function regSub(){
		try{
			Db::startTrans();
			$data = input('post.'); //var_dump($data);exit;
			//common/validate/WxRegister.php
			$vld=$this->validate($data,'WxRegister'); //var_dump($vld);exit;
			if($vld!==true){
				throw new \think\Exception($vld);
			}
			$oldUser = findById('user',['mobile'=>$data['mobile']],'id');
			if($oldUser['code'] == 1){
				throw new \think\Exception('此手机号已注册');
			}
			//获取districtId
			$areaStr=$data['area'];
			$last=strrpos($areaStr,' ');  //var_dump($last);
			$area=substr($areaStr, $last+1); //var_dump($area);
			$districtId=getField('region',array('name'=>$area),'id');//var_dump($districtId);
			//var_dump($data);exit;
			
			$icbData['contact']=$data['contact'];  //联系人
			$icbData['mobile']=$data['mobile'];
			$icbData['name']=$data['name'];  //空间名称
			$icbData['type']=$data['type'];  //空间类型
			$icbData['districtId']=$districtId;  //空间位置
			$icbData['address']=$data['address'];  //详细地址
			$icbData['from']=$data['source'];    //了解渠道
			$icbData['status']=6026006;   //审核中
			$icbData['validTime']=time()+86400*7;  //孵化器过期时间
			$icbRes= saveData('incubator', $icbData);
			if ($icbRes['data']){
				$userData['realname']=$data['contact'];
				$userData['name']=$data['mobile'];
				$userData['mobile']=$data['mobile'];
				$userData['status'] = '6018005';
				$userData['type'] = '6019001';    //用户类型：孵化器管理员
				$userData['roleId'] = '2';    //用户权限
				$userData['iqbtId'] = $icbRes['data'];
				$userData['password'] = md5(888888);
				$userData['openId'] = $data['openId'];//保存openId
				$uearRes = saveData('user', $userData); //var_dump($uearRes);
				if (!$uearRes['data']) {
					throw new \think\Exception('用户添加失败！');
				}
				/*//发送wechat通知*/
				$wxurl=config('domain').'/wechat/test/index';
				$openIdArr=getDataList('user',['roleId'=>1],'id,openId');//查询需要发送的用户 todo 确定menuId
				if($openIdArr['code']==0){
					throw new \think\Exception('查找权限G失败'.$openIdArr['msg']);//获取权限失败
				}
				//保存消息
				$msgPost['title']='新的空间注册申请';
				$msgPost['content']='';
				$msgPost['msgType']='6012049';
				$res=saveData('msg',$msgPost);
				if($res['code']==0){
					throw new \think\Exception('保存消息失败'.$res['msg']);
				}
				//保存消息日志
				$logRes=saveLog('6012049','注册申请消息',$res['data'],'msg','');
				if($logRes['code']==0){
					throw new \think\Exception('日志记录失败'.$logRes['msg']);
				}
				/*发送消息并保存消息记录*/
				foreach($openIdArr['data'] as $k=>$v){
					$msg=$this->rgstApl( $msgPost['title'],$v['openId'],'注册saas账户',$data['mobile'],$data['name'],$wxurl);
					$msgstatus=empty($msg['code'])?'6024002':'6024003';
					$rcdRes=saveMsgRcd($res['data'],$v['openId'],$msgstatus,$v['id']);
					if($rcdRes['code']==0){
						throw new \think\Exception('保存消息失败'.$rcdRes['msg']);
					}
				}
			}else{
				throw new \think\Exception('孵化器添加失败！');
			}
			Db::commit();
			return json(['code'=>1,'msg'=>'您的申请已提交，我们会尽快审核。']);
		}catch(\Exception $e){
			c_Log($e);
			Db::rollback();
			return json(['code'=>0,'msg'=>$e->getMessage()]);
		}
	}

	// 修改密码页面
	public function password(){
		return view();
	}

	// 修改密码 提交
	public function resetpwd(){
		$data=input("request.");
		if(empty($data["password"])){
			return json(array('code'=>'0','msg'=>'原密码不能为空','data'=>[]));
		}
		if(empty($data["newpassword"])){
			return json(array('code'=>'0','msg'=>'新密码不能为空','data'=>[]));
		}else{
			$six_t="/^[A-Za-z0-9]{6,12}$/";   //var_dump($data["newpassword"]);
			if(!preg_match($six_t,$data["newpassword"])){
				return json(array('code'=>'0','msg'=>'密码格式错误','data'=>[]));
			}
			//var_dump(preg_match($six_t,$data["newpassword"]));
		}
		
		$msg=findById("user",array("id"=>session('userId')),"id,password");  //var_dump($msg);exit;
		if(!empty($msg["data"])){
			if($msg["data"]["password"]==md5($data["password"])){
				$umsg=saveData("user",array("id"=>session('userId'),'password'=>md5($data["newpassword"])));
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

	// 个人中心 详情
	public function userinfo(){
		try{
			$userId=3;//session("userId");  //3 王洪
			if(empty($userId)){
				throw new \think\Exception('请重新登录');
			}
			$join=[['etprs b','a.etprsId = b.id','left'],['sysFile c','a.avatar = c.id','left']];
			$msg=findById("user",array("a.id"=>$userId),"a.id,a.iqbtId,a.etprsId,a.type,a.avatar,a.status,a.name,a.realname,a.mobile,a.avatar,b.contact,b.name as etprsName,c.savePath", $order = "a.id asc", $join);

			//var_dump($msg);exit;
			if(!empty($msg['data'])){
				
				//将 用户信息记录到session
				session('user',$msg["data"]);
				session('userId',$msg["data"]["id"]);
				session('iqbtId',$msg["data"]["iqbtId"]);
				
				//用户头像。
				/*     			$avatarId=$msg["data"]["avatar"];
				 $msg2=findById("sysFile",array("id"=>$avatarId),"savePath");
				 $msg["data"]["avatarpath"]="";
				 if(!empty($msg2['data'])){
				 $path=ROOT_PATH . 'public' . "/" . $msg2["data"]["savePath"];
				 if(file_exists($path)){
				 $msg["data"]["avatarpath"]=$msg2["data"]["savePath"];
				 }
				 } */
				return view('',array('data'=>$msg['data']));
			}else{
				throw new \think\Exception("未查到数据");
			}
		} catch (\Exception $e) {
			//记录事务
			c_Log($e);
			return json(array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]));
		}
	}

	// 个人中心 编辑
	public function suserinfo(){
		$data=self::userinfo();
		return $data;
	} 

	// 个人中心 编辑提交
	public function saveUserinfo(){
		try{
			Db::startTrans();
			$data = input('post.'); //var_dump($data);exit;
			if(empty($data["contact"])){
				throw new \think\Exception('联系人不能为空');
			}
			$isMobile="/^((\+?86)|(\(\+86\)))?(13[0123456789][0-9]{8}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/";
			$isTel="/^([0-9]{3,4}-)?[0-9]{7,8}$/";
			if(!preg_match($isMobile,trim($data["mobile"])) && !preg_match($isTel,trim($data["mobile"]))){
				throw new \think\Exception('联系方式请输入手机号');
			}
			if(empty($data["etprsName"])){
				throw new \think\Exception('公司名称不能为空');
			}
			
			//var_dump(session('userId'));die;
			$etprsId=getField('user',array('id'=>session('userId')),'etprsId'); //var_dump($etprsId);die;
			
			$etprsData['id']=$etprsId;
			$etprsData['contact']=$data['contact'];
			$etprsData['mobile']=$data['mobile'];
			$etprsData['name']=$data['etprsName']; //公司名称
			
			$sdRes= saveData('etprs', $etprsData);
			if ($sdRes['data']) {
				$userData['id']=session('userId');
				$userData['realname']=$data['contact'];
				$userData['mobile']=$data['mobile'];
				$userData['name']=$data['mobile'];
				$udRes= saveData('user', $userData);
				if (!$udRes['data']) {
					throw new \think\Exception('用户修改失败！');
				}
			}else{
				throw new \think\Exception('企业修改失败！');
			}
			
			Db::commit();
			return json(['code'=>1,'msg'=>'保存成功']);
		}catch(\Exception $e){
			c_Log($e);
			Db::rollback();
			return json(['code'=>0,'msg'=>$e->getMessage()]);
		}
		
	}

	//我的空间
	public function myicb(){
		try{
			$userId=session('userId');  //张震 id=2
			if(empty($userId)){
				throw new \think\Exception('请重新登录');
			}
			$join=[['incubator b','a.iqbtId = b.id']];
			$msg=findById("user",array("a.id"=>$userId),"a.id,a.realname,a.mobile,b.name,b.type,b.contact,b.address,b.districtId", $order = "a.id asc", $join);
			//var_dump($msg);die;
			if(!empty($msg['data'])){
				//空间类型
				$con['code']=array('like','6004%');
				$con['level']=2;
				$iqbttype=getDataList('sysDict',$con,'code,name');
				$iqbttype=$iqbttype['data'];
				
				//省市区街道
				$regionId=$msg['data']['districtId'];
				if ($regionId){
					$array=findById('region',array('id'=>$regionId),'name,provinceid,cityid'); //var_dump($array);exit;
					$proName=getField('region',array('id'=>$array['data']['provinceid']),'name');
					$cityName=getField('region',array('id'=>$array['data']['cityid']),'name');
					$area=$proName.' '.$cityName.' '.$array['data']['name'];
				}else{
					$area='';
				}
				return view('',array('data'=>$msg['data'],'iqbttype'=>$iqbttype,'area'=>$area));
			}else{
				throw new \think\Exception('未查到相关信息');
			}
			
		} catch (\Exception $e) {
			//记录事务
			c_Log($e);
			return json(array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]));
		}
	}
	
	//我的空间 保存
	public function saveMyIcb(){
		try{
			$data = input('post.'); //var_dump($data);exit;
			if(empty($data["name"])){
				throw new \think\Exception('空间名称必填');
			}
			if(empty($data["contact"])){
				throw new \think\Exception('联系人必填');
			}
			if(empty($data["address"])){
				throw new \think\Exception('详细地址必填');
			}
			$userId=session('userId');  //张震 id=2
			$iqbtid=getField('user',array('id'=>$userId),'iqbtid'); //var_dump($etprsId);die;
			$incuData['id']=$iqbtid;
			
			//获取districtId
			$areaStr=$data['area'];
			$last=strrpos($areaStr,' ');  //var_dump($last);
			$area=substr($areaStr, $last+1); //var_dump($area);
			$districtId=getField('region',array('name'=>$area),'id');//var_dump($districtId);
			
			$incuData['districtId']=$districtId;
			$incuData['name']=$data['name'];
			$incuData['type']=$data['type'];
			$incuData['contact']=$data['contact'];
			$incuData['address']=$data['address'];
			
			$incuRes= saveData('incubator', $incuData);
			if (!$incuRes['data']) {
				throw new \think\Exception('保存失败！');
			}
			return json(['code'=>1,'msg'=>'保存成功']);
		}catch(\Exception $e){
			c_Log($e);
			return json(['code'=>0,'msg'=>$e->getMessage()]);
		}
	}
	
	//我的账号
	public function mynum(){
		try{
			$userId=session('userId');  // id=3 王洪
			if(empty($userId)){
				throw new \think\Exception('请重新登录');
			}
			$join=[['incubator b','a.iqbtId = b.id','left'],['sysFile c','a.avatar = c.id','left']];
			$msg=findById("user",array("a.id"=>$userId),"a.id,a.avatar,a.realname,a.mobile,b.name,b.type,b.contact,b.address,b.districtId,c.savePath", "a.id asc", $join);
			if ($msg['data']) {
				return view('',array('data'=>$msg['data']));
			}else{
				throw new \think\Exception('未查到相关信息');
			}
		} catch (\Exception $e) {
			//记录事务
			c_Log($e);
			return json(array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]));
		}
	}
	
	//我的账号 保存
	public function saveMynum(){
		try{
			$data = input('post.'); //var_dump($data);exit;
			if(empty($data["realname"])){
				throw new \think\Exception('姓名必填');
			}
			if(empty($data["mobile"])){
				throw new \think\Exception('联系方式必填');
			}
			
			$isMobile="/^((\+?86)|(\(\+86\)))?(13[0123456789][0-9]{8}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/";
			$isTel="/^([0-9]{3,4}-)?[0-9]{7,8}$/";
			if(!preg_match($isMobile,trim($data["mobile"])) && !preg_match($isTel,trim($data["mobile"]))){
				throw new \think\Exception('联系方式请输入手机号');
			}
			
 			$userId=session('userId');  //
			
 			$userData['id']=$userId;
 			$userData['realname']=$data['realname'];
 			$userData['mobile']=$data['mobile'];  //var_dump($userData);
 			$userData['name']=$data['mobile'];
 			$userData['avatar']=$data['avatar'];

 			$userRes= saveData('user',$userData); //var_dump($userRes);die;
 			if (!$userRes['data']) {
				throw new \think\Exception('保存失败！');
			}else{
				return json(['code'=>1,'msg'=>'保存成功']);
			} 
			
		}catch(\Exception $e){
			c_Log($e);
			return json(['code'=>0,'msg'=>$e->getMessage()]);
		}
	}
	
	//use Hooklife\ThinkphpWechat\Wechat;
	//测试
	public function weixincs(){
		$users=Wechat::user()->lists();
		echo '<pre>';print_r($users);echo '</pre>';//exit();
		
		//获取用户信息
		$userService = Wechat::user();
		$user = $userService->get('oiUUo05qvQgIytDzi3BGn7IZy1c8');  //有时想念：oiUUo05qvQgIytDzi3BGn7IZy1c8
		echo '<pre>';print_r($user);echo '</pre>';
	}
	
	//群发消息  无效
	public function wxAllmess(){
/*  		$broadcast =  Wechat::broadcast();
		
 		$text='大家好！欢迎使用 EasyWeChat';
 		$openId1='oiUUo05qvQgIytDzi3BGn7IZy1c8';
 		$openId2='oiUUo02ccVM2tPl8C_BCQ4Evl5Ek'; //萨芬的企鹅
 		$res=$broadcast->sendText($text, [$openId1, $openId2]);
 		echo '<pre>';print_r($res);echo '</pre>'; */
	}
	
	//审核注册申请 调用 
	public function auditRegis1(){
		$name='有时想念';$mobile='13730928572';
		$openId='oiUUo05qvQgIytDzi3BGn7IZy1c8';
		$first="审核通过！";  //审核注册提醒！                  注册提醒！
		$remark="注册申请审核通过。";     // 请尽快登录系统审核。         申请成功，请等待审核。
		$RegisTime=date('Y-m-d H:i:s',time());
		$res=auditRegis($openId,$name,$mobile,$first,$remark,$RegisTime);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}
	
	//试用到期提醒 调用
	public function userExpire1(){
		$mobile='13730928572';
		$openId='oiUUo05qvQgIytDzi3BGn7IZy1c8';
		$first="到期提醒！";  
		$remark="到期提醒。";     
		$ExpireTime=date('Y-m-d H:i:s',time());
		$res=userExpire($openId,$mobile,$first,$remark,$ExpireTime);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}
	
	//注册申请 发送管理端
	public function rgstApl($first,$openId,$type,$mobile,$aplPerson,$wxurl){
		$ExpireTime=date('Y-m-d H:i:s',time());
		$remark='联系方式 ：'.$mobile."\n".'注册时间 ：'.$ExpireTime;
		$res=applyAdit($openId,$type,$first,$remark,$aplPerson,'',$wxurl);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}
	
	//活动申请审核提醒 管理端
	public function applyAdit1($first,$openId,$type,$aplPerson,$etprsName,$mobile,$num,$wxurl){
		$ExpireTime=date('Y-m-d H:i:s',time());
		$remark='所属企业 ：'.$etprsName."\n".'联系方式 ：'.$mobile."\n".'报名人数 ：'.$num."\n".'报名时间 ：'.$ExpireTime;
		$res=applyAdit($openId,$type,$first,$remark,$aplPerson,'',$wxurl);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}
	
	//活动申请审核提醒 企业端
	public function actAuditMsg($first,$openId,$type,$aplPerson,$etprsName,$mobile,$num,$wxurl){
		$ExpireTime=date('Y-m-d H:i:s',time());
		$remark='所属企业 ：'.$etprsName."\n".'联系方式 ：'.$mobile."\n".'报名人数 ：'.$num."\n".'审核时间 ：'.$ExpireTime;
		$res=applyAdit($openId,$type,$first,$remark,$aplPerson,'',$wxurl);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}

	//会议室审核 管理端
	public function mtroomAplMsg($first,$openId,$type,$aplPerson,$etprsName,$mobile,$num,$wxurl){
		$ExpireTime=date('Y-m-d H:i:s',time());
		$remark='预订企业 ：'.$etprsName."\n".'预订时间段 ：'.$mobile."\n".'会议名称 ：'.$num."\n".'申请时间 ：'.$ExpireTime;
		$res=applyAdit($openId,$type,$first,$remark,$aplPerson,'',$wxurl);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}
	
	//会议室审核 企业
	public function mtroomAuditMsg($first,$openId,$type,$aplPerson,$etprsName='',$mobile='',$num,$wxurl){
		$ExpireTime=date('Y-m-d H:i:s',time());
		if($first=='会议室审核通过'){
			$remark='您的会议室申请已通过';
		}else{
			$remark='您的会议室申请已被退回';
		}
		$res=applyAdit($openId,$type,$first,$remark,$aplPerson,'',$wxurl);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}

	//预约处理提醒  预约参观 - 调用
	public function beforeVisit1($first='',$name='',$mobile='',$openId='',$etprsName='',$wxurl=''){
		$first="预约参观！";
		$remark="请尽快登录系统处理。";
		$res=beforeVisit($openId,$name,$mobile,$etprsName,$first,$remark,$wxurl);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}

	//操作成功通知   已入住 续约 退出 - 调用
	public function operationSuc1($openId){
		$content='您的续约成功';      //已入住 续约 退出
		$first="操作成功！";
		$remark="操作成功。";
		$res=operationSuc($openId,$content,$first,$remark);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}

	//升级成功通知 - 调用
	public function upgrade1(){
		$openId='oiUUo05qvQgIytDzi3BGn7IZy1c8';
		$content='后台功能升级后台功能升级后台功能升级后台功能升级后台功能升级后台功能升级后台功能升级后台功能升级后台功能升级后台功能升级后台功能升级';      //已入住 续约 退出
		$first="系统升级通知！1";
		$remark="系统升级通知。";
		$res=upgrade($openId,$content,$first,$remark);
		return $res;
		//echo '<pre>';print_r($res);echo '</pre>';
	}

}