<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
*/
class Iqbt extends Validate
{
    protected $rule =   [
        'name|空间名称'  => 'require|uniqueIqbtName',
        'contact|联系人'  => 'require',

        'mobile|联系电话' => 'require|checkMobile',
        'districtId|空间位置'=>'require',
        'address|空间位置-详细街道'=>'require',
        'type|空间类型'=>'require',
        'poster|空间封面'=>'require',
        'services|提供服务'=>'require',
        'workstyle|办公方式'=>'require',
        'isfundtion|直投基金'=>'require',
        'policyspt|政策支持'=>'require',
        'detail|空间详情'=>'require',
        'url|案例链接'=>'url',
//        'busneslic|营业执照'=>'',
        'company|公司名称'=>'require',
        'from|了解渠道'=>'require',

    	//火炬中心
    	'incuname|空间名称'  => 'require',
    	'artificial|法人代表'=>'require',
    	'property|单位性质'=>'require',
    	'phone|固定电话'=>'require',
    	'fax|传真'=>'require',
    	'site|网址'=>'url',
    	'email|电子邮箱'=>'require|email',
    	'zipcode|邮编'=>'require',
    	'rgsttime|注册时间'=>'require',
    	'area|占地面积'=>'require',
    	'structure|建筑面积'=>'require',
    	'room|房间数'=>'require',
    	'unit|工位数'=>'require',
    	'magement|管理人员数量'=>'require',
    	'junior|管理人员中具有大专以上学历的数量'=>'require',
    	'canuserarea|可自主支配孵化场地使用面积'=>'require',
    	'userarea|在孵企业使用场地面积'=>'require',
    	'etprsnum|可自主支配场地内的在孵企业数量'=>'require',
    	'patentetprs|已申请专利的在孵企业数量'=>'require',
    	'graduate|累计毕业企业数量'=>'require',
    	'job|毕业企业和在孵企业提供的就业岗位数量'=>'require',
    	'etprsjuniorate|在孵企业中的大专以上学历人数占企业总人数的比例'=>'require',
    	'total|孵化器自有种子资金或孵化资金额'=>'require',
    	'trainrate|接收孵化器专业培训人员的比例'=>'require',
    ];

    protected $message  =   [
    ];

    protected $scene = [
        'edit'  =>  ['name','source','cstmstatus','contact','mobile'=>'require|checkMobile'],
        'insert'  =>  ['name','source','cstmstatus','contact','mobile'],
        'saveIqbt' =>['name','contact','mobile','districtId','address','services','workstyle','detail','busneslic'],
        'saveIqbt' =>['name','contact','mobile','districtId','address','services','workstyle','detail','busneslic'],
        'flow' =>['cstmstatus','reason','desc'],

        'rgst' =>['name','contact','mobile','districtId','address',],
    	//火炬中心
    	'saveDataTorch' =>['incuname','artificial','property','contact','mobile','phone','fax','site','email','zipcode','rgsttime','address','area','structure','room','unit','magement','junior','canuserarea','userarea','etprsnum','patentetprs','graduate','job','etprsjuniorate','total','trainrate'],
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
            return '此手机号已经存在,请重试...';
        }
        return true;
    }

    public function uniqueName($value)
    {
        $id=input('id');
        $con['name']=$value;
        if($id!=null){
            $con['id']=['<>',$id];
        }
        $result = findById('Etprs',$con);
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