<?php
namespace app\common\validate;
use think\Validate;
use think\Db;

class Room extends Validate{
    protected $rule =   [
        'id|编辑的房间' => 'require',
        'buildName|楼座' => 'require',
        'floor|楼层' => 'require|number',
        'type|房间类型' => 'require',
        'roomNo|房间/工位编号' => 'require',//|unique:room
        'price|单价' => 'require|decimal',
        'unit|价格单位' => 'require',
        'total|月租' => 'require',
    ];

    protected $message  =   [
        'floor.require' => '楼层不能为空',
        'type.require' => '房间类型不能为空',
        'roomNo.require' => '房间/工位编号不能为空',
        'price.require' => '单价不能为空',
        'total.require' => '月租不能为空',
    ];

    protected $scene = [
        'add' => ['floor','type','roomNo','price','total'],
        'edit' => ['buildName','floor','floorid','type','roomNo'=>'require|checkAllRoom','unit','price'=>'require|decimal|notZero','total'=>'require|decimal|tnotZero'],
        'editself' => ['buildName','floorid','type','roomNo'=>'require|checkAllRoom'],
//        'insert' => ['buildName'=>'require|checkBuild','floor'=>'require|checkFloor','roomNo'=>'require|checkIqbtRoom','type','price'=>'require|decimal|notZero','unit','total'=>'require|decimal|tnotZero',],
        'insert' => ['buildName'=>'require|checkBuild','floor'=>'require|checkFloor','roomNo'=>'require|checkNewRoomNo','type','price'=>'require|decimal|notZero','unit',],
        'insertself' => ['buildName'=>'require|checkBuild','floor'=>'require|checkFloor','roomNo'=>'require|checkAllRoom','type',],
    ];
    //非0
    public function notZero($value)
    {
        if($value==0){
            return '单价不能为0';
        }
        return true;
    }
    //非0
    public function tnotZero($value)
    {
        if($value==0){
            return '月租不能为0-请检查面积和工位,至少填写一个';
        }
        return true;
    }
    // 当编辑房间时校验房间号
    public function checkIqbtRoom($value)
    {
        $buildId = findById('room',['roomNo'=>$value],'buildId,id');
        $map['buildId'] = $buildId['data']['buildId'];
        $map['roomNo'] = $value;
        $map['id'] = ['<>',$buildId['data']['id']];
        $count = Db::name("room")->where($map)->count();
        if($count > 0){
            return '房间号重复,请检查';
        }
        return true;
    }
    // 当编辑房间时校验房间号
    public function checkNewRoomNo($value)
    {
        $postData=input('request.',null,'trim');
        $buildId = findById('room',['roomNo'=>$value,'buildId'=>$postData['list']['buildId']],'buildId,id');
       if(!empty($buildId['data'])){
           return '房间号重复!';
       }
        return true;
    }

    // 新增时候校验楼座是否重复 问题是楼座名称本来就可以重复
    public function checkBuild($value)
    {
        return true;
        $iqbtStr = session('user.iqbtId');
        $map['iqbtId'] = ['in',$iqbtStr];
        $map['name'] = $value;
    }

    // 新增校验楼层  也没办法校验
    public function checkFloor($value)
    {
        return true;
        $iqbtStr = session('user.iqbtId');
        $map['iqbtId'] = ['in',$iqbtStr];
        $map['floor'] = $value;
        $cur = findById('build',$map,'id,name,floor');
        if($cur['code'] == 1 && $cur['data']){
            return $cur['data']['name']." 下已经存在 ".$value . ' 层';
        }
    }

    public function checkAllRoom($value)
    {
    	$postData = input('');  //echo '<pre>';print_r($postData);echo '</pre>';//exit();
    	
    	//-me  添加保存验证
    	if (isset($postData['list']['buildId'])) {
    		$con1['id']=$postData['list']['buildId'];
    		$buildName=getField('build',$con1,'name');
    		unset($postData['list']['buildId']);
    		$postData['list']['buildName']=$buildName;
    	}
    	// 编辑保存验证
    	if (isset($postData['buildId'])) {
    		$con1['id']=$postData['buildId'];
    		$buildName=getField('build',$con1,'name');
    		unset($postData['buildId']);
    		$postData['buildName']=$buildName;
    	}
    	//echo '<pre>';print_r($postData);echo '</pre>';//exit();
    	//---
    	
        $iqbtStr = session('user.iqbtId');
        $map['iqbtId'] = ['in',$iqbtStr];
        //判断是编辑还是新增
        if(empty($postData['list'])){
            $map['name'] = $postData['buildName'];
            $cur = findById('build', $map, 'id');
            if ($cur['code'] == 1 && $cur['data']) {
                $con['roomNo'] = $postData['roomNo'];
                $con['buildId'] = $cur['data']['id'];
                $cur = findById('room', $con, 'id');
                if ($cur['code'] == 1 && $cur['data']) {
                    if($cur['data']['id']!=$postData['id']) {
                        return ' 房间号 ' . $postData['roomNo'] . ' 重复!';
                    }
                }
            }
        }else {
        	//-me 4.26 $postData['list']  --> $postData  
        	//echo '<pre>';print_r($postData);echo '</pre>';
        	foreach ($postData as $k => $v) {
                $map['name'] = $v['buildName'];
                $cur = findById('build', $map, 'id'); //dump($cur);//die;
                if ($cur['code'] == 1 && $cur['data']) {
                    $con['roomNo'] = $v['roomNo'];
                    $con['buildId'] = $cur['data']['id'];
                    $cur = findById('room', $con, 'id'); //dump($cur);die;
                    if ($cur['code'] == 1 && $cur['data']) {
                    	return '房间号 :'.$v['roomNo'].'重复'; //-me
                        //return '第 ' . ($k + 1) . ' 行: 房间号 ' . $v['roomNo'] . ' 重复';
                    }
                }
            }
        }
        return true;
    }

}