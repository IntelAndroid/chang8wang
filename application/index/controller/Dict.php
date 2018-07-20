<?php
namespace app\index\controller;

use app\common\controller\Common;
use think\Controller;
use think\Log;
use think\Db;
header("Access-Control-Allow-Origin: *");
class Dict extends  Common
{
    /*
     * 获取字典表数据 8001*  测试接口
     */
    public function sysDict(){
        try {
            $con=['code' => ['like', '8001%'], 'level' => 2];
            $parents = getDataList('sysDict',$con, 'id,name,code,level');
            if ($parents['code']==0){
                throw new \think\Exception('获取字典失败'.$parents['msg']);
            }
            return json($parents["data"]);
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>'0','msg'=>$e->getMessage(),'data'=>[]);
        }
    }

    /***
     *
     */
    function saveDict()
    {
        $data=input("request.");
        if(!empty($data["id"])){
            $msg=saveData("sysDict",$data);
        }else{
            $code=$data["code"];
            if(!empty($code)){
                $mcode=getField("sysDict",array("code"=>['like',$code.'%'],'level'=>2),"max(code) as code");
                if(!empty($mcode)){
                    $data["code"]=$mcode+1;
                    return saveData("sysDict",$data);
                }else{
                    return array('code'=>'0','msg'=>"参数错误",'data'=>[]);
                }

            }else{
                return array('code'=>'0','msg'=>"参数错误",'data'=>[]);
            }
        }

        return $msg;
    }

    /***
     *
     */
    function deleteDict($id=0)
    {
        if(!empty($id)){
            $msg=deleteByCon("sysDict",array("id"=>$id));
            return $msg;
        }else{
            return array("code"=>0,"msg"=>"操作失败");
        }
    }

    /***
     *
     */
    function dictinfo($id=0)
    {
        if(!empty($id)){
            $msg=findById("sysDict",array("id"=>$id),"id,name,code");
            return $msg;
        }else{
            return json(array('code'=>'0','msg'=>'参数错误','data'=>[]));
        }
        
    }

}
