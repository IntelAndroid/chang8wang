<?php
namespace app\common\validate;
use think\Validate;

class Build extends Validate{
    protected $rule =   [
        'build|楼座' => 'require',
        'floor|楼层' => 'require',
        'pic|楼层布局图' => 'require',
    ];

    protected $message  =   [

    ];

    protected $scene = [
        'savePic' => ['build','floor','pic'],
    ];

}