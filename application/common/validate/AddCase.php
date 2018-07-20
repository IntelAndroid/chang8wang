<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_iqbt_case表验证
*/
class  AddCase extends Validate
{
    protected $rule =   [
        'name|案例名称'  => 'require',
//        'logo|案例logo'  => 'require',
//        'desc|空间详情'=>'require',
        'url|案例链接'=>'url',
    ];

    protected $message  =   [
    ];

    protected $scene = [
        'edit'  =>  ['name','type','source','cstmstatus','contact','mobile'],
        'insert'  =>  ['name','url','logo','desc'],
        'saveIqbt' =>['temname','contact','temmobile','provice','city','county','address','type','poster','service','workstyle','isfundtion','policyspt','detail'],
        'case'=>[''],
        'flow' =>['cstmstatus','reason','desc'],
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


}