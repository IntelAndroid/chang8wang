<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_iqbt_case表验证
*/
class  Notice extends Validate
{
    protected $rule =   [
        'title|标题'  => 'require',
//        'usertype|推送对象'=>'require',
//        'districtId|推送区域'=>'require',
        'content|内容'=>'require',
    ];

    protected $message  =  [
    ];

    protected $scene = [
        'draft'  =>  ['title'],
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