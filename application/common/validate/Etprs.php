<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
*/
class Etprs extends Validate
{
	protected $rule =   [
        'name|企业名称'  => 'require',//|unique:etprs
        'type|客户类型'  => 'require',
        'source|来源渠道'  => 'require',
        'status|入驻状态'  => 'require',
        'contact|联系人'  => 'require',
        'mobile|联系电话'   => 'require|checkMobile',//|unique:etprs uniqueMob|telephone,mobile
        'legalname|法人或团队负责人'  => 'require',
//        'bp|项目计划书'  => 'require',
    ];
    
    protected $message  =   [
        'name.unique' => '此客户已经存在,请重试',
    ];

    protected $scene = [
        'insert'  =>  ['name','type','source','contact','legalname','mobile'=>'require|checkMobile|uniqueMob'],//,'mobile'
        'etprs'  =>  ['name|exceptName','contact','legalname','mobile'=>'require|checkMobile|uniqueMob'],//,'mobile'
        'edit'  =>  ['name'=>'require|exceptName','type','source','contact','legalname','mobile'=>'require|checkMobile|uniqueMob'],//,'mobile'=>'require|exceptMob|regex:1[34578]\d{9}'
        'detail'  =>  ['name'=>'require|exceptName','contact','legalname','mobile'=>'require|checkMobile|uniqueMob'],//,'mobile'=>'require|exceptMob|regex:1[34578]\d{9}'
        'xls' => ['name'=>'require|uniqueName','type','contact','mobile','source','cstmstatus'],  //导入客户
        'xlscover' => ['name','type','contact','mobile','source','cstmstatus'],  //覆盖并新增客户
        'enterxls' => ['name','type','contact','mobile','source'],//导入入驻客户
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
            return '此联系电话已经存在,请重试...';
        }
        return true;
    }
    public function uniqueName($value)
    {

        $result = findById('Etprs',['name'=>$value,'iqbtId'=>session('iqbtId')]);
        if($result['data']){
            return '已经存在当前客户名称！';
        }
        return true;
    }

    public function exceptName($value)
    {
        $iqbt=session('iqbtId');
        $count = getField('Etprs',['name'=>$value,'iqbtId'=>$iqbt],'count(id)');
        if($count > 1){
            return '客户名称重复';
        }
        return true;
    }

    public function exceptMob($value)
    {
        $count = getField('Etprs',['mobile'=>$value],'count(id)');
        if($count > 1){
            return '联系电话重复';
        }
        return true;
    }

    public function checkMobile($value)
    {
    	$isMobile="/^((\+?86)|(\(\+86\)))?(13[0123456789][0-9]{8}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/"; 
    	$isTel="/^([0-9]{3,4}-)?[0-9]{7,8}$/"; 
    	if(!preg_match($isMobile,trim($value)) && !preg_match($isTel,trim($value))){
    		return '联系电话格式错误,请重新输入';
    	}
        return true;
    }


}