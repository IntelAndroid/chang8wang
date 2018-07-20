<?php
namespace app\common\validate;
use think\Validate;

class Userrole extends Validate{

    protected $rule =   [
        'roleName|角色名称'=>"require|checkName",       //楼座楼层判断是否已经存在
        'roleId|上级角色' => 'require',
        'sort|菜单排序' => 'number',
        'roleAuth|角色权限'=>'require',
    ];

    protected $scene = [
        'insert' => ['roleName','roleAuth'],//'parentId',
    ];

    // 查询iqbtId下的角色名称是否重复
    public function checkName($value)
    {
        if(empty($this->data['id'])){
            $row = getDataList('UserMenu',['name'=>$value,'iqbtId'=>session("user.iqbtId")],'id');
            if($row['code'] == 1){
                return '角色名称重复';
            }
            return true;
        }else{
            $row = findById('UserMenu',['id'=>['<>',$this->data['roleId']],'name'=>$value,'iqbtId'=>session("user.iqbtId")]);
            if($row['code'] == 1){
                return '角色名称重复';
            }
            return true;
        }
    }
}