<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
*/
class Cstm extends Validate
{
    protected $rule =   [
        'name|客户名称'  => 'require|uniqueName',
//        'type|客户类型'  => 'require',
        'source|来源渠道'  => 'require',
        'cstmstatus|客户状态'  => 'require',
        'contact|联系人'  => 'require',
        'mobile|联系电话'   => 'require|checkMobile|uniqueMob',
        'rqst_start|需求时间-开始时间' => 'checkTime|checkNewTime',
        'rqst_end|需求时间-结束时间' => 'checkTime|checkNewTime',
        'reason|跟进原因' =>'require',
        'desc|跟进信息' =>'require|max:100',
    ];

    protected $message  =   [
    ];

    protected $scene = [
        'edit'  =>  ['name','source','cstmstatus','contact','mobile'=>'require|checkMobile','rqst_start' => 'checkTime','rqst_end' => 'checkTime'],
        'insert'  =>  ['name','source','cstmstatus','contact','mobile','rqst_start','rqst_end'],
        'saveIqbt' =>['temname','contact','temmobile','districtId','address','service','workstyle','detail','busneslic'],
        'case'=>[''],
        'flow' =>['cstmstatus','reason','desc'],
    ];

    public function uniqueMob($value)
    {
        $id=input('id');
        $con['mobile']=$value;
        if($id!=null){
            $con['id']=['<>',$id];
        }
        $result = findById('Etprs',$con);
        if($result['data']){
            return '此手机号已经存在,请重试...';
        }else{
            $result = findById('user',['mobile'=>$value]);
            if($result['data']) {
                return '此手机号已经存在,请重试.';
            }
        }
        return true;
    }

    public function uniqueName($value)
    {
//        dump(input(''));
        $iqbtId=session('iqbtId');
        $con['iqbtId']=$iqbtId;
        $id=input('id');
        $con['name']=$value;
        if($id!=null){
            $con['id']=['<>',$id];
        }
        $result = findById('Etprs',$con);
        if($result['data']){
            return '此客户已经存在,请重试';
        }
        return true;
    }
    public function uniqueIqbtName($value)
    {
        $id=input('id');
        if($id==null){
            $id=0;
        }
        $result = findById('incubator',['name'=>$value,'id'=>['<>',$id]]);
        if($result['data']){
            return '此空间名称已经存在,请重试';
        }
        return true;
    }
    public function checkMobile($value)
    {
    	$isMobile="/^((\+?86)|(\(\+86\)))?(13[0123456789][0-9]{8}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/"; 
    	$isTel="/^([0-9]{3,4}-)?[0-9]{7,8}$/"; 
    	if(!preg_match($isMobile,trim($value)) && !preg_match($isTel,trim($value))){
    		return '手机号/电话号格式错误,请重新输入';
    	}
        return true;
    }
    public function checkTime($value){
        $post=input('',null,'trim');
        if(!empty($post['rqst_start'])&&empty($post['rqst_end'])){
            return '请填写完整需求时间';
        }
        if(empty($post['rqst_start'])&&!empty($post['rqst_end'])){
            return '请填写完整需求时间';
        }
        if($post['rqst_start']>$post['rqst_end']){
            return '需求时间-开始时间不能大于结束时间';
        }
        return true;
    }
    public function checkNewTime($value){
        $post=input('',null,'trim');
        if(strtotime($post['rqst_start'])+86399<time()){
            return '需求时间-不能为过去时间';
        }
        return true;
    }
}