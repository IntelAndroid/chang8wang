<?php
namespace app\common\validate;
use think\Validate;

class Roomxls extends Validate{

    protected $rule =   [
        'iqbtname|孵化器名称'=>"require",
        'name|楼座'=>"require",       //楼座楼层判断是否已经存在
        'floor|楼层' => 'require',
        'type|房间类型' => 'require',
        'roomNo|房间编号' =>'require',
        'area|面积'=>'number',
        'unit|单位'=>'require',
        'num|数量'=>'number',
        'price|价格'=>'number',
        'total|月租' => 'number',
        'dection|装修' => 'require',
        'selfuse|是否自用'=>'require'
    ];

    protected $scene = [
        'xlsin' => ['iqbtname','name','type','floor','roomNo','area','num','selfuse'],//,'dection' ,'price' 'unit',,'total'
    ];









}