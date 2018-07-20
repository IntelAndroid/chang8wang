<?php
namespace app\common\controller;
use think;

class Common extends think\Controller{

    public function _initialize()
    {
        /*if(request()->isMobile()){
//            config('template.view_base',APP_PATH.'mobile/');

            $data=input("request.");
            $openId=$data["openId"];
            if(!empty($openId)){
                $msg=$msg=findById("user",array("openId"=>$openId),"id,password,iqbtId,etprsId,type,avatar,status,name,realname,mobile");
                if(!empty($msg["data"])){
                    session('user',$msg["data"]);
                    session('userId',$msg["data"]["id"]);
                    session('iqbtId',$msg["data"]["iqbtId"]);
                    $iqbtname=getField("incubator",array("id"=>$msg["data"]["iqbtId"]),"name");
                    session('iqbtName',$iqbtname);
                }else{
                    //用户必须先绑定个人登录帐号
//                    return json(array('code'=>'2','msg'=>'用户不存在','data'=>[]));
//                    $this->redirect(url('/user/rgst/rgstiqbt'));
                }

            }
//            else{
//                return json(array('code'=>'2','msg'=>'请先登录','data'=>[]));
//            }
        }*/
        /*$controller=request()->controller();
        $action=request()->action();
        $module= request()->module();
        $userId=session('userId');
        $iqbtId=session("iqbtId");*/
//        if(session("user.status")=='6018004'){
//            $this->redirect(url('/user/rgst/rgstiqbt'));
//        }
        /*if(empty($userId)||empty($iqbtId)){
            $this->redirect(url('/user/Login/login'));
        }*/
    }

    /***
     *
     */
    function initinfo()
    {
        $userId=session('userId');
        $user=session("user");
        /*if(empty($userId)||empty($user)){
//            think\Log::notice(json_encode("init info"));
            return json(array('code'=>'2','msg'=>'请先登录','data'=>[]));
        }*/
        try{
            $info["etprsId"]=$user["etprsId"];
            $info["iqbtId"]=$user["iqbtId"];
            $info["name"]=$user["name"];
            $info["realname"]=$user["realname"];
            $info["avatarpath"]="";
            if(!empty($user["avatarpath"])){
                $info["avatarpath"]=$user["avatarpath"];
            }
            return json(array('code'=>'1','msg'=>'','data'=>$info));
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     * 根据用户角色初始化菜单
     *   6019001	孵化器管理员
     *   6019002	企业用户
     *   6019003	系统维护员
     *   6019004	总管理员
     */
    function initmenu(){
//        $userId=session('userId');
        /*if(empty($userId)){
            //think\Log::notice(json_encode("init menu"));
            return json(array('code'=>'2','msg'=>'请先登录','data'=>[]));
        }*/
        $usertype=session("user.type");
        $etprsId=session("user.etprsId");
        if(empty($usertype)){
//            dump($usertype);
            return json(array('code'=>'2','msg'=>'用户角色获取失败','data'=>[]));
        }
        if(session("user.status")==6018004){
            return json(array('code'=>'3','msg'=>'用户角色获取失败','data'=>['url'=>"{:url('user/rgst/rgstiqbt')}",'id'=>session('userId'),'mobile'=>session('user.mobile')]));
        }
        switch ($usertype){
            case "6019001":
                return array(
                    array("url"=>url('/customer/Customer/index'),'icon'=>"kehuguanli",'title'=>'招商管理','flag'=>'invest'),
                    array("url"=>url('/etprs/etprs/etprslist'),'icon'=>"tubiaolunkuo-",'title'=>'入驻管理','flag'=>"enter"),
                    array("url"=>url('/room/Room/roomInfo'),'icon'=>"wodefangjian",'title'=>'房间管理','flag'=>'room'),
                    array("url"=>url('/iqbt/Iqbt/index'),'icon'=>"tijikongjian-xianxing",'title'=>'空间管理','flag'=>'space'),
                    array("url"=>url('/activity/Activity/index'),'icon'=>"tubiao-",'title'=>'活动管理','flag'=>"activity"),
                    array("url"=>url('/meetroom/Meetroom/mtroomlist'),'icon'=>"huiyishi",'title'=>'会议室','flag'=>'mtroom'),
                    array("url"=>url('/user/User/iqbtusers'),'icon'=>"shezhi",'title'=>'系统设置','flag'=>'cfg'),
                );
                break;
            case "6019002":
                /*return array(
                    array("url"=>url('/iqbt/Iqbt/myiqbt'),'icon'=>"tijikongjian-xianxing",'title'=>'我的入驻','flag'=>"kehuguanli"),
                    array("url"=>url('/activity/Activity/etprsactlist'),'icon'=>"-tubiao-",'title'=>'活动报名','flag'=>"activity"),
                    array("url"=>url('/meetroom/Meetroom/mtroometprslist'),'icon'=>"huiyishi",'title'=>'会议室','flag'=>'mtroom'),
                );*/
                //企业用户，只有入驻企业才能登陆
                $etprstatus=getField("etprs",array("id"=>$etprsId),"status");
//                Log::notice(json_encode($etprstatus));
                if(!empty($etprstatus)&& $etprstatus!="6008005"){
                    return array(
                        array("url"=>url('/iqbt/Iqbt/myiqbt'),'icon'=>"tijikongjian-xianxing",'title'=>'我的入驻','flag'=>"space"),
                    );
                }else{
                    return array(
                        array("url"=>url('/iqbt/Iqbt/myiqbt'),'icon'=>"tijikongjian-xianxing",'title'=>'我的入驻','flag'=>"space"),
                        array("url"=>url('/activity/Activity/etprsactlist'),'icon'=>"tubiao-",'title'=>'活动报名','flag'=>"activity"),
                        array("url"=>url('/meetroom/Meetroom/mtroometprslist'),'icon'=>"huiyishi",'title'=>'会议室','flag'=>'mtroom'),
                    );
                }
                break;
            case "6019003":
                return array(
                    array("url"=>url('/iqbt/Iqbt/iqbtlist'),'icon'=>"tijikongjian-xianxing",'title'=>'空间管理','flag'=>'space'),
                    array("url"=>url('/user/User/myusers'),'icon'=>"shezhi",'title'=>'系统设置','flag'=>'cfg'),
                );
                break;
            case "6019004":
                return array(
                    array("url"=>url('/iqbt/Iqbt/iqbtlist'),'icon'=>"tijikongjian-xianxing",'title'=>'空间管理','flag'=>'space'),
                    array("url"=>url('/user/user/auditlist'),'icon'=>"kehuguanli",'title'=>'用户审核','flag'=>'audit'),
                    array("url"=>url('/user/User/users'),'icon'=>"shezhi",'title'=>'系统设置','flag'=>'cfg'),
                );
                break;
            default:
                break;
        }

    }


    public function uploadFile()
    {
        $dir=input("dir");
        $dir=empty($dir)?"/default":"/".$dir;
        return upload($dir);
    }

    function smntUpload()
    {
        $dir=input("dir");
        $dir=empty($dir)?"/default":"/".$dir;
        $result= upload($dir);
        $file=findById("SysFile",array("id"=>$result['data']),"*");
        return $file["data"]["savePath"];
    }



    /**
     * 表名首字母大写，使用TP格式表名
     * 字典配置
     * */
    public function dict($table)
    {
        $dict=array();
        $data=array();
        switch($table){
            case "User":
                $data["status"]=array('sysDict','code,name',self::setDictCon("6018"));
                $data["type"]=array('sysDict','code,name',self::setDictCon("6019"));
                break;
            case "Etprs":
                $data["status"]=array('sysDict','code,name',self::setDictCon("6008"));
                $data["cstmstatus"]=array('sysDict','code,name',self::setDictCon("6002"));
                $data["source"]=array('sysDict','code,name',self::setDictCon("6001"));
                $data["type"]=array('sysDict','code,name',self::setDictCon("6003"));
                break;
            case "Flow":
                $data["status"]=array('sysDict','code,name',self::setDictCon("6008"));
                $data["cstmstatus"]=array('sysDict','code,name',self::setDictCon("6002"));
                $data["reason"]=array('sysDict','code,name',self::setDictCon("6002"));
                break;
            case "Incubator":
                $data["type"]=array('sysDict','code,name',self::setDictCon("6004"));
                $data["facility"]=array('sysDict','code,name',self::setDictCon("6005"));
                $data["services"]=array('sysDict','code,name',self::setDictCon("6006"));
                $data["workstyle"]=array('sysDict','code,name',self::setDictCon("6007"));
                $data["isfundtion"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["rgstspt"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["policyspt"]=array('sysDict','code,name',self::setDictCon("7002"));
                break;
            case "EtprsInfo":
                $data["industry"]=array('sysDict','code,name',self::setDictCon("6013"));
                $data["etprsStatus"]=array('sysDict','code,name',self::setDictCon("6015"));
                $data["roFinace"]=array('sysDict','code,name',self::setDictCon("6014"));
                break;
            case "Mtroom":
                $data["facility"]=array('sysDict','code,name',self::setDictCon("6022"));
                $data["free"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["audit"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["publish"]=array('sysDict','code,name',self::setDictCon("7002"));
                break;
            case "Room":
                $data["type"]=array('sysDict','code,name',self::setDictCon("6011"));
                $data["unit"]=array('sysDict','code,name',self::setDictCon("6009"));
                $data["dection"]=array('sysDict','code,name',self::setDictCon("6010"));
            case "Activity":
                $data["free"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["audit"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["draft"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["publish"]=array('sysDict','code,name',self::setDictCon("7002"));
                $data["tags"]=array('sysDict','code,name',self::setDictCon("6017"));
                break;
            default:
                break;
        }
        $dict[$table]=$data;
        return $dict;
    }


    function setDictCon($code){
        return array('level'=>array("EGT",1),'code'=>array('like',$code.'%'));
    }

    // 20180207  新加 渲染数据
    public function _empty($name)
    {
        // $controller=request()->controller();
        // if($controller!=="Login"){
        //     $userId=session('userId');
        //     $user=session("user");
        //     if(empty($userId)||empty($user)){
        //         \think\Session::clear();
        //         return view("user@Login/login");
        //     }
        // }
        return view($name);
    }

    /**
     * 检查数据表中字段数据是否唯一
     * @param $table 表名
     * @param array $con 查询条件
     * @return array()
     */
    function chkUniqe($table, $con)
    {
        $chk = findById($table, $con, "id");
        if (!empty($chk["data"])) {
            return returnResult("db_info", "db_exit_info");
        } else {
            return returnResult("db_info", "db_uniqe_info");
        }
    }


    //辅助处理函数----------------------------------------------------------------------------------------------------------------
    public function getDictStr($fileds,$table,$ext='Text'){
        $dict=self::dict($table);
//        Log::notice(json_encode($dict));
        $arr=explode(",",$fileds);
        $table=tableToTp($table);
        if(!isset($dict[$table])){
            return array();
        }
        $data=$dict[$table];
        $result=array();
        $b=$fileds=="*"?true:false;
        foreach ($data as $k => $v) {
            if(in_array($k,$arr)||$b){
                list($dictTable,$dictFileds,$con)=$v;
                $result[]=array(array('fieldkey'=>$k,'fieldname'=>$k.$ext),$dictTable,$dictFileds,$con);
            }
        }
        return $result;
    }

    /**
     * 列表字段重新赋值（针对外键字段,多个字段）
     * @param $datalist 需要处理的数据列表
     * @param $fieldarr 配置原来字段名称，赋值后的名称 array('fieldkey'=>'pid','fieldname'=>'parentName')
     * @param $table 新值从哪个表查询
     * @param string $field 查询的字段
     * @param array $con 查询条件
     * @return array() 将处理后的datalist返回
     */
    public function setListIdText($datalist,$tmplist){
        //print_r($tmplist);exit;
        $temp=array();
        foreach($tmplist as $tmp){
            list($fieldarr,$table,$field,$con)=$tmp;
            $list=array();
            if(isset($temp[$table.json_encode($con)])){
                $list=$temp[$table.json_encode($con)];
            }else{
                $listmsg=gethashmap($table,$con,$field);
                if($listmsg["code"]==="1"){
                    $list=$listmsg["data"];
                }
                $temp[$table.json_encode($con)]=$list;
            }
            if(empty($list)){
                return $datalist;
            }
            $fieldkey=$fieldarr["fieldkey"];
            $fieldName=empty($fieldarr['fieldname'])?$fieldkey:$fieldarr['fieldname'];
            for($i=0;$i<count($datalist);$i++){
                if(empty($datalist[$i][$fieldkey])){
                    $datalist[$i][$fieldName]="";
                }else{
                    $datalist[$i][$fieldName]=getidlistText($list,$datalist[$i][$fieldkey]);
                }
            }
        }
        unset($temp);
        return $datalist;
    }
    /**
     * 对象字段重新赋值（针对外键字段,多个字段）
     * @param $datalist 需要处理的数据列表
     * @param $fieldarr 配置原来字段名称，赋值后的名称 array('fieldkey'=>'pid','fieldname'=>'parentName')
     * @param $table 新值从哪个表查询
     * @param string $field 查询的字段
     * @param array $con 查询条件
     * @return array() 讲处理后的datalist返回
     */
    public function setObjIdText($obj,$tmplist){
        if(empty($tmplist)){
            return $obj;
        }
        foreach($tmplist as $tmp){

            list($fieldarr,$table,$field,$con)=$tmp;
            list($id,$name)=explode(",",$field);
            $fieldkey=$fieldarr["fieldkey"];
            $fieldName=empty($fieldarr['fieldname'])?$fieldkey:$fieldarr['fieldname'];
            $con=array();
            if(!empty($obj[$fieldkey])){
                if(strpos($obj[$fieldkey],",")){
                    $con[$id]=array("in",$obj[$fieldkey]);
                }else{
                    $con[$id]=$obj[$fieldkey];
                }
            }else{
                $con["id"]=0;
            }


            $fieldArr=getFieldArrry($table,$con,$name);

            $obj[$fieldName]=join(",",$fieldArr);
        }
        return $obj;
    }



    function download_file($fileId = '')
    {
        $fmsg = findById("sysFile", array("id" => $fileId), "id,fileName,savePath");
        $file = "";
        $filename = "";
        if (!empty($fmsg['data'])) {
//            $path = $fmsg['data']['savePath'];
            $file = 'public' . $fmsg["data"]["savePath"];
            $filename = $fmsg["data"]["fileName"];
        }
        $file = substr($file, strpos($file, "public"));
        if (is_file($file)) {
            $length = filesize($file);
            $showname = ltrim(strrchr($file, '/'), '/');
            header("Content-Description: File Transfer");
//            header('Content-Length:' . $length);
            if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) { //for IE
                header('Content-Disposition: attachment; filename="' . rawurlencode($filename) . '"');
            } else {
                header('Content-Disposition: attachment; filename="' . $filename . '"');
            }
            readfile($file);
            exit;
        } else {
            echo "文件不存在";
            //return json(array('code'=>'0','msg'=>'文件不存在','data'=>[]));
        }
    }























}