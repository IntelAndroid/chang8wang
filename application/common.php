<?php
/**
 * Author:Lippor
 * Date:   2016年9月28日
 * Time:   上午07:18:40
 */

use think\Db;
use Hooklife\ThinkphpWechat\Wechat;

/**
 * 新增，修改记录 可以按条件修改多条记录，不局限于ID
 * @param $table 表名
 * @param $saveData 保存数据（数组）array('id'=>1,'name'=>'张三')
 * @param $con 查询条件
 * @param $comments 修改、添加备注
 * @return array() 成功. array('code'=>'1','msg'=>'修改成功','data'=>'') data保存返回ID
 */
function saveDataByCon($table, $saveData, $con = array(), $comments = "")
{
    unset($saveData["s"]);
    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }

    if (!empty($con)) {
        if (empty($saveData)) {
            return returnResult("db_info", "db_noupdate_info");
        }
        try {
            $tmptable = tptabTotable($table);
            $saveData["lastupdateTime"]=time();
            $result = Db::table($tmptable)->where($con)->update($saveData);
            if ($result !== false) {
                return returnResult("db_info", "db_edit_suc");
            } else {
                $info = returnResult("db_info", "db_edit_err");
                throw new \think\Exception($info['msg']);
            }
        } catch (\Exception $e) {
            return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
        }


    } else {
        $saveData["lastupdateTime"]=time();
        $saveData["addtime"]=time();

        if(!empty(session("userId"))){
            $saveData["adduserId"]=session("userId");
        }

        $id = db($table)->insertGetId($saveData);
        if ($id) {
            return returnResult("db_info", "db_add_suc", $id);
        } else {
            return returnResult("db_info", "db_add_err");
        }
    }
}

/**
 * 新增，修改记录 只针对一条记录
 * @param $table 表名
 * @param $saveData 保存数据（数组）array('id'=>1,'name'=>'张三')
 * @param $comments 修改、添加备注
 * @return array() 成功. array('code'=>'0','msg'=>'用户名不存在','data'=>'') data保存返回ID
 */
function saveData($table, $saveData, $comments = "")
{
    unset($saveData["s"]);
    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }

    if (!empty($saveData["id"])) {
        unset($saveData["addtime"]);
        $id = $saveData["id"];
        try {
            $tmptable = tptabTotable($table);
            $saveData["lastupdateTime"]=time();
            $result = Db::table($tmptable)->update($saveData);
            if ($result !== false) {
                return returnResult("db_info", "db_edit_suc", $id);
            } else {
                return returnResult("db_info", "db_edit_err", 0);
            }
        } catch (\Exception $e) {
            return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
        }
    } else {
        try {
            $tmptable = tptabTotable($table);
            $saveData["lastupdateTime"]=time();
            $saveData["addtime"]=time();

            if(!empty(session("userId"))){
                $saveData["adduserId"]=session("userId");
            }
            Db::table($tmptable)->insert($saveData);
            $id = Db::name($tmptable)->getLastInsID();
            if ($id) {
                return returnResult("db_info", "db_add_suc", $id);
            } else {
                return returnResult("msg_info", "db_add_err");
            }
        } catch (\Exception $e) {
            return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
        }
    }
}

/**
 * 删除数据（逻辑删除）
 * @param $table 表名
 * @param $idstr id字符串连接 如：1,3,4
 * @param $comments 操作描述
 * @return bool|int 返回修改记录条数。发生错误返回false
 */
function deleteData($table, $idstr, $comments = '')
{
    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }

    $ids = explode(",", $idstr);
    if (count($ids) > 0) {
        if (!empty($ids)) {
            $tmptable = tptabTotable($table);
            $result = Db::table($tmptable)->where(['id' => ['in', $idstr]])->update(['isDelete' => 1,'lastupdateTime'=>time()]);
            if ($result !== false) {
                return returnResult("db_info", "db_delete_suc", $result);
            }else{
                return returnResult("db_info", "db_delete_err", 0);
            }
        }
        return returnResult("db_info", "db_delete_err", 0);
    } else {
        return returnResult("db_info", "db_delete_err", 0);
    }
}

function deleteByCon($table, $arr, $comments = '')
{
    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    $tmptable = tptabTotable($table);
    $result = Db::table($tmptable)->where($arr)->update(['isDelete' => 1,'lastupdateTime'=>time()]);
    /*echo Db($table, [], false)->getLastSql();*/
//    $result2 = Db::table($tmptable)->where($arr)->select();
//    \think\Log::notice(Db($table, [], false)->getLastSql());
    if ($result !== false) {// && 0 != $result
        /*if (count($arr) > 0) {
            return returnResult("db_info", "db_delete_suc", $result);
        } else {
            return returnResult("db_info", "db_delete_err", 0);
        }*/
        return returnResult("db_info", "db_delete_suc", $result);
    }else{
        return returnResult("db_info", "db_delete_err", 0);
    }
}


/**
 * 根据ID获取一条记录
 * @param $table 表名
 * @param $con 查询条件
 * @param $field 指定查询字段字段
 * @param $isDelete 是否查询isDelete=1的
 * @return array|null 成功-array('id'=>1,'name'=>'张三')  不存在-null
 */
function findById($table, $con = array(), $field = "*", $order = "a.id asc", $join = array(), $isDelete = '0')
{
    if ($isDelete === '0') {
        $con = is_string($con) ? (empty($con) ? "a.isDelete=0" : $con . " and a.isDelete=0") : array_merge($con, array('a.isDelete' => 0));
    }
    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    try {
        $info = db($table, [], false)->alias('a')->field($field)->join($join)->where($con)->order($order)->find();
//        $tmptable=tptabTotable($table);
//        $info = Db::name($tmptable)->alias('a')->field($field)->join($join)->where($con)->order($order)->find();
        if (empty($info)) {
            return returnResult("db_info", "db_norecord_err");
        }
    } catch (\Exception $e) {
        return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
    }
    return array('code' => '1', 'msg' => '', 'data' => $info);
}

function findById2($table, $con = array(), $field = "*",$order="a.id asc",$join=array(), $isDelete = '0')
{
    if ($isDelete === '0') {
        $con = is_string($con) ? (empty($con) ? "a.isDelete=0" : $con . " and a.isDelete=0") : array_merge($con, array('a.isDelete' => 0));
    }
    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    try {
        $info = db($table)->alias('a')->field($field)->join($join)->where($con)->fetchSql(true)->find();
        echo db($table, [], false)->getLastSql();
        if (empty($info)) {
            return returnResult("db_info", "db_norecord_err");
        }
    } catch (\Exception $e) {
        return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
    }
    return array('code' => '1', 'msg' => '', 'data' => $info);
}

/**
 * 获取数据列表
 * @param $table 表名
 * @param array $con 查询条件
 * @param string $field 查询字段
 * @param string $order 查询字段
 * @param array $join 左右连接查询 $join = [ ['work w','a.id=w.artist_id'], ['card c','a.card_id=c.id']];
 * @param string $group group操作
 * @return array() 返回查询列表
 */
function getDataList($table, $con = array(), $field = "*", $order = "", $join = array(), $group = "", $limit = "100000", $offset = 0)
{
    $con = is_string($con) ? (empty($con) ? "a.isDelete=0" : $con . " and a.isDelete=0") : array_merge($con, array('a.isDelete' => 0));

    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    try {
        $result = db($table, [], false)->alias('a')
            ->field($field)
            ->join($join)
            ->group($group)
            ->where($con)
            ->order($order)
            ->limit($offset, $limit)
            ->select();
    } catch (\Exception $e) {
        return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
    }
    return array('code' => '1', 'msg' => '', 'data' => $result);
}

function getDataList2($table, $con = array(), $field = "*", $order = "", $join = array(), $group = "", $limit = "100000", $offset = 0)
{
    $con = is_string($con) ? (empty($con) ? "a.isDelete=0" : $con . " and a.isDelete=0") : array_merge($con, array('a.isDelete' => 0));

    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    try {
        $result = db($table)->alias('a')
            ->field($field)
            ->join($join)
            ->group($group)
            ->where($con)
            ->order($order)
            ->limit($limit)
            ->fetchSql(true)->select();
        //var_dump(db($table)->getLastsql());
        echo db($table)->getLastSql();
    } catch (\Exception $e) {
        return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
    }
    return array('code' => '1', 'msg' => '', 'data' => $result);
}

/***
 *
 */
function getRecordNum($table, $con = array(), $join = array())
{
    $con = is_string($con) ? (empty($con) ? "a.isDelete=0" : $con . " and a.isDelete=0") : array_merge($con, array('a.isDelete' => 0));

    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    try {
        $result = db($table)->alias('a')
            ->join($join)
            ->where($con)
            ->count();

    } catch (\Exception $e) {
        return 0;
    }
    return $result;
}

/**
 * 获取数据列表
 * @param $table 表名
 * @param array $con 查询条件
 * @param string $field 查询字段
 * @param string $order 查询字段
 * @param array $join 左右连接查询 $join = [ ['work w','a.id=w.artist_id'], ['card c','a.card_id=c.id']];
 * @param string $group group操作
 * @param int $pageNum 页数，默认1
 * @param int $pageSize 页面大小，默认30
 * @return array() 返回查询列表
 */
function getPageDataList($table, $con = array(), $field = "*", $pageNum = 1, $pageSize = 10, $order = "", $join = array(), $group = "")
{
    $startNum = ($pageNum - 1) * $pageSize;
    $con = is_string($con) ? $con . " and isDelete=0" : array_merge($con, array('isDelete' => 0));

    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    $count = 0;
    try {
        $result = db($table)
            ->field($field)
            ->join($join)
            ->group($group)
            ->where($con)
            ->order($order)
            ->limit($startNum, $pageSize)
            ->select();
        $count = db($table)->field("id")
            ->join($join)
            ->group($group)
            ->where($con)
            ->count();
    } catch (\Exception $e) {
        return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array(), 'total' => $count);
    }
    return array('code' => '1', 'msg' => '', 'data' => $result, 'total' => $count);
}

function getAppPageList($table, $con = array(), $field = "*", $pageNum = 1, $pageSize = 10, $order = "", $join = array(), $group = "")
{
    $startNum = ($pageNum - 1) * $pageSize;
    $con = is_string($con) ? $con . " and isDelete=0" : array_merge($con, array('isDelete' => 0));

    if (empty($table) || (!is_string($table))) {
        return returnResult("db_info", "db_tablename_err");
    }
    $count = 0;
    try {
        $result = db($table)
            ->field($field)
            ->join($join)
            ->group($group)
            ->where($con)
            ->order($order)
            ->limit($startNum, $pageSize)
            ->select();
    } catch (\Exception $e) {
        return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array(), 'pageSize' => $pageSize);
    }
    return array('code' => '1', 'msg' => '', 'data' => $result, 'pageSize' => $pageSize);
}

/**
 * 获取单个字段在数据库中存取值
 * @param $table 表名
 * @param $con 查询条件
 * @param $field 需要返回字段
 * @return null|string 返回空或者字段值
 */
function getField($table, $con = array(), $field = "name", $default = '', $join = [])
{
    try {
        $field = trim($field);
        $data = findById($table, $con, $field, $join);
        if ($data["code"] === '1') {
            $field = substr(" " . $field, strrpos(" " . $field, " ") + 1);
            return $data['data'][$field];
        }
    } catch (\Exception $e) {
        c_Log($e);
        return $default;
    }
    return $default;
}

function getField2($table, $con = array(), $field = "name", $default = '', $join = [])
{
    try {
        $field = trim($field);
        $data = findById2($table, $con, $field, $join);
        var_dump($data);
    } catch (\Exception $e) {
        return $default;
    }
    return $default;
}

/**
 * 获取单个字段在数据库中列表，并以一维数组返回
 * @param $table 表名
 * @param $con 查询条件
 * @param $field 需要返回字段
 * @return null|array() 返回空或者一维数组 array('1','2','3')
 */
function getFieldArrry($table, $con = array(), $field = "id", $order = "", $join = array(), $group = array())
{
    $field = trim($field);
    $list = getDataList($table, $con, $field, $order, $join, $group);
    $field = substr(" " . $field, strrpos(" " . $field, " ") + 1);
    if (strpos($field, ".")) {
        list($d, $field) = explode(".", $field);
    }
    $result = array();
    if ($list['code'] === '1') {
        foreach ($list['data'] as $obj) {
            $result[] = $obj[$field];
        }
    }
    return $result;
}

/**
 * 获取两个字段，并以key=>value形式返回
 * @param $table 表名
 * @param $fields 需要返回字段（只限两个字段，用‘,’分割）
 * @param $con 查询条件（数组）
 * @return null|array() 返回空或者k=>v数组
 */
function gethashmap($table, $con = array(), $fields = "id,name", $sequence = "")
{
    $fieldArr = explode(",", $fields);
    if ($fieldArr < 2) {
        return array();
    }
    $return = array();
    try {
        $kfield = $fieldArr[0];
        $vfield = $fieldArr[1];
        $result = getDataList($table, $con, $fields, $sequence); //dump($result);
        if ($result['code'] === '1') {
            foreach ($result["data"] as $data) {
                $return[$data[$kfield]] = $data[$vfield];
            }
        }
    } catch (\Exception $e) {
        return array('code' => '0', 'msg' => $e->getMessage(), 'data' => array());
    }
    return returnResult("global_info", "global_operate_suc", $return);
}


/**
 * 上传文件
 * @param $directory 存放目录，所有上传文件按类型分目录保存。
 * @return array data中保存files表ID
 * array (size=3)
 * 'code' => string '1' (length=1)
 * 'msg' => string '上传成功' (length=18)
 * 'data' =>string '1,2'//file表id
 */
function upload($directory = "", $extarr = array('jpg', 'JPG', 'gif', 'GIF', 'png', 'PNG', 'jpeg', 'GPEG', "xlsx", "docx", "rar", "zip", "doc", "xls", "txt", "ppt", "pptx", "pdf", "PDF"), $dftsize = 50, $ret = '', $fmt = "")
{
    $files = request()->file();
    $i = 0;
    $result = array();
    $rlt = array();
    //\think\Log::notice(json_encode($files));
    if (count($files) > 0) {
        foreach ($files as $file) {
            $data = array();
            $fileInfo = $file->getInfo();
            $fileName = $fileInfo["name"];

            $filesize = $file->getSize();
            //判断文件大小
            if ($filesize > $dftsize * 1024 * 1024) {
                return returnResult("file_info", "file_size_err");
            }
            if (false !== strpos($fileName, ".")) {
                //$name = substr($fileName,0,strrpos($fileName,"."));
                $exts = substr($fileName, strrpos($fileName, ".") + 1, strlen($fileName) - strrpos($fileName, ".") - 1);
            } else {
                $exts = "";
            }
            $filesize = $filesize / (1024 * 1024);
            //判断文件类型
            if (!empty($extarr) && !in_array($exts, $extarr)) {
                return returnResult("file_info", "file_exts_err");
            }
            $tmppath = "/files/" . $directory;
            //$tmppath = "/huizhi/developer/filerepo/videoevlt/" . $directory;
            $savename = session("userId") . "-" . time() . "-" . rand(1, 100000) . "-" . $i . "." . $exts;
            $info = $file->move(ROOT_PATH . 'public' . $tmppath, "/" . $savename);
            $i++;
            $fullpath = $info->getPathName();
            if (false !== $info) {
                $data['fileName'] = $fileName;
                $data['savePath'] = substr($fullpath, strrpos($fullpath, $tmppath));
                $data['saveName'] = $savename;
                $data['exts'] = $exts;
                $data['size'] = $filesize;
                $data['uploadUserId'] = session('userId');
                $data['uploadTime'] = date('Y-m-d H:i', time());
                $id = db('sysFile')->insertGetId($data);
                if (!empty($id)) {
                    if (empty($ret)) {
                        $result[] = $id;
                    } else {
                        $result[] = $data['savePath'];
                    }

                    if (!empty($fmt)) {
                        $rlt["id"] = $id;
                        $rlt["savepath"] = $data['savePath'];
                    }
                } else {
                    return returnResult("file_info", "file_upload_err");
                }
            } else {
                // 上传失败获取错误信息
                //\think\Log::notice("22");
                return returnResult("file_info", "file_upload_err", $file->getError());
            }
        }
    } else {
        // 上传失败获取错误信息
        //\think\Log::notice(json_encode($files));
        return returnResult("file_info", "file_upload_err", "上传失败");
    }
    if (!empty($fmt)) {
        return returnResult("file_info", "file_upload_suc", $rlt);
    } else {
        return returnResult("file_info", "file_upload_suc", join(",", $result));
    }

}


function saveActionRecord($type, $object, $objectId, $diffArr, $newData, $comments, $extra)
{
    echo "saveActionRecord";
    $data['objectType'] = $object;
    $data['actionType'] = $type;
    $data['objectId'] = $objectId;
    $data['comments'] = $comments;
    $data['extra'] = $extra;
    $data['actorId'] = session('userId');
    $data['iqbtId'] = session('iqbtId');
    $data['actTime'] = date('Y-m-d H:i', time());
    //$id = db('sysAction')->insertGetId($data);
    Db::table('ibt_sys_action')->insert($data);
    $id = Db::name('ibt_sys_action')->getLastInsID();

    if ($type === config('action_type.edit') && !empty($diffArr)) {
        saveFieldChange($id, $diffArr, $newData);
    }
    if ($id) {
        return $objectId;
    } else {
        return false;
    }
}

//保存工作日志记录
//$data ,数组，根据不同的操作菜单传递不同的数据
function saveOaLog($data = array())
{
    if (empty($data)) {
        return array('code' => 0, 'msg' => '数据不能为空');
    }
    $arr = array('iqbtId', 'isDelete', 'adduserId', 'addtime', 'etprsId', 'fmenuId', 'smenuId', 'objId', 'content');
    foreach ($data as $key => $value) {
        if (!in_array($key, $arr)) {
            return array('code' => 0, 'msg' => '数据参数错误，不存在' . $key . '键');
        }
    }
    if (!isset($data['iqbtId'])) {
        $data['iqbtId'] = session('iqbtId');
    }
    if (!isset($data['adduserId'])) {
        $data['adduserId'] = session('userId');
    }
    if (!isset($data['addtime'])) {
        $data['addtime'] = time();
    }
    $id = db('oaActionlog')->insertGetId($data);
    if ($id) {
        return array('code' => 1, 'msg' => $id);
    } else {
        return array('code' => 0, 'msg' => '保存失败');
    }
}

/**
 * 设置checkbox为选中
 * @param $options
 * @param $idGroup
 * @return returnresult
 */
function setCbxCheck($options, $idGroup)
{
    $ids = explode(",", $idGroup);
    for ($i = 0; $i < count($options); $i++) {
        $id = $options[$i]["id"];
        $options[$i]['chk'] = 0;
        if (in_array($id, $ids)) {
            $options[$i]['chk'] = 1;
        }
    }
    return $options;
}

/**
 * 根据键值返回值字符串，多个之间用,隔开
 * @param $list hash表结构结构
 * @param $ids
 * @return string
 */
function getidlistText($list, $ids)
{
    $str = "";
    $idlist = explode(",", $ids);
    foreach ($idlist as $id) {
        if (isset($list[$id])) {
            $str .= "," . $list[$id];
        }
    }
    return trim($str, ",");
}

/**
 * 把表名转为tp使用结构类型
 * @param $table
 * @return string
 */
function tableToTp($table)
{
    $retTab = "";
    if (!empty($table)) {
        $tabletemp = $table;
        $retTab = strtoupper($tabletemp[0]);
        $b = false;
        for ($i = 1; $i < strlen($tabletemp); $i++) {
            $c = $tabletemp[$i];
            if ("_" != $c) {
                if ($b) {
                    $c = strtoupper($c);
                    $b = false;
                }
                $retTab = $retTab . $c;
            } else {
                $b = true;
            }
        }
    }
    return $retTab;
}

/***
 *
 */
function tptabTotable($table = '')
{
    $retTab = "";
    if (!empty($table)) {
        $tabletemp = $table;
        $retTab = strtolower($tabletemp[0]);
        for ($i = 1; $i < strlen($tabletemp); $i++) {
            $c = $tabletemp[$i];
            if (preg_match('/^[A-Z]+$/', $c)) {
                $retTab .= "_" . strtolower($c);
            } else {
                $retTab .= $c;
            }
        }
    }
    //echo "ab".C('DB_PREFIX');
    $retTab = config('database.prefix') . $retTab;
    return $retTab;
}

//辅助处理函数
function saveFieldChange($actionId, $diffArr, $newData)
{
    if (!empty($diffArr)) {
        foreach ($diffArr as $key => $val) {
            $data['actionId'] = $actionId;
            $data['field'] = $key;
            $data['old'] = $val;
            $data['new'] = $newData[$key];
            //db('sysHistory')->insert($data);
            Db::table('ibt_sys_history')->insert($data);
        }
    }
}

function deleteActionRecord($type, $object, $objectId, $comments, $extra)
{
    $data['objectType'] = $object;
    $data['actionType'] = $type;
    $data['objectId'] = $objectId;
    $data['comments'] = $comments;
    $data['extra'] = $extra;
    $data['actorId'] = session('userId');
    $data['actTime'] = date('Y-m-d H:i', time());
    //$id = db('sysAction')->insert($data);
    $id = Db::table('ibt_sys_action')->insert($data);
    if ($id) {
        return $objectId;
    } else {
        return false;
    }
}

/**
 * 比较两个数组，返回两个数组中的不同，并将第一个数组的数据返回。
 * @param $old
 * @param $new
 * @return array
 */
function array_diff_fun($old, $new)
{
    $diffArr = Array();
    foreach ($new as $key => $val) {
        if (isset($old[$key])) {
            if ($val != $old[$key]) {
                $diffArr[$key] = $old[$key];
            }
        } else {
            $diffArr[$key] = '';
        }
    }
    return $diffArr;
}

/**
 * 组织返回结果数组
 * @param $code
 * @param $key
 * @param array $result
 * @return mixed
 */
function returnResult($code, $key, $result = array())
{
    $return = config($code . '.' . $key);
    $return['data'] = $result;
    return $return;
}


/**
 * 聚合数据短信接口
 * 请求接口返回内容
 * @param  string $url [请求的URL地址]
 * @param  string $params [请求的参数]
 * @param  int $ipost [是否采用POST形式]
 * @return  string
 */
function juhecurl($url, $params = false, $ispost = 0)
{
    $httpInfo = array();
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22');
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    if ($ispost) {
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        curl_setopt($ch, CURLOPT_URL, $url);
    } else {
        if ($params) {
            curl_setopt($ch, CURLOPT_URL, $url . '?' . $params);
        } else {
            curl_setopt($ch, CURLOPT_URL, $url);
        }
    }
    $response = curl_exec($ch);
    if ($response === FALSE) {
        //echo "cURL Error: " . curl_error($ch);
        return false;
    }
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $httpInfo = array_merge($httpInfo, curl_getinfo($ch));
    curl_close($ch);
    return $response;
}

/*
    ***聚合数据（JUHE.CN）短信API服务接口PHP请求示例源码
    ***DATE:2015-05-25
 *  * @param  mobile  手机号码
 *  @param $tpl_value 模板变量
 *  @param $tpl_id   模板ID,是在聚合数据里设置的，默认是发送验证码的模板ID
*/
function sendSms($mobile, $tpl_value = "", $tpl_id = "49048")
{
    $sendUrl = 'http://v.juhe.cn/sms/send'; //短信接口的URL
    $smsConf = array(
        'key' => 'b6cb27cf1e6f9d084a4f92c0d060a06d', //您申请的APPKEY ,在聚合数据网站查看https://www.juhe.cn/
        'mobile' => $mobile, //接受短信的用户手机号码
        'tpl_id' => $tpl_id, //您申请的短信模板ID，根据实际情况修改 31902，默认设置的发送手机验证码的模板
        'tpl_value' => $tpl_value    //您设置的模板变量，根据实际情况修改 例如'#code#=1234&#company#=聚合数据'
    );
    $content = juhecurl($sendUrl, $smsConf, 1); //请求发送短信
    if ($content) {
        $result = json_decode($content, true);
        $error_code = $result['error_code'];
        if ($error_code == 0) {
            //状态为0，说明短信发送成功,返回短信ID
            return array('code' => '1', 'msg' => '短息发送成功', 'data' => $result['result']['sid']);
        } else {
            //状态非0，说明失败
            $msg = $result['reason'];
            return array('code' => '0', 'msg' => $msg, 'data' => $error_code);
        }
    } else {
        //返回内容异常，以下可根据业务逻辑自行修改
        return array('code' => '0', 'msg' => '短息发送失败，未知原因', 'data' => '');
    }
}

/**
 * 产生随机字符串
 * @param    int $length 输出长度
 * @param    string $chars 可选的 ，默认为 0123456789
 * @return   string     字符串
 */
function get_random($length, $chars = '0123456789')
{
    $hash = '';
    $max = strlen($chars) - 1;
    for ($i = 0; $i < $length; $i++) {
        $hash .= $chars[mt_rand(0, $max)];
    }
    return $hash;
}

/**
 * 验证手机号码
 * @param $phone_mob  手机号码
 * @param $code  手机验证码
 * @param $period  验证码有效期，默认十分钟有效
 * @return bool
 */
function verifySmsCode($mobile, $code, $period = "600")
{
    $map = array(
        'mobile' => $mobile,
        'msg' => trim($code),
        'type' => 0
    );
    $smsMsg = findById('SmsLog', $map, '*', array(), '0', 'id desc');
    if (($smsMsg['code'] != "1") || (empty($smsMsg['data']))) {
        return array('code' => '0', 'msg' => '短信验证码错误', 'data' => '');
    }
    $sms_info = $smsMsg['data'];
    if (time() - $sms_info['addtime'] > $period) {
        return array('code' => '0', 'msg' => '短信验证码已过期，请重新获取', 'data' => '');
    }
    return array('code' => '1', 'msg' => '验证成功', 'data' => '验证成功');
}

/**
 * 管理员发送消息
 * @param $userId 接收人ids，可以是数组或者逗号隔开的字符串
 * @param $data  内容，包括主题、内容、时间等
 * @param string $optId 发送者ID，默认session（userId）
 */
function sendEmail($userId, $data, $optId = '')
{
    if (empty($userId)) {
        return array('code' => 0, 'msg' => '参数为空');
    }
    if (!is_array($userId)) {
        $idArr = explode(",", $userId);
    } else {
        $idArr = $userId;
    }
    if (empty($optId)) {
        $optId = session("userId");
    }
    try {
        Db::startTrans();
        foreach ($idArr as $value) {
            $data['toUserId'] = $value;
            $data['oprtUserId'] = $optId;
            if (!isset($data['iqbtId'])) {
                $data['iqbtId'] = session("iqbtId");
            }
            $msg = saveData("sysMsg", $data, "发送消息");
            if ($msg["code"] !== '1') {//出现错误
                Db::rollback();
                return $msg;
            }
        }
        Db::commit();
    } catch (\Exception $e) {
        Db::rollback();
        $msg['code'] = '0';
        $msg["msg"] = $e->getMessage();
        return $msg;
    }
    return $msg;
}

/**
 * excel文件导出
 * @param $fileName  导出文件名,
 * @param $headArr   表头数组
 * @param $data   二维数据数组
 * @param imgs array 需要导出图片的字段数组
 * @throws PHPExcel_Exception
 * @throws PHPExcel_Reader_Exception
 */
function getExcel($fileName, $headArr, $data, $imgs = array())
{
    //对数据进行检验
    if (empty($data) || !is_array($data)) {
        return array('code' => '0', 'msg' => '没有要导出的数据', 'data' => '');
    }
    //检查文件名
    if (empty($fileName)) {
        exit;
    }
    // H:i:s
    $date = date("YmdHis", time());
    $fileName .= "_{$date}.xlsx";

    //创建PHPExcel对象，注意，不能少了\
    $objPHPExcel = new \PHPExcel();
    $objProps = $objPHPExcel->getProperties();

    //第一列设置报表列头
    $key = ord("A");
    $key2 = ord("@");//@--64

    foreach ($headArr as $v) {
        if ($key > ord("Z")) {
            $key2 += 1;
            $key = ord("A");
            $colum = chr($key2) . chr($key);//超过26个字母时才会启用
        } else {
            if ($key2 >= ord("A")) {
                $colum = chr($key2) . chr($key);//超过26个字母时才会启用
            } else {
                $colum = chr($key);
            }
        }

        //  $colum = chr($key);
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
        //设置水平居中
        $objPHPExcel->setActiveSheetIndex(0)->getStyle($colum)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        //设置垂直居中
        $objPHPExcel->getActiveSheet()->getStyle($colum)->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        // 设置个表格宽度
        $objPHPExcel->getActiveSheet()->getColumnDimension($colum)->setWidth(16);
        $key += 1;
    }

    // $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(20); 单独设置某一列的宽度
    //  $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(20); 单独设置某一列的宽度

    $column = 2;
    $objActSheet = $objPHPExcel->getActiveSheet();

    foreach ($data as $key => $rows) { //行写入
        $span = ord("A");
        $span2 = ord("@");//@--64
        foreach ($rows as $keyName => $value) {// 列写入
            if ($span > ord("Z")) {
                $span2 += 1;
                $span = ord("A");
                $j = chr($key2) . chr($span);//超过26个字母时才会启用
            } else {
                if ($span2 >= ord("A")) {
                    $j = chr($span2) . chr($span);//超过26个字母时才会启用
                } else {
                    $j = chr($span);
                }
            }
            // $j = chr($span);
            $objActSheet->setCellValue($j . $column, $value);

            $span++;
        }
        $objActSheet->getRowDimension($key + 2)->setRowHeight(30);
        $column++;
    }

    $fileName = iconv("utf-8", "gb2312", $fileName);
    //重命名表
    // $objPHPExcel->getActiveSheet()->setTitle('test');
    //设置活动单指数到第一个表,所以Excel打开这是第一个表
    ob_end_clean();
    ob_start();
    $objPHPExcel->setActiveSheetIndex(0);

    header('Pragma: public');
    header('Expires: 0');
    header('Cache-Control:must-revalidate， post-check=0， pre-check=0');
    header('Content-Type:application/force-download');
    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment;filename=\"$fileName\"");
    header('Cache-Control: max-age=0');
    header('Content-Transfer-Encoding:binary');
    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save('php://output'); //文件通过浏览器下载
    exit;
}

//验证是否是手机号码
function isMobile($mobile)
{
    if (empty($mobile)) {
        return false;
    }
    if (preg_match("/^1[34578]{1}\d{9}$/", $mobile)) {
        return true;
    } else {
        return false;
    }
}

/**
 * 文件、图片由ID获取具体保存地址
 * @param string $fileArr 要查询的字段 如： array('idcardfile'=>234)
 * @return array  返回的数组  如： array('idcardfile'=>'file/default/20170809/384448484.jpg')
 */
function filePath($fileArr = '')
{
    if (!empty($fileArr)) {
        $ids = array();
        foreach ($fileArr as $key => $value) {
            if (!empty($value)) {
                $ids[] = $value;
            }
        }
        $files = array();
        if (!empty($ids)) {
            $msg = getDataList("sysFile", array("id" => array("in", $ids)), "id,savePath,fileName");
            if (!empty($msg["data"])) {
                $files = $msg["data"];
            }
        }
        $result = array();
        foreach ($fileArr as $key1 => $value1) {
            $result[$key1] = '';
            foreach ($files as $val) {
                if ($val['id'] == $value1) {
                    $result[$key1] = $val['savePath'];
                }
            }
        }
        return $result;
    } else {
        return array();
    }
}


function c_Log($e)
{
    $msg = '';
    $tmpmsg=$e->getMessage();
    if (!empty($e)) {
        $msg = "\r\n时间：" . date("Y-m-d H:i:s", time()) . "\r\n文件：" . $e->getFile() . "\r\n行-" . $e->getLine() . ":" . $e->getMessage();
    }
    if (!empty($tmpmsg) && preg_match('/[\x{4e00}-\x{9fa5}]/u', $tmpmsg) > 0) {
        trace($msg, 'notice');
    } else {
        trace($msg, 'error');
    }
}


/**
 * 阿里云最新短信发送接口
 * @author  江城子
 * @param $tplId 发送消息的模板ID，一般写在config配置文件里
 * @param $mobile 要发送的电话号码， 多个电话可以是数组或者以逗号隔开的字符串
 * @param $data  要发送的消息，格式根据模板配置，如短信验证码  data = array('code'=>'2948');
 * @return array  返回一个数组，如果code值为1，说明发送成功，如果为0，说明发送失败。
 */
function alsms($tplId, $mobile, $data)
{
    $signname = '创8网';
    if (empty($tplId)) {
        return array('code' => '0', 'msg' => '短信模板不能为空', 'data' => array());
    }
    if (empty($mobile)) {
        return array('code' => '0', 'msg' => '电话号码不能为空', 'data' => array());
    } elseif (is_array($mobile)) {
        //如果是数组，则转换成用逗号隔开的字符串
        $mobile = implode(",", $mobile);
        $mobile = trim($mobile, ",");
    } else {
        $mobile = trim($mobile);
    }
    if (empty($data)) {
        return array('code' => '0', 'msg' => '短信数据不能为空', 'data' => array());
    } else {
        //把数据处理一遍，过滤掉特殊字符 【、】、[、]
        $search = array("【", "】", "[", "]");
        $replace = array("", "", "", "");
        foreach ($data as $key => $value) {
            $data[$key] = str_replace($search, $replace, $value);
        }
    }
    import('alsmsdemo.api_demo.SmsDemo', EXTEND_PATH);
    $response = SmsDemo::sendSms($signname, $tplId, $mobile, $data, '');
    if ($response->Code == 'OK') {
        return array('code' => '1', 'msg' => '发送成功', 'data' => array());
    } else {
        //#todo  发送失败做日志记录
        return array('code' => '0', 'msg' => $response->Message, 'data' => array());
    }

}

/**
 * 获取企查查企业信息
 * @param string $name 企业名称全称
 * @return \think\response\Json
 */
function getQccData($name = '')
{
    $keyNo = '';
    $menuId = 13;  //企查查数据接口类型
    if (empty($name)) {
        return array('code' => '0', 'msg' => '企业名称不能为空', 'data' => '');
    }

    /* 'cstm_host'      => "http://test.zlhuiyun.com/",
 // 自定义：企查查key
 'cstm_qcc_key'      => "4716b59038424c4a86cfba13e26cf0d9",*/
    $key = "4716b59038424c4a86cfba13e26cf0d9";

    if (empty($menuId)) {
        return array('code' => '0', 'msg' => '接口不能为空', 'data' => []);
    }
    if (empty($name)) {
        return array('code' => '0', 'msg' => '查询条件不能为空', 'data' => []);
    }
    //校验是否在短期内校验过 ,"addtime"=>array("gt",time()-86400*30)
    $rcdmsg = findById("dataRcd", array("menuId" => $menuId, 'name' => $name, 'keyNo' => $keyNo), "id,result,addtime", array(), '0', 'a.addtime desc');
    if (empty($rcdmsg['data'])) {
//        if(empty($rcdmsg['data'])||(!empty($rcdmsg['data']["addtime"])&&intval($rcdmsg['data']["addtime"])<time()-86400*30)){
        $msg = findById("dataMenu", array("id" => $menuId), "id,url,pagesize");
        if (!empty($msg['data'])) {
            $url = $msg["data"]["url"];
            $url = str_replace(['￥name￥', '￥keyNo￥', '￥ApiKey￥'], [$name, $keyNo, $key], $url);
            if (!empty($msg['data']["pagesize"])) {
                $url .= "&pageSize=" . $msg['data']["pagesize"];
            }
            //  return array('code'=>'1','data'=>$url);
            $ret = file_get_contents($url);
            $return = json_decode($ret, true);
            //Log::notice(json_encode($return));
            if ($return["Status"] == '200') {
                if (!empty($rcdmsg["data"]["id"])) {
                    $rcd["id"] = $rcdmsg["data"]["id"];
                }
                $rcd["menuId"] = $menuId;
                $rcd["name"] = $name;
                $rcd["keyNo"] = $keyNo;
                $rcd["result"] = json_encode($return["Result"]);
                $rcd["addtime"] = time();
                $rcd["status"] = '200';
                saveData("dataRcd", $rcd, "保存企查查接口信息");

                return array('code' => '1', 'msg' => '更新成功', 'data' => $return["Result"]);
            } else {
                //Log::notice($url.":".json_encode($ret));
                return array('code' => '1', 'msg' => '暂无数据', 'data' => []);
            }
        } else {
            return array('code' => '0', 'msg' => '没有当前接口', 'data' => []);
        }
    } else {
        //Log::notice(urldecode($rcdmsg["data"]["result"]));
        //如果没有实际更新信息，code类型返回2
        return array('code' => '2', 'msg' => '已经是最新消息，无需更新', 'data' => json_decode(urldecode($rcdmsg["data"]["result"])));
    }
}


/**
 * 操作日志记录
 * @param string $code  日志代码，对应字典表
 * @param string $desc  日志描述
 * @param string $rcdId 对应操作记录ID
 * @param string $table 对应操作记录表
 * @return array        通用返回格式
 */
function saveLog($code='',$desc='',$rcdId='',$table='',$etprsId=0,$privious='',$after=''){
    try{
        if(empty($code)){
            return array('code'=>'0','msg'=>'操作记录码不能为空','data'=>[]);
        }
        $ip=request()->ip();
//        \think\Log::notice(json_encode($ip));
        //保存操作日志
        $iqbtId=session("iqbtId");
        $data=array("code"=>$code,'desc'=>$desc,'rcdId'=>$rcdId,'table'=>$table,'userId'=>session("userId"),'etprsId'=>$etprsId,'iqbtId'=>$iqbtId,'privious'=>$privious,'after'=>$after,'ip'=>$ip);
        return saveData("log",$data,"更新日志");
    } catch (\Exception $e) {
        //记录事务
        c_Log($e);
        return array("code" => 0, "msg" =>$e->getMessage(),'data'=>[]);
    }
}

/**
 * excel数据获取
 * @param $template 要导入的excle文件
 * @param $cols     导入的数据表字段
 * @param $startRow 默认从第2行开始
 * @throws \PHPExcel_Exception
 */
function xlsData($template,$cols,$startRow=2){
    if(!is_file($template)){
        echo "没有文件";
        return array();
    }
    try{
        vendor("PHPExcel");
        vendor("PHPExcel.IOFactory");
        vendor("PHPExcel.RichText");
        $exts=strrchr($template,'.');
        if($exts == '.xls'){
            vendor("PHPExcel.Reader.Excel5");
            vendor("PHPExcel.Writer.Excel5");
            $PHPReader = new \PHPExcel_Reader_Excel5();
        }else if($exts == '.xlsx'){
            vendor("PHPExcel.Reader.Excel2007");
            vendor("PHPExcel.Writer.Excel2007");
            $PHPReader = new \PHPExcel_Reader_Excel2007();
        }
        $PHPExcel = $PHPReader->load($template);
        $sheet = $PHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow(); // 取得总行数
        $data=array();
        for($j = $startRow; $j <= $highestRow; $j++ ) {
            $row=array();
            for ($i=0;$i<count($cols);$i++) {
                $v = $sheet->getCellByColumnAndRow($i, $j)->getFormattedValue();
                if ($v instanceof \PHPExcel_RichText) {
                    $v = $v->__toString();
                }
                $row[$cols[$i]]=$v;
            }
            $data[]=$row;
        }
    }catch (\Exception $e){
        return array();
    }

    return $data;
}

/*
 * 裁剪图片
 * */
function cutImage()
{
    if (request()->isPost()) {
        header('Content-type:text/html;charset=utf-8');
        $base64_image_content = $_POST['imgBase'];
        //将base64编码转换为图片保存
        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)) {
            $type = $result[2];
            $new_file = ROOT_PATH.'/public/files/cutimg/';
            if (!is_dir($new_file)) {
                //检查是否有该文件夹，如果没有就创建，并给予最高权限
                mkdir($new_file, 0700);
            }
            $img=time() . ".{$type}";
            $new_file = $new_file . $img;
            //将图片保存到指定的位置
            if (file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64_image_content)))) {
                // 将图片保存
                $data['fileName'] = 'cut';
                $data['savePath'] = '/files/cutimg/'.$img;
                $res = Db::name("SysFile")->insertGetId($data);
               //保存到img表
                $imgData['fileId']=$res;
                $imgData['iqbtId']=$_POST['id'];//待修改
                $imgData['isDelete']=1;
                $imgData['code']=$_POST['code'];//code
                if($res){
                    $res=saveData('iqbtImg',$imgData);
                    if($res) {
                        return $res;
                    }else{
                        return array('code'=>0,'msg'=>'图片存储失败,请重试');
                    }
                }else{
                    return array('code'=>0,'msg'=>'上传失败,请重试');
                }
            }else{
                return array('code'=>0,'msg'=>'上传失败,请重试');
            }
        }else{
            return array('code'=>0,'msg'=>'上传失败,请重试');
        }

    }
}

/***
 *
 */
function dbcstmquery($sql="")
{
    if(!empty($sql)){
        try{
            $result=Db::query($sql);
            return $result;
        } catch (\Exception $e) {
            //记录事务
            c_Log($e);
            return [];
        }
    }else{
        return [];
    }
}

/**
 * 把返回的数据集转换成Tree
 * @access public
 * @param array $list 要转换的数据集
 * @param string $pid parent标记字段
 * @param string $level level标记字段
 * @return array
 */
function list_to_tree($list, $pk='id',$pid = 'pid',$child = '_child',$root=0) {
    // 创建Tree
    $tree = array();
    if(is_array($list)) {
        // 创建基于主键的数组引用
        $refer = array();
        foreach ($list as $key => $data) {
            $refer[$data[$pk]] =& $list[$key];
        }
        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId = $data[$pid];
            if ($root == $parentId) {
                // 等于
                $tree[] =& $list[$key];
            }else{
                if (isset($refer[$parentId])) {
                    $parent =& $refer[$parentId];
                    $parent[$child][] =& $list[$key];
                }
            }
        }
    }
    return $tree;
}

/**use Hooklife\ThinkphpWechat\Wechat;
 * 模板消息
 * @param $openId  openid      string(单个openid)
 * @param $templateId  模板ID
 * @param $wxurl    点击跳转链接
 * @param $wxdata   模板内容  注意：和模板的详细内容对应
 * @return array() 成功：array('code'=>1,'msg'=>'发送成功'); 失败：array('code'=>0,'msg'=>$e->getMessage());
 */
function wxMessage($openId,$templateId,$wxdata,$wxurl='http://tool.chuang8wang.com/'){
	try{
		if (empty($openId)) {return array('code'=>0,'msg'=>'openid为空');}
		if (empty($templateId)) {return array('code'=>0,'msg'=>'模板ID为空');}
		if (empty($wxdata)) {return array('code'=>0,'msg'=>'模板内容为空');}
		
		if ($openId) {
			//文档：$notice = $app->notice;
			$notice =  Wechat::notice();
			$result = $notice->uses($templateId)->withUrl($wxurl)->andData($wxdata)->andReceiver($openId)->send();
			return array('code'=>1,'msg'=>'发送成功');
			//echo '<pre>';print_r($result);echo '</pre>';
		}else{
			return array('code'=>0,'msg'=>'发送失败，数据表中无openid');
		}
	}catch(\Exception $e){
		c_Log($e);
		return array('code'=>0,'msg'=>$e->getMessage());
	}
}

/**
 * 审核注册申请   审核结果
 * @param $openId  openid   string(单个openid)
 * @param $name     注册人
 * @param $mobile   注册号码
 * @param $first    小标题        管理员： 审核注册提醒！  申请人：注册提醒！                                         结果：审核通过！    拒绝！
 * @param $remark   描述            管理员： 请尽快登录系统审核。    申请人：申请成功，请等待审核。      结果：注册申请审核通过。    注册申请审核不通过。
 * @param $RegisTime  注册时间
 * @param $titleColor 小标题颜色  默认灰色
 * @param $wxurl    跳转链接  默认创8网址
 * @return array() 成功：array('code'=>1,'msg'=>'发送成功'); 失败：array('code'=>0,'msg'=>$e->getMessage());
 */
function auditRegis($openId,$name,$mobile,$first,$remark,$RegisTime,$titleColor='#555555',$wxurl='http://tool.chuang8wang.com/'){
	$templateId='qI52e44dWv6d2CMS98dUQsnWoPRssK4wleuTWb3fuQs';
	//模板内容  注意：和模板的详细内容对应
	$wxdata = array(
			"first"    => array($first, $titleColor),
			"keyword1"   => $name,     //注册人
			"keyword2"  =>$mobile,     //注册号码
			"keyword3"  =>$RegisTime,  //注册时间
			"remark" => $remark,
	);
	return wxMessage($openId,$templateId,$wxdata,$wxurl);
}

/**
 * 试用到期提醒
 * @param $openId  openid   string(单个openid)
 * @param $mobile   注册号码
 * @param $first    小标题       到期提醒
 * @param $remark   描述           到期提醒
 * @param $ExpireTime 到期时间
 * @param $titleColor 小标题颜色  默认灰色
 * @param $wxurl    跳转链接  默认创8网址
 * @return array() 成功：array('code'=>1,'msg'=>'发送成功'); 失败：array('code'=>0,'msg'=>$e->getMessage());
 */
function userExpire($openId,$mobile,$first,$remark,$ExpireTime,$titleColor='#555555',$wxurl='http://tool.chuang8wang.com/'){
	$templateId='ugrY5Zbm6-nWPMZ2K8m_0zVGKZJaFPxhWwVzy6lCCx0';
	//模板内容  注意：和模板的详细内容对应
	$wxdata = array(
			"first"    => array($first, $titleColor),
			"keyword1"  =>$mobile,      //账号
			"keyword2"  =>$ExpireTime,  //到期时间
			"remark" => $remark,
	);
	return wxMessage($openId,$templateId,$wxdata,$wxurl);
}

/**
 * 申请审核提醒
 * @param $openId  openid   string(单个openid)
 * @param $aditType 审核类型
 * @param $first    小标题       活动申请审核
 * @param $remark   描述           会议室申请审核
 * @param $applyUser 审核申请人
 * @param $titleColor 小标题颜色  默认灰色
 * @param $wxurl    跳转链接  默认创8网址
 * @return array() 成功：array('code'=>1,'msg'=>'发送成功'); 失败：array('code'=>0,'msg'=>$e->getMessage());
 */
function applyAdit($openId,$aditType,$first,$remark,$applyUser,$titleColor='#555555',$wxurl='http://tool.chuang8wang.com/'){
	$templateId='2yF15zdgXjbmdrsCGP4O7AmBv1gWIStgTo5X_-uy-2A';
	//模板内容  注意：和模板的详细内容对应
	$wxdata = array(
			"first"    => array($first, $titleColor),
			"keyword1"  =>$aditType,      //审核类型
			"keyword2"  =>$applyUser,  //审核申请人
			"remark" => $remark,
	);
	return wxMessage($openId,$templateId,$wxdata,$wxurl);
}

/**
 * 预约处理提醒  预约参观
 * @param $openId  openid   string(单个openid)
 * @param $name    预约姓名
 * @param $first    小标题       预约参观
 * @param $remark   描述           会议室申请审核
 * @param $applyUser 审核申请人
 * @param $titleColor 小标题颜色  默认灰色
 * @param $wxurl    跳转链接  默认创8网址
 * @return array() 成功：array('code'=>1,'msg'=>'发送成功'); 失败：array('code'=>0,'msg'=>$e->getMessage());
 */
function beforeVisit($openId,$name,$mobile,$etprsName,$first,$remark,$titleColor='#555555',$wxurl='http://tool.chuang8wang.com/'){
	$templateId='O3KhEIYukl-S4IKboceaTwOMANI6veotSbrtgwNrv98';
	//模板内容  注意：和模板的详细内容对应
	$wxdata = array(
			"first"    => array($first, $titleColor),
			"keyword1"  =>$name,   //预约姓名
			"keyword2"  =>$mobile,  //预约电话
			"keyword3"  =>date('Y-m-d H:i:s',time()),   //预约时间
			"keyword4"  =>$etprsName,  //预约项目
			"remark" => $remark,
	);
	return wxMessage($openId,$templateId,$wxdata,$wxurl);
}

/**
 * 操作成功通知   已入住 续约 退出
 * @param $openId  openid   string(单个openid)
 * @param $content  内容
 * @param $first    小标题      操作成功通知
 * @param $remark   描述          操作成功通知
 * @param $titleColor 小标题颜色  默认灰色
 * @param $wxurl    跳转链接  默认创8网址
 * @return array() 成功：array('code'=>1,'msg'=>'发送成功'); 失败：array('code'=>0,'msg'=>$e->getMessage());
 */
function operationSuc($openId,$content,$first,$remark,$titleColor='#555555',$wxurl='http://tool.chuang8wang.com/'){
	$templateId='EuW1o6AcYUI7WH2McErS_xXkr6VUuTRlSbGMMiOZxPE';
	//模板内容  注意：和模板的详细内容对应
	$wxdata = array(
			"first"    => array($first, $titleColor),
			"keyword1"  =>$content,                     //内容
			"keyword2"  =>date('Y-m-d H:i:s',time()),   //创建时间
			"remark" => $remark,
	);
	return wxMessage($openId,$templateId,$wxdata,$wxurl);
}

/**
 * 升级通知  
 * @param $openId  openid   string(单个openid)
 * @param $content  升级计划
 * @param $first    小标题       系统升级通知
 * @param $remark   描述           系统升级通知
 * @param $titleColor 小标题颜色  默认灰色
 * @param $wxurl    跳转链接  默认创8网址
 * @return array() 成功：array('code'=>1,'msg'=>'发送成功'); 失败：array('code'=>0,'msg'=>$e->getMessage());
 */
function upgrade($openId,$content,$first,$remark,$titleColor='#555555',$wxurl='http://tool.chuang8wang.com/'){
	$templateId='GwUPHLuLnwYgoARWIN-JSJwuJIXrA9a-KsBtZewgVVU';
	//模板内容  注意：和模板的详细内容对应
	$wxdata = array(
			"first"    => array($first, $titleColor),
			"keyword1"  =>'符合条件用户',                  //升级用户
			"keyword2"  =>$content,                     //升级计划
			"keyword3"  =>date('Y-m-d H:i:s',time()),   //升级日期
			"remark" => $remark,
	);
	return wxMessage($openId,$templateId,$wxdata,$wxurl);
}

/**
 * 消息通知表 存数据
 * @param $id     ibt_msg_rcd  msgId varchar string(单个openid)
 * @param $openId     ibt_msg_rcd varchar string(单个openid)
 * @param $status     ibt_msg_rcd varchar 状态 字典表
 * @return array()
 */
function saveMsgRcd($id,$openId,$status,$userId=0)
{
    try {
        $msgRcdData['msgId'] = $id;
        $msgRcdData['openId'] = $openId;
        $msgRcdData['status'] = $status;
        $msgRcdData['userId'] = $userId;
        $MsgRArr = saveData('MsgRcd', $msgRcdData); //var_dump($MsgRArr);
        if (!$MsgRArr['data']) {
            throw new \think\Exception('ibt_msg_rcd添加数据失败');
        }
        return $MsgRArr;
    } catch (\Exception $e) {
        c_Log($e);
        return array('code' => 0, 'msg' => $e->getMessage());
    }
}


/**
 * 给管理端发通知 需
 * 查找所有有接受该通知权限的用户(openId)
 * @param int $menuId  菜单id
 */
function searchRoleUser($menuId=0){
    $con["concat(',',menuIds,',')"]=['like','%,'.$menuId.',%'];
    $con["b.iqbtId"]=session('user.iqbtId');//当前孵化器的管理员
    $join=[['user b','a.id=b.roleId and b.isDelete=0','left']];
    $res=getDataList('userRole',$con,'b.openId,b.name,b.id','',$join);
    if($res['code']==0){
        throw new \think\Exception('获取通知用户失败'.$res['msg']);
    }
    return $res;
}



