<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_iqbt_case表验证
*/
class  IqbtPact extends Validate
{
    protected $rule =   [
        'name|合同名称'  => 'require',
        'pact_start|开始时间'=>'require',
        'pact_end|结束时间'=>'require',
        'total|合同金额'=>'require|decimal',
        'saleId|合同金额'=>'require'
    ];

    protected $scene = [
        'add'=>['name','pact_start',"pact_end","total","saleId"],
    ];




}