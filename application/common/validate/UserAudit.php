<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
*/
class UserAudit extends Validate
{
	protected $rule =   [
        'salesperson|对接人'   => 'require',
//        'addtime|开始时间'   => 'require|checkTime',
        'validTime|过期时间'   => 'require|checkTime|checkNewTime',
    ];
    
    protected $message  =   [
    ];

    protected $scene = [
        'insert|edit'  =>  ['name','type','source','status','contact','mobile','legalname','bp'],
    ];

    public function checkTime($value){
        $post=input('',null,'trim');
//        if(!empty($post['addtime'])&&empty($post['validTime'])){
//            return '请填写完整使用时间';
//        }
//        if(empty($post['addtime'])&&!empty($post['validTime'])){
//            return '请填写完整使用时间';
//        }
//        if($post['addtime']>$post['validTime']){
//            return '使用时间-开始时间不能大于结束时间';
//        }
        return true;
    }
    public function checkNewTime($value){
        $post=input('',null,'trim');
        if(strtotime($post['validTime'])+86399<time()){
//            dump(strtotime($post['validTime']));
            return '过期时间-不能为过去时间';
        }
        return true;
    }

}