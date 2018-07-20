<?php
namespace app\work\controller;
use think\Controller;
use think\Db;
use app\common\controller\Common;
use think\image\Exception;
use think\Log;
//header("Access-Control-Allow-Origin: *");
class Etprsuser extends Common{
	
	/**
	 * 获取 数据中心-高频会议室数据接口(柱状图)
	 */
	public function getMtroomData(){
		try{
			$join=[['mtroom b','a.mtroomId=b.id']];
			$con=['a.adduserId'=>session('userId'),'a.status'=>7001002];
			//$total=getRecordNum('mtroomApl',$con);
			$res=getDataList('mtroomApl',$con,'count(a.id)as aplNum,a.id,b.name','',$join,'a.mtroomId'); //var_dump($res);exit;
			$data=$res['data']; $count=count($data);
			if ($res['code']==1 && $data) {
				foreach($data as $k=>$v){
					if ($k<$count && $k==0) {
						$data[$k]['color']='red';
					}elseif($k<=$count && $k==1){
						$data[$k]['color']='green';
					}elseif($k<=$count && $k==2){
						$data[$k]['color']='blue';
					}elseif($k<=$count && $k==3){
						$data[$k]['color']='yellow';
					}
				}
				//echo '<pre>';print_r($data);echo '</pre>'; //exit();
				$data1['code']=1;  $data1['msg']=''; $data1['data']=$data;
				//$data1['total']=$total;
				return json($data1);
			}else{
				$data1['code']=0;  $data1['msg']='未查到数据'; $data1['data']='';
				return json($data1);
			}
			throw new \think\Exception($res);
		} catch (\Exception $e) {
			//记录事务
			c_Log($e);
		}
	}
	
	/**
	 * 获取 数据中心-高频时间段接口(柱状图)
	 */
	public function getMtrTimeData(){
		try{
			$join=array();
			$userId=session('userId');
			$con=['adduserId'=>$userId,'status'=>7001002];
			$res=getDataList('mtroomApl',$con,'id,starttime,endtime',$order='starttime',$join);
			//echo '<pre>';print_r($res['data']);echo '</pre>'; //exit();
			if ($res['code']==1 && $res['data']){
				$res1=array();
				foreach ($res['data'] as $k=>$v){
					$res1[$k]['starttime']=date('H:i',$v['starttime']);
					$res1[$k]['endtime']=date('H:i',$v['endtime']);
					//echo $res1[$k]['endtime']-$res1[$k]['starttime'].' ';
				}
				//echo '<pre>';print_r($res1);echo '</pre>'; //exit();
				
				$arr=array();
				$a='00'; $b='00';
				$arr[]=$a.':'.$b;
				for ($i=1;$i<=48;$i++){
					$b+=30;
					if ($b==60){
						$a+=1;$b='00';
						if ($a>=1 && $a<10) {
							$a='0'.$a;
						}
						$c1=$a.':'.$b;
						$arr[]=$c1;
						//echo $c1.' ';
					}else{
						$c2=$a.':'.$b;
						//echo $c2.' ';
						$arr[]=$c2;
					}
				}
				//echo '<pre>';print_r($arr);echo '</pre>'; //exit();
				
				$newArr=array();
				$arrC=count($arr);
				foreach($arr as $k=>$v){
					foreach($res1 as $k1=>$v1){
						//echo $v1['starttime'].' '.$v1['endtime'].'/'; echo $v.' '.$arr[$k+1];exit;
						$nk=$k+1;
						if ($nk<count($arr)) {
							if ($v1['starttime']<=$v && $v1['endtime']>=$arr[$nk]) {
								//echo $v1['starttime'].' '.$v1['endtime'].'/'; echo $v.' '.$arr[$k+1];exit;
								$newArr[]=$v.'-'.$arr[$k+1];
							}
						}
					}
				}
				//echo '<pre>';print_r($newArr);echo '</pre>'; //exit();
				//统计数组中所有值出现的次数。
				$eArr=array_count_values($newArr);  //echo '<pre>';print_r($eArr);echo '</pre>'; //exit();
				$neArr=array();
				foreach ($eArr as $k=>$v){
					$neArr[][$k]=$v;//$neArr[]['color']='pink';
				}
				//echo '<pre>';print_r($neArr);echo '</pre>'; //exit();
				//+颜色 并改为关联数组
				foreach ($neArr as $k=>$v){
					foreach($v as $k1=>$v1){
						$neArr[$k]['stEn']=$k1;
						$neArr[$k]['count']=$v1;
					}
					$neArr[$k]['color']='pink';
				}
				// echo '<pre>';print_r($neArr);echo '</pre>'; exit();
				
				$data['code']=1; $data['msg']=''; $data['data']=$neArr;
				return json($data);
			}else{
				$data['code']=0; $data['msg']='未查到数据'; $data['data']='';
				return json($data);
			}
			throw new \think\Exception($res);
		} catch (\Exception $e) {
			//记录事务
			c_Log($e);
		}
	}
	
	/**
	 * 数据中心 -累计使用会议室次数接口
	 */
	public function countMt(){
		try{
			$join=array();
			$userId=session('userId');
			$con=['adduserId'=>$userId,'status'=>7001002];
			$con['endtime']=array('<',time());
			$res=getDataList('mtroomApl',$con,'id,starttime,endtime',$order='starttime',$join);
			//echo '<pre>';print_r($res);echo '</pre>';
			if ($res['code']==1 && $res['data']) {
				$count=count($res['data']); //echo  $count;
				$arr['code']=1;$arr['data']=$count;
				return json($arr);
			}elseif($res['code']==1 && !$res['data']){
				$arr['code']=0;$arr['data']=0;
				return json($arr);
			}
			throw new \think\Exception($res);
		} catch (\Exception $e) {
			//记录事务
			c_Log($e);
		}
	}
}