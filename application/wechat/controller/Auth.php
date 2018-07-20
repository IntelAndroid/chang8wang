<?php
namespace app\wechat\controller;

use think\Controller;
use think\Log;
use think\Request;
use think\Db;
use think\Cache;

class Auth extends Controller
{
    private $appid = 'wx0e2195a85fb69f6f';
    private $appsecret = '6f34b486e9215dc6dd7e5486519e4aa1';
    private $authnotify = null;

    public function _initialize()
    {
        $this->authnotify = Request::instance()->domain().url('wechat/Auth/saveUser');
    }

    //-me 申请（注册）页面
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
    
    //-me 申请（注册）页面  提交
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
    		$icbData['source']=$data['source'];    //了解渠道
    		$icbData['status']=1;   //已认领
    		
    		$icbRes= saveData('incubator', $icbData);
    		
    		if ($icbRes['data']){
    			$userData['realname']=$data['contact'];
    			$userData['name']=$data['mobile'];
    			$userData['mobile']=$data['mobile'];
    			$userData['status'] = '6018005';
    			$userData['type'] = '6019001';    //用户类型：孵化器管理员
    			$userData['iqbtId'] = $icbRes['data'];
    			$userData['password'] = md5(888888);
    			$userData['validTime']=time()+86400*7;  //账号过期时间
    			
    			$uearRes = saveData('user', $userData); //var_dump($uearRes);
    			if (!$uearRes['data']) {
    				throw new \think\Exception('用户添加失败！');
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
    
    //-me 修改密码页面
    public function password(){
    	return view();
    }
    
    //-me 修改密码 提交
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
    	
    	$userId=session('userId'); //3 王洪
    	$msg=findById("user",array("id"=>$userId),"id,password");  //var_dump($msg);exit;
    	if(!empty($msg["data"])){
    		if($msg["data"]["password"]==md5($data["password"])){
    			$umsg=saveData("user",array("id"=>$userId,'password'=>md5($data["newpassword"])));
//    			var_dump($umsg);exit;
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
    
    //-me 个人中心 详情
    public function userinfo(){
    	try{
    		$userId=3;//session("userId");
    		if(empty($userId)){
    			throw new \think\Exception('请重新登录');
    		}
    		$join=[['etprs b','a.etprsId = b.id'],['sysFile c','a.avatar = c.id']];
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
    			throw new \think\Exception("用户不存在");
    		}
    	} catch (\Exception $e) {
    		//记录事务
    		c_Log($e);
    		return json(array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]));
    	}
    }
    
    //-me 个人中心 编辑
    public function sUserinfo(){
    	$data=self::userinfo();
    	return $data;
    } 
    
    //-me 个人中心 编辑提交
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
    
    /**
     * 网页授权回调接口
     * @return array|\think\response\Json
     */
    public function saveUser(){
        try{
            $code = input("get.code","");
            $accArr = $this->oauth2_access_token($code);
//			dump($accArr);
            $userInfo = $this->oauth2_get_user_info($accArr["access_token"],$accArr["openid"]);
//			dump($userInfo);
            $data["openId"] = $userInfo["openid"];
            session("openId",$userInfo["openid"]);
//            $this->redirect('wechat/test/index');
            /*redirect跳转不了  临时修改为在这边查一遍user*/
            $msg = findById('user',['openId'=>$data["openId"]],'id,iqbtId,mobile,status,etprsId,type');
			Log::notice(json_encode('res is '.$msg['code']));
            // 角色在这里判断绑定什么的比较好
            if(empty($msg['code'])){
                //todo 跳转到绑定页面
                Log::notice(json_encode("跳转到绑定页面"));
//                $this->redirect(url('wechat/Auth/bind'));
                return view('bind',['openId'=> $data["openId"]]);
            }else{
                Log::notice(json_encode($msg));
				//判断是否为未通过审核账号
				if($msg['data']['status']==6018005){
					return ('您的账号正在审核中,请耐心等待');
				}
				//判断孵化器是否过期
				$res=findById('incubator',['id'=>$msg['data']['iqbtId']],'validTime');
				if($res['data']['validTime']!=0 && $res['data']['validTime']<time()){
					return ('您的空间合同已过期,请联系创8官方客服续费');
				}
                //将用户数据保存到session里
                session('userId',$msg['data']['id']);
                session('iqbtId',$msg['data']['iqbtId']);
                session('user',$msg['data']);
                if(session('user.status')!=6018004) {
                    $iqbtname = getField("incubator", array("id" => $msg["data"]["iqbtId"]), "name");
                    session('iqbtName',$iqbtname);
                }
                if(session('user.type')==6019001) {
                    return view('/test/index', ['iqbtName' => session('iqbtName')]);
                }else if(session('user.type')==6019002){
                    return view('/test/bhd-index', ['iqbtName' => session('iqbtName')]);
                }
            }
        }catch(\Exception $e){
            c_Log($e);
        }
    }

    public function bind()
    {
        $openId=session('openId');
        return view('',['openId'=>$openId]);
    }
//    public function register(){
//        return view('');
//    }

    public function saveBind()
    {
        try{
            Db::startTrans();
            $data = input('post.');
            $vld=$this->validate($data,'Bind');
            if($vld!==true){
                throw new \think\Exception($vld);
            }
            $oldUser = findById('user',['name'=>$data['mobile']],'id,password,iqbtId,etprsId,type,status,mobile,openId');
            if($oldUser['code'] == 0){
                throw new \think\Exception('此账号不存在,请注册');
            }
            if($oldUser['data']['password']!=md5($data['password'])){
                throw new \think\Exception('密码错误');
            }
			if($oldUser['data']['status']==6018005){
                throw new \think\Exception('该账号正在审核,请耐心等待');
            }
//            if(!empty($oldUser['data']['openId'])){
//                throw new \think\Exception('此手机号已经绑定,请更换账号');
//            }

//            // 删除当前的临时微信用户
//            $delRes = deleteData('user',$data['tempId']);
//            if($delRes['code'] == 0){
//                throw new \think\Exception('临时数据清理失败');
//            }
			/*查找此openId原来是否有绑定账号,如果有,将原账号openId清空*/
			$oldOpenId = findById('user',['openId'=>$data['openId']],'id');

			if(!empty($oldOpenId['data'])){//清除原账号openId
				$res=saveData('user',['id'=>$oldOpenId['data']['id'],'openId'=>'']);
				if($res['code']==0){
					throw new \think\Exception('清除原openId失败'.$res['msg']);
				}
			}
            // 更新openid到此手机号下
            $userData['id'] = $oldUser['data']['id'];
            $userData['openId'] = $data['openId'];
            $result = saveData('user',$userData);
//            dump($result);exit;
            if($result['code'] == 0){
                throw new \think\Exception('绑定失败');
            }

            // 设置session
            session('userId',$result['data']);
            session('openId',$data['openId']);
            session('iqbtId',$oldUser['data']['iqbtId']);
			unset($oldUser['data']['password']);
            session('user',$oldUser['data']);
            if(session('user.status')!=6018004) {
                $iqbtname = getField("incubator", array("id" => $oldUser["data"]["iqbtId"]), "name");
                session('iqbtName',$iqbtname);
            }
			if(session('user.type')==6019002) {
				$etprsName = getField("etprs", array("id" => $oldUser["data"]["etprsId"]), "name");
				session('etprsName',$etprsName);
			}
            Db::commit();
            return json(['code'=>1,'msg'=>'绑定成功,正在跳转','type'=>session('')]);
            $url = url('/wechat/Test/index');
//            $this->redirect($url);
            header("location:$url");
//            exit;
        }catch(\Exception $e){
            c_Log($e);
            Db::rollback();
            return json(['code'=>0,'msg'=>$e->getMessage()]);
        }
    }

    /***
     * 生成OAuth2的Access Token
     * @param $code
     * @return mixed
     */
    public function oauth2_access_token($code)
    {
        // access token 缓存7200
        //if(!Cache::get('access_token')){
            $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$this->appid."&secret=".$this->appsecret."&code=".$code."&grant_type=authorization_code";
            $res = $this->http_request($url);
            $access = json_decode($res, true);
            //Cache::set('access_token',$access,'7200');
            return $access;
        /*}else{
            return Cache::get('access_token');
        }*/
    }

    /**
     * //获取用户基本信息
     * @param $access_token
     * @param $openid
     * @return mixed
     */
    public function oauth2_get_user_info($access_token, $openid)
    {
        $url = "https://api.weixin.qq.com/sns/userinfo?access_token=".$access_token."&openid=".$openid."&lang=zh_CN";
        $res = $this->http_request($url);
        return json_decode($res, true);
    }


    /**
     * HTTP请求（支持HTTP/HTTPS，支持GET/POST）
     * @param $url
     * @param null $data
     * @return mixed
     */
    protected function http_request($url, $data = null)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if (!empty($data)){
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;
    }

    /**
     * 当用户未授权调用
     * 暂时判断的是cookie('openId')
     */
    public function oauth2_access(){
//        dump($this->authnotify);exit;
        $rec_url = urlencode($this->authnotify);
//        $rec_url = $this->authnotify;
//        dump($rec_url);exit;
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$this->appid."&redirect_uri=".$rec_url."&oauth_response.php&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
//        dump($url);exit;
        $this->redirect($url);
//        $this->redirect($bindUrl);
//        Log::notice(json_encode($url));
        /*$ret = file_get_contents($url);
        Log::notice(json_encode($ret));
        $userdata = json_decode($ret, true);
        Log::notice(json_encode($userdata));*/
    }

}
