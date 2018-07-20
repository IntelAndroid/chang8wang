<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_iqbt_case表验证
*/
class  Visit extends Validate
{
    protected $rule =   [
        'iqbtId|孵化器Id'=>'require',
        'name|企业名称'  => 'require',
//        'contact|联系人'=>'',
        'mobile|联系电话'=>'require|checkMobile',
    ];

    protected $message  =   [
    ];

    protected $scene = [
        'edit'  =>  ['name','startdate','starttime','enddate','endtime','districtId','address','poster','total'=>'integer|checkSign','tags','detail','free','price','publish','mobile','email'],
        'wechat'  =>  ['name','startdate','starttime','enddate','endtime','districtId','address','poster','total'=>'integer|checkSign','free','price','publish','mobile','email'],
        'insert'  =>  ['name','logo','desc'],
    ];
    public function uniqueMob($value)
    {
        $id=input('id');
        if($id==null){
            $id=0;
        }
        $result = findById('Etprs',array('mobile'=>$value,'id'=>['<>',$id]));
        if($result['data']){
            return '此手机号已经存在,请重试';
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


}