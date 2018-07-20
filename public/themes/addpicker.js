$('.box').on('click', '.fly', function () {
    if ($(this).children().parent('').next().attr('value') == 1) {

    } else {
        abc = $(this).children().parent('').children('.name').text();
        $(this).children().parent('').next().text(abc)
        $(this).children().parent('').next().attr('value', '1')
    }
    flyValue = $(this).attr('value');
    window.sessionStorage.setItem('a', flyValue)
    $(this).attr('id', 'getImageData')
    $(this).parent().parent().siblings().children().children().attr('id', 'aaa')
})
var flyValue = '';
$('.box').on('click', '#getImageData', function () {
    flyValue = $(this).attr('value');
    window.sessionStorage.setItem('a', flyValue)
})
// 点击添加上传图片框start
$('.addpicker').on('click', 'label', function () {
    var code = $(this).attr("value");
    if ($(this).css('color') == 'rgb(0, 0, 0)') {//获取是否选中 并判断
        $(this).parent().css('background', '#01be9e')
        $(this).parent().css('border', '0')
        $(this).css('color', '#fff')
        // 最外层盒子3
        var boxc = $('<div class="col-sm-2" id = "aa"></div>')
        // 外层盒子2
        var boxb = $('<div class="col-sm-12 pic"   data-target="#logsForm1" data-toggle="modal" aria-hidden="true"></div>')
        // 内层盒子1
        var boxa = $('<div class="fly"  id="getImageData" value = "' + code + '"></div>')
        // 内部+号标签
        var pb = $('<p class="add">+</p>')
        // 内部文字标签
        var pa = $('<p class = "name">' + $(this).text() + '</p>')
        //外部盒子标签
        var pc = $('<p style="display:none" class = "content"></p >')
        // 内部图片盒子
        var pica = $('<div class="modal-body  mo-body"></div>')
        // 插入图片
        var picb = $('<div class="text-center" id="getImageData4"></div>')
        picb.append(pica)
        pica.append(boxa)
        boxa.append(pb);
        boxa.append(pa);
        boxb.append(boxa);
        boxb.append(pc);
        boxc.append(boxb);
        $('.box').append(boxc);
    } else {
        $(this).parent().css('background', '#fff')
        $(this).css('color', '#000')
        $(this).parent().css('border', '1px dashed #e0e0e0')
        // 删除当前上传框
        var that = $(this);
        $('.box').children().each(function () {
            if (that.attr('value') == $(this).children().children().attr('value')) {
                $('input[name=' + code + ']').val(0);
                $(this).remove()
            }
        })
    }
})
// 点击添加上传图片框end

// 提供服务点击全选
$('#servicesCheck').on('click', 'div', function () {
    if ($(this).children('input').val() == '1') {
        if ($(this).children('input').prop('checked')) {
            $('#servicesCheck').find('input').prop('checked', true)
        } else {
            $('#servicesCheck').find('input').prop('checked', false)
        }
    } else {
        if ($(this).children('input').prop('checked')) {

        } else {
            $(this).parent().children('div:eq(0)').children('input').prop('checked', false)
        }
    }
})
// 配套设施点击全选
$('#facilityChecks').on('click', 'div', function () {
    if ($(this).children('input').val() == '1') {
        if ($(this).children('input').prop('checked')) {
            $('#facilityChecks').find('input').prop('checked', true)
        } else {
            $('#facilityChecks').find('input').prop('checked', false)
        }
    } else {
        if ($(this).children('input').prop('checked')) {

        } else {
            $(this).parent().children('div:eq(0)').children('input').prop('checked', false)
        }
    }
})