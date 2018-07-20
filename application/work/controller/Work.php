<?php
namespace app\work\controller;
use think\Controller;
use think\Db;
use app\common\controller\Common;
use think\image\Exception;
use think\Log;
//header("Access-Control-Allow-Origin: *");
class Work extends Common{
	
	public function index()
	{
		//预约参观
		$data['visitCount']=self::visitCount('6024003');
		$data['visitCountFin']=self::visitCount('6024004');
		//到期提醒
		$data['endtime']=self::endtimeCount('6024003');
		$data['endtimeFin']=self::endtimeCount('6024004');
		//会议室申请  7001001:提交     7001002：通过  7001003：拒绝
		$data['mtrAplCount']=self::mtrAplCount('7001001');
		$data['mtrAplCountFin']=self::mtrAplCount('23');
		//活动申请   7001001:提交     7001002：通过  7001003：拒绝
		$data['actAplCount']=self::actAplCount('7001001');
		$data['actAplCountFin']=self::actAplCount('23');
		
		//消息中心
		$con['a.userId']=session('userId');
		$con['a.status']=6024003;
		$join=[['msg b','a.msgId=b.id','left'],['notice c','b.objId=c.id','left']];
		$res=getDataList('msgRcd',$con,'a.status,a.id as msgId,c.id as noticeId,c.title,c.content,c.addtime','a.status asc,a.addtime desc',$join);
		if($res['code']==1 && $res['data']){
			$data['noticeCount']=count($res['data']);
		}elseif($res['code']==1){
			$data['noticeCount']=0;
		}
		
		//return json($data);
		return view('',array('data'=>$data));
	}
	
	/**
	 * 预约参观
	 * $status  string 6024003 ：未读（发送成功   6024004：已读 
	 * @return  int  数量
	 */
	public function visitCount($status)
	{
		$con['a.msgType']=6012048;
		$con['b.status']=$status;
		$con['a.iqbtId'] = ['in', session('user.iqbtId')];
		$join=[['msgRcd b','a.id=b.msgId'],['iqbtVisit c','a.objId=c.id']];
		$res=getDataList('msg',$con,"c.addtime,c.name,c.contact,c.mobile",$order="c.addtime desc",$join);
		if ($res['code']==1 && $res['data']) {
			$tzcount=count($res['data']);
			return $tzcount;
		}else{
			$tzcount=0;
			return $tzcount;
		}
	}
	
	/**
	 * 到期提醒
	 * $status  string 6024003 ：未读（发送成功   6024004：已读
	 * @return  int  数量
	 */
	public function endtimeCount($status)
	{
		//到期提醒   ibt_msg.msgType  6012056
		$con['msgType']=6012056;
		$con['b.status']=$status;
		$join=[['msgRcd b','a.id=b.msgId']];
		$res=getDataList('msg',$con,'b.*',array(),$join); //var_dump($res);
		if ($res['code']==1 && $res['data']) {
			$tzcount=count($res['data']);
			return $tzcount;
		}else{
			$tzcount=0;
			return $tzcount;
		}
	}
	
	/**
	 * 会议室申请
	 * $status  string    7001001:提交     7001002：通过  7001003：拒绝
	 * @return  int  数量
	 */
	public function mtrAplCount($status)
	{
		//会议室申请  已提交
		if ($status==7001001){
			$conMt['b.status']=$status;          
			$conMt['b.endtime']=['>',time()];    
		}else{
			$conMt['b.status']=array('<>','7001001');
		}
		$conMt['a.iqbtId'] = ['in', session('user.iqbtId')];
		//echo '<pre>';print_r($conMt);echo '</pre>';exit();
		$join=[['mtroomApl b','b.mtroomId=a.id']];
		$res=getDataList('mtroom',$conMt,"b.id,b.name",$order='',$join); //var_dump($res);die;
		if ($res['code']==1 && $res['data']) {
			$tzcount=count($res['data']);
			return $tzcount;
		}else{
			$tzcount=0;
			return $tzcount;
		}
	}
	
	/**
	 * 活动申请
	 * $status  string     7001001:提交     7001002：通过  7001003：拒绝
	 * @return  int  数量
	 */
	public function actAplCount($status)
	{
		//活动申请
		if ($status==7001001){
			$conAct['b.status']=$status;          //var_dump(conMt);
			$conAct['a.endtime']=['>',time()];    //var_dump(conMt);
		}else{
			$conAct['b.status']=array('<>','7001001');
		}
		$conAct['a.iqbtId'] = ['in', session('user.iqbtId')];
		$join=[['activityApl b','b.actId=a.id']];
		$Msg=getDataList('activity',$conAct,"b.id,b.name",$order="",$join); //dump($Msg);die;
		if ($Msg['code']==1 && $Msg['data']) {
			$tzcount=count($Msg['data']);
			return $tzcount;
		}else{
			$tzcount=0;
			return $tzcount;
		}
	}
	
	//预约参观 详情
	public function getVisitList()
	{
		$postData = input('');
		$status=input('status'); //dump($staus);die;
		//分页条件
		$limit = !empty($postData["limit"]) ? $postData["limit"] : '';
		$offset = !empty($postData["offset"]) ? $postData["offset"] : '';
		
  		$con['a.msgType']=6012048;
  		$con['b.status']=$status;   //var_dump($con);
  		$con['a.iqbtId'] = ['in', session('user.iqbtId')];
		$join=[['msgRcd b','a.id=b.msgId'],['iqbtVisit c','a.objId=c.id']];
		$Msg=getDataList('msg',$con,"b.id,c.addtime,c.name,c.contact,c.mobile",$order="c.addtime desc",$join,array(),$limit, $offset); 
		//var_dump($Msg);exit;
		if ($Msg['code']==1 && $Msg['data']) {
 			foreach ($Msg['data'] as $k => $v) {
				$Msg['data'][$k]["addtime"]=date("Y-m-d H:i",$Msg['data'][$k]["addtime"]);
			} 
			//数据总数
			$Msg1=getDataList('msg',$con,"c.addtime,c.name,c.contact,c.mobile",$order="c.addtime desc",$join);
			$total =count($Msg1['data']);
			//table data-side-pagination="server"  return array('total'=>$total,'rows'=>$Msg['data']);
			return array('total'=>$total,'rows'=>$Msg['data']);
		}
		return array('total'=>0,'rows'=>0);
	}
	
	//到期提醒
	public function getendtlist()
	{
		
	}
	
	//操作 -完成   改为已读
	public function dispose(){
		try{
			Db::startTrans();
			//获取多选框id
			$ids=input("id");   //var_dump($ids);die;
			$idArr=explode(",",$ids); //把字符串打散为数组： 
			
			foreach ($idArr as $k=>$v){
				$saveData['id']=$v;
				$saveData['status']=6024004;  //已读
				$res=saveData('msgRcd',$saveData); //var_dump($res);die();
				if($res['code']==0){  //$res['code']==0
					throw new \think\Exception('修改状态失败'.$res['msg']);
				}
			}
			Db::commit();
			return $res;
		}catch(\Exception $e){
			c_Log($e);
			Db::rollback();
			return array('code'=>0,'msg'=>$e->getMessage());
		}
	}

	/**
	 * 系统管理员获取参观列表
	 * @author ljj
	 * @return array
	 */
	public function getAllVisitList()
	{
		try{
			$postDate=input('request.',null,'trim');
			//查询条件
			$con=[];
			if(!empty($postDate['name'])){
				$con['b.name']=['like','%'.$postDate['name'].'%'];
			}
			//分页条件
			$limit = !empty($postData["limit"]) ? $postData["limit"] : '';
			$offset = !empty($postData["offset"]) ? $postData["offset"] : '';
			$join=[['incubator b','b.id=a.iqbtId','left']];
			$res=getDataList('iqbtVisit',$con,'a.addtime,a.name,a.contact,a.mobile,b.name as iqbtName','a.addtime desc',$join,'',$limit,$offset);
			foreach($res['data'] as $k=>$v){//数据处理
				$res['data'][$k]['addtime']=!empty($v['addtime'])?date('Y年m月d日 H:i',$v['addtime']):'';//格式化时间戳
			}
			if($res['code']==0){
				throw new \think\Exception('获取列表失败'.$res['msg']);
			}
			$total=count($res['data']);
			return array('total'=>$total,'rows'=>$res['data']);
		} catch (\Exception $e) {
		    //记录事务
		    c_Log($e);
		}
	}

	/**
	 * 系统管理员导出excel
	 *@author ljj
	 * @return array
	 */
	public function exportVisit()
	{
		try {
			$postDate=input('request.',null,'trim');
			//查询条件
			$con=[];
			$title='';
			if(!empty($postDate['name'])){
				$con['b.name']=['like','%'.$postDate['name'].'%'];
				$title=$postDate['name'];
			}
			//分页条件
			$limit = !empty($postData["limit"]) ? $postData["limit"] : '';
			$offset = !empty($postData["offset"]) ? $postData["offset"] : '';
			$join=[['incubator b','b.id=a.iqbtId','left']];
			vendor("PHPExcel");
			vendor("PHPExcel.Writer.Excel2007");
			vendor("PHPExcel.IOFactory");
			//列名
			$header = array('提交时间', '企业名称', '联系人', '联系电话','空间名称');
			$res=getDataList('iqbtVisit',$con,'a.addtime,a.name,a.contact,a.mobile,b.name as iqbtName','a.addtime desc',$join,'',$limit,$offset);
			//取出数据
			foreach($res['data'] as $k=>$v){//数据处理
				$res['data'][$k]['addtime']=!empty($v['addtime'])?date('Y年m月d日 H:i',$v['addtime']):'';//格式化时间戳
			}
			if($res['code']==0){
				throw new \think\Exception('获取列表失败'.$res['msg']);
			}
			getExcel("预约参观表_" . $title, $header, $res['data']);
		} catch (\Exception $e) {
			c_Log($e);
			return array('code' => 0, 'msg' => $e->getMessage());
		}

	}

}