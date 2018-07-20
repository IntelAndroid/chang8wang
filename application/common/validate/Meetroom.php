<?php
namespace app\common\validate;
use think\Db;
use think\Validate;
class Meetroom extends Validate
{
    protected $rule =   [
        'name|会议室名称'  => 'require|uniqueName',//|unique:etprs
        'buildId|楼座'  => 'require',
        'accept|容纳人数'  => 'require',
        'floor|楼层'  => 'require',
        'free|是否免费'  => 'require',
        'audit|是否需要审核'   => 'require',//|unique:etprs
        'publish|是否发布'  => 'require',
    ];

    protected $message  =   [
        'name.unique' => '会议室名称重复,请重试',
    ];

    protected $scene = [
        'insert'  =>  ['name','buildId','accept','floor','free','audit','publish'],
        'edit'  =>  ['name'=>'require|exceptName','accept','floor','free','audit','publish'],
        'xls' => ['name','type','contact','mobile','source','cstmstatus'],  //导入客户
        'enterxls' => ['name','type','contact','mobile','source'],//导入入驻客户
    ];




    public function uniqueName($value)
    {
        $data = input("");
        $con['floorId'] = $data['floor'];
        $con['name'] = $value;
        $result = findById('mtroom',$con);
        if($result['data']){
            return '会议室名称重复！';
        }
        return true;
    }

    public function exceptName($value)
    {
        $data = input("");
        $con['name'] = $value;
        $con['floorId'] = $data['floor'];
        $con['id'] = ['<>',$data['id']];
        $count = getField('mtroom',$con,'count(id)');
        if($count){
            return '会议室名称重复';
        }
        return true;
    }
}