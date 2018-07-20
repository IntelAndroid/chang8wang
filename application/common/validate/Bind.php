<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
*/
class Bind extends Validate
{

	protected $rule = [
        'mobile|账号'   => 'require|checkMobile',
        'password|密码' => 'require',

    ];
	protected $scene = [
			'login'  =>  ['name','password'],
			'add'  =>  ['name','mobile','password','realname'],
			'info'  =>  ['name','mobile'],
            'admuiInsert'=>['loginName','password','confirm','roleIds'],
	];
    public function checkMobile($value){
    	$isMobile="/^((\+?86)|(\(\+86\)))?(13[0123456789][0-9]{8}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/"; 
    	$isTel="/^([0-9]{3,4}-)?[0-9]{7,8}$/"; 
    	if(!preg_match($isMobile,trim($value)) && !preg_match($isTel,trim($value))){
    		return '手机号/电话号格式错误,请重新输入';
    	}else{
    		return true;
    	}
    }

    public function checkPhone($value)
    {
    	$isTel="/^([0-9]{3,4}-)?[0-9]{7,8}$/"; 
    	if(!preg_match($isTel,$value)){
    		return '电话号格式错误';
    	}else{
    		return true;
    	}
    }
}