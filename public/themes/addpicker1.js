$('.box').on('click', '#aa', function () {
    var code = $(this).attr("data-code");
    console.log(code)
    var target = $(event.target); 
    target.parent().attr('id','getImageData')   
    target.parent().parent().parent().siblings().children().children().attr('id','aaa')   
})
$('#setCropperData').on('click',function(){
    var a = [];
    // console.log(typeof $('.clearfix>div>img')[0].attributes[1].nodeValue)
})
// 点击添加上传图片框start
$('.addpicker').on('click', 'label', function () {
    var target = $(event.target);
    var code = $(this).attr("id");
    if (target.css('color')=='rgb(0, 0, 0)') {//获取是否选中 并判断
        target.parent().css('background','#01be9e')
        target.parent().css('border','0')
        target.css('color','#fff')        
        // 最外层盒子3
        var boxc = $('<div class="col-sm-2" id = "aa" ></div>')
        // 外层盒子2
        var boxb = $('<div class="col-sm-12 pic"   data-target="#logsForm1" data-toggle="modal" aria-hidden="true"></div>')
        // 内层盒子1
        var boxa = $('<div class="fly"  id="getImageData" value="'+code+'"></div>')
        // 内部+号标签
        var pb = $('<p class="add">+</p>')
        // 内部文字标签
        var pa = $('<p class = "name">' + target.text() + '</p>')
        // 内部图片盒子
        var pica = $('<div class="modal-body  mo-body"></div>')
        // 插入图片
        var picb = $('<div class="text-center" id="getImageData4"></div>') 
        picb.append(pica)
        pica.append(boxa)
        boxa.append(pb);
        boxa.append(pa);
        boxb.append(boxa);
        boxc.append(boxb);
        $('.box').append(boxc);
    } else {
        target.parent().css('background','#fff')
        target.css('color','#000')
        target.parent().css('border','1px dashed #e0e0e0')
        // 删除当前上传框
        $('.box').children().each(function () {
            console.log($(this).children().children().attr('value'))
            if (target.attr('value') == $(this).children().children().attr('value')) {
                $(this).remove()
            }
        })
    }
    // 同步图片
    // var data=$('canvas').toDataURL();
})
// 点击添加上传图片框end