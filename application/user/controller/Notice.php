<?php

namespace app\user\controller;

use app\common\controller\Common;
use think\Controller;
use think\Request;
use think\Db;

header("Access-Control-Allow-Origin: *");

class Notice extends Common
{
    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 发布公告/保存草稿(系统端和空间端)
     * @param publish   是否发布
     * @param usertype  发布对象
     * @param districtId 推送区域
     *
     */
    public function pubNotice(){
        try{
            Db::startTrans();
            $postData=input('request.',null,'trim');
            if($postData['publish']==7002001){//是否发布
                $vld=$this->validate($postData,'Notice');
            }else{
                $vld=$this->validate($postData,'Notice.draft');
            }
            if($vld===true){
                $con=[];
                $postData['source']=session('user.type');//消息来源
                if(session('user.type')==6019001){//如果是空间用户发布公告
                    $postData['iqbtId']=session('iqbtId');
                    $con['a.iqbtId']=session('iqbtId');
                }
                $res=saveData('notice',$postData);//保存公告
                if($res['code']==0){
                    throw new \think\Exception('保存失败:'.$res['msg']);
                }
                if($postData['publish']==7002001) {//如果是发布
                    /*获取所有符合条件的用户   的userid和openid*/
                    if(!empty($postData['usertype'])){//推送对象
                        $con['a.type']=$postData['usertype'];
                    }
                    if(!empty($postData['districtId'])){//推送区域
                        $con['b.districtId']=['like',$postData['districtId'].'%'];
                    }
                    $join=[['incubator b','a.iqbtId=b.id','left']];
                    $userArr=getDataList('user',$con,'a.id,a.openId','',$join);
                    if($userArr['code']==0){
                        throw new \think\Exception('获取用户列表失败:'.$userArr['msg']);
                    }
                    /*保存消息和消息记录*/
                    $postData['objId']=$res['data'];
                    unset($postData['publish']);
                    unset($postData['source']);
                    unset($postData['id']);
                    $res=saveData('msg',$postData);
                    if($res['code']==0){
                        throw new \think\Exception('保存消息失败:'.$res['msg']);
                    }
                    foreach($userArr['data'] as $k=>$v){
                        //todo:微信消息推送
                        $Rcdres=saveMsgRcd($res['data'],$v['openId'],'6024003',$v['id']);
                    }
                }
            }else{
                throw new \think\Exception($vld);
            }
            Db::commit();
            return json($res);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            Db::rollback();
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }
    /**
     * (管理端/空间端)获取我发布的公告列表
     */
    public function getNoticeList(){
        try{
            $postData=input('request.',null,'trim');
//            $field='a.id,a.addtime,a.title,a.content,a.publish,a.usertype,a.districtId,
//            sum(case when  (c.status=6024003 or c.status=6024004) then 1 else 0 end) as pushNum,
//            sum(case when   c.status=6024004 then 1 else 0 end) as readNum';
//            $join=[['msg b','a.id=b.objId','left'],['msgRcd c','b.id=c.msgId','left']];

            /*排序条件*/
            if (!empty($postData['sort'])) {
                //转化排序字段
/*                switch ($postData['sort']) {
                    case"sourceText":
                        $postData['sort'] = 'source';
                        break;
                    case"cstmstatusText":
                        $postData['sort'] = 'cstmstatus';
                        break;
                    case"realname":
                        $postData['sort'] = 'cstmstatus';
                        break;
                    default:
                        break;
                }*/
                if (!empty($postData['order'])) {
                    $order = 'a.' . $postData['sort'] . ' ' . $postData['order'];
                } else {
                    $order = 'a.' . $postData['sort'] . ' asc';
                }
            } else {
                $order='a.addtime desc';//默认排序
            }
            /*分页条件*/
            $limit = !empty($postData["limit"]) ? $postData["limit"] : '';
            $offset = !empty($postData["offset"]) ? $postData["offset"] : '';
            /*查询条件*/
            $con=['a.adduserId'=>session('userId')];
            if(!empty($postData['title'])){//标题
                $con['a.title']=['like','%'.$postData['title'].'%'];
            }
            if(!empty($postData['status'])){//状态
                $con['a.publish']=$postData['status'];
            }
            /*获取公告列表*/
            $field='a.id,a.addtime,a.title,a.content,a.publish,a.usertype,a.districtId';
//            $res=getDataList('notice',$con,$field,$order,$join,'c.msgId',$limit,$offset);
            $res=getDataList('notice',$con,$field,$order,[],'',$limit,$offset);
            if($res['code']==0){
                throw new \think\Exception('获取公告列表失败:'.$res['msg']);
            }
//            dump($res);
            /*求出推送和已读人数*/
            $numField='sum(case when  (c.status=6024003 or c.status=6024004) then 1 else 0 end) as pushNum,
           sum(case when   c.status=6024004 then 1 else 0 end) as readNum';
            $join=[['msgRcd c','a.id=c.msgId','left']];
            foreach($res['data'] as $k=>$v){
                if($v['publish']==7002001){
                    $numArr=getDataList('msg',['a.objId'=>$v['id']],$numField,'',$join,'c.msgId');
                    if($numArr['code']==0){
//                        throw new \think\Exception('获取推送人数失败:'.$res['msg']);
                    }
//                    dump($numArr);
                    $res['data'][$k]['pushNum']=$numArr['data'][0]['pushNum'];
                    $res['data'][$k]['readNum']=$numArr['data'][0]['readNum'];
                }
            }
            if($res['code']==0){
                throw new \think\Exception('获取公告列表失败:'.$res['msg']);
            }
            /*数据处理*/
            foreach($res['data'] as $k=>$v){
                $res['data'][$k]['addtime']=date('Y:m:d H:i',$v['addtime']);//创建时间
                $districtArr=explode(',',$v['districtId']);//发布地区
                $arr=[];
                foreach($districtArr as $k2=>$v2){
                    $arr[]=['=',$v2];
                }
                $arr[]='or';
                $discon['id']=$arr;
                $disres=getDataList('region',$discon,'name');
                if($disres['code']==0){
                    throw new \think\Exception('获取发布城市失败:'.$res['msg']);
                }
                $disStr='';
                foreach($disres['data'] as $k2=>$v2){
                    $disStr.=$v2['name'].'/';
                }
                $disStr=!empty($disStr)?substr($disStr,0,-1):'全部';
                $res['data'][$k]['districtStr']=$disStr;
            }
//            dump($res);
            $total=getRecordNum('notice',$con);//总条数(bootstaptable)
//            dump($con);
            return json(array('total'=>$total,'rows'=>$res['data']));
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }

    /**
     *   获取公告详情
     * @param int $id
     * @return array|\think\response\Json
     */
    public function getNoticeInfo($id=0){
        try{
            $field='a.addtime,a.title,a.content,a.publish,a.usertype,a.districtId,
            sum(case when  (c.status=6024003 or c.status=6024004) then 1 else 0 end) as pushNum,
            sum(case when   c.status=6024004 then 1 else 0 end) as readNum';
            $join=[['msg b','a.id=b.objId','left'],['msgRcd c','b.id=c.msgId','left']];
            $res=getDataList('notice',['a.id'=>$id],$field,'',$join);//根据id获取详情
            if($res['code']==0){
                throw new \think\Exception('获取公告失败:'.$res['msg']);
            }
//            dump($res);
            /*数据处理*/
            $res['data'][0]['addtime']=date('Y:m:d H:i',$res['data'][0]['addtime']);//创建时间
//            dump($res);
            if(!empty($res['data'][0]['districtId'])) {
                $districtArr = explode(',', $res['data'][0]['districtId']);//发布地区
//            dump($districtArr);
                /*$arr=[];
                foreach($districtArr as $k2=>$v2){
                    $arr[]=['=',$v2];
                }
                $arr[]='or';
                $discon['id']=$arr;
                $disres=getDataList('region',$discon,'name');
                            if($disres['code']==0){
                    throw new \think\Exception('获取发布城市失败:'.$res['msg']);
                }
                */
                foreach ($districtArr as $k2 => $v2) {
                    $len = strlen($v2);
                    switch ($len) {
                        case'2':
                            $districtArr[$k2] = getDataList('region', ['id' => $v2], 'name')['data'][0];
                            break;
                        case'4':
                            $districtArr[$k2] = getDataList('region', ['a.id' => $v2], "concat(b.name,'/',a.name)as district", '', [['region b', 'a.parentid=b.id', 'left']])['data'][0];
                            break;
                        default:
                            $districtArr[$k2] = getDataList('region', ['a.id' => $v2], "concat(c.name,'/',b.name,'\/',a.name)as district", '', [['region b', 'a.parentid=b.id', 'left'], ['region c', 'b.parentid=c.id', 'left']])['data'][0];
                    }
                }
                $res['data'][0]['districtStr'] = $districtArr[0]['district'];
            }else{
                $res['data'][0]['districtStr'] = '全部';
            }

//            $disStr='';
//            foreach($disres['data'] as $k2=>$v2){
//                $disStr.=$v2['name'].'/';
//            }
//            $disStr=!empty($disStr)?substr($disStr,0,-1):'全部';
//            $res['data'][0]['districtStr']=$disStr;

            $res['data']=$res['data'][0];
            return json($res);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }

    /**
     *  空间管理员 和 企业获取公告列表
     *  如果是企业  传一个 source 6019001  孵化器  6019004系统管理员
     */
    public function getAllNotice(){
        try{
            $postData=input('request.',null,'trim');
            if(!empty($postData['source'])){
                $con['c.source']=$postData['source'];
                if($con['c.source']==6019001){//如果查看空间公告
                    $con['c.iqbtId']=session('iqbtId');
                }
            }
            /*分页条件*/
            $limit = !empty($postData["limit"]) ? $postData["limit"] : '';
            $offset = !empty($postData["offset"]) ? $postData["offset"] : '';
            /*公告筛选*/
         /*   $con=['usertype'=>[['=',session('user.type')],['=',''],'or']];
            $districtId=substr(session('districtId'),0,2);
            $con['districtId']=['like',$districtId.'%'];
            $res=getDataList('notice',$con,'id,title,content,addtime','',$join,'',$limit,$offset);//获取公告*/
            $con['a.userId']=session('userId');
            $join=[['msg b','a.msgId=b.id','left'],['notice c','b.objId=c.id','left']];
            $res=getDataList('msgRcd',$con,'a.status,a.id as msgId,c.id as noticeId,c.title,c.content,c.addtime','a.status asc,a.addtime desc',$join,'',$limit,$offset);
            if($res['code']==0){
                throw new \think\Exception('获取公告失败:'.$res['msg']);
            }
            /*数据处理*/
            foreach($res['data'] as $k=>$v) {
                $res['data'][$k]['addtime'] = date('Y:m:d H:i', $v['addtime']);//创建时间
            }
//            dump($res);
            return json($res);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }

    /**
     * 更改公告状态为已读消息
     * @param int $id
     * @param string $openId
     * @return \think\response\Json
     */
    public function readNotice($id=0,$openId=''){
        try{
            $postData=input('request.',null,'trim');
            $postData['status']=6024004;
            $res=saveData('msgRcd',$postData);
            if($res['code']==0){
                throw new \think\Exception('已读操作失败:'.$res['msg']);
            }
            return json($res);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }

    /**
     * 删除公告
     * @param int $id
     */
    public function deleteNotice($id=0){
        try{
            $res=deleteData('notice',$id,'删除公告');
            if($res['code']==0){
                throw new \think\Exception('删除公告失败:'.$res['msg']);
            }
            return json($res);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }

    /**
     *获取未读公告数量
     *
     */
    public function getUnreadNum(){
        try{
            $con['a.userId']=session('userId');
            $con['a.status']=6024003;
            $join=[['msg b','b.id=a.msgId','left'],['notice c','b.objId=c.id','left']];
            $field='c.id,count(c.id)as unReadNum';
            $res=getDataList('msgRcd',$con,$field,'',$join);
            if($res['code']==0){
                throw new \think\Exception('获取公告失败:'.$res['msg']);
            }
            return json($res['data'][0]['unReadNum']);
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return json(array('code'=>0,'msg'=>$e->getMessage()));
        }
    }
}