<?php
namespace app\index\controller;


use app\common\controller\Common;
use think\Controller;
use think\Log;
use think\Db;
class Index extends  Common
{

    /**
     * 18-05-03 ljj 修改 增加$mode参数
     * 导入房间文件上传
     * @param int $mode 导入方式 0:新增;1:覆盖并新增
     * @return array
     */
    function tmpupload($mode=0)
    {
        $dir = input("dir");
        $dir = empty($dir) ? "/xlsData" : "/" . $dir;
        $rlt = upload($dir,["xlsx"]);
        if(!empty($rlt["data"])){
            $fileId=$rlt["data"];
            $ret= self::uploadRoomData($fileId,0,$mode);
            $ret["fileId"]=$fileId;
            return $ret;
        }else{
            return $rlt;
        }
    }

    /***
     * @param int $fileId 文件ID
     * @param int $type 0：校验，1：保存
     * @return array
     */
    function uploadRoomData($fileId=0,$type=0,$mode=0)
    {
        try{
            $filepath=getField("sysFile",array("id"=>$fileId),"savePath");
            if(!empty($filepath)){
                $path=ROOT_PATH . 'public' . "/" . $filepath;
                if(file_exists($path)){
                    //从excel文件获取数据
                    $data=xlsData($path,['iqbtname','name',"floor","type","roomNo","area","num","price","unit","total","dection","selfuse"]);
                    $errs=[];
                    $flag=0;//标识是否有错误，如果有错误则不能导入
                    //校验列表中的字典字典。如果有错误，校验失败，如果没有错误，则继续遍历校验
                    $dictrlt=self::dictVlt($data);
                    //Log::notice($dictrlt);
                    if(!empty($dictrlt["errs"])){
                        $errs=$dictrlt["errs"];
                    }else{
                        $data=$dictrlt["data"];
                    }
                    //遍历excel中的数据
                    for ($i = 0; $i < count($data); $i++) {
                        //校验每条房间信息
                        $vld = $this->validate($data[$i], 'Roomxls.xlsin');
                        if ($vld !== true) {
                            $flag=1;
                            $data[$i]['flag']=1;//发生错误
                            $data[$i]["err"]=$vld;
                            $errs[]=$data[$i];
                        }else{
                            //如果校验通过
                            //校验孵化器是否存在
                            $slfvld3=self::iqbtexit($data[$i]);
                            if($slfvld3["code"]== 0){
                                $flag=1;
                                $data[$i]['flag'] = 1;//错误
                                $data[$i]["err"]=$slfvld3["msg"];
                                $errs[]=$data[$i];
                            }else{
                                $data[$i]['iqbtId']=$slfvld3["data"];
                            }
                            //检验是否自用  如果 不是自用价格必填 单位必填
                            if(isset($data[$i]['selfuseCode'] ) && $data[$i]['selfuseCode'] == '7002002'){
                                if($data[$i]['price']*100/100 <= 0) {
                                    $flag = 1;
                                    $data[$i]['flag'] = 1;//错误
                                    $data[$i]["err"] = '非自用房间必须填写单价';
                                    $errs[] = $data[$i];
                                }
                                if(empty($data[$i]['unitCode'])){
                                    $flag = 1;
                                    $data[$i]['flag'] = 1;//错误
                                    $data[$i]["err"] = '非自用房间必须填写单位';
                                    $errs[] = $data[$i];
                                }
                            }
                            //校验当前房间编号在导入的数据中是否存在
                            $slfvld2=self::checkRoomNo($data[$i],$data);
//                            dump($slfvld2);
                            if($slfvld2 !== true){
                                $flag=1;
                                $data[$i]['flag']=1;//错误
                                $data[$i]["err"]=$slfvld2;
                                $errs[]=$data[$i];
                            }
                            //校验房间编号是否存在
                            $slfvld = self::roomNoExit($data[$i], $type,$mode);
                            //Log::notice(json_encode($slfvld));
                            if($slfvld["code"] == 0){
                                $flag=1;
                                $data[$i]['flag'] = $slfvld["flag"];//错误
                                $data[$i]["err"]=$slfvld["msg"];
                                $errs[]=$data[$i];
                            }else if($slfvld["code"] == 1 && !empty($slfvld['data'])){
                                $data[$i]["floorId"]=$slfvld["data"];
                            }
                            //校验房间的面积和工位数量，有且必须只有一个大于0
                            $slfvld4=self::checkRoomNum($data[$i],$type);
                            if($slfvld4!==true){
                                $flag=1;
                                $data[$i]['flag'] = 1;//错误
                                $data[$i]["err"]=$slfvld4;
                                $errs[]=$data[$i];
                            }

                        }
                    }
                    if($type==1){
                        //saveRoomData函数调用，返回可导入数据
                        //返回前端提醒修改
                        if(empty($errs)){
                            return array("code" => 1, "msg" =>"校验通过",'data'=>$data);
                        }else{
                            return array("code" => 0, "msg" =>"有未通过的校验",'data'=>$errs,'flag'=>$flag);
                        }
                    }else{
                        //返回前端提醒修改
                        if(empty($errs)){
                            return array("code" => 1, "msg" =>"校验通过",'data'=>[]);
                        }else{
                            return array("code" => 0, "msg" =>"有未通过的校验",'data'=>$errs,'flag'=>$flag);
                        }
                    }
                }else{
                    throw new \think\Exception("文件不存在");
                }
            }else{
                throw new \think\Exception("文件不存在");
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            return array("code" => 0, "msg" =>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     *  将excel数据导入
     * @param int $fileId 文件ID
     * @param string $type 导入方式 0：直接导入。1：先删除旧数据，再导入
     * @return array
     */
    function saveRoomData($fileId=0,$type='0')
    {
        //先删除历史数据再做校验，防止有跟历史数据核对的校验不通过
        //删除所有历史数据前 需要校验有房间是否正在使用
        $iqbtId=session("user.iqbtId");
        try{
            Db::startTrans();
             //先校验
            $msg=self::uploadRoomData($fileId,1,$type);
            if($msg['code']==0){
                return array('code'=>'0','msg'=>$msg['msg'],'data'=>[]);
            }
            if($type=="1"){
                // 当选择覆盖并新增
                $hasEnter = findById('room',['iqbtId'=>$iqbtId,'status'=>['<>','0']]);
                if($hasEnter['code'] != 0){
                    throw new \think\Exception("历史房间中有正在使用的房间,请检查数据");
                }
                $bmsg=deleteByCon("Build",array("iqbtId"=>$iqbtId),"导入前删除历史数据");
                if($bmsg["code"]==='1'){
                    $rmsg=deleteByCon("Room",array("iqbtId"=>$iqbtId),"导入前删除历史数据");
                    if($rmsg["code"]!=='1'){
                        throw new \think\Exception("删除历史房间信息失败");
                    }
                }else{
                    throw new \think\Exception("删除历史楼座信息失败");
                }
            }

            //先校验
            $msg=self::uploadRoomData($fileId,1);
            //Log::notice(json_encode($msg));
            if($msg["code"]=='1'){
                //校验通过
                $list=$msg["data"];
                Log::notice($list);
                for ($i = 0; $i < count($list); $i++) {
                    $tmp=$list[$i];
                    $room["iqbtId"]=$tmp["iqbtId"];
                    $room["buildId"]=getField('floor',['id'=>$tmp["floorId"]],'buildId');
                    $room["floorId"]=$tmp["floorId"];
                    $room["roomNo"]=$tmp["roomNo"];
                    $room["area"]=$tmp["area"];
                    $room["num"]=$tmp["num"];
                    $room["type"]=$tmp["typeCode"];
                    $room["unit"]=$tmp["unitCode"];
                    $room["price"]=$tmp["price"];
                    // 20180320 1614 去掉导入房间装修必填校验
                    $room["dection"]=isset($tmp["dectionCode"]) ? $tmp["dectionCode"] : '';
//                    $room["total"]=$tmp["total"];
                    if(empty($tmp["total"])){
                        /**
                         * 71	元/平米/天	6009001	2		0	0	0	0
                        72	元/平米/月	6009002	2		0	0	0	0
                        73	元/工位/天	6009003	2		0	0	0	0
                        74	元/工位/月	6009004	2		0	0	0	0
                        75	元/间/月	6009005	2		0	0	0	0
                         */
                        $room["total"]=0;
                        // 计算月租时候switch修改  应该是 unitCode
                        switch ($room["unit"]){
                            case "6009001":
                                $room["total"]=$room["price"]*$room["area"]*30;
                                break;
                            case "6009002":
                                $room["total"]=$room["price"]*$room["area"];
                                break;
                            case "6009003":
                                $room["total"]=$room["price"]*$room["num"]*30;
                                break;
                            case "6009004":
                                $room["total"]=$room["price"]*$room["num"];
                                break;
                            case "6009005":
                                $room["total"]=$room["price"];
                                break;
                            default:
                                break;
                        }
                    }else{
                        // 20180320 1729 当excle中用户填写了价格需要保存价格
                        $room['total'] = $tmp['total'];
                    }
                    //$room["selfuse"]=$tmp["selfuseCode"];
                    if($tmp['selfuseCode'] == '7002001'){
                        $room['status'] = 3;
                    }
                    // Log::notice($room);
                    $msg=saveData("room",$room,"导入房间");
                    if($msg["code"]!='1'){
                        throw new \think\Exception($msg["msg"]);
                    }
                }
                //事务提交
                Db::commit();
                saveLog("6012018","成功导入".count($list)."条记录",0,"room",0);//导入记录
                return array('code'=>'1','msg'=>'','data'=>[],"count"=>count($list));
            }else{
                return $msg;
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            Db::rollback();
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     * 字典数据校验
     */
    function dictVlt($data=[])
    {
        $unit=gethashmap("SysDict",array("code"=>["like",'6009%'],"level"=>2),"name,code");
        $dection=gethashmap("SysDict",array("code"=>["like",'6010%'],"level"=>2),"name,code");
        $selfuse=gethashmap("SysDict",array("code"=>["like",'7002%'],"level"=>2),"name,code");
        $type=gethashmap("SysDict",array("code"=>["like",'6011%'],"level"=>2),"name,code");
        $errs=[];
        for ($i = 0; $i < count($data); $i++) {
            if(!empty($unit["data"][$data[$i]["unit"]])){
                $data[$i]["unitCode"]=$unit["data"][$data[$i]["unit"]];
            }/*else{
                $data[$i]["flag"]=1;
                $data[$i]["err"]="单位校验失败";
                $errs[]=$data[$i];
            }*/

            if(!empty($dection["data"][$data[$i]["dection"]])){
                $data[$i]["dectionCode"]=$dection["data"][$data[$i]["dection"]];
            }/* 20180320 1611 房间导入去掉装修必填校验 else{
                $data[$i]["flag"]=1;
                $data[$i]["err"]="装修校验失败";
                $errs[]=$data[$i];
            }*/

            if(!empty($selfuse["data"][$data[$i]["selfuse"]])){
                $data[$i]["selfuseCode"]=$selfuse["data"][$data[$i]["selfuse"]];
            }else{
                $data[$i]["flag"]=1;
                $data[$i]["err"]="是否自用校验失败";
                $errs[]=$data[$i];
            }

            if(!empty($type["data"][$data[$i]["type"]])){
                $data[$i]["typeCode"]=$type["data"][$data[$i]["type"]];
            }else{
                $data[$i]["flag"]=1;
                $data[$i]["err"]="房间类型校验失败";
                $errs[]=$data[$i];
            }
        }

        return ['errs'=>$errs,"data"=>$data];
    }

    /***
     * 导入所有校验通过xls数据
     * @param array $list
     */
    function uploadXlsRoomData($list=[]){
        try{
            Db::startTrans();
            //遍历列表保存到数据库
            for ($i = 0; $i < count($list); $i++) {
                $tmp=$list[$i];
                $room["iqbtId"]=$tmp["iqbtId"];
                $room["buildId"]=$tmp["buildId"];
                $room["roomNo"]=$tmp["roomNo"];
                $room["area"]=$tmp["area"];
                $room["num"]=$tmp["num"];
                $room["type"]=$tmp["typeCode"];
                $room["unit"]=$tmp["unitCode"];
                $room["price"]=$tmp["price"];
                $room["dection"]=$tmp["dectionCode"];
                if(empty($tmp["total"])){
                    /**
                     * 71	元/平米/天	6009001	2		0	0	0	0
                    72	元/平米/月	6009002	2		0	0	0	0
                    73	元/工位/天	6009003	2		0	0	0	0
                    74	元/工位/月	6009004	2		0	0	0	0
                    75	元/间/月	6009005	2		0	0	0	0
                     */
                    $room["total"]=0;
                    switch ($room["unit"]){
                        case "6009001":
                            $room["total"]=$room["price"]*$room["area"]*30;
                            break;
                        case "6009002":
                            $room["total"]=$room["price"]*$room["area"];
                            break;
                        case "6009003":
                            $room["total"]=$room["price"]*$room["num"]*30;
                            break;
                        case "6009004":
                            $room["total"]=$room["price"]*$room["num"];
                            break;
                        case "6009005":
                            $room["total"]=$room["price"];
                            break;
                        default:
                            break;
                    }
                }
                $room["selfuse"]=$tmp["selfuseCode"];
                $msg=saveData("room",$room,"导入企业");
                if($msg["code"]!=='1'){
                    throw new \think\Exception($msg["msg"]);
                }
            }
            //事务提交
            Db::commit();
            return array('code'=>'1','msg'=>'','data'=>[]);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            Db::rollback();
            return array("code" => 0, "msg" =>$e->getMessage(),'data'=>[]);
        }
    }


    /***
     *  校验房间编号是否存在
     */
    function roomNoExit($data=[],$type=0,$mode=0)
    {
        $name=$data["name"];
        $floor=$data["floor"];
        $roomNo=$data["roomNo"];
        $useriqbtId=session("user.iqbtId");
        $iqbtId=getField("incubator",array("name"=>$data["iqbtname"]),"id");
        if(empty($iqbtId)){
            return ["code"=>0,"flag"=>1,"msg"=>"不存在孵化器：".$data["iqbtname"]];
        }
        if(!in_array($iqbtId,explode(",",$useriqbtId))){
            return ["code"=>0,"flag"=>1,"msg"=>"导入孵化器不在当前用户下"];
        }
        // 20180321 检查房间唯一性 去掉floor查询条件
        $id=getField("build",array("name"=>$name,'iqbtId'=>$iqbtId),"id");//,"floor"=>$floor
        Log::notice($id.' 楼座ID');
        //是否存在该楼座
        if(empty($id)){
            Log::notice(' 不存在此楼座');
            if($type==1){
                $msg=saveData("build",array("name"=>$name,'iqbtId'=>$iqbtId),"添加楼座");
                $floorId=saveData("floor",array("buildId"=>$msg['data'],"floor"=>$floor,'iqbtId'=>$iqbtId),"添加楼层");
                return ["code"=>1,"msg"=>'','data'=>$floorId['data']];
            }
            return ["code"=>0,"flag"=>0,"msg"=>"不存在楼座楼层:".$name."-".$floor."。直接导入将会创建。"];
        }else{
            //楼座存在,判断是否存在该楼层
            $floorId=getField("floor",array("floor"=>$floor,"buildId"=>$id),"id");
            Log::notice($floorId.'楼层ID，存在此楼座');
            if(empty($floorId)){
                if($type==1) {
                    $floorId = saveData("floor", array("buildId" => $id, "floor" => $floor, 'iqbtId' => $iqbtId), "添加楼层");
                    Log::notice($floorId);
                    return ["code" => 1, "msg" => '', 'data' => $floorId['data']];
                }
                Log::notice('楼座存在了,但是楼层不存在');
                return ["code" => 1, "msg" => ''];
            }else{
                if($mode==0) {
                    //存在楼层,判断是否存在该房间
                    $roomId = getField("Room", array("roomNo" => $roomNo, "buildId" => $id, "floorId" => $floorId), "id");
                    if (!empty($roomId)) {
                        return ["code" => 0, "flag" => 1, "msg" => $data["name"] . "-" . $data["floor"] . "楼层已经存在此房间编号:" . $roomNo];
                    } else {
                        // return ["code"=>1,"msg"=>'','data'=>$id];
                        // 20180321 0949  whl 这里应该返回楼层的数据ID  $floorId
                        return ["code" => 1, "msg" => '', 'data' => $floorId];
                    }
                }
                return ["code" => 1, "msg" => '', 'data' => $floorId];
            }
        }
    }

    /***
     *校验当前房间编号在导入的数据中是否存在
     */
    function checkRoomNo($data=[],$list=[])
    {
        $roomNo=$data["roomNo"];
        $roomStr=$data["name"].'-'.$data['floor'].'-'.$data["roomNo"];
        $num=0;
        foreach ($list as $room) {
            if($roomStr==$room["name"].'-'.$room['floor'].'-'.$room["roomNo"]){
                $num++;
                if($num>1){
                    return "导入数据中有重复的房间编号：".$roomNo;
                }

            }
        }

       /* $mobile=$data["mobile"];
        $mbnum=0;
        foreach ($list as $room) {
            if($mobile==$room["mobile"]){
                $mbnum++;
                if($mbnum>1){
                    return "导入数据中有重复的手机号码：".$mobile;
                }
            }
        }*/
        return true;
    }

    /***
     *校验当前房间面积和工位数是否只有一个大于0
     */
    function checkRoomNum($data=[])
    {
        $area=$data["area"];
        $num=$data["num"];
        if(($area>0&&$num>0)||($area==0&&$num==0)){
            return "房间面积和工位数量有且必须只有一个大于0";
        }
        return true;
    }

    /***
     * 校验孵化器是否存在
     */
    function iqbtexit($data)
    {
        $iqbtname=$data["iqbtname"];
        $iqbtId=getField("incubator",array("name"=>$iqbtname),"id");
        if(!empty($iqbtId)){
            return array("code"=>1,"msg"=>'校验通过',"data"=>$iqbtId);
        }else{
            return array("code"=>0,"msg"=>"不存在孵化器:".$iqbtname,"data"=>$iqbtId);
        }
    }


    /**
     * 18-05-03 ljj 修改 增加$mode参数
     * 招商客户文件上传
     * @param int $mode 导入方式 0:新增;1:覆盖并新增
     * @return array
     */
    function customerupload($mode=0)
    {
        $dir = input("dir");
        $dir = empty($dir) ? "/xlsData" : "/" . $dir;
        $rlt = upload($dir,["xlsx"]);
        if(!empty($rlt["data"])){
            $fileId=$rlt["data"];
            $ret= self::uploadCustomerData($fileId,0,$mode);
            $ret["fileId"]=$fileId;
            return $ret;
        }else{
            return $rlt;
        }
    }

    /***
     * @param int $fileId 文件ID
     * @param int $type 0：校验，1：保存
     * @return array
     */
    function uploadCustomerData($fileId=0,$type=0,$mode=0)
    {
        try{
            $filepath=getField("sysFile",array("id"=>$fileId),"savePath");
            if(!empty($filepath)){
                $path=ROOT_PATH . 'public' . "/" . $filepath;
                if(file_exists($path)){
                    //从excel文件获取数据
                    $data=xlsData($path,["type",'name',"contact","mobile","source","cstmstatus","rqst",'legalname']);
                    $errs=[];
                    $flag=0;//标识是否有错误，如果有错误则不能导入

                    //校验列表中的字典。如果有错误，校验失败，如果没有错误，则继续遍历校验
                    $dictrlt=self::etprsdictVlt($data);
                    if(!empty($dictrlt["errs"])){
                        $errs=$dictrlt["errs"];
                    }else{
                        $data=$dictrlt["data"];
                    }
//                    Log::notice(json_encode($data));
                    //遍历excel中的数据
                    if($mode==0) {
                        $sence = 'Etprs.xls';
                    }else{
                        $sence = 'Etprs.xlscover';
                    }
                    for ($i = 0; $i < count($data); $i++) {
                        //校验每条信息
                        $vld = $this->validate($data[$i],$sence);
                        if ($vld !== true) {
                            $flag=1;
                            $data[$i]['flag']=1;//发生错误
                            $data[$i]["err"]=$vld;
                            $errs[]=$data[$i];
                        }else{
                            //如果校验通过
                            //校验当前房间编号在导入的数据中是否存在
                            $slfvld2=self::checketprsname($data[$i],$data);
                            if($slfvld2 !== true){
                                $flag=1;
                                $data[$i]['flag']=1;//错误
                                $data[$i]["err"]=$slfvld2;
                                $errs[]=$data[$i];
                            }

                        }
                    }
                    if($type==1){
                        //saveEtprsData函数调用，返回可导入数据列表
                        //返回前端提醒修改
                        if(empty($errs)){
                            return array("code" => 1, "msg" =>"校验通过",'data'=>$data);
                        }else{
                            return array("code" => 0, "msg" =>"有未通过的校验",'data'=>$errs,'flag'=>$flag);
                        }
                    }else{
                        //返回前端提醒修改
                        if(empty($errs)){
                            return array("code" => 1, "msg" =>"校验通过",'data'=>[]);
                        }else{
                            return array("code" => 0, "msg" =>"有未通过的校验",'data'=>$errs,'flag'=>$flag);
                        }
                    }
                }else{
                    throw new \think\Exception("文件不存在");
                }
            }else{
                throw new \think\Exception("文件不存在");
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            return array("code" => 0, "msg" =>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     *  将excel数据导入 客户
     * @param int $fileId 文件ID
     * @param string $type 导入方式 0：直接导入。1：先删除旧数据，再导入
     * @return array
     */
    function saveCustomerData($fileId=0,$type='0'){
        //先校验
        $msg=self::uploadCustomerData($fileId,1,$type);
        if($msg['code']==0){
            return array('code'=>'0','msg'=>$msg['msg'],'data'=>[]);
        }
        //先删除所有历史数据，再做校验
        $iqbtId=session("user.iqbtId");
        if($type=="1"){
            //删除本孵化器，入驻状态为：发起入住前 的所有客户。
            $bmsg=deleteByCon("etprs",array("iqbtId"=>$iqbtId,'status'=>'6008001'),"导入前先删除历史数据");
            if($bmsg["code"]!=='1'){
                return array('code'=>'0','msg'=>'删除历史数据失败','data'=>[]);
            }
        }
        //先校验
        $msg=self::uploadCustomerData($fileId,1);
        if($msg["code"]=='1'){
            //校验通过
            $list=$msg["data"];
            try{
                Db::startTrans();
                for ($i = 0; $i < count($list); $i++) {
                    $tmp=$list[$i];
                    if(!empty(session("user.iqbtId"))){
                        $etprs["iqbtId"]=session("user.iqbtId");
                    }else{
                        throw new \think\Exception("没有孵化器信息，请登录后再尝试");
                    }

                    $etprs["name"]=$tmp["name"];
                    $etprs["type"]=$tmp["typeCode"];
                    $etprs["contact"]=$tmp["contact"];
                    $etprs["mobile"]=$tmp["mobile"];
                    $etprs["datafrom"]=6023002;
                    if(!empty($tmp["cstmstatusCode"])){
                        $etprs["cstmstatus"]=$tmp["cstmstatusCode"];
                    }else{
                        $etprs["cstmstatus"]='6002001';
                    }
                    $etprs["source"]=$tmp["sourceCode"];
                    $etprs["rqst"]=$tmp["rqst"];
                    $etprs["legalname"]=$tmp["legalname"];
                    /*if(!empty($etprs["statusCode"])){
                        $etprs["status"]=$tmp["statusCode"];
                    }else{
                        $etprs["status"]='6008001';
                    }*/
                    if($etprs["cstmstatus"]=="6002003"){
//                        $etprs["status"]=$tmp["statusCode"];
                        //如果客户招商状态为拟入驻，入驻状态为：发起入驻。
                        $etprs["status"]='6008002';
                    }else{
                        $etprs["status"]='6008001';
                    }

                    $msg=saveData("etprs",$etprs,"导入客户信息");
                    if($msg["code"]!='1'){
                        throw new \think\Exception($msg["msg"]);
                    }
                    // 写入日志:新增客户
                    $after=$etprs["cstmstatus"];
                    $logRes=saveLog(6012006,'新增客户',$msg['data'],'etprs',$msg['data'],0,$after);
                    if($logRes['code']==0){
                        throw new \think\Exception("新增-新增客户-操作记录失败:".$logRes['msg']);
                    }
//                    else{
//                        $userInfo['name'] = $etprs["mobile"];
//                        $userInfo['mobile'] = $etprs["mobile"];
//                        $userInfo['realname'] = $etprs["contact"];
//                        $userInfo['etprsId'] = $msg['data'];//取刚刚生成的客户id
//                        $userInfo['password'] = md5(888888);
//                        $userInfo['status'] = '6018001';
//                        $userInfo['type'] = '6019002';//用户类型：企业用户
//                        $userInfo['iqbtId'] = session("user.iqbtId");
//
//                        $user = saveData('user', $userInfo);
//                        if ($user['code'] == 0) {
//                            throw new \think\Exception("新建用户失败:".$user['msg']);
//                        }
//                    }
                }

                //事务提交
                Db::commit();
                saveLog("6012005","成功导入".count($list)."条记录",0,"etprs",0);//导入记录
                return array('code'=>'1','msg'=>'','data'=>[],"count"=>count($list));
            } catch (\Exception $e) {
                //记录事务
                c_Log($e);
                return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
            }
        }else{
            return $msg;
        }
    }

    /***
     *校验当前客户名称在导入的数据中是否存在
     */
    function checketprsname($data=[],$list=[])
    {
        $name=$data["name"];
        $num=0;
        foreach ($list as $etprs) {
            if($name==$etprs["name"]){
                $num++;
                if($num>1){
                    return "导入数据中有重复客户名称：".$etprs["name"];
                }
            }
        }

        $mobile=$data["mobile"];
        $mbnum=0;
        foreach ($list as $room) {
            if($mobile==$room["mobile"]){
                $mbnum++;
                if($mbnum>1){
                    return "导入数据中有重复的手机号码：".$mobile;
                }
            }
        }
        return true;
    }

    /***
     * 客户字典数据校验
     */
    function etprsdictVlt($data=[])
    {
        $status=gethashmap("SysDict",array("code"=>["like",'6008%'],"level"=>2),"name,code");
        $cstmstatus=gethashmap("SysDict",array("code"=>["like",'6002%'],"level"=>2),"name,code");
        $source=gethashmap("SysDict",array("code"=>["like",'6001%'],"level"=>2),"name,code");
        $type=gethashmap("SysDict",array("code"=>["like",'6003%'],"level"=>2),"name,code");
        $errs=[];
        for ($i = 0; $i < count($data); $i++){
            if(!empty($source["data"][$data[$i]["source"]])){
                $data[$i]["sourceCode"]=$source["data"][$data[$i]["source"]];
            }else{
                $data[$i]["flag"]=1;
                $data[$i]["err"]="来源渠道校验失败";
                $errs[]=$data[$i];
            }

            if(!empty($data[$i]["status"])){
                if(!empty($status["data"][$data[$i]["status"]])){
                    $data[$i]["statusCode"]=$status["data"][$data[$i]["status"]];
                }else{
                    $data[$i]["flag"]=1;
                    $data[$i]["err"]="客户入驻状态校验失败";
                    $errs[]=$data[$i];
                }
            }

            if(!empty($data[$i]["cstmstatus"])){
//                Log::notice(json_encode($cstmstatus));
                if(!empty($cstmstatus["data"][$data[$i]["cstmstatus"]])){
                    $data[$i]["cstmstatusCode"]=$cstmstatus["data"][$data[$i]["cstmstatus"]];
                }else{
                    $data[$i]["flag"]=1;
                    $data[$i]["err"]="客户状态校验失败";
                    $errs[]=$data[$i];
                }
            }


            if(!empty($type["data"][$data[$i]["type"]])){
                $data[$i]["typeCode"]=$type["data"][$data[$i]["type"]];
            }else{
                $data[$i]["flag"]=1;
                $data[$i]["err"]="客户类型校验失败";
                $errs[]=$data[$i];
            }
        }

//        Log::notice(json_encode($data));
        return ['errs'=>$errs,"data"=>$data];
    }


    /***
     *
     */
    function etprsupload($mode=0)
    {
        $dir = input("dir");
        $dir = empty($dir) ? "/xlsData" : "/" . $dir;
        $rlt = upload($dir,["xlsx"]);
        if(!empty($rlt["data"])){
            $fileId=$rlt["data"];
            $ret= self::uploadEtprsData($fileId,0,$mode);
            $ret["fileId"]=$fileId;
            return $ret;
        }else{
            return $rlt;
        }
    }

    /***
     * @param int $fileId 文件ID
     * @param int $type 0：校验，1：保存
     * @return array
     */
    function uploadEtprsData($fileId=0,$type=0,$mode=0)
    {
        try{
            $filepath=getField("sysFile",array("id"=>$fileId),"savePath");
//            dump($filepath);
//            dump($fileId);
            if(!empty($filepath)){
                $path=ROOT_PATH . 'public' . "/" . $filepath;
                if(file_exists($path)){
                    //从excel文件获取数据
                    $data=xlsData($path,["type",'name',"contact","mobile","source","rqst",'legalname']);
                    $errs=[];
                    $flag=0;//标识是否有错误，如果有错误则不能导入
                    //校验列表中的字典。如果有错误，校验失败，如果没有错误，则继续遍历校验
                    $dictrlt=self::etprsdictVlt($data);
                    if(!empty($dictrlt["errs"])){
                        $errs=$dictrlt["errs"];
                    }else{
                        $data=$dictrlt["data"];
                    }
//                    Log::notice(json_encode($data));
                    //遍历excel中的数据
                    if($mode==0) {
                        $sence = 'Etprs.xls';
                    }else{
                        $sence = 'Etprs.xlscover';
                    }
                    for ($i = 0; $i < count($data); $i++) {
                        //校验每条入驻信息
                        $vld = $this->validate($data[$i],$sence);
                        if ($vld !== true) {
                            $flag=1;
                            $data[$i]['flag']=1;//发生错误
                            $data[$i]["err"]=$vld;
                            $errs[]=$data[$i];
                        }else{
                            //如果校验通过
                            //校验当前房间编号在导入的数据中是否存在
                            $slfvld2=self::checketprsname($data[$i],$data);
                            if($slfvld2 !== true){
                                $flag=1;
                                $data[$i]['flag']=1;//错误
                                $data[$i]["err"]=$slfvld2;
                                $errs[]=$data[$i];
                            }

                        }
                    }
                    if($type==1){
                        //saveEtprsData函数调用，返回可导入数据列表
                        //返回前端提醒修改
                        if(empty($errs)){
                            return array("code" => 1, "msg" =>"校验通过",'data'=>$data);
                        }else{
                            return array("code" => 0, "msg" =>"有未通过的校验",'data'=>$errs,'flag'=>$flag);
                        }
                    }else{
                        //返回前端提醒修改
                        if(empty($errs)){
                            return array("code" => 1, "msg" =>"校验通过",'data'=>[]);
                        }else{
                            return array("code" => 0, "msg" =>"有未通过的校验",'data'=>$errs,'flag'=>$flag);
                        }
                    }
                }else{
                    throw new \think\Exception("文件不存在");
                }
            }else{
                throw new \think\Exception("文件不存在");
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            // 回滚事务
            return array("code" => 0, "msg" =>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     *  将excel数据导入 入驻客户
     * @param int $fileId 文件ID
     * @param string $type 导入方式 0：直接导入。1：先删除旧数据，再导入
     * @return array
     */
    function saveEtprsData($fileId=0,$type='0'){
        //先校验
        $msg=self::uploadEtprsData($fileId,1,$type);
        if($msg['code']==0){
            return array('code'=>'0','msg'=>$msg['msg'],'data'=>[]);
        }
        //删除所有历史数据
        $iqbtId=session("user.iqbtId");
        if($type=="1"){
            //删除本孵化器，入驻状态为：发起入驻后
            $bmsg=deleteByCon("etprs",array("iqbtId"=>$iqbtId,'status'=>['>','6008001']),"导入前先删除历史数据");
//            $bmsg=deleteByCon("etprs",array("iqbtId"=>$iqbtId,'status'=>'6008002'),"导入前先删除历史数据");
            if($bmsg["code"]!=='1'){
                return array('code'=>'0','msg'=>'删除历史数据失败','data'=>[]);
            }
        }
        //再次校验
        $msg=self::uploadEtprsData($fileId,1);
        Log::notice(json_encode($msg));
        if($msg["code"]=='1'){
            //校验通过
            $list=$msg["data"];
            try{
                Db::startTrans();
                for ($i = 0; $i < count($list); $i++) {
                    $tmp=$list[$i];
                    if(!empty(session("user.iqbtId"))){
                        $etprs["iqbtId"]=session("user.iqbtId");
                    }else{
                        throw new \think\Exception("没有孵化器信息，请登录后再尝试");
                    }
                    // 导入客户 需要入驻时间  以及客户来源
                    $etprs['datafrom'] = '6023005';
                    $etprs['entertime'] = time();
                    $etprs["name"]=$tmp["name"];
                    $etprs["type"]=$tmp["typeCode"];
                    $etprs["contact"]=$tmp["contact"];
                    $etprs["mobile"]=$tmp["mobile"];

                    if(!empty($tmp["cstmstatusCode"])){
                        $etprs["cstmstatus"]=$tmp["cstmstatusCode"];
                    }else{
                        $etprs["cstmstatus"]='6002003';
                    }
                    $etprs["source"]=$tmp["sourceCode"];
                    $etprs["rqst"]=$tmp["rqst"];
                    $etprs["legalname"]=$tmp["legalname"];
                    if(!empty($etprs["statusCode"])){
                        $etprs["status"]=$tmp["statusCode"];
                    }else{
                        $etprs["status"]='6008002';
                    }
                    $msg=saveData("etprs",$etprs,"导入客户信息");
                    if($msg["code"]!='1'){
                        throw new \think\Exception($msg["msg"]);
                    }else{
                        // 写入日志:新增客户
                        $logRes = saveLog(6012022,'导入入驻客户',$msg['data'], 'etprs', $msg['data']);
                        if ($logRes['code'] == 0) {
                            throw new \think\Exception("新增-导入入驻客户-操作记录失败:" . $logRes['msg']);
                        }
                        // 写入日志:跟进状态日志
                        $logRes = saveLog(6012040, "招商客户状态变化",$msg['data'], 'etprs', $msg['data'],0,6002003);
                        if ($logRes['code'] == 0) {
                            throw new \think\Exception("新增-招商客户状态变化-操作记录失败:" . $logRes['msg']);
                        }
                        // 写入日志:入驻状态日志
                        $logRes = saveLog(6012041, "入驻客户状态变化",$msg['data'], 'etprs', $msg['data'],0,6008002);
                        if ($logRes['code'] == 0) {
                            throw new \think\Exception("新增-入驻客户状态变化-操作记录失败:" . $logRes['msg']);
                        }
                    }
                }
                //事务提交
                Db::commit();
                saveLog("6012022","成功导入".count($list)."条记录",0,"etprs",0);//导入记录
                return array('code'=>'1','msg'=>'','data'=>[],"count"=>count($list));
            } catch (\Exception $e) {
                //记录事务
                c_Log($e);
                return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
            }
        }else{
            return $msg;
        }
    }



}
