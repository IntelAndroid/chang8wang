<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/6
 * Time: 11:53
 */
namespace app\iqbt\controller;
use think\Controller;
use think\Db;
use app\common\controller\Common;
use app\wechat\controller\User;
use think\image\Exception;
use think\Log;
//header("Access-Control-Allow-Origin: *");
class Iqbt extends Common{

    public function _initialize()
    {
        parent::_initialize();
//        if(empty(session("userId"))){
//            session("userId",3);
//            session('user',['etprsId'=>3]);
//            session('iqbtId',1);
//        }
        $this->userId=session("userId");
        //nav
        $this->assign("nav",'iqbt');
    }
    /*
    * 获取场地列表
    */
    public function getIqbtList($con=[])
    {
        $join = [['sysFile b', 'a.poster=b.id and b.isDelete=0', 'left'], ['sysFile c', 'a.logo=c.id  and c.isDelete=0', 'left'], ['sysDict d', 'a.type=d.code and d.isDelete=0', 'left'], ['sysFile e', 'a.busneslic=e.id  and e.isDelete=0', 'left']];
        try {
            $con['status'] = ['in', ['6026009','6026012']];//只查认证的,'status'=>
            $totalrecord = getRecordNum('incubator', $con);//数据总数
            $list = getDataList('incubator', $con, 'a.id,a.status,a.name,a.workstyle,a.poster as posterId,b.savePath as poster,a.display', '', $join);//空间数据
//            dump($list);
            if ($list['code'] != 1) {
                throw new \think\Exception("获取场地列表失败:" . $list['msg']);
            }
            $data = $list['data'];
            //空间状态
            if (!empty($data)) {
                foreach ($data as $k => $v) {
                    switch ($v['status']) {
                        case"1":
                            $data[$k]['status'] = "已认证";
                            break;
                    }
                    //room表查房间信息
                    $roomnum = getField('room', ['iqbtId' => $data[$k]['id'], 'type' => 6011001], 'count(id) as roomnum');
                    $unitnum = getField('room', ['iqbtId' => $data[$k]['id'], 'type' => 6011002], 'count(id) as unitnum');
                    $list['data'] = $data;
                    if (!empty($roomnum) && !empty($unitnum)) {
                        $roomInfo = '办公室：' . $roomnum . '间；工位：' . $unitnum . '个';
                    } else if (!empty($roomnum)) {
                        $roomInfo = '办公室：' . $roomnum . '间';
                    } else if (!empty($unitnum)) {
                        $roomInfo = '工位：' . $unitnum . '个';
                    } else {
                        $roomInfo = '';
                    }
                    $data[$k]['roomInfo'] = $roomInfo;
                    //封面图片
//                    dump($data[$k]['poster']);
                    $data[$k]['poster'] = is_file(ROOT_PATH . "/public" . $v['poster']) ? $v['poster'] : null;
                }
                $list['data'] = $data;
            }
//            dump($list['data']);
            $tmplist = $this->getDictStr('*', 'Incubator');
            $list['data'] = $this->setListIdText($list['data'], $tmplist);
            return array('total' => $totalrecord, 'rows' => $list['data']);
        } catch (\Exception $e) {
            return array('total' => 0, 'rows' => [], 'msg' => $e->getMessage());
        }
    }

    /***
     *
     */
    function auditiqbt($id=0,$status='')
    {
        //事务开始
        Db::startTrans();
        try {
            if(empty($status)){
                throw new \think\Exception("参数错误");
            }
            $msg=saveDataByCon("incubator",array("status"=>$status,'validTime'=>strtotime("+7 day",strtotime(date("Y-m-d",time())))-1),array("id"=>$id));;
            if($msg["code"]==='0'){
                throw new \think\Exception("审核失败");
            }
            $rlt=saveDataByCon("user",array("status"=>'6018001'),array("iqbtId"=>$id));
            if($rlt["code"]==='0'){
                throw new \think\Exception("审核失败");
            }

            Db::commit();
            return $msg;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return json(array('code' => '0', 'msg' => $e->getMessage(), 'data' => []));
        }
    }

    /***
     *
     */
    function initSale()
    {
        try {
            $roles=getFieldArrry("userRole",array("id|parentId"=>1),"id");
//            Log::notice(json_encode($roles));
            if(!empty($roles)){
                 $msg=getDataList("user",array("roleId"=>['in',$roles]),"id,realname");
                return $msg["data"];
            }else{
                return json(array('code' => '1', 'msg' =>"", 'data' => []));
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return json(array('code' => '0', 'msg' => $e->getMessage(), 'data' => []));
        }
    }

    /*
     *空间详情
     */
    public function getIqbtInfo($id=0){
        try{
            $join=[['sysFile b','a.poster=b.id and b.isDelete=0','left'],['sysFile c','a.logo=c.id  and c.isDelete=0','left'],['sysFile e','a.busneslic=e.id  and e.isDelete=0','left']];
            $field='a.from,a.company,a.id,a.status,a.type,a.name,a.address,a.poster as posterId,a.logo as logoId,a.display,a.busneslic as huserheader,a.mobile,a.contact,a.email,a.districtId,a.services,a.facility,a.type,a.workstyle,a.rgstspt,a.isfundtion,a.fundtion,a.policy,a.policyspt,a.detail,a.require,a.credit,a.lealperson,b.savePath as poster,c.savePath as logo,e.fileName as busneslic,e.id as buslic';
            //场地数据
            $list = findById('incubator', ['a.id' => $id],$field, '', $join);
            $list['data']['buslic']=$list['data']['buslic'].','.$list['data']['busneslic'];
            if($list['code']!=1){
                throw new \think\Exception("获取场地详情失败:".$list['msg']);
            }
            //获取字典名称
            $templist=$this->getDictStr('*','Incubator');
            $list['data']=$this->setObjIdText($list['data'],$templist);
            //将数据中的null替换为 ''
            if(!empty($list['data'])) {
                foreach ($list['data'] as $k => $v) {
                    if ($v == null) {
                        $list['data'][$k] = '';
                    }
                }
                //场地状态
                switch ($list['data']['status']) {
                    case"6026003":
                        $list['data']['iqbtstatus'] = "未认领";
                        break;
                    case"6026006":
                        $list['data']['iqbtstatus'] = "待审核";
                        break;
                    case"6026009":
                        $list['data']['iqbtstatus'] = "试用";
                        break;
                    case"6026012":
                        $list['data']['iqbtstatus'] = "正式";
                        break;
                    case"6026015":
                        $list['data']['iqbtstatus'] = "已退出";
                        break;
                    default:
                        $list['data']['iqbtstatus'] = "";
                        break;
                }
                //空间类型 待初始化
                $list['data']['iqbttype'] = $list['data']['type'];
                //所在地区
                if (!empty($list['data']['districtId'])) {//如果地址不为空
                    $cityArr=getDataList('region',['a.id' => ['in',[substr($list['data']['districtId'], 0, 2),substr($list['data']['districtId'], 0, 4),$list['data']['districtId']]]],'name');
                    if($cityArr['code']!=1){
                        throw new \think\Exception("获取地址名称失败:".$cityArr['msg']);
                    }
                    $citystr=$cityArr['data'];
                    $list['data']['districtCode'] = $list['data']['districtId'];//input hidden填充
                    $list['data']['districtId'] = $citystr[0]['name'] . '/' . $citystr[1]['name'] . '/' . $citystr[2]['name'];
                }
                //封面和logo文件 是否存在
                if (!is_file(ROOT_PATH."/public" . $list['data']['poster'])) {
                    $list['data']['poster'] = '';
                }
                if (!is_file(ROOT_PATH."/public" . $list['data']['logo'])) {
                    $list['data']['logo'] = '';
                }
                $list['data']['facilityCheck'] = $list['data']['facility'];//初始化更多配套设施图片
                $list['data']['servicesCheck'] = $list['data']['services'];//初始化提供服务
                $list['data']['facilityChecks'] = $list['data']['facility'];//初始化配套设施复选框
                //是否提供注册 待渲染
                $list['data']['rgstsptRadio'] = $list['data']['rgstspt'];
                //基金
                $list['data']['isfundtion'] = empty($list['data']['isfundtion']) ? '' : $list['data']['fundtion'];
                $list['data']['isfundtionname'] = empty($list['data']['isfundtion']) ? '无基金' : $list['data']['fundtion'];
                //政策
                $list['data']['policyspt'] = empty($list['data']['policyspt']) ? '' : $list['data']['policy'];
                $list['data']['policysptname'] = empty($list['data']['policyspt']) ? '无政策支持' : $list['data']['policy'];
                $join = [['sysFile g', 'g.id=a.fileId and g.isDelete=0', 'left'], ['sysDict b', 'b.code=a.code', 'left']];//不能+isDelete=0;查不出外景/前台/独立办公
                //图片
                $imgorder='field(a.code,6005015,6005016,6005017,6005018,6005001,6005002,6005003,6005004,6005005,6005006,6005007,6005008,6005009,6005010)';
                $img = getDataList('iqbtImg', ['a.iqbtId' => $id], 'a.id,a.code,g.savePath,g.filename,b.name', $imgorder, $join);
                if($img['code']!=1){
//                            throw new \think\Exception("获取环境图片失败:".$img['msg']);//没获取到图片,依然需要取出空间不能抛出
                }
                $imgDiv = [];
                if (!empty($img['data'])) {
                    foreach ($img['data'] as $k => $v) {
                        if (!is_file(ROOT_PATH."/public" . $v['savePath'])) {//检测图片是否存在
                            $img['data'][$k]['savePath'] = '';
                        }
                        if (!in_array($v['code'], $imgDiv)) {//选中的配套div
                            $imgDiv[] = $v['code'];
                        }
                    }
                    $imgDiv = implode(',', $imgDiv);
                    $list['data']['img'] = $img['data'];
                }
                $list['data']['imgDiv'] = $imgDiv;
            }
            return $list;
        }catch(\Exception $e){
            return array('total'=>0,'rows'=>[],'msg'=>$e->getMessage());
        }
    }

    /***
     *
     */
    function initIqbtInfo($iqbtId=0){
        try {
            $msg=findById("incubator",array("id"=>$iqbtId),"status,name,contact,mobile,districtId,address,company,from,type as iqbttype");
            if(!empty($msg['data'])){
                $districtId=$msg["data"]["districtId"];
                if(!empty($districtId)){
                    $cityArr=getDataList('region',['a.id' => ['in',[substr($districtId, 0, 2),substr($districtId, 0, 4),$districtId]]],'name');
                    Log::notice(json_encode($cityArr));
                    if($cityArr['code']!=1){
                        throw new \think\Exception("获取地址名称失败:".$cityArr['msg']);
                    }
                    $citystr=$cityArr['data'];
                    $msg["data"]['districtCode'] = $msg["data"]['districtId'];
                    if(!empty($citystr[0]['name'])){
                        $msg["data"]['districtId'] = $citystr[0]['name'];
                    }
                    if(!empty($citystr[1]['name'])){
                        $msg["data"]['districtId'] .='/' . $citystr[1]['name'];
                    }
                    if(!empty($citystr[2]['name'])){
                        $msg["data"]['districtId'] .='/' . $citystr[2]['name'];
                    }
                }else{
                    $msg["data"]['districtCode'] = $msg["data"]['districtId'];
                    $msg["data"]['from'] = "6025004";
                    $msg["data"]['iqbttype'] = "6004001";
                }

            }else{
                throw new \think\Exception("获取信息失败");
            }
            $rlt=findById("user",array("id"=>session("userId")),"qr_img");
            if(!empty($rlt["data"]["qr_img"])){
                $msg["data"]["qr_img"]=$rlt["data"]["qr_img"];
            }else{
                $msg["data"]["qr_img"]="";
            }
            return $msg;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return json(array('code' => '0', 'msg' => $e->getMessage(), 'data' => []));
        }
    }

    /*
     * 孵化器管理员 孵化器列表 6019001
     */
    public function getMyIqbtList(){
        $con=['a.id' => ['in', session('iqbtId')]];
        $data=$this->getIqbtList($con);
        return $data;
    }

    /***
     *
     */
    function getIqbts2($status=1)
    {
        try {
            $userId=session("userId");
            $roleId=session("user.roleId");
            $con='1=1 ';
            $order="";
            if($status==1){
                $con.=" and a.status='6026006'";
                if($roleId==1){
                    $con.=" and (a.saleId=0 or a.saleId=".$userId.")";
                }else{
                    $con.=" and a.saleId=".$userId;
                }
                $order="a.addtime desc";
            }else if($status==2){
                $con.=" and a.status in ('6026009','6026012') and a.saleId=".$userId." and (a.validTime>".time()." or a.validTime=0)";

                $order="a.validTime desc";
            }else if($status==3){
                $con.=" and a.status in ('6026009','6026012') and a.saleId=".$userId." and a.validTime<".time()." and  a.validTime>0)";
            }else{
                $con.=" and 2!=2";
                $order="a.addtime desc";
            }
            $join = [['user b', 'a.saleId=b.id and b.isDelete=0', 'left'],['iqbt_pactlog c', 'a.id=c.iqbtId and c.isDelete=0 and c.pact_start<unix_timestamp(now()) and c.pact_end>unix_timestamp(now())', 'left']];
            $msg=getDataList("incubator",$con,"a.*,b.realname,c.total,c.pact_end,c.pact_start",$order,$join);
            if($msg["code"]==='1'){
                $tmplist = $this->getDictStr('*', 'Incubator');
                $msg['data'] = $this->setListIdText($msg['data'], $tmplist);
                for ($i = 0; $i < count($msg['data']); $i++) {
                    if (!empty($msg['data'][$i]['districtId'])) {//如果地址不为空
                        $cityArr=getDataList('region',['a.id' => ['in',[substr($msg['data'][$i]['districtId'], 0, 2),substr($msg['data'][$i]['districtId'], 0, 4),$msg['data'][$i]['districtId']]]],'name');

                        if($cityArr['code']!=1){
                            throw new \think\Exception("获取地址名称失败:".$cityArr['msg']);
                        }
                        $citystr=$cityArr['data'];
                        $citys="";
                        //$citystr=$citystr[0]['name'].'/'.$citystr[1]['name'].'/'.$citystr[2]['name'];//拼接省市区地址
                        if(!empty($citystr[0]['name'])){
                            $citys = $citystr[0]['name'];
                        }
                        if(!empty($citystr[1]['name'])){
                            $citys .='/' . $citystr[1]['name'];
                        }
                        if(!empty($citystr[2]['name'])){
                            $citys .='/' . $citystr[2]['name'];
                        }
//                    $actList['data'][$k]['districtCode'] = $v['districtId'];//input hidden填充 code
                        $msg['data'][$i]['districtId'] = $citys;//省市区地址
//                    $actList['data'][$k]['addressStr'] =$citystr. '/' .$v['address'];//完整地址
                    }else{
                        $msg['data'][$i]['districtId'] ="";
                    }
                    $msg['data'][$i]['addtime']=date("Y-m-d",$msg['data'][$i]['addtime']);
                    $msg['data'][$i]['total']=$msg['data'][$i]['total']*100/100;
                    if(!empty($msg['data'][$i]['pact_end'])){
                        $msg['data'][$i]['pact_end']=date("Y-m-d",$msg['data'][$i]['pact_end']);
                    }else{
                        ///如果是试用，则开始时间为添加时间，结束时间为到期时间
                        if(in_array($msg['data'][$i]['status'],['6026009','6026012'])){
                            if(!empty($msg['data'][$i]['validTime'])){
                                $msg['data'][$i]['pact_end']=date("Y-m-d",$msg['data'][$i]['validTime']);
                            }else{
                                $msg['data'][$i]['pact_end']="永久有效";
                            }

                        }
                    }
                    if(!empty($msg['data'][$i]['pact_start'])){
                        $msg['data'][$i]['pact_start']=date("Y-m-d",$msg['data'][$i]['pact_start']);
                    }else{
                        if(in_array($msg['data'][$i]['status'],['6026009','6026012'])){
                            $msg['data'][$i]['pact_start']=$msg['data'][$i]['addtime'];
                        }
                    }
                }
                return $msg["data"];
            }else{
                return [];
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return [];
        }
    }
    function getIqbts($status=1)
    {
        try {
            $userId=session("userId");
            $roleId=session("user.roleId");
            $con='1=1 ';
            $order="";
            if($status==1){
                $con.=" and a.status='6026006'";
                if($roleId==1){
                    $con.=" and (a.saleId=0 or a.saleId=".$userId.")";
                }else{
                    $con.=" and a.saleId=".$userId;
                }
                $order="a.addtime desc";
            }else if($status==2){
                $con.=" and a.status in ('6026009','6026012') and a.saleId=".$userId." and (a.validTime>".time()." or a.validTime=0)";

                $order="a.validTime desc";
            }else if($status==3){
                $con.=" and a.status in ('6026009','6026012') and a.saleId=".$userId." and a.validTime<".time()." and  a.validTime>0";
            }else{
                $con.=" and 2!=2";
                $order="a.addtime desc";
            }
            $join = [['user b', 'a.saleId=b.id and b.isDelete=0', 'left'],['iqbt_pactlog c', 'a.id=c.iqbtId and c.isDelete=0 and c.pact_start<unix_timestamp(now()) and c.pact_end>unix_timestamp(now())', 'left']];
            $msg=getDataList("incubator",$con,"a.*,b.realname,c.total,c.pact_end,c.pact_start",$order,$join);
            /*$msg2=getDataList2("incubator",$con,"a.*,b.realname,c.total,c.pact_end,c.pact_start",$order,$join);
            Log::notice(json_encode($msg2));*/
            Log::notice(json_encode($msg));
            if($msg["code"]==='1'){
                $tmplist = $this->getDictStr('*', 'Incubator');
                $msg['data'] = $this->setListIdText($msg['data'], $tmplist);
                for ($i = 0; $i < count($msg['data']); $i++) {
                    if (!empty($msg['data'][$i]['districtId'])) {//如果地址不为空
                        $cityArr=getDataList('region',['a.id' => ['in',[substr($msg['data'][$i]['districtId'], 0, 2),substr($msg['data'][$i]['districtId'], 0, 4),$msg['data'][$i]['districtId']]]],'name');

                        if($cityArr['code']!=1){
                            throw new \think\Exception("获取地址名称失败:".$cityArr['msg']);
                        }
                        $citystr=$cityArr['data'];
                        //$citystr=$citystr[0]['name'].'/'.$citystr[1]['name'].'/'.$citystr[2]['name'];//拼接省市区地址
                        $citys=[];
                        if(!empty($citystr[0]['name'])){
                            $citys = $citystr[0]['name'];
                        }
                        if(!empty($citystr[1]['name'])){
                            $citys .='/' . $citystr[1]['name'];
                        }
                        if(!empty($citystr[2]['name'])){
                            $citys .='/' . $citystr[2]['name'];
                        }
//                    $actList['data'][$k]['districtCode'] = $v['districtId'];//input hidden填充 code
                        $msg['data'][$i]['districtId'] = $citys;//省市区地址
//                    $actList['data'][$k]['addressStr'] =$citystr. '/' .$v['address'];//完整地址
                    }else{
                        $msg['data'][$i]['districtId'] ="";
                    }
                    $msg['data'][$i]['addtime']=date("Y-m-d",$msg['data'][$i]['addtime']);
                    $msg['data'][$i]['total']=$msg['data'][$i]['total']*100/100;
                    if(!empty($msg['data'][$i]['pact_end'])){
                        $msg['data'][$i]['pact_end']=date("Y-m-d",$msg['data'][$i]['pact_end']);
                    }else{
                        ///如果是试用，则开始时间为添加时间，结束时间为到期时间
                        if(in_array($msg['data'][$i]['status'],['6026009','6026012'])){
                            if(!empty($msg['data'][$i]['validTime'])){
                                $msg['data'][$i]['pact_end']=date("Y-m-d",$msg['data'][$i]['validTime']);
                            }else{
                                $msg['data'][$i]['pact_end']="永久有效";
                            }

                        }
                    }
                    if(!empty($msg['data'][$i]['pact_start'])){
                        $msg['data'][$i]['pact_start']=date("Y-m-d",$msg['data'][$i]['pact_start']);
                    }else{
                        if(in_array($msg['data'][$i]['status'],['6026009','6026012'])){
                            $msg['data'][$i]['pact_start']=$msg['data'][$i]['addtime'];
                        }
                    }
                }
                return $msg["data"];
            }else{
                return [];
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return [];
        }
    }

    /***
     *
     */
    function dstbiqbtSale($saleId=0,$iqbtId=0)
    {
        try {
            $msg=saveDataByCon("incubator",array("saleId"=>$saleId),array("id"=>$iqbtId));
            if($msg["code"]==='0'){
                throw new \think\Exception("分配失败");
            }else{
                return $msg;
            }
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return json(array('code' => '0', 'msg' => $e->getMessage(), 'data' => []));
        }
    }

    /***
     *
     */
    function initRenew($iqbtId='')
    {
        try {
            $msg=findById("incubator",array("a.id"=>$iqbtId),"a.id as iqbtId,a.saleId,a.validTime,b.pact_end","b.pact_end desc",[['iqbt_pactlog b',"b.iqbtId=a.id","left"]]);
//            Log::notice(json_encode($msg["data"]));
            if(empty($msg['data'])){
                throw new \think\Exception("没有对应孵化器");
            }
            if(empty($msg["data"]['pact_end'])){
                $msg["data"]['pact_start']=$msg["data"]['validTime'];
            }else{
                $msg["data"]['pact_start']=$msg["data"]['pact_end'];
            }
            if(empty($msg["data"]['pact_start'])){
                $msg["data"]['pact_start']=strtotime(date("Y-m-d",time()));
            }
            if(!empty($msg["data"]['pact_start'])){
                $msg["data"]['pact_start']=date("Y-m-d",$msg["data"]['pact_start']+1);
            }

            $roles=getFieldArrry("userRole",array("id|parentId"=>1),"id");
            if(!empty($roles)){
                $msg2=getDataList("user",array("roleId"=>['in',$roles]),"id,realname");
                $msg["data"]["sale"]=$msg2["data"];
            }else{
                $msg["data"]["sale"]=[];
            }
            return $msg;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return json(array('code' => '0', 'msg' => $e->getMessage(), 'data' => []));
        }
    }

    /***
     *
     */
    function savepact()
    {
        //事务开始
        Db::startTrans();
        try {
            $data=input("request.");
//            Log::notice(json_encode($data));
            $iqbtId=$data["iqbtId"];
            if(empty($iqbtId)){
                throw new \think\Exception("参数错误");
            }
            $rlt=saveDataByCon("incubator",array("saleId"=>$data["saleId"],'status'=>'6026012'),array("id"=>$iqbtId));
            if($rlt["code"]==='0'){
                throw new \think\Exception("操作失败");
            }
            $pact=array(
                "pact_start"=>strtotime($data["pact_start"]),
                "pact_end"=>strtotime($data["pact_end"])+86400-1,
                "name"=>$data["name"],
                "total"=>$data["total"],
                "saleId"=>$data["saleId"],
                "iqbtId"=>$data["iqbtId"]
            );
            $vlt=$this->validate($data,'IqbtPact.add');
            if($vlt===true){
                if($pact["pact_end"]<=$pact["pact_start"]){
                    throw new \think\Exception("合同结束时间必须大于开始时间");
                }
                if(empty($iqbtId)){
                    throw new \think\Exception("参数错误");
                }
                $msg=saveData("iqbtPactlog",$pact);
                if($msg["code"]==='0'){
                    throw new \think\Exception("操作失败");
                }
            }else{
                throw new \think\Exception($vlt);
            }


            Db::commit();
            return $msg;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            Db::rollback();
            return json(array('code' => '0', 'msg' => $e->getMessage(), 'data' => []));
        }
    }

    /***
     *
     */
    function getIqbtPacts($iqbtId=0)
    {
        try {
            if(empty($iqbtId)){
                throw new \think\Exception("参数错误");
            }
            $msg=getDataList("iqbtPactlog",array("a.iqbtId"=>$iqbtId),"a.*,b.realname","a.pact_end desc",[["user b",'b.id=a.saleId',"left"]]);

            if($msg["code"]==='0'){
                throw new \think\Exception($msg["msg"]);
            }
            for ($i = 0; $i < count($msg["data"]); $i++) {
                $msg["data"][$i]["pact_start"]=date("Y-m-d H:i",$msg["data"][$i]["pact_start"]);
                $msg["data"][$i]["pact_end"]=date("Y-m-d H:i",$msg["data"][$i]["pact_end"]);
                $msg["data"][$i]["total"]=$msg["data"][$i]["total"]*100/100;
            }
            return $msg["data"];
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            //Db::rollback();
            return json(array());
        }
    }

    /*
     * 系统管理员 孵化器列表 6019004
     */
    public function getAddIqbtList(){
        $con=['a.adduserId' => session('userId')];
        $data=$this->getIqbtList($con);
        return $data;
    }




	
	/**
	 * 企业端 我的入驻  企业 6019002
	 */
	public function getMyIqbt()
	{
		$join = [['sysFile b', 'a.poster=b.id and b.isDelete=0', 'left']];
		try {
			$con = ['a.id' => session('iqbtId')];
//			$con['status'] = 1;//只查认证的
			//            $totalrecord=getRecordNum('incubator', $con);
			$list = getDataList('incubator', $con, 'a.id,a.name,a.contact,a.mobile,b.savePath as poster', '', $join);
			if ($list['code'] != 1) {
				throw new \think\Exception("获取我的场地失败:" . $list['msg']);
			}
			//检测图片是否存在
			$list['data'][0]['poster']=is_file(ROOT_PATH."/public" .$list['data'][0]['poster'])?$list['data'][0]['poster']:'';
			//获取入驻状态和合同时间
			$join=[['etprsPactlog b','b.etprsId=a.id and b.isDelete=0','left'],['sysFile c','c.id=b.pact and c.isDelete=0','left']];
			$etprs=findById('etprs', ['a.id'=>session('user.etprsId')], 'a.id as etprsId,a.name as etprsName,a.status,b.pactNo,b.pact,b.pact_start,b.pact_end,c.fileName,c.savePath', '', $join);
			//            dump(session('user'));
//			            dump($etprs);
			if($etprs['code']!=1){
				throw new \think\Exception("获取入驻状态,合同信息失败:" . $etprs['msg']);
			}
			//如果是正式入驻
			if ($etprs['data']['status'] == '6008005') {
				// 获取已经分配的房间
				$roomList = getDataList('room', ['etprsId' => session('user.etprsId')], 'a.id,a.roomNo,b.name as buildName', 'a.addtime', [['build b', 'a.buildId=b.id', 'left']]);
				if($roomList['code']==0){
					throw new \think\Exception($roomList['msg']);
				}
				foreach ($roomList['data'] as $k2 => $v2) {
					$roomInfo['data'][] = $v2['buildName'] . ' - ' . $v2['roomNo'];
				}
				$list['data'][0]['roomInfo'] = $roomInfo['data'];
			}
			//获取字典名称
			$templist=$this->getDictStr('*','Etprs');
			$etprs['data']=$this->setObjIdText($etprs['data'],$templist);
			$list['data'][0]['statusText']=$etprs['data']['statusText'];
			$list['data'][0]['etprsId']=$etprs['data']['etprsId'];
			$list['data'][0]['pact']=$etprs['data']['pact'];
			$list['data'][0]['pactNo']=$etprs['data']['pactNo'];
			$list['data'][0]['fileName']=$etprs['data']['fileName']?$etprs['data']['fileName']:'';//文件名
			$list['data'][0]['etprsName']=$etprs['data']['etprsName'];
			$list['data'][0]['starttime']=$etprs['data']['pact_start']?date('Y-m-d',$etprs['data']['pact_start']):'';
			$list['data'][0]['endtime']=$etprs['data']['pact_end']?date('Y-m-d',$etprs['data']['pact_end']):'';
			return json(array('total' => 1, 'rows' => $list['data']));
		} catch (\Exception $e) {
			return json(array('code' => 0, 'msg' => $e->getMessage()));
		}
	}
	
	
	/*
	 * 孵化案例表格
	 * @param $caseId 新增空间时,新增case 后穿过一个案例id拼接的字符串
	 */
	public function iqbtCase($id=0,$caseId=0){
		//        $a='a';
		//        $b='b';
		//        $b=&$a;
		//        d
		//        dump($b);
		try {
			$join = [['sysFile b', 'a.logo=b.id', 'left']];
			if(!empty($caseId)){
				$con['a.id']=['in',$caseId];
			}else{
				$con= ['a.iqbtId' => $id];
			}
			//获取孵化案例
			$case = getDataList('iqbtCase', $con, 'a.id ,a.name,a.url,a.desc,b.savePath as logo', '', $join);
			if($case['code']!=1){
				throw new \think\Exception("获取案例失败:".$case['msg']);
			}
			//处理数据:链接+a标签,图片+img
			foreach ($case['data'] as $k => $v) {
				$case['data'][$k]['url'] = '<a target="_blank" href=' . $v['url'] . ">" . $v['url'] . "</a>";
				if (!empty($case['data'][$k]['logo'])) {//如果logo不为空
					if (!is_file(ROOT_PATH . "/public" . $v['logo'])) {//如果logo文件不存在
						$case['data'][$k]['logo'] = '图片不存在';
					}
				}
			}
			return $case;
		}catch(\Exception $e){
			c_Log($e);
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}
	/**
	 * 保存场地封面
	 */
	public function savePoster(){
		try {
			$postData = input('post.', null, 'trim');
			$res = saveData('incubator', $postData);
			if ($res['code'] == 0) {
				throw new \think\Exception("保存空间封面失败:".$res['msg']);
			}else{
				$logRes = saveLog('6012016', '修改空间信息', $res['data'], 'incubator', 0);
				if ($logRes['code'] != 1) {
					throw new \think\Exception("新增-修改空间信息-操作记录失败:".$logRes['msg']);
				}
			}
			return $res;
		}catch(\Exception $e){
			c_Log($e);
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}
	
	/**
	 * 保存场地信息
	 */
	function saveIqbt(){
		try {
			$postData=input('request.',null,'trim');
			//            dump($postData);exit;
			//            Log::notice(json_encode($postData));
			
			//如果是注册的
			if(!empty($postData['validTime']) && $postData['validTime']==1){
				/*todo  delete\\\\\\\\\\\\\\\\\\\*/
				$postData['validTime']=time()+86400*7;
				$userInfo['id']=$postData['userId'];
				$userInfo['validTime']=$postData['validTime'];
				unset($postData['validTime']);
				/*todo  delete////////////////////*/
				/*修改后的代码  todo  release
				$postData['validTime']=time()+86400*7;
				*/
				unset($postData['userId']);
			}
			// 校验
			$cstmValidate = $this->validate($postData,"Iqbt.saveIqbt");
			if ($cstmValidate!==true) {
				throw new \think\Exception ( $cstmValidate);
			}
			//如果有img
			if(!empty($postData['img'])){
				//            $img=$postData['img'];
				unset($postData['img']);
			}
			//是否有基金
			$postData['isfundtion']=empty($postData['fundtion'])?'7002002':'7002001';
			//是否有政策支持
			$postData['policyspt']=empty($postData['policy'])?'7002002':'7002001';
			//环境图片
			Db::startTrans();
			//            dump($postData);exit;
			if(!empty($postData['id'])){
				/*$res = getDataList('iqbtImg', ['iqbtId' => $postData['id']], 'id');//获取所有图片id
				 if ($res['code'] != 1) {
				 throw new \think\Exception("获取空间原有图片失败:".$res['msg']);
				 }
				 foreach ($res['data'] as $k2 => $v2) {
				 $hiddenCon['id'] = $v2['id'];//图片id
				 $hiddenCon['isDelete'] = 1;
				 //将当前空间图片全部隐藏/初始化
				 $res = saveData('iqbtImg', $hiddenCon);
				 if ($res['code'] == 0) {
				 throw new \think\Exception("更新图片失败:" . $res['msg']);
				 }
				 }*/
				$dltmsg=deleteByCon('iqbtImg',array("iqbtId"=>$postData['id']));
				if ($dltmsg['code'] == 0) {
					throw new \think\Exception("更新图片失败:" . $dltmsg['msg']);
				}
			}else{
				//如果有caseId(新增时候有)
				if(!empty($postData['caseId'])){
					$caseId=$postData['caseId'];
					$caseArr=explode(',',$caseId);
				}
				$postData['status']=1;//新增孵化器状态为已认证
			}
			
			$imgId=[];
			foreach($postData as $k=>$v){
				if (is_numeric($k)){//如果是图片
					if(!empty($v)){//如果图片不为空
						$con['id']=$v;
						$con['isDelete']=0;
						//                    $res=saveData('iqbtImg',$con);//修改图片isDelete=0
						$res=Db::name('iqbtImg')->update($con);//修改图片isDelete=0
						if($res!=1){
							throw new \think\Exception("配套图片新增失败:".$res['msg']);
						}
						//把有图片的配套设施的图片id收集起来
						$imgId[]=$v;
					}
					//                else{//
					//////                    dump($v);
					////                    //找到删除图片的id,进行软删除
					//                    $con['iqbtId']=$postData['id'];
					//                    $con['code']=$k;
					//                    $imgData['id']=getField('iqbtImg',$con,'id');
					////                    dump($imgData['id']);//id
					//                    $imgData['isDelete']=1;
					//                    $res=saveData('iqbtImg',$imgData);//修改图片isDelete=1
					//                }
					unset($postData[$k]);
				}
			}
			//注销无效变量
			//dump($imgId);
			unset($postData['temname']);
			unset($postData['temmobile']);
			unset($postData['provice']);
			unset($postData['city']);
			unset($postData['caseId']);
			//        unset($postData['caseId']);
			//$join=[['sysFile b','a.poster=b.id and b.isDelete=0','left'],['sysFile c','a.logo=c.id and c.isDelete=0','left'],['sysDict d','a.type=d.code and d.isDelete=0','left'],['iqbtCase e','e.iqbtId=a.id and e.isDelete=0','left'],['sysFile f','f.id=e.logo  and f.isDelete=0','left']];
			//保存空间信息
			$data = saveData('incubator', $postData);
			if($data['code']==1) {
				//如果是新增空间,把图片的iqbtId补充上
				if(empty($postData['id'])){
					/*foreach ($imgId as $k=>$v){
					 $res=saveData('iqbtImg', ['id'=>$v,'iqbtId'=>$data['data'],"isDelete"=>0]);
					 if($res['code']!=1){
					 throw new \think\Exception("填充图片所属空间失败".$res['msg']);
					 }
					 }*/
					$res=saveDataByCon('iqbtImg', ['iqbtId'=>$data['data'],"isDelete"=>0],['id'=>['in',$imgId]]);
					if($res['code']!=1){
						throw new \think\Exception("填充图片所属空间失败".$res['msg']);
					}
					//如果有案例,把案例的iqbtId补上
					if(!empty($caseArr)) {
						foreach ($caseArr as $k => $v) {
							if ($v != '') {
								$con = [];
								$con['id'] = $v;
								$con['iqbtId'] = $data['data'];
								$res = saveData('iqbtCase', $con);
								if ($res['code'] != 1) {
									throw new \think\Exception("填充案例所属空间失败" . $res['msg']);
								}
							}
						}
					}
					//如果非注册,是新增空间
					if(empty($userInfo['id'])) {
						//新增用户
						$userInfo['name'] = $postData['mobile'];
						$userInfo['realname'] = $postData['contact'];
						$userInfo['mobile'] = $postData['mobile'];
						$userInfo['iqbtId'] = $data['data'];//取刚刚生成的客户id
						$userInfo['password'] = md5(888888);
						$userInfo['status'] = '6018001';
						$userInfo['type'] = '6019001';//用户类型：孵化器管理员
						$userInfo['roleId'] = '2';//用户权限：孵化器管理员
						$vld = $this->validate($postData, 'Autoadduser');
						if ($vld !== true) {
							throw new \think\Exception($vld);
						}
						//user表插入数据
						$user = saveData('user', $userInfo);
						if ($user['code'] == 0) {
							throw new \think\Exception("新建用户失败:" . $user['msg']);
						}
					}else{
						//如果是注册的,将刚生成的孵化器id保存到user表中
						$userInfo['realname'] = $postData['contact'];
						$userInfo['iqbtId'] = $data['data'];//取刚刚生成的客户id
						$userInfo['status'] = '6018005';
						$user = saveData('user', $userInfo);
						if ($user['code'] == 0) {
							throw new \think\Exception("修改用户失败:" . $user['msg']);
						}
						\think\Session::clear();

						/*//发送wechat通知*/
						$user=new User();
						$wxurl=config('domain').'/wechat/test/index';
						$openIdArr=getDataList('user',['role'=>1],'id.openId');//查询需要发送的用户 todo 确定menuId
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
							$msg=$user->rgstApl( $msgPost['title'],$v['openId'],'注册saas账户',$postData['name'],$wxurl);
							$msgstatus=empty($msg['code'])?'6024002':'6024003';
							$rcdRes=saveMsgRcd($res['data'],$v['openId'],$msgstatus,$v['id']);
							if($rcdRes['code']==0){
								throw new \think\Exception('保存消息失败'.$rcdRes['msg']);
							}
						}
					}
				}
				//写入日志
				if(!empty($postData['id'])){
					$logCode="6012016";
					$logName="修改空间信息";
				}else{
					$logCode="6012015";
					$logName="添加空间";
				}
				$logRes = saveLog($logCode, $logName, $data['data'], 'incubator', 0);
				if ($logRes['code'] != 1) {
					throw new \think\Exception("新增-".$logName."-操作记录失败:".$logRes['msg']);
				}
				//                if (isset($img)) {
				//                    foreach ($img as $v) {
				//                        $v['iqbtId'] = $data['data'];
				//                        $imgres=saveData('iqbtImg', $v);
				//                        if($imgres['code']==0){
				//                            throw new \think\Exception("保存图片失败");
				//                        }
				//                    }
				//                }
			}else{
				throw new \think\Exception("保存空间信息失败:".$data['msg']);
			}
			Db::commit();
			return $data;
		}catch (\Exception $e){
			c_Log($e);
			Db::rollback();
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}
	
	/*
	 * 案例详情
	 */
	public function getCaseInfo($id=0){
		try {
			$field="a.id as caseid,a.name as casename,a.logo as caselogoId,a.url as caseurl,a.desc as casedesc,b.savePath as casesavepath";
			$join=[['sysFile b','a.logo=b.id and b.isDelete=0','left']];
			$data = findById('iqbtCase', ['a.id'=>$id],$field,'',$join);
			if($data['code']!=1){
				throw new \think\Exception("获取案例详情失败:".$data['msg']);
			}
		}catch(\Exception $e){
			c_Log($e);
			return array('code'=>0,'msg'=>$e->getMessage());
		}
		return $data;
	}
	
	/*
	 * 删除案例
	 */
	public function deleteCase($id=0){
		try {
			$data = deleteData('iqbtCase', $id, '删除案例');
		}catch(\Exception $e){
			c_Log($e);
			return array('code'=>0,'msg'=>$e->getMessage());
		}
		return $data;
	}
	
	
	/*
	 * 保存案例
	 */
	public function saveCase(){
		try {
			$postData=input('request.',null,'trim');
			//            dump($postData);exit;
			unset($postData['s']);
			unset($postData['/iqbt/iqbt/savecase_html']);
			if(!empty($postData['caseid'])){
				$postData['id']=$postData['caseid']; //如果是编辑案例
				unset($postData['caseid']);
			}
			//验证
			$vld = $this->validate($postData, 'AddCase.insert');
			if ($vld === true) {
				$data = saveData('iqbtCase', $postData);//保存案例
				if($data['code']!=1){
					throw new \think\Exception ("保存案例失败:".$data['msg']);
				}
			}else{
				throw new \think\Exception ($vld);
			}
			return $data;
		}catch(\Exception $e){
			c_Log($e);
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}
	/**
	 * 用户管理(销售审核)列表
	 * @param $arr
	 * @return mixed
	 */
	public function getUserList(){
		try{
			$postData=input('');
			//分页条件
			$limit = !empty($postData["limit"])? $postData["limit"] : '';
			$offset = !empty($postData["offset"]) ? $postData["offset"] : '';
			//状态条件
			if (!empty($postData["status"]) ) {
				switch($postData["status"]){
					case'6018005':
						//                        $con['a.status']=$postData["status"];
						$con=' status= '.$postData["status"];
						break;
					case'outtime':
						//                        $con['a.validTime'] = ['<',time()];
						$con=' validTime>0 and validTime < '.time();
						break;
					case'intime':
						//                        $con['a.validTime'] = ['>',time()];
						$con=' validTime=0 or validTime > '.time().' and status <> 6018005 ';
						break;
				}
			}
			//排序
			if (!empty($postData['sort'])) {
				//转化排序字段
				switch($postData['sort']){
					case"sourceText":
						$postData['sort']='source';
						break;
					case"cstmstatusText":
						$postData['sort']='cstmstatus';
						break;
					default:
						break;
				}
				if (!empty($postData['order'])) {
					$order =  $postData['sort'] . ' ' . $postData['order'];
				} else {
					$order =  $postData['sort'] . ' asc';
				}
			} else {
				//                $order = 'a.backlog desc,a.cstmstatus asc,a.addtime asc,a.flowtime asc';//默认排序
				$order = 'a.validTime asc';//默认排序
			}
			unset($postData['sort']);
			
			//            $join=[['incubator b','a.iqbtId=b.id','LEFT']];
			//获取列表数据
			//            $con['a.type']=6019001;
			//            $con['a.iqbtId']=['>',0];
			$field='a.id as userId,a.status,a.iqbtId,a.validTime,b.name,b.contact,b.mobile,b.districtId,b.addtime,b.salesperson';
			$data=Db::query('select * from(select '.$field.' from ibt_user as a  left join ibt_incubator b on a.iqbtId=b.id where a.iqbtId > 0 and a.type=6019001  group by a.iqbtId order by '.$order.')tab where'.$con);
			
			/*            $list=getDataList('user',$con,$field,$order,$join,'b.id',$offset,$limit);
			 if($list['code']==0){
			 throw new \think\Exception('获取用户数据失败:'.$list['msg']);
			 }*/
			$list=[];
			$list['data']=$data;
			foreach ($list['data'] as $k=>$v){
				$list['data'][$k]['addtime']=date('Y-m-d H:i',$v['addtime']);//处理时间戳
				$list['data'][$k]['validStamp']=$v['validTime'];//保存时间戳 待前台处理
				$list['data'][$k]['validTime']=empty($v['validTime'])?'永久有效':date('Y-m-d H:i',$v['validTime']);//处理时间戳
				//所在地区
				if (!empty($list['data'][$k]['districtId'])) {//如果地址不为空
					$cityArr=getDataList('region',['a.id' => ['in',[substr($list['data'][$k]['districtId'], 0, 2),substr($list['data'][$k]['districtId'], 0, 4),$list['data'][$k]['districtId']]]],'name');
					if($cityArr['code']!=1){
						throw new \think\Exception("获取地址名称失败:".$cityArr['msg']);
					}
					$citystr=$cityArr['data'];
                    if(!empty($citystr[0]['name'])){
                        $list['data'][$k]['province'] = $citystr[0]['name'];//省
                    }
					if(!empty($citystr[1]['name'])){
                        $list['data'][$k]['city'] =  $citystr[1]['name'];//市
					}

				}
				//房间信息
				$room= findById('room', ['iqbtId' => $v['iqbtId'], 'type' => 6011001], 'count(id) as roomnum,sum(case when status=0 then 1 else 0 end) as oddnum');
				$list['data'][$k]['roomnum']=$room['data']['roomnum'];
				$list['data'][$k]['oddroomnum']=$room['data']['oddnum'];
				$unitnum = findById('room', ['iqbtId' => $v['iqbtId'], 'type' => 6011002], 'count(id) as unitnum,sum(case when status=0 then 1 else 0 end) as oddnum');
				$list['data'][$k]['unitnum']=$unitnum['data']['unitnum'];
				$list['data'][$k]['oddunitnum']=$unitnum['data']['oddnum'];
				if($list['data'][$k]['validTime']=='永久有效'){
					//                    dump($list['data'][$k]);
					//                    dump($list['data']);
					$tem=$list['data'][$k];
					//                    dump($tem);
					unset($list['data'][$k]);
					array_push($list['data'],$tem);
					//                    dump($list['data']);exit;
				}
			}
			$arr=[];
			$total=count($list['data']);
			$key=array_keys($list['data']);
			for($i=0;$i<$total;$i++){
				$arr[$i]=$list['data'][$key[$i]];
			}
			$list['data']=$arr;
			return  array('total' => $total, 'rows' => $list['data']);
		}catch(Exception $e){
			c_Log($e);
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}
	/**
	 * 保存用户审核信息(续约)
	 * @param $arr
	 * @return mixed
	 */
	public function saveUserInfo(){
		try{
			Db::startTrans();
			$postData=input('request.',null,'trim');
			$vlt=$this->validate($postData,'UserAudit');
			if($vlt===true){
				$res=saveData('incubator',['id'=>$postData['iqbtId'],'salesperson'=>$postData['salesperson']]);
				if($res['code']==0){
					throw new \think\Exception('保存对接人信息失败:'.$res['msg']);
				}
				unset($postData['salesperson']);
				$postData['status']=6018001;
				//                $postData['addtime']=strtotime($postData['addtime']);
				unset($postData['addtime']);
				$postData['validTime']=strtotime($postData['validTime'])+86400-1;
				$res=saveData('user',$postData);
				if($res['code']==0){
					throw new \think\Exception('审核失败:'.$res['msg']);
				}

				/*//发送通知*/
				$user=new User();
				$wxurl=config('wxdomain').'/wechat/test/index';
				//查询该条报名的用户id
//				$join=[['user b','a.adduserId=b.id','left']];
				$userId=getDataList('user',['a.iqbtId'=>$postData['iqbtId']],'b.id,b.openId');
				if($userId['code']==0){
					throw new \think\Exception('查找用户id失败'.$userId['msg']);//获取权限失败
				}
				//保存消息
				$msgPost['title']='试用审核通过';
				$msgPost['content']='';
				$msgPost['usertype']='';
//                    $msgPost['iqbtId ']=session('user.iqbtId');
				$msgPost['usertype']='';
				$res=saveData('msg',$msgPost);
				if($res['code']==0){
					throw new \think\Exception('保存消息失败'.$res['msg']);
				}
				/*发送消息并保存消息记录*/
				$msg=$user->rgstApl( $msgPost['title'],$userId['data'][0]['openId'],'试用审核通过','',session('user.etprsName'),'','',$wxurl);
				$msgstatus=empty($msg['code'])?'6024002':'6024003';
				$res=saveMsgRcd($res['data'],$userId['data'][0]['openId'],$msgstatus,$userId['data'][0]['id']);
				if($res['code']==0){
					throw new \think\Exception('保存消息失败'.$res['msg']);
				}


			}else{
				throw new \think\Exception($vlt);
			}
			Db::commit();
			return $res;
		}catch(\Exception $e){
			c_Log($e);
			Db::rollback();
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}

	/**
	 * 分享空间展示页面
	 * @param int $id  空间id
	 * @return \think\response\Json
	 */
	public function shareIqbtInfo($id=0)
	{
		try {
			$info = $this->getIqbtInfo($id);//空间详情
			/*//房间信息*/
			$roominfo=getDataList('room',['iqbtId' => $id,],'type,sum(case when status=0 then 1 else 0 end) as oddnum,max(area) ,min(area),max(total),min(total)','',[],'type');//月租.面积区间
			if($roominfo['code']==0){
				throw new \think\Exception('房间信息获取失败'.$roominfo['msg']);
			}
			$room=$roominfo['data'][0];
			$unit=$roominfo['data'][1];
			//办公室（剩余100，50-100㎡，500-1000元/月），工位（剩余100，50-100元/工位/天）
			$roomStr='办公室（剩余'.$room['oddnum'].','.$room['min(area)'].'-'.$room['max(area)'].'㎡,'.$room['min(total)'].'-'.$room['max(total)'].'元/月),工位(剩余'.$unit['oddnum'].','.$unit['min(total)'].'-'.$unit['max(total)'].'元/月)';
			$info['data']['roomStr']=$roomStr;
			/*孵化案例*/
			$case=$this->iqbtCase($id);
			$info['data']['case']=$case['data'];
//			dump($info);
			return json($info);
		}catch(\Exception $e){
			c_Log($e);
			return json(array('code'=>0,'msg'=>$e->getMessage()));
		}
	}

	/**
	 * 预约参观
	 */
	public function visitIqbt(){
		try{
			$postData=input('request.',null,'trim');
			$vld=$this->validate($postData,'Visit');
			if($vld===true){
				$visitRes=saveData('iqbtVisit',$postData);//保存预约参观信息
				if($visitRes['code']==0)
				{
					throw new \think\Exception('保存预约信息失败'.$visitRes['msg']);
				}
				/*//发送wechat通知*/
				$user=new User();
				$wxurl=config('domain').'/wechat/test/index';
				$openIdArr=getDataList('user',['role'=>2,'iqbtId'=>$postData['iqbtId']],'id.openId');//查询需要发送的用户 todo 确定menuId
				if($openIdArr['code']==0){
					throw new \think\Exception('查找权限G失败'.$openIdArr['msg']);//获取权限失败
				}
				//保存消息
				$msgPost['title']='新的预约参观申请';
				$msgPost['content']='';
				$msgPost['msgType']='6012048';
				$msgPost['iqbtId']=$postData['iqbtId'];//msg表保存iqbtId
				$msgPost['objId']=$visitRes['data'];//visit表id
				$res=saveData('msg',$msgPost);
				if($res['code']==0){
					throw new \think\Exception('保存消息失败'.$res['msg']);
				}
				//保存消息日志
				$logRes=saveLog('6012048','预约参观申请消息',$res['data'],'msg','');
				if($logRes['code']==0){
					throw new \think\Exception('日志记录失败'.$logRes['msg']);
				}
				/*发送消息并保存消息记录*/
				foreach($openIdArr['data'] as $k=>$v){
					$msg=$user->beforeVisit1($msgPost['title'],$postData['contact'],$postData['mobile'],$v['openId'],$postData['name']);
					$msgstatus=empty($msg['code'])?'6024002':'6024003';
					$rcdRes=saveMsgRcd($res['data'],$v['openId'],$msgstatus,$v['id']);
					if($rcdRes['code']==0){
						throw new \think\Exception('保存消息失败'.$rcdRes['msg']);
					}
				}
			}else{
				throw new \think\Exception($vld);
			}
			return json($res);
		}catch (\Exception $e){
		    //记录事务
		    c_Log($e);
			return json(array('code'=>0,'msg'=>$e->getMessage()));
		}
	}

			
	//-me 火炬中心 {:url('/iqbt/Iqbt/service')}
	public function service(){
		$iqbtId = session('iqbtId');
		$data=Db::name('data_torch')->where('iqbtId',$iqbtId)->find();  //var_dump($data);
		//echo Db::name('data_torch')->getlastsql();exit;
		if (!$data) {
			$con1['id']=$iqbtId;
			$data=findById('incubator',$con1,$filed='name,lealperson,type,contact,mobile,email,display,districtId,address');
			$data=$data['data'];  //var_dump($data);die;
			$data['id']='';
			//省市区街道
			$regionId=$data['districtId'];
			if ($regionId){
				$array=findById('region',array('id'=>$regionId),'name,provinceid,cityid'); //var_dump($array);exit;
				$proName=getField('region',array('id'=>$array['data']['provinceid']),'name');
				$cityName=getField('region',array('id'=>$array['data']['cityid']),'name');
				$data['address']=$proName.$cityName.$array['data']['name'].$data['address'];
			}else{
				$data['address']=$data['address'];
			}
			$data['artificial']=$data['lealperson']; //法人
			$data['site']=$data['display'];          //网址
			$data['property']='';$data['phone']='';$data['fax']='';$data['zipcode']='';$data['rgsttime']='';$data['area']='';$data['structure']='';
			$data['room']='';$data['unit']='';$data['magement']='';$data['junior']=''; $data['canuserarea']=''; $data['userarea']='';$data['etprsnum']='';
			$data['patentetprs']=''; $data['graduate']=''; $data['job']=''; $data['etprsjuniorate']=''; $data['total']='';
			$data['trainrate']='';
		}
		//空间类型
		$con['code']=array('like','6004%');
		$con['level']=2;
		$iqbttype=getDataList('sysDict',$con,'code,name');
		$iqbttype=$iqbttype['data']; //dump($iqbttype);exit;
		//var_dump($data);exit;
		
		return view("",array('data'=>$data,'iqbttype'=>$iqbttype));
	}
	
	//-me 火炬中心 保存
	public function saveDataTorch(){
		try{
			$postData=input('request.',null,'trim');
			//echo '<pre>';print_r($postData);echo '</pre>';exit();
			// 校验
			$cstmValidate = $this->validate($postData,"Iqbt.saveDataTorch");
			if ($cstmValidate!==true) {
				throw new \think\Exception ($cstmValidate);
			}
			
			$con['id']=session('iqbtId');
			$postData['districtId']=getField('incubator',$con,'districtId');
			
			$postData['iqbtId']=session('iqbtId');
			$postData['name']=$postData['incuname'];
			unset($postData['incuname']);
			
			//管理人员中具有大专以上学历的比例
			if ($postData['magement']) {
				$postData['juniorrate']=round($postData['junior']/$postData['magement'],2).'%';
			}
			//在孵企业使用的场地（含公共服务场地）占比
			if ($postData['canuserarea']) {
				$postData['userate']=round($postData['userarea']/$postData['canuserarea'],2).'%';
			}
			
			//已申请专利的在孵企业占比
			if ($postData['etprsnum']) {
				$postData['patentrate']=round($postData['patentetprs']/$postData['etprsnum'],2).'%';
			}
			
			$res=saveData('DataTorch',$postData);  //var_dump($res);exit;
			if ($res['code']===0){
				throw new \think\Exception ('数据添加失败');
			}else{
				return array('code'=>1,'msg'=>'保存成功','data'=>$res);
			}
		}catch(\Exception $e){
			c_Log($e);
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}
	
	//导出word
	public function toWord(){
		$con['iqbtId']=session('iqbtId');
		$data=findById('DataTorch',$con);  //var_dump($data);
		
		if ($data['data']) {
			$data=$data['data'];
		}else{
			//return array('code'=>0,'msg'=>'无数据！');
			$this->redirect(url('/iqbt/iqbt/service'));
		} 
		//空间类型
		$type=$data['type']; 
		$con1['code']=$type;
		$typeName=getField('sysDict',$con1,'name'); //dump($typeName);exit;
		$data['type']=$typeName; 
		
		vendor("PHPWord");
		vendor("PHPWord.IOFactory");
		
		// New Word Document
		$PHPWord = new \PHPWord();
		
		// New portrait section
		$PHPWord->addParagraphStyle('pStyle', array('align' => 'center'));
		$PHPWord->addFontStyle('titleStyle', array('bold' => true, 'color' => '000000', 'size' => 16));
		//首页 ---start------------------------------------------------------------------------------------------------------------------------------------
		$section = $PHPWord->createSection();
		//$section->addTextBreak(1);   //换行 1行
		$PHPWord->addFontStyle('rStyle', array('bold' => true, 'color' => '000000', 'size' => 22));
		$PHPWord->addParagraphStyle('pStyle', array('align' => 'center'));
		$section->addText('空间基本信息表', 'rStyle', 'pStyle');
		$section->addTextBreak(1);    //换行 1行
		
		// Add table
		$styleTable = array('borderSize' => 0, 'borderColor' => '000000','cellMargin' => 80);
		$PHPWord->addTableStyle('myOwnTableStyle', $styleTable);
		$table = $section->addTable('myOwnTableStyle');
		$fontStyle = array('bold' => false, 'align' => 'center','size'=>12);
		$fontStyle2 = array('bold' => false, 'align' => 'left','size'=>11);
		
		// Add more rows / cells
		$table->addRow(400);
		$table->addCell(4000, array('valign' => "center"))->addText("申报单位", $fontStyle);
		$table->addCell(600, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['name'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		
		$table->addRow(400);
		$table->addCell(2400, array('valign' => "center"))->addText("单位性质", $fontStyle);
		$table->addCell(1600, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['property'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(4000, array('valign' => "center"))->addText("注册时间", $fontStyle);
		$table->addCell(900, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['rgsttime'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "center"))->addText("法人代表", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['artificial'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(4000, array('valign' => "center"))->addText("空间类型", $fontStyle);
		/* $table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['inctype'],$fontStyle2); */
		$table->addCell(2600, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['type'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		//------------
		/* $table->addRow(400);   //rowMerge 合并行
		 $table->addCell(1600, array('rowMerge' => 'restart','valign' => "center"))->addText("法人代表", $fontStyle);
		 $table->addCell(2400, array('rowMerge' => 'restart', 'valign' => "left"))->addText($data['fren'],$fontStyle);
		 
		 $table->addCell(1600, array('rowMerge' => 'restart','valign' => "right"))->addText("孵化器类型", $fontStyle);
		 $table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "center"))->addText("综合",$fontStyle);
		 $table->addCell(0, array('cellMerge' => 'continue'));
		 $table->addCell(0, array('cellMerge' => 'continue'));
		 $table->addCell(0, array('cellMerge' => 'continue'));
		 $table->addCell(0, array('cellMerge' => 'continue'));
		 
		 $table->addRow(400);
		 $table->addCell(1600, array('rowMerge' => 'continue'));
		 $table->addCell(2400, array('rowMerge' => 'continue'));
		 
		 $table->addCell(0, array('rowMerge' => 'continue'));   //rowMerge 合并行
		 $table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "center"))->addText('专业',$fontStyle);
		 $table->addCell(0, array('cellMerge' => 'continue'));
		 $table->addCell(0, array('cellMerge' => 'continue'));
		 $table->addCell(0, array('cellMerge' => 'continue'));
		 $table->addCell(0, array('cellMerge' => 'continue')); */
		//---------
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "center"))->addText("联系人", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['contact'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "center"))->addText("电子邮箱", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['email'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "center"))->addText("固定电话", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['phone'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "center"))->addText("传真", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['fax'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "center"))->addText("移动电话", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['mobile'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "center"))->addText("邮编", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['zipcode'],$fontStyle2);  //网址：site
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		
		$table->addRow(400);
		$table->addCell(1600, array('cellMerge' => 'restart','valign' => "center"))->addText("通讯地址", $fontStyle);
		$table->addCell(1600, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['address'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(2400, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "center"))->addText("网址", $fontStyle);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['site'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(2400, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		
		$table->addRow(400);
		$table->addCell(2400, array('valign' => "right"))->addText("管理人员数量", $fontStyle2);
		$table->addCell(1600, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['magement'],$fontStyle2);
		$table->addCell(1600, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(2400, array('valign' => "right"))->addText("管理人员中具有大专以上学历的数量", $fontStyle2);
		$table->addCell(1600, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['junior'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(2400, array('valign' => "right"))->addText("管理人员中具有大专以上学历的比例", $fontStyle2);
		$table->addCell(1600, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['juniorrate'].'%',$fontStyle2);

		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "right"))->addText("可自主支配孵化场地使用面积（万平方米）", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['canuserarea'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "right"))->addText("在孵企业使用场地（含公共服务场地）面积（万平方米）", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['userarea'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "right"))->addText("在孵企业使用的场地（含公共服务场地）占比", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['userate'].'%',$fontStyle2);

		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "right"))->addText("可自主支配场地内的在孵企业数量", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['etprsnum'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "right"))->addText("已申请专利的在孵企业数量", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['patentetprs'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "right"))->addText("已申请专利的在孵企业占比", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['patentrate'].'%',$fontStyle2);

		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "right"))->addText("累计毕业企业数量", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['graduate'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "right"))->addText("毕业企业和在孵企业提供的就业岗位数量", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['job'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "right"))->addText("在孵企业中的大专以上学历人数占企业总人数的比例", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['etprsjuniorate'].'%',$fontStyle2);

		
		
		$table->addRow(400);
		$table->addCell(1600, array('valign' => "right"))->addText("孵化器自有种子资金或孵化资金额（万元）", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['total'],$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(1600, array('valign' => "right"))->addText("接受孵化器专业培训人员的比例", $fontStyle2);
		$table->addCell(2400, array('cellMerge' => 'restart', 'valign' => "left"))->addText($data['trainrate'].'%',$fontStyle2);
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));
		$table->addCell(0, array('cellMerge' => 'continue'));

		
		$section->addTextBreak(1); //换行 1行
		
		$section->addText('负责人签字',array('color' => '000000', 'size' => 16,),array('align' => 'left'));
		$section->addText('',array('color' => '000000', 'size' => 16,),array('align' => 'left'));
		$section->addText('申报单位盖章                                                 2018年   月   日',array('color' => '000000', 'size' => 16,),array('align' => 'left'));
		
		//Add image
		/*$section->addImage('logo.jpg', array('width'=>100, 'height'=>100,'align'=>'right'));*/
		
		/*$objWrite = \PHPWord_IOFactory::createWriter($PHPWord, 'Word2007');
		 $objWrite->save('word/tmp/' . time() . '.docx');*/
		
		/**设置在浏览器下载**/
		header('Pragma: public');
		header('Expires: 0');
		header('Cache-Control:must-revalidate， post-check=0， pre-check=0');
		header('Content-Type:application/force-download');
		header('Content-Type:application/vnd.ms-word');
		header('Content-Type:application/octet-stream');
		header('Content-Type:application/download');
		header('Content-Disposition:attachment;filename=空间基本信息表'. '.docx');
		header('Content-Transfer-Encoding:binary');
		$objWriter = \PHPWord_IOFactory::createWriter($PHPWord, 'Word2007');
		$objWriter->save('php://output');
	}
	
	//-me 企业用户 -首页
	public function first(){
		//通知公告ibt_msg.objId<>0
		$con['a.objId']=array('<>',0);
		//未读（发送成功） ：6024003
		$con['b.status']=6024003;
		$join=[['msgRcd b','a.id=b.msgId']];
		$res=getDataList('msg',$con,'b.*',array(),$join); //var_dump($res);
		if ($res['code']==1 && $res['data']) {
			$tzcount=count($res['data']);
			$data['tzcount']=$tzcount;
		}else{
			$data['tzcount']=0;
		}
		
		return json($data);
		//return view("",array('data'=>$data));
	}
	
	//-me 企业用户 -数据中心
	public function dataCenter(){
		//参加活动次数
		$con['a.endtime']=array('<',time());
		$con['a.status']=7001002; //审核通过
		$con['b.status']=7001002; //审核通过
		$con['b.adduserId']=session('userId'); //申请
		$join=[['activityApl b','a.id=b.actId']];
		$res=getDataList('activity',$con,'b.*',array(),$join); //var_dump($res);
		if ($res['code']==1 && $res['data']) {
			$actNum=count($res['data']);
			$peoNum=0;
			foreach ($res['data'] as $k=>$v){
				$peoNum+=$v['num'];  //参加活动人数
			}
			$data['actNum']=$actNum;
			$data['peoNum']=$peoNum;
		}else{
			$data['actNum']=0;
			$data['peoNum']=0;
		}
		
		return json($data);;
	}
}