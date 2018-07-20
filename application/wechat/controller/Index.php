<?php

namespace app\wechat\controller;

use think\Controller;
use think\Request;
use app\wechat\controller\Wxbase;
use \wechat\sdk\Jsapi;

class Index extends Wxbase
{
    public function index()
    {
        $jsapi = new Jsapi();
        // 获取签名的时候必须在当前方法中获取,要不签名会失败
        $jsConfig = $jsapi->getSignPackage();
        return view('',['sign'=>$jsConfig]);
    }
}
