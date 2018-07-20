<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/1
 * Time: 15:20
 */

/**
 * excel数据获取
 * @param $template 要导入的excle文件
 * @param $cols     导入的数据表字段
 * @param $startRow 默认从第2行开始
 * @throws \PHPExcel_Exception
 */
function xlsDatahl($template,$cols,$startRow=2){
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

/**
 * 数字转换为中文
 * @param  string|integer|float  $num  目标数字
 * @param  integer $mode 模式[true:金额（默认）,false:普通数字表示]
 * @param  boolean $sim 使用小写（默认）
 * @return string
 */
function number2chinese($num,$mode = true,$sim = true){
    if(!is_numeric($num)) return '含有非数字非小数点字符！';
    $char    = $sim ? array('零','一','二','三','四','五','六','七','八','九')
        : array('零','壹','贰','叁','肆','伍','陆','柒','捌','玖');
    $unit    = $sim ? array('','十','百','千','','万','亿','兆')
        : array('','拾','佰','仟','','萬','億','兆');
    $retval  = $mode ? '楼':'点';
    //小数部分
    if(strpos($num, '.')){
        list($num,$dec) = explode('.', $num);
        $dec = strval(round($dec,2));
        if($mode){
            $retval .= "{$char[$dec['0']]}角{$char[$dec['1']]}分";
        }else{
            for($i = 0,$c = strlen($dec);$i < $c;$i++) {
                $retval .= $char[$dec[$i]];
            }
        }
    }
    //整数部分
    $str = $mode ? strrev(intval($num)) : strrev($num);
    for($i = 0,$c = strlen($str);$i < $c;$i++) {
        $out[$i] = $char[$str[$i]];
        if($mode){
            $out[$i] .= $str[$i] != '0'? $unit[$i%4] : '';
            if($i>1 and $str[$i]+$str[$i-1] == 0){
                $out[$i] = '';
            }
            if($i%4 == 0){
                $out[$i] .= $unit[4+floor($i/4)];
            }
        }
    }
    $retval = join('',array_reverse($out)) . $retval;
    return $retval;
}


function downfile(){
    $id=input("id");
    $fileinfoMsg=findById("sysFile",array("id"=>$id),"id,savePath,saveName");
    if($fileinfoMsg["code"]!=="1"){
        echo "error";exit;
        return $fileinfoMsg;
    }
    $fileinfo=$fileinfoMsg["data"];
    $file=$fileinfo["savePath"];
    $file = ROOT_PATH.'/public'.$file;
    if(is_file($file)){
        $length = filesize($file);
        /*$type = Fileinfo($file);
        //$showname =  ltrim(strrchr($file,'/'),'/');*/
        header("Content-Description: File Transfer");
        header('Content-Type: application/force-download');
        header('Content-Length:' . $length);
        if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) { //for IE
            header('Content-Disposition: attachment; filename="' . rawurlencode($fileinfo['saveName']) . '"');
        } else {
            header('Content-Disposition: attachment; filename="' . $fileinfo['saveName'] . '"');
        }
        readfile($file);
        exit;
    } else {
        exit('file not exstsis');
    }
}