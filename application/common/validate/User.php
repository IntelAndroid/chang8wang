<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
*/
class User extends Validate
{

	protected $rule = [
        'name|用户名'  => 'require',
        'mobile|手机号'   => 'require|checkMobile',
        'email|邮箱' => 'email',
		'realname|真实姓名'=>'require',
        'password|登录密码' => 'require',
        'repassword|确认密码' => 'require|confirm:password',
        'loginName|用户名'=>'require',
        'confirm|确认密码'=>'require|confirm:password',
        'roleIds|用户角色'=>'require'
    ];
	protected $scene = [
			'login'  =>  ['name','password'],
			'add'  =>  ['name','mobile','password','realname'],
			'info'  =>  ['name','mobile'],
            'admuiInsert'=>['loginName','realname','roleIds'],
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