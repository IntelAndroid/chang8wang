$(document).ready(function () {
    // 点击添加添加行start
    var last = $('.tbody').children('tr:last')
    $('#addChlidMenu').on('click', function () {
        var tr = $(".tbody").find("tr:last-child").eq(0).html();
        var reciprocalTwo = $(".tbody").find("tr:last-child");
        if($('.tbody tr:last').find('#inputUnchecked3').prop('checked')){
            console.log( reciprocalTwo.find('#roomType option:selected').val())
             // 点击添加，添加一行
             tr = '<tr>' + tr + '</tr>';
             $('.tbody').append(tr)
             // 单价添加同上
             $('.tbody').children('tr:last').children('.inlineparent').find('.unit').children('option:first').text('同上')
             $('.tbody').children('tr:last').children('.inlineparent').find('.unit').children('option:first').attr('value', reciprocalTwo.find('#unit option:selected').val())
             // 房间类型添加同上
             $('.tbody').children('tr:last').children('.rtparent').find('#roomType').children('option:first').text('同上')
             $('.tbody').children('tr:last').children('.rtparent').find('#roomType').children('option:first').attr('value', reciprocalTwo.find('#roomType option:selected').val())
             // 房间编号循环
             $.each($('.tbody>tr'), function (i) {
                 $(this).find('p').text(i + 1)
             })
        }else if (last.find('.area').val() == '' && last.find('.num').val() == '' || last.find('.price').val() == '' || last.find('#unit').val() == '') {
                    // 办公室面积，工位个位数选其一，单价必填，单价单位必填
            toastr.error('上一条数据不完整,请重新输入')
        } else {
            // 点击添加，添加一行
            var tr = $(".tbody").find("tr:last-child").eq(0).html();
            tr = '<tr>' + tr + '</tr>';
            $('.tbody').append(tr)
            // 单价添加同上
            $('.tbody').children('tr:last').children('.inlineparent').find('.unit').children('option:first').text('同上')
            $('.tbody').children('tr:last').children('.inlineparent').find('.unit').children('option:first').attr('value', reciprocalTwo.find('#unit option:selected').val())
            // 房间类型添加同上
            $('.tbody').children('tr:last').children('.rtparent').find('#roomType').children('option:first').text('同上')
            $('.tbody').children('tr:last').children('.rtparent').find('#roomType').children('option:first').attr('value', reciprocalTwo.find('#roomType option:selected').val())
            // 房间编号循环
            $.each($('.tbody>tr'), function (i) {
                $(this).find('p').text(i + 1)
            })
        }

    })

});
// 判断办公室或者工位单位
$('body').on('change', '.area', function () {
    var area = $(event.target).parents('td').parent().children();
    var $area = area.find('.area');
    if (area.parents('tr').prev().find('.area').val() > 0) {
        if ($areab == '0') {
            var unitSel = area.find("select").eq(1);
            var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009001">元/平米/天</option><option value="6009002">元/平米/月</option></select>';
            area.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
            unitSel.html(unitOp)
        }
    } else {
        var unitSel = area.find("select").eq(1);
        var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009001">元/平米/天</option><option value="6009002">元/平米/月</option></select>';
        area.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
        unitSel.html(unitOp)
    }
    $areab = area.children('.area').val();
})
// 判断办公室或者工位单位
$('body').on('change', '.num', function () {
    var ared = $(event.target).parents('td').parent().children();
    if (ared.parents('tr').prev().find('.num').val() > 0) {
        if ($aredc == '0') {
            var unitSel = ared.find("select").eq(1);
            var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009003">元/工位/天</option><option value="6009004">元/工位/月</option><option value="6009005">元/间/月</option></select>';
            ared.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
            unitSel.html(unitOp)
        }
    } else {
        var unitSel = ared.find("select").eq(1);
        var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009003">元/工位/天</option><option value="6009004">元/工位/月</option><option value="6009005">元/间/月</option></select>';
        ared.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
        unitSel.html(unitOp)
    }
    $aredc = ared.children('.num').val();
})
$('body').on('change', '.area,.num', function () {
    var target = $(event.target).parents('td').parent().children();
    var $area = target.children('.area');
    var $ared = target.children('.num');
    // 面积和工位数量只有一个大于0
    if ($area.val() > 0 && $ared.val() > 0) {
        toastr.warning('面积和工位数量只有一个大于0');
        $(event.target).val('0')
        var are = $(event.target).parent('td').parent().children().find('.unit')
        $(event.target).parents('tr').find('.monthPay').val('0.00')
        if ($area.val() > 0) {
            var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009001">元/平米/天</option><option value="6009002">元/平米/月</option></select>';
            $area.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
            are.html(unitOp)
        } else if ($ared.val() > 0) {
            var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009003">元/工位/天</option><option value="6009004">元/工位/月</option><option value="6009005">元/间/月</option></select>';
            $ared.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
            are.html(unitOp)
        }
    }
})
// 根据面积单价，算出月租
$('body').on('change', '.area,.price,.unit', function () {
    var targ = $(this).parents('td').nextAll().children('.total');
    var $area = $(this).parents('td').nextAll().prevAll().children('.area');
    var $num = $(this).parents('td').nextAll().prevAll().children('.num');
    var $unitP = $(this).parents('td').nextAll().prevAll().find('.price');
    var $unit = $(this).parents('td').nextAll().prevAll().find('.unit');
    var $typarent = $(this).parents('td').prevAll().find('#roomType');
    if ($typarent.find("option:selected").val() == '1') {
        $typarent.find("option:selected").val('' + $('.tbody').children('tr:last').prev().children('.rtparent').find('#roomType option:selected').val())
    }
    if ($unit.find("option:selected").val() == '1') {
        $unit.find("option:selected").val('' + $('.tbody').children('tr:last').prev().children('.inlineparent').find('.inline option:selected').val())
    }
    // 根据单位value判断月租
    switch ($unit.find("option:selected").val()) {
        case '6009001':
            targ.val('' + ($area.val() * $unitP.val() * 30).toFixed(2));
            break;
        case '6009002':
            targ.val('' + ($area.val() * $unitP.val()).toFixed(2));
            break;
        case '6009003':
            targ.val('' + ($num.val() * $unitP.val() * 30).toFixed(2));
            break;
        case '6009004':
            targ.val('' + ($num.val() * $unitP.val()));
            break;
        case '6009005':
            targ.val('' + ($num.val() * $unitP.val()));
            break;
        case '':
            targ.val('0');
            break;
    }
    // if ($unit.find("option:selected").val() == '6009001') {
    //     targ.val('' + ($area.val() * $unitP.val() * 30).toFixed(2))
    // } else if ($unit.find("option:selected").val() == '6009002') {
    //     targ.val('' + ($area.val() * $unitP.val()).toFixed(2))
    // } else if ($unit.find("option:selected").val() == '6009003') {
    //     targ.val('' + ($num.val() * $unitP.val() * 30).toFixed(2))
    // } else if ($unit.find("option:selected").val() == '6009004') {
    //     targ.val('' + ($num.val() * $unitP.val()))
    // } else if ($unit.find("option:selected").val() == '6009005') {
    //     targ.val('' + ($num.val() * $unitP.val()))
    // } else if ($unit.find("option:selected").val() == '') {
    //     targ.val('0')
    // }
})

function listenType(obj) {
    // 办公室-工位 =》 面积-工位数量  以及对应的单位切换
    var parentTr = obj.parent("td").parent("tr");
    var curVal = obj.val();
    if (curVal == '6011002') { //6011002：开放工位  6011001: 办公室
        parentTr.find('.area').val('0');
        var unitSel = parentTr.find("select").eq(1);
        var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009003">元/工位/天</option><option value="6009004">元/工位/月</option><option value="6009005">元/间/月</option></select>';
        // 无法选中
        parentTr.find('.num').attr('disabled', 'disabled')
        parentTr.find('.num').val('1')
        parentTr.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
        unitSel.html(unitOp)

    } else {
        var unitSel = parentTr.find("select").eq(1);
        var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009001">元/平米/天</option><option value="6009002">元/平米/月</option><option value="6009003">元/工位/天</option><option value="6009004">元/工位/月</option><option value="6009005">元/间/月</option></select>';
        parentTr.find('.num').val('0')
        parentTr.find('.num').removeAttr('disabled')
        parentTr.find('.num').css("heigth:32px;width:100%;background:#fff;border: 1px solid #e4eaec;border-radius: 3px;")
        unitSel.html(unitOp)
    }
}

//单价单位 添加之后，改变上一个兄弟级时同上改变
$('.tbody').on('change', 'select', function () {
    $(this).parents('tr').next().find('#unit').children('option:first').val($(this).val())
    $(this).parents('tr').next().find('#unit').change();
    // 判断是否为最后一行或者下一行不为同上
    if ($(this).parents('tr').next().find('#unit').length == 0 || $(this).parents('tr').find('#unit').text() != '同上') {
        // return false;   
    } else {
        $(this).parents('tr').next().find('.price').change();
        $(this).parents('tr').next().find('#unit').change();
    }
})
//房间类型 添加之后，改变上一个兄弟级时同上改变
$('.tbody').on('change', 'select', function () {
    $(this).parents('tr').next().find('#roomType').children('option:first').val($(this).val())
    $(this).parents('tr').next().find('#roomType').change();
    // 判断是否为最后一行或者下一行不为同上
    if ($(this).parents('tr').next().find('#roomType').length == 0 || $(this).parents('tr').find('#roomType').text() != '同上') {
        // return false;   
    } else {
        $(this).parents('tr').next().find('.price').change();
        $(this).parents('tr').next().find('#roomType').change();
    }
})
// if($('#roomType option:selected').val() == 6011002){
//     console.log('aaa')
// }
$('#num').on('change', function () {
    console.log($('#roomType').val())
    if ($('#roomType').val() == 6011002) {
        $(this).attr('readonly', 'readonly');
        $(this).val('1');
        toastr.error('开放工位工位数只能为1');
        return;
    }

})
$('#saveRoom').on('click', function () {
    if ($('#roomType').val() == 6011002) {
        var that = $(this)
        if ($('#unit').val() == 6009003 || $('#roomType').val() == 6009004 || $('#roomType').val() == 6009005) {

        } else {
            console.log('aaa')
            var unitOp = '<select class="form-control inline unitsel" id="unit" name="unit"><option value="">请选择</option><option value="6009003">元/工位/天</option><option value="6009004">元/工位/月</option><option value="6009005">元/间/月</option></select>';
            $('#unit').html(unitOp);
            //toastr.error('请输入正确的单价')
        }
    }
})