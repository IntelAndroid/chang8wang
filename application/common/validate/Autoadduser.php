<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
*/
class Autoadduser extends Validate
{
	protected $rule =   [
        'mobile|手机号'   => 'require|checkMobile|uniqueMob',
    ];
    
    protected $message  =   [
    ];

    protected $scene = [
        'insert|edit'  =>  ['name','type','source','status','contact','mobile','legalname','bp'],
    ];

    public function uniqueMob($value)
    {
        $result = findById('user',array('mobile'=>$value));
        if($result['data']){
            return '此手机号已经存在,无法创建新用户,请重试';
        }
        return true;
    }

    public function uniqueName($value)
    {
        $result = findById('Etprs',['name'=>$value]);
        if($result['data']){
            return '此客户已经存在,请重试';
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