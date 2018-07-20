<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
/**
 * ibt_user表验证
 */
class Pactlog extends Validate
{
    protected $rule =   [
        'id|合同ID' => 'require',
        'etprsId|要操作的企业'  => 'require|number',
        'pact_start|合同开始时间'  => "require|date",//|checkStart
        //'pact_end|合同结束时间'  => 'require|date|different:pact_start|checkEnd:pact_start',
        'pact_end|合同结束时间'  => 'require|date|different:pact_start',
        'roomInfo|入驻房间/区域'  => 'require',
        'pact|合同文件'  => 'require',
        'pactNo|合同编号'  => 'require',
    ];

    protected $message  =   [
        'pact_start.date' => '合同开始时间只允许日期格式',
        //'pact_start.after' => '合同开始时间不能小于当前时间',
        'pact_end.date' => '合同结束时间只允许日期格式',
        'pact_end.different' => '开始时间和结束时间不能为同一天',
        'pact_end.after' => '开始时间不能早于结束时间',
    ];

    protected $scene = [
        'insert'  =>  ['etprsId','pact_start','pact_end','roomInfo'],
        'update'  =>  ['id','etprsId','roomInfo'],
        'complete'  =>  ['id'],//['id','pactNo','pact'],
        'renew'  =>  ['pact_start','pact_end','roomInfo'],//,'pactNo','pact'
    ];

    public function checkStart($value)
    {
        if(strtotime($value) < time()){
            return '合同开始时间不能小于当前时间';
        }
        return true;
    }

    public function checkEnd($value)
    {
        if(strtotime($this->data['pact_start']) > strtotime($this->data['pact_end'])){
            return '开始时间不能早于结束时间';
        }
        return true;
    }


}