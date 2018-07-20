<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
class Mtroomcollect extends Validate
{
    protected $rule =   [
        'mtroomId|会议室'  => 'require',//|unique:etprs
    ];

    protected $message  =   [
        'name.unique' => '此客户已经存在,请重试',
    ];

    protected $scene = [
        'insert'  =>  ['mtroomId'],
    ];

}