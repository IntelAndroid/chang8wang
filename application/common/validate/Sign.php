<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_iqbt_case表验证
*/
class  Sign extends Validate
{
    protected $rule =   [
        'name|报名人'  => 'require',
        'mobile|联系电话'=>'require|checkMobile',
        'email|联系邮箱'=>'email',
        'num|报名人数'=>'require|integer|notZero'
    ];

    protected $message  =   [
    ];

    protected $scene = [
        'sign'=>['mobile','num'],
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

    public function uniqueName($value)
    {
        $id=input('id');
        if($id==null){
            $id=0;
        }
        $result = findById('Etprs',['name'=>$value,'id'=>['<>',$id]]);
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
    //非0
    public function notZero($value)
    {
        if($value==0){
            return '报名人数不能为0';
        }
        if($value<0){
            return '报名人数必须为正整数';
        }
        return true;
    }


}