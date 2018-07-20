<?php
namespace app\common\validate;
use think\Log;
use think\Validate;

class Usermenu extends Validate{

    protected $rule =   [
        'text|菜单名称'=>"require|checkName",
        //'parentId|上级菜单' => 'require',
        'sort|菜单排序' => 'number',
        //'url|菜单地址'=>'checkUrl',
    ];

    protected $scene = [
        'insert' => ['name'],//,'url','parentId'
    ];

    public function checkName($value)
    {
        if(empty($this->data['id'])){
            $row = findById('UserMenu',['name'=>$value],'id');
            Log::notice(json_encode($value));
            if($row['code'] == 1){
                return '菜单名称重复';
            }
            return true;
        }else{
            $row = findById('UserMenu',['id'=>['<>',$this->data['id']],'name'=>$value]);
            if($row['code'] == 1){
                return '菜单名称重复';
            }
            return true;
        }
    }

    public function checkUrl($value)
    {
        if(empty($value)){
            return true;
        }
        if(empty($this->data['id'])){
            $row = findById('UserMenu',['url'=>$value],'id');
            if($row['code'] == 1){
                return '菜单连接重复';
            }
            return true;
        }else{
            $row = findById('UserMenu',['id'=>['<>',$this->data['id']],'url'=>$value]);
            if($row['code'] == 1){
                return '菜单连接重复';
            }
            return true;
        }
    }
}