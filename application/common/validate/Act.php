<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_iqbt_case表验证
*/
class  Act extends Validate
{
    protected $rule =   [
        'name|活动名称'  => 'require|min:5',
//        'startdate|活动时间-开始日期'=>'require',
        'starttime|活动时间-开始时间'=>'require',
//        'enddate|活动时间-结束日期'=>'require',
        'endtime|活动时间-结束时间'=>'require',
        'districtId|活动地点-省市区'  => 'require',
        'address|活动地点-详细地址'=>'require',
        'total|活动人数'=>'integer',
        'poster|活动海报'=>'require',
        'tags|活动标签'=>'require',
        'detail|活动详情'=>'require',
        'free|是否免费'=>'require',
        'price|单价'=>'number',
        'publish|是否发布'=>'require',
        'mobile|联系电话'=>'checkMobile',
        'email|联系邮箱'=>'email',
    ];

    protected $message  =   [
    ];

    protected $scene = [
        'edit'  =>  ['name','startdate','starttime','enddate','endtime','districtId','address','poster','total'=>'integer|checkSign','tags','detail','free','price','publish','mobile','email'],
        'wechat'  =>  ['name','startdate','starttime','enddate','endtime','districtId','address','poster','total'=>'integer|checkSign','free','price','publish','mobile','email'],
        'insert'  =>  ['name','logo','desc'],
    ];
    //修改活动人数时候,检查已报名成功的人数,活动人数不能少于此值
    public function checkSign($value){
        $postData=input('');
        if(!empty($postData['total'])){
            $num=findById('activityApl',['actId'=>$postData['id'],'status'=>7001002],'sum(num)as total');
            if($num['code']==1){
                if($value<$num['data']['total']) {
                    return "活动已有" . $num['data']['total'] . "人报名成功,活动人数不能小于" . $num['data']['total'];
                }
            }
        }
        return true;
    }
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