<?php

namespace app\user\controller;

use app\common\controller\Common;
use think\Controller;
use think\Log;
use think\Request;
use think\Db;

header("Access-Control-Allow-Origin: *");

class Index extends Common
{
    private $curUserRoleId = null;

    public  $prevId = null;
    public  $newMenuId = null;
    public  $rankMenu = [];
    public  $roleExcept = [];
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        /*session("user", ['id' => 1, 'type' => '6019001', 'iqbtId' => 1]);*/
        // 获取当前用户的角色ID
//        $curUserRole = findById('user', ['id' => session("user.id")], 'roleId');
//        $this->curUserRoleId = $curUserRole['data']['roleId'];
    }

    public function first(){

    }

    function getsqlrlt($sql = '')
    {
        $rlt = dbcstmquery($sql);
    }

    // 获取菜单列表  数据格式参考admui
    public function menuList($roleId=-1)
    {
        $condition = [];
        try {
            // 如果是编辑用户组权限
            if($roleId==-1){
                $roleId=session("user.roleId");
            }
            if($roleId != -1){
                $roleInfo = findById('userRole',['id'=>$roleId],'menuIds');
                if($roleInfo['code'] == 0){
                    throw new \think\Exception($roleInfo['msg']);
                }
                $roleArr = explode(",",$roleInfo['data']['menuIds']);
            }
            /*switch ($this->curUserRoleId) {
                case '1'://系统维护员，显示所有菜单
                    break;
                case '2'://孵化器管理员，显示user_role表中id=2（管理员）的所有菜单
                    //获取管理员下所有menu
                    $iqbtMenus = findById('UserRole', ['a.id' => $this->curUserRoleId], 'menuIds');
                    if ($iqbtMenus['code'] == 0) {
                        throw new \think\Exception('管理员权限获取失败' . $iqbtMenus['msg']);
                    }
                    //获取tree
                    $menuArr = explode(',',$iqbtMenus['data']['menuIds']);
                    foreach($menuArr as $v){
                        if($v){
                            $pId = Db::name('UserMenu')->where(['id'=>$v])->value('parentId');
                            if(!in_array($pId,$menuArr)){
                                $menuArr[] = $pId;
                            }
                        }
                    }
                    $condition = array_merge($condition, ['a.id' => ['in', $menuArr]]);
                    break;
                case '3'://企业用户
                    break;
                default:
                    break;
            }*/

            $msg=findById("userRole",array("id"=>$roleId),"id,parentId,menuIds");
            if(!empty($msg["data"])){
                if(empty($msg["data"]["parentId"])){
                    //前四个角色
                    $condition["id"]=['in',$msg["data"]["menuIds"]];
                }else{
                    $msg2=findById("userRole",array("id"=>$msg["data"]["parentId"]),"id,parentId,menuIds");
                    if(!empty($msg2['data'])){
                        $condition["id"]=['in',$msg2["data"]["menuIds"]];
                    }else{
                        $condition["id"]=0;
                    }
                }
            }else{
                throw new \think\Exception('参数错误，' . $msg['msg']);
            }

//            Log::notice(json_encode($condition));
            $list = getDataList('UserMenu', $condition, 'id,name as text,parentId,isDelete as tenantId,level,icon,url,code as layer', 'sort desc');
            if ($list['code'] == 0) {
                throw new \think\Exception('菜单获取失败' . $list['msg']);
            }
            if($roleId != -1){
                foreach ($list['data'] as $k=>$v){
                    if(in_array($v['id'],$roleArr)){
                        $list['data'][$k]['state'] = ['selected'=>true];
                    }else{
                        $list['data'][$k]['state'] = ['selected'=>false];
                    }
                }
            }
            $result = $list['data'];
            $menu = list_to_tree($result, 'id', 'parentId', 'children', 0);

            /*$path = ROOT_PATH . '/public/data/system';
            $fileName = 'menu.json';
            if (!is_dir($path)) {
                mkdir($path, 0777, true);
            }
            file_put_contents($path . '/' . $fileName, json_encode($menu));*/
            return json($menu);
        } catch (\Exception $e) {
            c_Log($e);
            return json(['code' => 0, 'msg' => $e->getMessage()]);
        }
    }

    /***
     *
     */
    function getMenus($roleId=-1)
    {
        $condition = [];
        try {
            // 如果是编辑用户组权限
            if($roleId != -1){
                $roleInfo = findById('userRole',['id'=>$roleId],'menuIds');
                if($roleInfo['code'] == 0){
                    throw new \think\Exception($roleInfo['msg']);
                }
                $roleArr = explode(",",$roleInfo['data']['menuIds']);
            }
            switch ($this->curUserRoleId) {
                case '1'://系统维护员，显示所有菜单
                    break;
                case '2'://孵化器管理员，显示user_role表中id=2（管理员）的所有菜单
                    //获取管理员下所有menu
                    $iqbtMenus = findById('UserRole', ['a.id' => $this->curUserRoleId], 'menuIds');
                    if ($iqbtMenus['code'] == 0) {
                        throw new \think\Exception('管理员权限获取失败' . $iqbtMenus['msg']);
                    }
                    //获取tree
                    $menuArr = explode(',',$iqbtMenus['data']['menuIds']);
                    foreach($menuArr as $v){
                        if($v){
                            $pId = Db::name('UserMenu')->where(['id'=>$v])->value('parentId');
                            if(!in_array($pId,$menuArr)){
                                $menuArr[] = $pId;
                            }
                        }
                    }
                    $condition = array_merge($condition, ['a.id' => ['in', $menuArr]]);
                    break;
                case '3'://企业用户
                    break;
                default:
                    break;
            }


            $list = getDataList('UserMenu', $condition, 'id,name as text,parentId,isDelete as tenantId,level,icon,url,code as layer,desc,sort', 'sort desc');
            if ($list['code'] == 0) {
                throw new \think\Exception('菜单获取失败' . $list['msg']);
            }
            if($roleId != -1){
                foreach ($list['data'] as $k=>$v){


                    if(in_array($v['id'],$roleArr)){
                        $list['data'][$k]['state'] = ['selected'=>true];
                    }else{
                        $list['data'][$k]['state'] = ['selected'=>false];
                    }
                }
            }
            $result = $list['data'];
            for ($i = 0; $i < count($result); $i++) {
                $icon=$result[$i]["icon"];
                if(strpos($icon, "fa-") === 0){
                    $result[$i]["icon"]="fa ".$icon;
                }else{
                    $result[$i]["icon"]="icon iconfont icon-".$icon;
                }
            }
            $menu = list_to_tree($result, 'id', 'parentId', 'children', 0);
            /*$path = ROOT_PATH . '/public/data/system';
            $fileName = 'menu.json';
            if (!is_dir($path)) {
                mkdir($path, 0777, true);
            }
            file_put_contents($path . '/' . $fileName, json_encode($menu));*/
            return json($menu);
        } catch (\Exception $e) {
            c_Log($e);
            return json(['code' => 0, 'msg' => $e->getMessage()]);
        }
    }

    // 全部保存
    public function saveAllMenu(Request $request)
    {
        Db::startTrans();
        try {

            $data = $request->param('menu', null);
            $allJson = json_decode($data, true);
            $collection = $this->tree_to_list($allJson, 'children');
            foreach ($collection as $k => $v) {
                foreach($this->rankMenu as $k2=>$v2){
                    if($v['rank']-1 == $v2['rank']){
                        $v['parentId'] = $v2['menuId'];
                    }
                }
                //\think\Log::notice($v);
                //unset($v['rank']);
//                Log::notice(json_encode($v));
                $curResult = $this->saveMenu($v);
                if (!$curResult['success']) {
                    throw new \think\Exception($curResult['msg']);
                }
            }
            //\think\Log::notice($this->rankMenu);
            //throw new \think\Exception('aaaa');
            Db::commit();
            return json(['success' => true, 'msg' => '保存成功']);
        } catch (\Exception $e) {
            Db::rollback();
            c_Log($e);
            return json(['success' => false, 'msg' => $e->getMessage()]);
        }
    }

    // 把tree 格式化 二维数组
    function tree_to_list($arrTmp, $child = 'children', $parent_id = 0, &$ret = null)
    {
        foreach ($arrTmp as $k => $v) {
           $arr = array('id' => $v['id'],
                'rank'=>isset($v['rank']) ? $v['rank'] : 1,
                'code' => isset($v['layer']) ? $v['layer'] : '',
                'parentId' => $parent_id, 'name' => $v['text'],
                'url' => isset($v['url']) ? $v['url'] : '',
                'auth'=>isset($v['auth']) ? $v['auth'] : [],
                'desc' => isset($v['desc']) ? $v['desc'] : '',
//                'sort' => isset($v['sort']) ? $v['sort'] : '',
            );
            if(isset($v['sort'])){
                $arr["sort"]=$v['sort'];
            }
            if(isset($v['icon'])){
                $arr["icon"]=str_replace(['fa ','icon iconfont icon-'],"",$v['icon']);
            }
            $ret[]=$arr;
            if (!empty($v[$child])) {
                $this->tree_to_list($v[$child], $child, $parent_id, $ret);
            }
        }
        return $ret;
    }

    // 新增单个菜单
    public function saveMenu($data){
        Db::startTrans();
        try {
            if(isset($data['rank'])){
                // 存起来当前层级
                $curRank = $data['rank'];
                unset($data['rank']);
            }
            if (empty($data['id'])) {
                $logCode = '111';
                $logDesc = '新增菜单';
            } else {
                $logCode = '222';
                $logDesc = '编辑菜单';
            }
            $valiRes = $this->validate($data, 'Usermenu.insert');
            if ($valiRes !== true) {
                throw new \think\Exception($valiRes);
            }
            // 如果是admui全部保存会有这个字段
            if (!empty($data['auth'])) {
                $auth = [];
                foreach($data['auth'] as $k=>$v){
                    $auth[] = $v['id'];
                }
                unset($data['auth']);
            } else {
                $auth = null;
            }
            unset($data['auth']);
            //\think\Log::notice($auth);
            // 处理level 以及 ismenu
            if ($data['parentId'] == 0) {
                // 获取最外层最大的code
                $max = findById('UserMenu', ['parentId' => 0], 'max(code) as code');
                if ($max['code'] == 1 && !empty($max['data'])) {
                    $maxCode = intval($max['data']['code']);
                    ++$maxCode;
                    $data['code'] = '0' . $maxCode;
                } else {
                    $data['code'] = '01';
                }
                $data['level'] = 1;
                $data['ismenu'] = 1;
            } else {
                // 获取父级别level
                $parent = findById('UserMenu', ['id' => $data['parentId']], 'id,level,code');
                if ($parent['code'] == 0) {
                    throw new \think\Exception('父级菜单不存在');
                }
                //\think\Log::notice('当前新增菜单名为'.$data['name'].'父级ID为'.$data['parentId'].';父级code为'.$parent['data']['code'].';父级level为'.$parent['data']['level']);
                // 获取父级code
                $con['code'] = ['like', $parent['data']['code'] . '%'];
                $con['id'] = ['<>', $parent['data']['id']];
                $pList = getDataList('UserMenu', $con, 'level,code');
                if ($pList['code'] == 0) {
                    throw new \think\Exception($pList['msg']);
                }
                // 如果父级下没有子菜单
                if (empty($pList['data'])) {
                    $data['code'] = $parent['data']['code'] . '01';
                } else {
                    // 如果有子菜单
                    $nextStart = 0;
                    foreach ($pList['data'] as $k => $v) {
                        // 替换掉上级code 以便于排序知道下一个菜单code
                        $rugularCode = intval(str_replace($parent['data']['code'], '', $v['code']));
                        if ($rugularCode > $nextStart) {
                            $nextStart = $rugularCode;
                        }
                    }
                    ++$nextStart;
                    $data['code'] = $parent['data']['code'] . '0' . $nextStart;
                }
                $data['level'] = intval($parent['data']['level']) + 1;
                $data['ismenu'] = 0;
            }
            $result = saveData('UserMenu', $data);
            if ($result['code'] == 0) {
                throw new \think\Exception($logDesc . '失败' . $result['msg']);
            }
            $logRes = saveLog($logCode, $logDesc, $result['data'], 'UserMenu', session("user.etprsId"));
            if ($logRes['code'] == 0) {
                throw new \think\Exception('日志记录失败');
            }
            // 如果有auth字段就是admui中全部保存中的  此菜单分配给了哪些角色
            if (!empty($auth)) {
                $authList = $auth;
                // $v 是角色ID
                foreach ($authList as $k => $v) {
                    $this->roleExcept = array_merge($this->roleExcept,[$v]);
                    // 获取当前角色已有的权限
                    $exiMenuIds = findById('UserRole', ['id' => $v], 'menuIds,id');
                    if ($exiMenuIds['code'] == 0) {
                        throw new \think\Exception('要分配给的角色不存在' . $exiMenuIds['msg']);
                    }
                    $oldMenuIds = explode(",", trim($exiMenuIds['data']['menuIds']));
                    // 如果此菜单没有在此角色下 需要加入此菜单权限
                    $isUp = false;
                    if (!in_array($result['data'], $oldMenuIds)) {
                        $isUp = true;
                        $oldMenuIds[] = $result['data'];
                    }
                    if($isUp){
                        $newMenuIds = implode(',', $oldMenuIds);
                        $roleData['id'] = $exiMenuIds['data']['id'];
                        $roleData['menuIds'] = $newMenuIds;
                        $roleSave = saveData('UserRole', $roleData);
                        if ($roleSave['code'] == 0) {
                            throw new \think\Exception('角色权限更新出错' . $roleSave['msg']);
                        }
                    }
                    // 然后处理此菜单没有被分配的用户组
                    $roleList = $this->getChildRole($this->roleExcept);
                    if($roleList['code'] == 0){
                        throw new \think\Exception($roleList['msg']);
                    }
                    $roleList = $roleList['data'];
                    //\think\Log::notice($roleList);
                    // key role表ID  item 对应权限ID
                    foreach($roleList as $key=>$item){
                        $curMenu = explode(",",trim($item));
                        //\think\Log::notice($curMenu);
                        $isUpdate = false;
                        foreach($curMenu as $kId=>$mId){
                            if($mId == $result['data']){
                                \think\Log::notice($mId);
                                unset($curMenu[$kId]);
                                $isUpdate = true;
                            }
                        }
                        //\think\Log::notice($curMenu);
                        //\think\Log::notice($isUpdate);
                        if($isUpdate){
                            $upData['id'] = $key;
                            $upData['menuIds'] = implode(',',$curMenu);
                            //\think\Log::notice($upData);
                            $upRes = saveData('UserRole',$upData);
                            if($upRes['code'] == 0){
                                throw new \think\Exception('取消权限失败'.$upRes['msg']);
                            }
                        }
                    }
                }
                $this->roleExcept = [];
            }
            $result['success'] = true;
            $result['msg'] = $logDesc . '成功';
            $result['id'] = $result['data'];
            $result['layer'] = $data['code'];
            //if(empty($data['id'])){
            $result['menuId'] = $result['data'];
            $this->rankMenu[] = ['rank'=>isset($curRank) ? $curRank : 1,'menuId'=>$result['data']];
            //}
            Db::commit();
            return $result;
        } catch (\Exception $e) {
            Db::rollback();
            c_Log($e);
            return ['success' => false, 'msg' => $e->getMessage(), 'data' => []];
        }
    }

    // 获取当前管理员下属角色,只获取ID
    public function getChildRole($except=false)
    {
        try{
            $roleId = $this->curUserRoleId;
            switch ($roleId) {
                case '1'://维护员 获取level=0的角色
                    $con['level'] = 0;
                    $conp['parentId'] = 0;
                    break;
                case '2'://管理员  获取管理员下子角色
                    $con['level'] = ['<>', 0];
                    $con['parrentId'] = $roleId;
            }
            if($except){
                $con['id'] = ['not in',$except];
            }
            $list = getDataList('UserRole',$con,'id,menuIds');
            if($list['code'] == 0){
                throw new \think\Exception($list['msg']);
            }
            $idArr = [];
            foreach($list['data'] as $k=>$v){
                $idArr[$v['id']] = $v['menuIds'];
            }
            return ['code'=>1,'msg'=>'','data'=>$idArr];
        }catch(\Exception $e){
            c_Log($e);
            return ['code'=>0,'msg'=>$e->getMessage()];
        }
    }

    // 新增 编辑 菜单
    public function storeMenu(Request $request)
    {
        $data = json_decode($request->param("menu"),true);
        $regular['id'] = $data['id'];
        if(isset($data['parentId'])){
            $regular['parentId'] = $data['parentId'];
        }else{
            $regular['parentId']=0;
        }
        $regular['name'] = $data['name'];
        $regular['icon'] = str_replace(['fa ','icon iconfont icon-'],"",$data['icon']);
        $regular['auth'] = $data['auth'];
        return json($this->saveMenu($regular));
    }

    // 删除菜单
    public function deletedMenu(Request $request)
    {
        try {
            $data = $request->only(['id']);
            if (!empty($data['id'])) {
                $idArr = explode(",", $data['id']);
                foreach ($idArr as $mId) {
                    // 是否有子菜单
                    $children = findById('UserMenu', ['parentId' => $mId]);
                    if ($children['code'] == 1) {
                        throw new \think\Exception('包含子菜单,不可删除');
                    }
                }
                $delRes = deleteData('UserMenu', $data['id']);
                if ($delRes['code'] == 1) {
                    return json(['success' => true, 'msg' => '删除成功']);
                } else {
                    return json(['success' => false, 'msg' => '删除失败' . $delRes['msg']]);
                }
            }
        } catch (\Exception $e) {
            c_Log($e);
            return json(['success' => false, 'msg' => $e->getMessage()]);
        }
    }

    // 角色下对应权限返回  -1==新增角色
    public function roleData(Request $request)
    {
        $roleId = $request->param("roleId");
        return $this->menuList($roleId);
    }


    // 新增 编辑 角色************************************************
    public function storeRole(Request $request)
    {
        Db::startTrans();
        try {
            $data = $request->only(['id', 'roleName', 'roleAuth', 'roleId', 'sort', 'desc',"parentId"]);//'parentId'
            if (empty($data['roleId'])) {
                $logCode = '6012057';
                $logDesc = '新增角色';
            } else {
                if(in_array($data['roleId'],[1,2,3,4])){
                    throw new \think\Exception("当前角色不可修改");
                }
                $logCode = '6012058';
                $logDesc = '编辑角色';
            }
            $valiRes = $this->validate($data, 'Userrole.insert');
            if ($valiRes !== true) {
                throw new \think\Exception($valiRes);
            }
            // 获取当前roleId所在role表中的parentId 0是三大类不可更改的

            // 根据当前用户所在的用户组来区分level以及parentId
            // 判断当前添加人身份  添加人的身份无非就是 1 2 对应维护员 管理员
            $roleId = $this->curUserRoleId;
            // 获取当前角色下的parentId 以及level
            $curParent = findById('UserRole', ['id' => $roleId], 'parentId,level');
            if ($curParent['code'] == 0) {
                throw new \think\Exception('角色不存在' . $curParent['msg']);
            }
            // 根据当前用户所在的用户组来区分level以及parentId
            $roleData['rolename'] = $data['roleName'];
            $roleData['menuIds'] = $data['roleAuth'];
            $roleData['id'] = $data['roleId'];
            $roleData['iqbtId'] = session("user.iqbtId");
            if(!empty($data["parentId"])){
                $roleData['parentId'] = $data["parentId"];
                $roleData['level'] = intval($curParent['data']['level']) + 1;
            }
            $result = saveData('UserRole', $roleData);
            if ($result['code'] == 0) {
                throw new \think\Exception($logDesc . '失败' . $result['msg']);
            }
            $logRes = saveLog($logCode, $logDesc, $result['data'], 'UserRole', session("user.etprsId"));
            if ($logRes['code'] == 0) {
                throw new \think\Exception('日志记录失败');
            }
            $result['msg'] = $logDesc . '成功';
            $result['success'] = true;
            Db::commit();
            return json($result);
            //}else{
            throw new \think\Exception('非法请求');
            //}
        } catch (\Exception $e) {
            Db::rollback();
            c_Log($e);
            return json(['success' => false, 'msg' => $e->getMessage(), 'data' => []]);
        }
    }

    // 删除角色
    public function deleteRole(Request $request)
    {
        try {
            $data = $request->only(['roleId']);
            if (!empty($data['roleId'])) {
                $idArr = explode(",", $data['roleId']);
                foreach ($idArr as $id) {
                    if(in_array($id,[1,2,3,4])){
                        throw new \think\Exception("当前角色不可修改");
                    }
                }

                $children = getDataList('UserRole', ['parentId' => ['in', $idArr]], 'id,lock');
                if ($children['code'] == 0) {
                    throw new \think\Exception('角色信息获取失败' . $children['msg']);
                }
                if (!empty($children['data'])) {
                    throw new \think\Exception('包含子角色,不可删除');
                }
                $delRes = deleteData('UserRole', $data['roleId']);
                if ($delRes['code'] == 0) {
                    throw new \think\Exception('删除失败');
                }

                $logCode = '6012057';
                $logDesc = '新增角色';
                $logRes = saveLog($logCode, $logDesc, $data['roleId'], 'UserRole');
                return json(['success' => true, 'msg' => '删除成功']);
            }
        } catch (\Exception $e) {
            c_Log($e);
            return json(['success' => false, 'msg' => '数据不存在']);
        }
    }

    // 点击菜单数据返回 查询role  1,2,3
    public function getTop(Request $request)
    {
        try {
            $con = [];
            $type = session("user.type");
            $roleId = session("user.roleId");
            switch ($type) {
                case '6019003'://系统管理员 /获取基本角色和系统管理员下角色
                    $condition = "id=1 or parentId=1 or id=3";
                    break;
                case '6019001'://管理员  获取管理员下子角色,企业用户
                    $condition = "id=2 or parentId=2 or id=3";
                    $con=array("iqbtId"=>session("user.iqbtId"));
                    break;
                case '6019002'://企业用户
                    $condition = "id=3 or parentId=3";
                    $con=array("etprsId"=>session("user.etprsId"));
                    break;
                case '6019004'://系统维护员
                    $condition = "level=0";
                    break;
                default:
                    $condition = [];
                    break;
            }
            $menuId = $request->param('menuId');
            $isInsert = $request->param('isInsert');
            $userId=$request->param('userId');

            /*if(empty($menuId)){
                throw new \think\Exception('请选择菜单');
            }*/
            $return['success'] = true;
            $return['auth'] = [];
            $list = getDataList('UserRole', $condition, 'a.id,a.rolename as text,a.menuIds,a.isDelete as tenantId');
            if ($list['code'] == 0) {
                throw new \think\Exception('角色获取失败');
            }
            $role = $list['data'];
            foreach ($role as $k => $v) {
                if ($isInsert != -1) {
                    // 不是编辑用户
                    if ((empty($userId) || $userId == '-1') && !$menuId) {
                        //\think\Log::notice("不是编辑用户");
                        $curAuth['permission'] = false;
                    } else if ($menuId) {
                        //\think\Log::notice("这个是菜单点击事件");
                        $curMenuids = explode(",", $v['menuIds']);
                        if (in_array($menuId, $curMenuids)) {
                            $curAuth['permission'] = true;
                        } else {
                            $curAuth['permission'] = false;
                        }
                    } else {
                        // 编辑用户
                        //\think\Log::notice("编辑用户");
                        if ($v['id'] == $roleId) {
                            $curAuth['permission'] = true;
                        } else {
                            $curAuth['permission'] = false;
                        }
                    }
                } else {
                    \think\Log::notice("新增角色");
                    $curAuth['permission'] = false;
                }
                $curAuth['tenantId'] = $v['tenantId'];
                $curAuth['id'] = $v['id'];
                $curAuth['text'] = $v['text'];

                $con["roleId"]=$v['id'];
//                Log::notice(json_encode($con));
                $curAuth['total'] = getField('user', $con, 'count(id)');
                $return['auth'][] = $curAuth;
            }
            return json($return);
        } catch (\Exception $e) {
            c_Log($e);
            return json(['success' => false, 'msg' => $e->getMessage()]);
        }
    }

    // 获取角色下用户列表
    public function getRoleUser($roleId=0)
    {
        try {
            $con = [];
            if(empty($roleId)){
                if(!empty(session("iqbtId"))){
                    //孵化器下的管理员或者企业
                    /*
                     *  201	孵化器管理员	6019001
                        202	企业用户	    6019002
                        203	系统维护员	    6019003
                     */
                    if(!empty(session("user.type"))&&session("user.type")=="6019001"){
                        //孵化器管理员
                        $con["iqbtId"]=session("iqbtId");
                        $roleIds=getFieldArrry("userRole",array("id|parentId"=>['in',[2,3]]),"id");
                        if(!empty($roleIds)){
                            $con['a.roleId'] = ['in',$roleIds];
                        }
                    }else if(!empty(session("user.type"))&&session("user.type")=="6019002"){
                        //企业
                        $con['a.roleId'] = 3;
                        $con["iqbtId"]=session("iqbtId");
                        $con["etprsId"]=session("user.etprsId");
                    }else if(!empty(session("user.type"))&&session("user.type")=="6019003"){
                        //系统维护人员显示所有用户
                        $roleIds=getFieldArrry("userRole",array("id|parentId"=>1),"id");
                        if(!empty($roleIds)){
                            $con['a.roleId'] = ['in',$roleIds];
                        }
                    }else if(!empty(session("user.type"))&&session("user.type")=="6019004"){
                        //系统管理员
                        $roleIds=getFieldArrry("userRole",array("id|parentId"=>['in',[1,3]]),"id");
                        if(!empty($roleIds)){
                            $con['a.roleId'] = ['in',$roleIds];
                        }
                    }else{
                        throw new \think\Exception("参数错误~");
                    }

                }else{
                    if(!empty(session("user.type"))&&session("user.type")=="6019004"){
                        //系统维护人员显示所有用户
                        /*$roleIds=getFieldArrry("userRole",array("id|parentId"=>1),"id");
                        if(!empty($roleIds)){
                            $con['a.roleId'] = ['in',$roleIds];
                        }*/
                    }else if(!empty(session("user.type"))&&session("user.type")=="6019003"){
                        //系统管理员
                        $roleIds=getFieldArrry("userRole",array("id|parentId"=>['in',[1,3]]),"id");
                        if(!empty($roleIds)){
                            $con['a.roleId'] = ['in',$roleIds];
                        }
                    }else{
                        throw new \think\Exception("参数错误");
                    }
                }
            }else{
                if(in_array($roleId,[1,2,3,4])){
                    //所有孵化器管理员||企业用户||系统管理员
                    $roleIds=getFieldArrry("userRole",array("id|parentId"=>$roleId),"id");
                    if(!empty($roleIds)){
                        $con['a.roleId'] = ['in',$roleIds];
                    }
                    if(!empty(session("iqbtId"))){
                        $con["iqbtId"]=session("iqbtId");
                    }
                }else{
                    $con['a.roleId'] = $roleId;
                }
            }

            /*if ($roleId) {
                $con['a.roleId'] = $roleId;
            } else {
                switch ($this->curUserRoleId) {
                    case '1'://维护员
                        $con['a.roleId'] = ['in', '1,2,3'];
                        break;
                    case '2'://管理员
                        $con['a.id'] = ['<>',session('userId')];
                        // 获取管理员下子节点
                        $child = getDataList('UserRole',['parentId'=>$this->curUserRoleId],'id');
                        if($child['code'] == 0){

                        }
                        $con['a.roleId'] = $this->curUserRoleId;
                        $con['a.iqbtId'] = session('user.iqbtId');
                }
            }*/
            /*Log::notice(json_encode($con));
            $msg2 = getDataList2('user', $con, '*,a.id as userId', 'a.roleId asc,a.type desc,a.addtime desc');
            Log::notice(json_encode($msg2));*/

            /*$msg2 = getDataList2('user', $con, '*,a.id as userId', 'a.roleId asc,a.type desc,a.addtime desc');
            Log::notice(json_encode($msg2));*/
//            Log::notice(json_encode($con));

            $msg = getDataList('user', $con, '*,a.id as userId', 'a.roleId asc,a.type desc,a.addtime desc');
            if ($msg['code'] == 0) {
                throw new \think\Exception($msg['msg']);
            }
            for ($i = 0; $i < count($msg["data"]); $i++) {
                $msg['data'][$i]["addtime"]=empty($msg['data'][$i]["addtime"])?"":date("Y-m-d H:i",$msg['data'][$i]["addtime"]);
                $msg['data'][$i]["lastloginTime"]=empty($msg['data'][$i]["lastloginTime"])?"":date("Y-m-d H:i",$msg['data'][$i]["lastloginTime"]);
            }
            $tmplist=self::getDictStr("*","User");
            $msg['data']=$this->setListIdText($msg['data'],$tmplist);
            return json(['success' => true, 'data' => $msg['data']]);
        } catch (\Exception $e) {
            c_Log($e);
            return json(['success' => false, 'msg' => $e->getMessage()]);
        }
    }

    /***
     *
     */
    function resetdftpwd($userId=0)
    {
        if(!empty($userId)){
            $msg=saveData("user",array('id'=>$userId,"password"=>md5("888888")));
            if($msg["code"]==='1'){
                return json(array('code'=>'1','msg'=>'重置成功','data'=>[]));
            }else{
                return json(array('code'=>'0','msg'=>'重置失败','data'=>[]));
            }
        }else{
            return json(array('code'=>'0','msg'=>'用户不能为空','data'=>[]));
        }
    }

    // 保存用户
    public function saveUser(Request $request)
    {
        Db::startTrans();
        try {
            if ($request->isPost()) {
                $data = $request->only(['userId', 'loginName',  'roleIds', 'state','realname']);//'parentId'
                if (empty($data['userId'])) {
                    $logCode = '6012060';
                    $logDesc = '新增用户';
                } else {
                    $logCode = '6012061';
                    $logDesc = '编辑用户';
                }
                $valiRes = $this->validate($data, 'User.admuiInsert');
                if ($valiRes !== true) {
                    throw new \think\Exception($valiRes);
                }
                $regular = [];
                $regular['id'] = $data['userId'];
                $regular['name'] = $data['loginName'];
                $regular['realname'] = $data['realname'];
                $regular['roleId'] = $data['roleIds'];
                $regular['iqbtId'] = session('user.iqbtId');
                if (!empty($data['state'])) {
                    $regular['status'] = '6018003';
                } else {
                    $regular['status'] = '6018001';
                }
                if ($this->curUserRoleId == 1) {
                    $regular['type'] = '6019001';
                } else if ($this->curUserRoleId == 2) {
                    $regular['type'] = '6019001';
                }
                $result = saveData('user', $regular);
                if ($result['code'] == 0) {
                    throw new \think\Exception($logDesc . '失败' . $result['msg']);
                }
                $logRes = saveLog($logCode, $logDesc, $result['data'], 'User');
                if ($logRes['code'] == 0) {
                    throw new \think\Exception('日志记录失败');
                }
                $result['msg'] = $logDesc . '成功';
                $result['success'] = true;
                $addd = findById('user', ['id' => $result['data']], '*,a.id as userId', 'a.roleId asc,a.type desc,a.addtime desc');
                if ($addd['code'] == 0) {
                    throw new \think\Exception($addd['msg']);
                }
                $result['user'] = $addd['data'];
                Db::commit();
                return json($result);
            } else {
                throw new \think\Exception('非法请求');
            }
        } catch (\Exception $e) {
            Db::rollback();
            c_Log($e);
            return json(['success' => false, 'msg' => $e->getMessage(), 'data' => []]);
        }
    }

    // 获取用户日志信息 直接差seesion  user.id 下面的就可以
    public function getLogList()
    {
        try {
            $userId = session("user.id");
            $list = getDataList('log', ['a.adduserId' => $userId], 'a.adduserId,a.desc as type,a.addtime as logTime,a.ip as userIp,b.name as userName', 'a.addtime desc', [['user b', 'a.adduserId=b.id and b.isDelete=0', 'left']]);
            if ($list['code'] == 0) {
                throw new \think\Exception($list['msg']);
            }
            foreach ($list['data'] as $k => $v) {
                $list['data'][$k]['logTime'] = date('Y-m-d H:i', $v['logTime']);
                $addd = findById('user', ['id' => $v['adduserId']], '*,a.id as userId', 'a.roleId asc,a.type desc,a.addtime desc');
                if ($addd['code'] == 0) {
                    throw new \think\Exception($addd['msg']);
                }
                $list['data'][$k]['user'] = $addd['data'];
            }
            return json(['success' => true, 'data' => $list['data']]);
        } catch (\Exception $e) {
            c_Log($e);
            return json(['success' => false, 'msg' => $e->getMessage()]);
        }
    }

    public function menuInfo()
    {
        return view();
    }


}
