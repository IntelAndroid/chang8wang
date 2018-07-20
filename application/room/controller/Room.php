<?php
namespace app\room\controller;
use app\common\model\Room as roomModel;
use app\common\controller\Common;
use think\Controller;
use think\Db;
class Room extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        $this->roomModel = new roomModel();
        $type=session('user.type');
        if($type!=6019001){
            $this->redirect(url('/index/index/index'));
        }
        //nav
        $this->assign("nav", 'room');
    }
    // 获取房间数据
    public function roomList()
    {
        return model('room')->getAllRooms();
    }
    // 导出 房间
    public function exportRooms()
    {
        return model("room")->export();
    }
    // 房间类型、单价、装修
    public function getType()
    {
        $res = $this->roomModel->getDic('6011,6010,6009,7002');
        return $res;
    }
    
    // 添加房间保存-可能多个
    public function roomAddSave()
    {
        Db::startTrans();
        try{
            // 多个房间数组
        	$data = input("list/a",null,'trim'); //echo '<pre>';print_r($data);echo '</pre>';exit();
            if (!empty($data)) {
                // 楼座-楼层-房间号
                $defaultRoom = array();
                foreach ($data as $k => $v) {
                    $line = $k+1;
                    if(isset($v['status'])){
                        $vali = $this->validate($data[$k], 'Room.insertself');
                    }else {
                        $vali = $this->validate($data[$k], 'Room.insert');
                    }
                    if ($vali !== true) {
                        if(strpos($vali,'第')===false) {
                            $msg = '第 ' . $line . ' 行: ' . $vali;
                            throw new \think\Exception($msg);
                        }else{
                            throw new \think\Exception($vali);
                        }
                    }
                    // 判断添加的所有条数中有没有重复的房间号
                    if(in_array($v['buildName'].'-'.$v['floor'].'-'.$v['roomNo'],$defaultRoom)){
                        $msg = '第 '.$line.' 行: '.$v['roomNo'].' 房间号重复';
                        throw new \think\Exception($msg);
                    }
                    $defaultRoom[] = $v['buildName'].'-'.$v['floor'].'-'.$v['roomNo'];
                }
                foreach ($data as $k => $v) {
                    $result = $this->roomModel->addRoom($data[$k]);
                    if($result['code'] == 0){
                        throw new \think\Exception('房间新增失败'.$result['msg']);
                    }
                }
                Db::commit();
                return $result;
            } else {
                throw new \think\Exception('没有可以保存的房间');
            }
        }catch(\Exception $e){
            c_Log($e);
            Db::rollback();
            return ['code'=>0,'msg'=>$e->getMessage()];
        }
    }
    
    // -me 添加房间保存(弹窗)
    public function roomAddSaveNew()
    {
    	Db::startTrans();
    	try{
    		// 多个房间数组   list/a?
    		$data = input("list/a",null,'trim'); //echo '<pre>';print_r($data);echo '</pre>';exit();
    		$con['id']=$data['buildId'];
    		$buildName=getField('build',$con,'name');
    		unset($data['buildId']);
    		$data['buildName']=$buildName;  //echo '<pre>';print_r($data);echo '</pre>';exit();
    		
    		if (!empty($data)) {
    			// 楼座-楼层-房间号
    			$defaultRoom = array();
    			//-me
    			if(isset($v['status'])){
    				$vali = $this->validate($data, 'Room.insertself');
    			}else {
//                    dump($data);
    				$vali = $this->validate($data, 'Room.insert');
    			}
    			if ($vali !== true) {
    				throw new \think\Exception($vali);
    			}
    			// 判断添加的所有条数中有没有重复的房间号
    			if(in_array($data['buildName'].'-'.$data['floor'].'-'.$data['roomNo'],$defaultRoom)){
    				$msg = '房间号重复';
    				throw new \think\Exception($msg);
    			}
    			$defaultRoom[] = $data['buildName'].'-'.$data['floor'].'-'.$data['roomNo'];
    			
    			$result=self::saveRooms($data);
    			//---
    			Db::commit();
    			return $result;
    		} else {
    			throw new \think\Exception('没有可以保存的房间');
    		}
    	}catch(\Exception $e){
    		c_Log($e);
    		Db::rollback();
    		return ['code'=>0,'msg'=>$e->getMessage()];
    	}
    }
    
    //-me 添加：保存
    public function saveRooms($data){
	    //多个工位号 存多条记录
    	if ($data['type']==6011003 && $data['num']>0) {//办公室（工位）-工位数
	    	//$data['roomNo']=$data['roomNos'];  //var_dump($data['roomNo']);
	    	$roomNos=$data['roomNos'];
	    	unset($data['roomNos']);
	    	
	    	$prtRoomId = $this->roomModel->addRoom($data);  //var_dump($prtRoomId); die;
	    	
	    	if ($prtRoomId['code']==1) {
	    		
	    		$selfprt= saveData('room',array("id"=>$prtRoomId['data'],'prtRoomId'=>$prtRoomId['data']),"设置房间prtRoomId");
	    		if($selfprt["code"]!=='1'){
	    			throw new \think\Exception($selfprt["msg"]);
	    		}
	    		
	    		$arr=explode(',', $roomNos); //var_dump($arr);
	    		$newArr=array();
	    		foreach ($arr as $k=>$v){
	    			$newArr[$k]['roomNo']=$v;  //工位编号
	    			$newArr[$k]['prtRoomId']=$prtRoomId['data'];
	    			if (isset($data['buildName'])) {$newArr[$k]['buildName']=$data['buildName'];} //楼座
	    			if (isset($data['floor']))  {$newArr[$k]['floor']=$data['floor'];}   //楼层
	    			if (isset($data['type']))   {$newArr[$k]['type']=$data['type'];}     //房间类型
	    			if (isset($data['area']))   {$newArr[$k]['area']=$data['area'];}
	    			if (isset($data['num']))    {$newArr[$k]['num']=$data['num'];}
	    			if (isset($data['price']))  {$newArr[$k]['price']=$data['price'];}
	    			if (isset($data['unit']))   {$newArr[$k]['unit']=$data['unit'];}
	    			if (isset($data['total']))  {$newArr[$k]['total']=$data['total'];}
	    			if (isset($data['dection'])){$newArr[$k]['dection']=$data['dection'];}
	    			if (isset($data['status'])) {$newArr[$k]['status']=$data['status'];}
	    		}
	    		//var_dump($newArr);die;
	    		foreach ($newArr as $k1=>$v2){
	    			$result = $this->roomModel->addRoom($v2);
	    			if($result['code'] == 0){
	    				throw new \think\Exception('房间新增失败'.$result['msg']);
	    			}
	    		}
	    		return $result;
	    	}else{
	    		throw new \think\Exception('房间新增失败'.$prtRoomId['msg']);
	    	}
	    }else{
	    	unset($data['roomNos']);
	    	
	    	$result = $this->roomModel->addRoom($data);
	    	if($result['code'] == 0){
	    		throw new \think\Exception('房间新增失败'.$result['msg']);
	    	}else{
	    		$selfprt= saveData('room',array("id"=>$result['data'],'prtRoomId'=>$result['data']),"设置房间prtRoomId"); //var_dump($selfprt);die;
	    		if($selfprt["code"]!=='1'){
	    			throw new \think\Exception($selfprt["msg"]);
	    		}else{
	    			return $result;
	    		}
	    	}
	    }
	}
    
    
    // 获取一条房间信息
    public function getRoomInfo()
    {
        $id = input("id");
        return model("room")->getOne($id);
    }

    // 保存-编辑房间
    public function saveRoom()
    {
        try {
            $isSelf = false;
            $data = input("post.",null,'trim');  //echo '<pre>';print_r($data);echo '</pre>'; 
            
            $con['id']=$data['buildId'];
            $buildName=getField('build',$con,'name');
            //unset($data['buildId']);  //编辑保存需要 buildId
            $data['buildName']=$buildName;  //echo '<pre>';print_r($data);echo '</pre>';exit();
            
            if(is_numeric($data['price'])) {
                $data['price'] = $data['price'] * 100 / 100;
            }
            if(is_numeric($data['total'])) {
                $data['total'] = $data['total'] * 100 / 100;
            }
            if (isset($data['status'])) {
                $isSelf = true;
                $roomVali = $this->validate($data, 'Room.editself');//自用校验
            }else {
                $roomVali = $this->validate($data, 'Room.edit');//非自用校验
            }
            if ($roomVali === true) {
                Db::startTrans();
                // 当状态不为0  20180323 0923 新增获取当前房间的floorId 为了去替换掉会议室的floorId
                $cur = findById('room', ['id' => $data['id']], 'status,etprsId,floorId');
                //判断房间原状态是否为空闲
                if(empty($cur['data']['status'])||$cur['data']['status']==3){
                    /*// 是否存在分配记录
                    $logCon['roomId'] = $data['id'];
                    $record = findById("RoomRcd", $logCon, 'id');
                    if (isset($record['data']) && $record['data']) {
                        throw new \think\Exception('此房间存在分配记录,不可修改楼座/楼层/房间编号');
                    }*/
                    //如果原房间为空闲,可以修改楼座楼层,判断是否新增楼座楼层
                    $build=findById('build', ['name' => $data['buildName']], 'id');
                    if($build['code']==0){//没有该楼座的话
                        $buildres = saveData('build',['name' => $data['buildName'],'iqbtId'=>$data['iqbtId']]);//新增楼座
                        if($buildres['code']==0){
                            throw new \think\Exception('新增楼座失败:'.$buildres['msg']);
                        }
                        $floorres = saveData('floor',['floor' => $data['floor'],'buildId'=>$buildres['data'],'iqbtId'=>$data['iqbtId']]);//新增楼层
                        if($floorres['code']==0){
                            throw new \think\Exception('新增楼层失败:'.$floorres['msg']);
                        }
                        $oldfloorId=$data['floorId'];
                        $oldbuildId=$data['buildId'];
                        $data['floorId']=$floorres['data'];
                        $data['buildId']=$buildres['data'];
                        
                        //dump($data);
                        //-me 办公室(工位) +工位数量
                        isset($data['status'])?$data['status']:$data['status']=0;
                        if ($data['type']==6011003 && $data['num']>0) {
                        	$res=self::editRooms($data); //--me
                        }else{
                        	unset($data['roomNos']);//-me
                        	unset($data['buildName']);
                        	unset($data['floor']);
                        	$res = saveData('room', $data); //dump($res);
                        	if($res['code'] == 0){
                        		throw new \think\Exception('房间编辑失败:'.$res['msg']);
                        	}
                        }
                        //---
                        
/*                         unset($data['buildName']);
                        unset($data['floor']); 
                        $res = saveData('room',$data);//新增房间 */
                        // 20180323 0925 新增 当修改了楼座楼层需要把会议室的信息也修改
                        saveDataByCon('mtroom',['buildId'=>$buildres['data'],'floorId'=>$floorres['data']],['floorId'=>$cur['data']['floorId']]);
                        // 会议室修改完毕
                        if($res['code']==0){
                            throw new \think\Exception('新增房间失败266:'.$res['msg']);
                        }
                        // 写入日志
                        $logRes = saveLog('6012020','编辑房间信息',$res['data'],'room',session("user.etprsId"));
                        if($logRes['code'] == 0){
                            throw new \think\Exception('编辑房间信息-日志记录失败');
                        }
                        //原楼层是否只有这一个房间
                        $roomlist=getDataList('room', ['floorId' =>$oldfloorId], 'id');
                        if($roomlist['code']==0){
                            throw new \think\Exception('获取原楼层房间列表失败:'.$roomlist['msg']);
                        }
                        if (empty($roomlist['data'])) {
                            // 删除楼层
                            deleteData('floor', $oldfloorId);
                            //原楼座是否只有这一个楼层
                            $floorlist=getDataList('floor', ['buildId' =>$oldbuildId], 'id');
                            if($floorlist['code']==0){
                                throw new \think\Exception('获取原楼座楼层列表失败:'.$floorlist['msg']);
                            }
                            if (empty($floorlist['data'])) {
                                // 删除楼座
                                deleteData('build', $oldbuildId);
                            }
                        }
                    }else{
                        //楼座存在,判断楼层是否存在
                        $floorId=findById('floor', ['buildId'=>$build['data']['id'],'floor' => $data['floor']], 'id');
                        if($floorId['code']==0) {//没有该楼层的话,新增楼层
                            $floorres = saveData('floor',['floor' => $data['floor'],'buildId'=>$build['data']['id'],'iqbtId'=>$data['iqbtId']]);//新增楼层
                            if($floorres['code']==0){
                                throw new \think\Exception('新增楼层失败:'.$floorres['msg']);
                            }
                            $oldfloorId=$data['floorId'];
                            $oldbuildId=$data['buildId'];
                            $data['floorId']=$floorres['data'];
                            $data['buildId']=$build['data']['id'];
                            
                            //dump($data);
                            //-me 办公室(工位) +工位数量
                            isset($data['status'])?$data['status']:$data['status']=0;
                            if ($data['type']==6011003 && $data['num']>0) {
                            	$res=self::editRooms($data); //--me
                            }else{
                            	unset($data['roomNos']);//-me
                            	unset($data['buildName']);
                            	unset($data['floor']);
                            	$res = saveData('room', $data); //dump($res);
                            	if($res['code'] == 0){
                            		throw new \think\Exception('房间编辑失败:'.$res['msg']);
                            	}
                            }
                            //---
                            
/*                             unset($data['buildName']);
                            unset($data['floor']); 
                            $res = saveData('room',$data);//新增房间 */
                            // 20180323 0925 新增 当修改了楼座楼层需要把会议室的信息也修改
                            saveDataByCon('mtroom',['floorId'=>$floorres['data']],['buildId'=>$build['data']['id'],'floorId'=>$oldfloorId]);
                            // 会议室修改完毕
                            if($res['code']==0){
                                throw new \think\Exception('新增房间失败311:'.$res['msg']);
                            }
                            // 写入日志
                            $logRes = saveLog('6012020','编辑房间信息',$res['data'],'room',session("user.etprsId"));
                            if($logRes['code'] == 0){
                                throw new \think\Exception('编辑房间信息-日志记录失败');
                            }
                            //原楼层是否只有这一个房间
                            $roomlist=getDataList('room', ['floorId' => $oldfloorId], 'id');
                            if($roomlist['code']==0){
                                throw new \think\Exception('获取原楼层房间列表失败:'.$roomlist['msg']);
                            }
                            if (empty($roomlist['data'])) {
                                // 删除楼层
                                deleteData('floor', $oldfloorId);
                                //原楼座是否只有这一个楼层
                                $floorlist=getDataList('floor', ['buildId' => $oldbuildId], 'id');
                                if($floorlist['code']==0){
                                    throw new \think\Exception('获取原楼座楼层列表失败:'.$floorlist['msg']);
                                }
                                if (empty($floorlist['data'])) {
                                    // 删除楼座
                                    deleteData('build', $oldbuildId);
                                }
                            }
                        }else{
                            //楼座楼层都存在
                            $oldfloorId=$data['floorId'];
                            $oldbuildId=$data['buildId'];
                            $data['floorId']=$floorId['data']['id'];
                            $data['buildId']=$build['data']['id'];
                            
                            //dump($data);
                            //-me 办公室(工位) +工位数量
                            isset($data['status'])?$data['status']:$data['status']=0;
                            if ($data['type']==6011003 && $data['num']>0) {
                            	$res=self::editRooms($data); //--me
                            }else{
                            	unset($data['roomNos']);//-me
                            	unset($data['buildName']);
                            	unset($data['floor']);
                            	$res = saveData('room', $data); //dump($res);
                            	if($res['code'] == 0){
                            		throw new \think\Exception('房间编辑失败:'.$res['msg']);
                            	} 
                            }
                            //---
/*                             unset($data['buildName']);
                            unset($data['floor']);
                            $res = saveData('room', $data); //dump($res);
                            if($res['code'] == 0){
                            	throw new \think\Exception('房间编辑失败1:'.$res['msg']);
                            }  */
                            
                            //原楼层是否只有这一个房间
                            $roomlist=getDataList('room', ['floorId' => $oldfloorId], 'id');
                            if($roomlist['code']==0){
                                throw new \think\Exception('获取原楼层房间列表失败:'.$roomlist['msg']);
                            }
                            if (empty($roomlist['data'])) {
                                // 删除楼层
                                deleteData('floor', $oldfloorId);
                                //原楼座是否只有这一个楼层
                                $floorlist=getDataList('floor', ['buildId' => $oldbuildId], 'id');
                                if($floorlist['code']==0){
                                    throw new \think\Exception('获取原楼座楼层列表失败:'.$floorlist['msg']);
                                }
                                if (empty($floorlist['data'])) {
                                    // 删除楼座
                                    deleteData('build', $oldbuildId);
                                }
                            }
                            // 写入日志
                            $logRes = saveLog('6012020','编辑房间信息',$res['data'],'room',session("user.etprsId"));
                            if($logRes['code'] == 0){
                                throw new \think\Exception('编辑房间信息-日志记录失败');
                            }
                        }
                    }
                }else{
                    //房间非空闲
                    if ($isSelf && $cur['data']['etprsId']){
                        return array('code' => 0, 'msg' => '此房间正在使用,不可置为自用');
                    }
                    /*if(empty($data['status'])){
                        $data['status'] = 0;
                    }*/
                    unset($data['roomNos']);//-me
                    unset($data['buildName']);
                    unset($data['floor']); 
                    $res = saveData('room', $data);
                    if($res['code'] == 0){
                        throw new \think\Exception('房间编辑失败:'.$res['msg']);
                    }
                    // 写入日志
                    $logRes = saveLog('6012020','编辑房间信息',$res['data'],'room',session("user.etprsId"));
                    if($logRes['code'] == 0){
                        throw new \think\Exception('编辑房间信息-日志记录失败');
                    }
                }
            }else{
                return array('code' => 0, 'msg' => $roomVali);
            }
            Db::commit();
            return $res;
        } catch (\Exception $e) {
            c_Log($e);
            Db::rollback();
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }
    
    //-me 编辑：保存调用  
    public function editRooms($data){
    	//dump($data);
    	$roomNos=$data['roomNos'];
    	$roomNosArr=explode(',', $roomNos); //echo '<pre>';print_r($roomNosArr);echo '</pre>';
    	
    	unset($data['roomNos']);
    	$buildName=$data['buildName'];
    	unset($data['buildName']);
    	$floor=$data['floor'];
    	unset($data['floor']);
    	
    	$newNum=$data['num'];  //新填写的工位数量
    	
    	//修改房间编号
    	$oRes = saveData('room', $data);  //dump($oRes);
    	//echo '<pre>';print_r($data);echo '</pre>';exit();
    	//修改工位号
    	if ($oRes['code']==1){
    		$prtRoomId=$oRes['data'];$floorId=$data['floorId']; $buildId=$data['buildId'];
    		//办公室 工位   二位：索引+关联
    		$roomIdArr=db::query("select id,status,roomNo from ibt_room where buildId=$buildId and floorId=$floorId and prtRoomId=$prtRoomId and id<>$prtRoomId and isDelete=0"); 
    		$oldNum=count($roomIdArr); //echo $oldNum.' ';
    		//echo  '<pre>';print_r($roomIdArr);echo '</pre>';  exit;
    		
    		if ($roomIdArr) {
    			//echo '<pre>';print_r($roomIdArr);echo '</pre>';//exit;
    			$roomNostatus1=array();$roomNostatus2=array();
    			foreach ($roomIdArr as $k2=>$v2){
    				if ($v2['status']==1){
    					$roomNostatus1[]=$v2['roomNo'];
    				}
    				if ($v2['status']==2){
    					$roomNostatus2[]=$v2['roomNo'];
    				}
    			}
    			//var_dump($result);
    			//echo '<pre>';print_r($roomNostatus1);echo '</pre>';
    			
    			if ($roomNostatus1) {
    				$strRoomNos1=implode(',',$roomNostatus1);   //echo $strRoomNos;
    				throw new \think\Exception('房间'.$strRoomNos1.'已占用！');
    			}
    			
    			if ($roomNostatus2) {
    				$strRoomNos2=implode(',',$roomNostatus2);   //echo $strRoomNos;
    				throw new \think\Exception('房间'.$strRoomNos2.'已入驻！');
    			}
    			
    			//编辑工位数量 大于 原来的数量
    			if ($newNum>$oldNum) {
    				foreach($roomIdArr as $k=>$v){
    					foreach($roomNosArr as $k1=>$v1){
    						if($k==$k1){
    							//echo $v['id'].' ';  //room.id
    							//echo $v1.' ';       //roomNo  工位号
    							$data['id']=$v['id'];
    							$data['roomNo']=$v1;
    							$oRes1 = saveData('room', $data);
    							if ($oRes1['code']==0) {
    								throw new \think\Exception('房间编辑失败:'.$oRes['msg']);;
    							}
    						}
    					}
    				}
    				//return $oRes1;
    				$arr=explode(',', $roomNos); //var_dump($arr);exit;
    				$newArr=array();
    				foreach ($arr as $k=>$v){
    					if ($k>=$oldNum) {
    						$newArr[$k]['roomNo']=$v;  //工位编号
    						$newArr[$k]['prtRoomId']=$prtRoomId;
    						$newArr[$k]['buildName']=$buildName; //楼座
    						$newArr[$k]['floor']=$floor; //楼层
    						if (isset($data['type']))   {$newArr[$k]['type']=$data['type'];}     //房间类型
    						if (isset($data['area']))   {$newArr[$k]['area']=$data['area'];}
    						if (isset($data['num']))    {$newArr[$k]['num']=$data['num'];}
    						if (isset($data['price']))  {$newArr[$k]['price']=$data['price'];}
    						if (isset($data['unit']))   {$newArr[$k]['unit']=$data['unit'];}
    						if (isset($data['total']))  {$newArr[$k]['total']=$data['total'];}
    						if (isset($data['dection'])){$newArr[$k]['dection']=$data['dection'];}
    						if (isset($data['status'])) {$newArr[$k]['status']=$data['status'];}
    					}
    				}
    				//var_dump($newArr);die;
    				foreach ($newArr as $k1=>$v2){
    					$result = $this->roomModel->addRoom($v2);
    					if($result['code'] == 0){
    						throw new \think\Exception('房间新增失败'.$result['msg']);
    					}
    				}
    				return $result;
    			}
    			
    			//编辑工位数量 小于 原来的数量
    			if ($newNum<$oldNum) {
    				foreach($roomIdArr as $k=>$v){
    					if($v['status']==0 && $k >= count($roomNosArr)){
    						$result = deleteData('room', $v['id']);
    						if ($result['code']==0) {
    							throw new \think\Exception('房间编辑失败！（删除）');
    						}
    					}
    					foreach($roomNosArr as $k1=>$v1){
    						if($k==$k1 && $v['status']==0){
    							//echo $v['id'].' ';  //room.id
    							//echo $v1.' ';       //roomNo  工位号
    							$data['id']=$v['id'];
    							$data['roomNo']=$v1;
    							$oRes1 = saveData('room', $data);
    							if ($oRes1['code']==0) {
    								throw new \think\Exception('房间编辑失败:'.$oRes['msg']);;
    							}
    						}
    					}
    				}
    				return $oRes1;
    			}
    			
    			//编辑工位数量 = 原来的数量
    			foreach($roomIdArr as $k2=>$v2){
    					$data['id']=$v2['id'];
    					$data['roomNo']=$v2['roomNo'];
    					$oRes2 = saveData('room', $data);
    					if ($oRes2['code']==0) {
    						throw new \think\Exception('房间编辑失败:'.$oRes2['msg']);;
    					}
    			}
    			return $oRes2;
    			//echo '---------';exit;
    		}else{  //编辑 新增工位
    			//var_dump($data);
    			$arr=explode(',', $roomNos); //var_dump($arr);
    			$newArr=array();
    			foreach ($arr as $k=>$v){
    				$newArr[$k]['roomNo']=$v;  //工位编号
    				$newArr[$k]['prtRoomId']=$prtRoomId;
    				$newArr[$k]['buildName']=$buildName; //楼座
    				$newArr[$k]['floor']=$floor; //楼层
    				if (isset($data['type']))   {$newArr[$k]['type']=$data['type'];}     //房间类型
    				if (isset($data['area']))   {$newArr[$k]['area']=$data['area'];}
    				if (isset($data['num']))    {$newArr[$k]['num']=$data['num'];}
    				if (isset($data['price']))  {$newArr[$k]['price']=$data['price'];}
    				if (isset($data['unit']))   {$newArr[$k]['unit']=$data['unit'];}
    				if (isset($data['total']))  {$newArr[$k]['total']=$data['total'];}
    				if (isset($data['dection'])){$newArr[$k]['dection']=$data['dection'];}
    				if (isset($data['status'])) {$newArr[$k]['status']=$data['status'];}
    			}
    			//var_dump($newArr);die;
    			foreach ($newArr as $k1=>$v2){
    				$result = $this->roomModel->addRoom($v2);
    				if($result['code'] == 0){
    					throw new \think\Exception('房间新增失败'.$result['msg']);
    				}
    			}
    			return $result;
    		}
    	}else{
    		throw new \think\Exception('房间编辑失败:'.$oRes['msg']);
    	}
    }
    
    // 添加房间图片
    public function saveRoomPic()
    {
        return model("room")->saveRoomPic();
    }
    // 删除房间
    public function delRoom()
    {
        return model("room")->removeOne();
    }
    // 上传楼层布局图
    public function buildLayout()
    {
        try {
            $data = input("post.", '', 'trim');
            $valiRes = $this->validate($data, 'Build.savePic');
            if ($valiRes === true) {
                $picData['id'] = $data['floor'];
                $picData['pic'] = $data['pic'];
                return saveData("floor", $picData);
            }
            return array('code' => 0, 'msg' => $valiRes);
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }
    // 获取某个房间图片信息
    public function getAllPic()
    {
        try{
            $id = input("id/d");
            $pics = getField('room',array('id'=>$id),'roomPics');
            if($pics){
                $result['code'] = 1;
                $result['str'] = $pics;
                $pics = explode(",",$pics);
                $path = array();
                foreach ($pics as $fId)
                {
                    $file = getField('SysFile',array('id'=>$fId),'savePath');
                    if(is_file(ROOT_PATH.'/public'.$file)){
                        $cur['img']  = $file;
                        $cur['id'] = $fId;
                        $path[] = $cur;
                    }
                }
                $result['path'] = $path;
            }else{
                $result['code'] = 1;
                $result['str'] = '';
                $result['path'] = null;
            }
            return $result;
        }catch(\Exception $e){
            c_Log($e);
            return array('code'=>0,'msg'=>$e->getMessage());
        }
    }
    //系统管理员roominfo
    function roominfo($id=0){
        if(!empty($id)) {
            $this->assign('iqbtId',$id);
            }
        return view();
    }
    /**
     * 获取楼座列表  及楼座下房间信息
     * @author  ljj
     *
     */
    public function getBuildlist(){
        try{
            $con['a.iqbtId']=session('iqbtId');
            $join=[['sysFile b','a.pic=b.id','left'],['room c','c.buildId=a.id and c.isDelete=0','left']];
            $field='a.id,a.name,a.pic,b.savePath
            ,sum(case when c.type=6011001 then 1 else 0 end) as roomNum
            ,sum(case when c.status=0 and c.type=6011001 then 1 else 0 end) as freeroomNum
            ,sum(case when c.type=6011002 then 1 else 0 end) as cubicleNum
            ,sum(case when c.status=0 and c.type=6011002 then 1 else 0 end) as freecubicleNum
            ';
            $res=getDataList('build',$con,$field,'',$join,'a.id');
            if($res['code']==0){
                throw new \think\Exception($res['msg']);
            }
            foreach ($res['data'] as $k=>$v){
                $res['data'][$k]['savePath']=is_file(ROOT_PATH.'public/'.$v['savePath'])?$v['savePath']:'';//检测楼座图片是否存在
            }
            /*楼座信息*/
            $data=getDataList('room',['iqbtId'=>session('iqbtId')],'sum(area) as totalarea,sum(case when status =0 then area else 0 end) as freearea,sum(case when status =0 then area else 0 end)/sum(area) as freeRate');
            $data['data'][0]['buildNum']=count($res['data']);//总数
            $data['data'][0]['totalarea']=($data['data'][0]['totalarea']*100/100).'㎡';//总面积
            $data['data'][0]['freearea']=($data['data'][0]['freearea']*100/100).'㎡';//空闲面积
            $data['data'][0]['freeRate']=round($data['data'][0]['freeRate']*100,2).'%';//空闲率
            $res['total']['data']=$data['data'][0];
            return json($res);
        }catch (\Exception $e){
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }

    /**
     *新增楼座
     * @author  ljj
     */
    public function addBuild(){
        try{
            $postData=input('request.',null,'trim');
            $postData['iqbtId']=session('iqbtId');
            if(empty($postData['name'])){
                throw new \think\Exception('楼座名称不能为空');
            }
            $con=['iqbtId'=>session('iqbtId'),'name'=>$postData['name']];
            if(!empty($postData['id'])){
                $con['id']=['<>',$postData['id']];
            }
            //检查楼座名是否已存在
            $res=findById('build',$con,'id');
            if(!empty($res['data'])){
                throw new \think\Exception('该楼座名已存在,请重新填写');
            }
            //保存楼座
            $res=saveData('Build',$postData);
            if($res['code']==0){
                throw new \think\Exception($res['msg']);
            }
            return $res;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }
    /**
     * 保存(删除)楼座图片
     * @author  ljj
     * @id   楼座id
     * @pic   图片id  删除时为空
     */
    public function saveBuildPic(){
        try{
            $postData=input('request.',null,'trim');
            $res=saveData('build',$postData);//保存图片信息
            if($res['code']==0){
                throw new \think\Exception($res['msg']);
            }
        }catch (\Exception $e) {
            //记录事务
            c_Log($e);
        }
    }
    /**
     * 检索楼座
     * @author  ljj
     * @name   楼座名称
     *
     */
    public function searchBuild()
    {
        try {
            $name = input("name", '');
            $condition = array();
            if (!empty($name)) {
                $con['name'] = ['like', "%$name%"];
                $list = getDataList('build', $condition,'id,name', 'a.addtime');
                if($list['code']==0){
                    throw new \think\Exception('检索失败'.$list['msg']);
                }
//                dump($list);
                return json($list);
            }
            return json(array('code' => 0, 'msg' => '没有相关客户数据'));
        } catch (\Exception $e) {
            c_Log($e);
            return array('code' => 0, 'msg' => $e->getMessage());
        }
    }

    /**
     * 获取图形化数据
     * @author  ljj
     * @name   楼座名称
     *
     */
    public function getChartData()
    {
        try {
           $chart=[];
            /*价格趋势分析*/
            //todo:产品说待定
            /*均价*/
            $res=getDataList('room',['iqbtId'=>session('iqbtId')],'avg(total) as avg,type','',[],'type');
            if($res['code']==0){
                throw new \think\Exception('均价数据获取失败'.$res['msg']);
            }
            foreach($res['data'] as $k=>$v){
                $res['data'][$k]['avg']=round($v['avg']).'元/月';
            }
            $chart['avg']=$res['data'];
            /*面积统计*/
            $res=getDataList('room',['iqbtId'=>session('iqbtId')],'sum(area)as area,status','',[],'status');//各状态房间面积
            if($res['code']==0){
                throw new \think\Exception('均价数据获取失败'.$res['msg']);
            }
            $total=getField('room',['iqbtId'=>session('iqbtId')],'sum(area)as totalarea');//总面积
            $res['data'][]=$total;
            $chart['area']=$res['data'];
            /*入驻情况柱形图*/
            $join=[['build b','a.buildId=b.id','left']];
            $field='sum(case when status=2 and type=6011001 then 1 else 0 end)as roomNum
            ,sum(case when status=2 and type=6011002 then 1 else 0 end)as cubicleNum,b.name,a.buildId';
            $res=getDataList('room',['a.iqbtId'=>session('iqbtId')],$field,'',$join,'buildId');//获取各楼座入驻情况
            if($res['code']==0){
                throw new \think\Exception('入驻情况柱形图获取失败'.$res['msg']);
            }
            $chart['enter']=$res['data'];
            /*入驻情况分析*/
            $field='sum(case when status=0 then 1 else 0 end)as freeNum
                 ,sum(case when status=1 then 1 else 0 end)as occupyNum
                 ,sum(case when status=2 then 1 else 0 end)as inuseNum
                 ,sum(case when status=3 then 1 else 0 end)as selfuseNum
                 ,b.name,a.buildId';
            $join=[['build b','a.buildId=b.id','left']];
            $res=getDataList('room',['a.iqbtId'=>session('iqbtId')],$field,'',$join,'buildId');//获取各楼座入驻情况
            if($res['code']==0){
                throw new \think\Exception('入驻情况柱形图获取失败'.$res['msg']);
            }
            $chart['roomstatus']=$res['data'];
//            dump(array('code' => 1, 'msg' => '','data'=>$chart));
            return json(array('code' => 1, 'msg' => '','data'=>$chart));
        } catch (\Exception $e) {
            c_Log($e);
            return json(array('code' => 0, 'msg' => $e->getMessage()));
        }
    }
}