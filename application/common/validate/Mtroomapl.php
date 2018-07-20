<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
class Mtroomapl extends Validate
{
    protected $rule =   [
        'mtroomId|会议室'  => 'require',//|unique:etprs
        'etprsId|申请企业'  => 'require',
        'name|会议名称' => 'require',
        'starttime|开始时间'=>'require|date',
        'endtime|结束时间'=>'require|date',
        'payable|应缴金额'=>'require',
        'id|审核数据'=>'require',
    ];

    protected $message  =   [
        'name.unique' => '此客户已经存在,请重试',
    ];

    protected $scene = [
        'insert'  =>  ['mtroomId','name','starttime','endtime'],
        'change'=>['',''],
    ];

}