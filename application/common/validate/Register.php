<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
 */
class Register extends Validate
{

    protected $rule = [
        'name|用户名'  => 'require',
        'mobile|手机号'   => 'require|checkMobile',
        'code|验证码'=>'require|length:4|number',
        'email|邮箱' => 'email',
        'realname|真实姓名'=>'require',
        'password|登录密码' => 'require|min:6',
        'repassword|确认密码' => 'require|confirm:password',
        'loginName|用户名'=>'require',
        'confirm|确认密码'=>'require|confirm:password',
        'roleIds|用户角色'=>'require'
    ];

    protected $scene = [
        'res'=>['mobile','code','password','repassword'],
        'login'  =>  ['name','password'],
        'add'  =>  ['name','mobile','password','realname'],
        'info'  =>  ['name','mobile'],
        'mobile'  =>  ['mobile'=>'require|checkMobile|uniqueMob'],
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

    //注册时候校验账号是否已存在
    public function uniqueMob($value)
    {
        $con['mobile']=$value;
        $result = findById('user',$con);
        if($result['code']==="1"){
            return '此联系电话已经存在';
        }
        return true;
    }
}