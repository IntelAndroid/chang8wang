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

