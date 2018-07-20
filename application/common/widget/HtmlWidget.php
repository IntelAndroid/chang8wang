<?php
namespace app\common\Widget;

use Think\Controller;
use think\Log;
/*
 * Thinkphp5的小部件访问的类文件
 */
class HtmlWidget extends Controller {

    function initDictSelect($con,$default="",$order="id",$firstOption=false,$firstValue="")
    {
        $optHtml="";
        $table="SysDict";
        $field="code,name";
        $con=self::parseCon($con);
        if(!empty(session("iqbtId"))){
            $con["concat(',',exceptIqbt,',')"]=array("notlike",'%,'.session("iqbtId").',%');
        }
        $msg=gethashmap($table,$con,$field,$order);
        if($firstOption){
            $optHtml="<option value='".$firstValue."'>".$firstValue."</option>";
        }

        if($msg["code"]==='1'&&!empty($msg["data"])){
            foreach ($msg["data"] as $code => $name) {
                $optHtml.="<option value='$code' ".($default==$code?'selected':'').">$name</option>";
            }
        }
        return $optHtml;
    }

    function initBuildFloor($isBuild='',$bd='')
    {
        $optHtml="";
        $list = model('Etprs')->getBuilds();
        $build = $list['build'];
        foreach ($build as $v){
            $optHtml.="<option value='$v[1]' ".($bd==$v[1]?'selected':'').">$v[0]</option>";
        }
        $floorHtml="";
        $floor = $list['floor'];
        foreach ($floor as $v){
            $floorHtml.="<option value='$v' ".($bd==$v?'selected':'').">$v</option>";
        }
        if(!empty($isBuild)){
            return $optHtml;
        }
        if(!empty($isFloor)){
            return $floorHtml;
            $optHtml.="<option value='$v' ".($default==$v?'selected':'').">$v</option>";
        }
        return $optHtml;
    }

    function initDictRedio($iptname,$con=array(),$default="",$order="code")
    {
        $optHtml="";
        $table="SysDict";
        $field="code,name";
        $con=self::parseCon($con);
        if(!empty(session("iqbtId"))){
            $con["concat(',',exceptIqbt,',')"]=array("notlike",'%,'.session("iqbtId").',%');
        }
        $msg=gethashmap($table,$con,$field,$order);
        if($msg["code"]==='1'&&!empty($msg["data"])){
            $i=0;
            foreach ($msg["data"] as $code => $name) {
                $optHtml.='<div class="radio-custom radio-primary radio-inline"><input type="radio" id="'.$iptname.$i.'" value="'.$code.'" name="'.$iptname.'" '.($default==$code?"checked":"").'><label for="'.$iptname.$i.'">'.$name.'</label></div>';
                $i++;
            }
        }
        return $optHtml;
    }

    function initDictCheckbox($iptname,$con=array(),$default="",$order="code")
    {
        $optHtml="";
        $table="SysDict";
        $field="code,name";
        $con=self::parseCon($con);
        if(!empty(session("iqbtId"))){
            $con["concat(',',exceptIqbt,',')"]=array("notlike",'%,'.session("iqbtId").',%');
        }
        $msg=gethashmap($table,$con,$field,$order);
        if($msg["code"]==='1'&&!empty($msg["data"])){
            $i=0;
            foreach ($msg["data"] as $code => $name) {
                $optHtml.='<div class="checkbox checkbox-success checkbox-inline"><input type="checkbox" id="'.$iptname.$i.'" value="'.$code.'" name="'.$iptname.'" '.(in_array($code,explode(",",$default))?'checked':'').'><label for="'.$iptname.$i.'"> '.$name.' </label></div>';
                $i++;
            }
        }
        return $optHtml;
    }
    function initCommonSelect($table,$con=array(),$default="",$field="id,name",$order="id")
    {
        $con=self::parseCon($con);
        $optHtml="";
        $msg=gethashmap($table,$con,$field,$order);
//        Log::notice(json_encode($msg["data"]));
        if($msg["code"]==='1'&&!empty($msg["data"])){
            foreach ($msg["data"] as $code => $name) {
                $optHtml.="<option value='$code' ".($default==$code?'selected':'').">$name</option>";
            }
        }
        return $optHtml;
    }
    function initCommonSelect1($table,$con=array(),$default="",$field="id,name,mobile",$order="id")
    {
        $con=self::parseCon($con);
        $optHtml="";
        $msg=getDataList($table,$con,$field,$order);
//        Log::notice(json_encode($msg["data"]));
        if($msg["code"]==='1'&&!empty($msg["data"])){
            foreach ($msg["data"] as $k => $v) {
                $optHtml.="<option value='".$v['name']."' ".($default==$v['name']?'selected':'').">".$v['name']."</option>";
            }
        }
        return $optHtml;
    }
    function initCommonCheckbox($iptname,$table,$con=array(),$default="",$field="id,name",$order="id")
    {
        $con=self::parseCon($con);
        $optHtml="";
        $msg=gethashmap($table,$con,$field,$order);
        if($msg["code"]==='1'&&!empty($msg["data"])){
            $i=0;
            foreach ($msg["data"] as $code => $name) {
                $optHtml.='<div class="checkbox checkbox-success checkbox-inline"><input type="checkbox" id="'.$iptname.$i.'" value="'.$code.'" name="'.$iptname.'" '.(in_array($code,explode(",",$default))?'checked':'').'><label for="'.$iptname.$i.'"> '.$name.' </label></div>';
                $i++;
            }
        }
        return $optHtml;
    }
    function initStaticCheckbox($iptname,$table,$con=array(),$default="",$field="id,name",$order="id")
    {
        $con=self::parseCon($con);
        $optHtml="";
        $msg=gethashmap($table,$con,$field,$order);
        if($msg["code"]==='1'&&!empty($msg["data"])){
            $i=0;
            foreach ($msg["data"] as $code => $name) {
                $optHtml.='<div class="checkbox checkbox-success checkbox-inline"><input type="checkbox" txt="'.$name.'" id="'.$iptname.$i.'" value="'.$code.'" name="'.$iptname.'" '.(in_array($code,explode(",",$default))?'checked':'').'><label for="'.$iptname.$i.'"> '.$name.' </label></div>';
                $i++;
            }
        }
        return $optHtml;
    }
    function parseCon($con)
    {
        $where =array();
        foreach($con as $k=>$v){
            if(is_array($v)){
                $v[0]=trim($v[0]);
                $where[$k]=$v;
            }else{
                $where[$k]=$v;
            }
        }
        return $where;
    }

    function initEtprsSelect($con)
    {
        $id=session("userId");
        $user=array();
        $umsg=findById("user",array("id"=>$id),"id,etprsId");
        if($umsg["code"]==='1'){
            $user=$umsg["data"];
        }
        $optHtml="";

        if(!empty($user)){
            $table='enterprise';
            $field="id,name";
            $order="id";
            $con=self::parseCon($con);

            //return var_dump($con);
            if(!isset($con["status"])||empty($con["status"])){
                $con["status"]="1001015";
            }
            if(!empty($user["etprsId"])){
                $con["id"]=array("in",$user["etprsId"]);
            }
            $msg=gethashmap($table,$con,$field,$order);
            if($msg["code"]==='1'&&!empty($msg["data"])){
                foreach ($msg["data"] as $code => $name) {
                    $optHtml.="<option value='$code'>$name</option>";
                }
            }
        }
        return $optHtml;
    }

    function initaplDictCheckbox($iptname,$con=array(),$default="",$order="code")
    {
        $optHtml="";
        $table="SysDict";
        $field="code,name";
        $con=self::parseCon($con);
        if(!empty(session("iqbtId"))){
            $con["concat(',',exceptIqbt,',')"]=array("notlike",'%,'.session("iqbtId").',%');
        }
        $msg=gethashmap($table,$con,$field,$order);
        if($msg["code"]==='1'&&!empty($msg["data"])){
            $i=0;
            foreach ($msg["data"] as $code => $name) {
                $optHtml.='<label><input type="checkbox" id="'.$iptname.$i.'" value="'.$code.'" name="'.$iptname.'" '.(in_array($code,explode(",",$default))?'checked':'').'><span> '.$name.' </span></label>&nbsp;&nbsp;&nbsp;';
                $i++;
            }
        }
        return $optHtml;
    }

    function initAplDictRedio($iptname,$con=array(),$default="",$order="code")
    {
        $optHtml="";
        $table="SysDict";
        $field="code,name";
        $con=self::parseCon($con);
        if(!empty(session("iqbtId"))){
            $con["concat(',',exceptIqbt,',')"]=array("notlike",'%,'.session("iqbtId").',%');
        }
        $msg=gethashmap($table,$con,$field,$order);
        if($msg["code"]==='1'&&!empty($msg["data"])){
            $i=0;
            foreach ($msg["data"] as $code => $name) {
                $optHtml.='<label><input type="radio" value="'.$code.'" name="'.$iptname.'" '.($default==$code?"checked":"").'><p>'.$name.'</p></label>';
                $i++;
            }
        }
        return $optHtml;
    }

    function initBuilds($con=array(),$default="",$field="id,name",$order="id")
    {
        $con=self::parseCon($con);
        $optHtml="";
//        $msg=gethashmap("estateBuilding",$con,$field,$order);
        $msg=getDataList("estateBuilding",array(),"a.id,a.name,b.name as iqbt","b.id",[['incubator b','a.iqbtId=b.id']]);
        Log::notice(json_encode($msg["data"]));
        if($msg["code"]==='1'&&!empty($msg["data"])){
            foreach ($msg["data"] as $code => $name) {

            }
            for ($i = 0; $i < count($msg["data"]); $i++) {
                $sel='';
                if($msg["data"][$i]["id"]==$default){
                    $sel="selected";
                }
                $optHtml.="<option value='".$msg["data"][$i]["id"]."' ".$sel.">".$msg["data"][$i]["iqbt"]."--".$msg["data"][$i]["name"]."</option>";
            }
        }
        return $optHtml;
    }
    //获取默认楼层
    function initFloor($isBuild='',$isFloor='',$bd='',$fd='')
    {
        $optHtml="";
        $list =getDataList('build');
        $build = $list['build'];
        $floorHtml="";
        $floor = $list['floor'];
        foreach ($floor as $v){
            $floorHtml.="<option value='$v' ".($bd==$v?'selected':'').">$v</option>";
        }
        if(!empty($isBuild)){
            return $optHtml;
        }
        if(!empty($isFloor)){
            return $floorHtml;
        }
    }
}