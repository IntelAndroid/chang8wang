$(document).ready(function () {
    //sum();
    $('.polling').on('click', function () {
        var newid = $(this).attr("data-etprsId")
        $('.colligation').html('')
        build = $('.build option:selected').text();
        floor = $('.floor option:selected').text();
        room = $('.room').val();
        statu = $('.statu option:selected').val();
        sum(1, newid);
    });

    // 房间分配数据提交
    $('.finish').on('click', function () {
        // 房间id获取
        // 获取的value值通过'，'转化成数组
        var strArr = $('.roomget').val().split(',')
        // 循环数组
        var array = [];
        var id = ''
        for (arr in strArr) {
            // 数组的每一项值
            // 截取从第一位到':'位
            array.push(strArr[arr].slice(0, strArr[arr].indexOf(':')))
            $('.icon-title').each(function () {
                for (aaa in array) {
                    if (array[aaa] == $(this).text()) {
                        id = $(this).attr('value') + ',' + id
                    }
                }
            })
        }

    })
});
// 初始化数据
var build = '';//楼座
var floor = '';//楼层
var room = '';//房间号
var statu = '';//房间状态
// 页面刚载入后台获取数据
function sum(a, newid) {
    $.ajax({
        url: '/Etprs/Etprs/changeRoom',
        type: 'get',
        data: {
            etprsId: newid,
            build: build,
            floor: floor,
            room: room,
            status: statu,
        },
        dataType: 'json',
        success: function (res) {
            var etprsId = res.etprsInfo.eId;
            $("#addChlidMenu").attr('data-etprsId', etprsId);
            $("#buildselect").attr('data-etprsId', etprsId);
            $("#etprsName").text(res.etprsInfo.name);
            $("#pact_start").val(res.etprsInfo.pact_start);
            $("#pact_end").val(res.etprsInfo.pact_end);
            $("#pactId").val(res.etprsInfo.pactId);
            $("#etprsId").val(etprsId);
            if (a == 1) {
                infor(res, 1);
            } else {
                infor(res)
            }
        }
    })
};

function infor(res, a) {
    // 楼座select值
    if (a == 1) {

    } else {
        $(".build").find("option").remove();
        for (buiKey in res.build) {
            var buia = $("<option>" + res.build[buiKey] + "</option>");
            $('.build').append(buia);
            $('.build').selectpicker('refresh');
            $(".floor").find("option").remove();
            for (floKey in res.floor) {
                var floa = $("<option>" + res.floor[floKey] + "</option>");
                $('.floor').append(floa);
                $('.floor').selectpicker('refresh')
            }
        }
    }
    //楼层外部盒子
    var boxa = $("<div class='col-md-12 padding-0 text-center'></div>")
    for (key in res.floor) { //楼层循环
        var room = res.floorRoom[res.floor[key]].office;
        var roomNo = res.floorRoom[res.floor[key]].station;
        if (room != undefined) {
            //楼层盒子
            var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25'>" + room[0].floor + "</div>")
        } else {
            var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25'>" + roomNo[0].floor + "</div>")
        }
        //房间外部盒子4
        var boxc = $("<div class='col-lg-11 col-md-11 col-sm-12 col-xs-12'></div>")
        //房间外部盒子3
        var boxd = $("<div class='col-md-12 padding-0 form'></div>")
        boxa.append(boxb);
        boxc.append(boxd);
        //工位外部盒子3
        var boxj = $("<div class='col-md-12 padding-0 form'></div>")
        if (room != undefined) {
            for (num in room) {//办公室循环
                //房间外部盒子2
                var boxe = $("<div class='col-lg-1 col-md-1 col-sm-2 col-xs-3 padding-10 icondemo-wrap vertical-align' data-name='alert-circled'></div>")
                //房间外部盒子1
                var boxf = $("<div class='icondemo vertical-align-middle' style = 'position:relative'></div>")
                // 房间图标
                var boxg = $("<i class='icon wb-home font-size-40' aria-hidden='true'></i>")
                //房间编号
                var boxh = $("<div class='icon-title' value = " + room[num].id + ">" + room[num].roomNo + "</div>")
                //鼠标放上显示房间信息
                var boxz = $("<div class = 'icon-box' style='width:200px;height:130px;background:#f3f3f3;position:absolute;top:-10px;left:50px; z-index:0.7; display:none;color:#000'></div>")
                var infor = $("<p>" + room[num].statusName + "</p>")
                var infora = $("<p>工位数(个):" + room[num].num + "</p>")
                var inforb = $("<p>面积:<span>" + room[num].area + "</span></p>")
                var inforc = $("<p>单价:" + room[num].price + room[num].unitName + "</p>")
                //房间颜色判断
                var color = room[num].statusName;
                if (color == '空闲') {
                    boxg.addClass('colorgreen')
                } else if (color == '已入驻') {
                    // 显示到右侧状态栏
                    var h = room[num].roomNo + ":" + room[num].area;
                    $('.roomget').tokenfield('createToken', '' + h + "㎡")
                    boxg.addClass('colorred')
                } else if (color == '已占用') {
                    boxg.addClass('coloryellow')
                } else if (color == '自用') {
                    boxg.addClass('colorblue')
                }
                boxf.append(boxg);
                boxf.append(boxh);
                boxf.append(boxz);
                boxz.append(infor)
                boxz.append(infora)
                boxz.append(inforb)
                boxz.append(inforc)
                boxe.append(boxf);
                boxd.append(boxe);
            }
        }
        if (roomNo != undefined) {
            for (number in roomNo) {//工位循环
                //工位外部盒子2
                var boxh = $("<div class='col-lg-1 col-md-1 col-sm-2 col-xs-3 padding-10 icondemo-wrap vertical-align' data-name='alert'></div>")
                //工位外部盒子1
                var boxi = $("<div class='icondemo vertical-align-middle' style = 'position:relative'></div>")
                //工位图标
                var boxk = $("<i class='icon wb-desktop font-size-30' aria-hidden='true'></i>")
                //工位编号
                var boxl = $("<div class='icon-title' value = " + roomNo[number].id + ">" + roomNo[number].roomNo + "</div>")
                //鼠标放上显示工位信息
                var boxm = $("<div class = 'icon-box' style='width:200px;height:130px;background:#f3f3f3;position:absolute;top:-10px;left:50px; z-index:0.7; display:none;color:#000'></div>")
                var information = $("<p>" + roomNo[number].statusName + "</p>")
                var informationa = $("<p>工位数(个):" + roomNo[number].num + "</p>")
                var informationb = $("<p>面积:<span>" + roomNo[number].area + "</span></p>")
                var informationc = $("<p>单价:" + roomNo[number].price + roomNo[number].unitName + "</p>")
                //工位颜色判断
                var boxCol = roomNo[number].statusName;
                if (boxCol == '空闲') {
                    boxk.addClass('colorgreen')
                } else if (boxCol == '已入驻') {
                    // 显示到右侧状态栏
                    var h = roomNo[number].roomNo + ":" + roomNo[number].area;
                    $('.roomget').tokenfield('createToken', '' + h + '㎡')
                    boxk.addClass('colorred')
                } else if (boxCol == '已占用') {
                    boxk.addClass('coloryellow')
                } else if (boxCol == '自用') {
                    boxk.addClass('colorblue')
                }
                boxh.append(boxi);
                boxi.append(boxk);
                boxi.append(boxl);
                boxi.append(boxm);
                boxm.append(information);
                boxm.append(informationa);
                boxm.append(informationb);
                boxm.append(informationc);
                boxj.append(boxh);
            }
        }
        boxc.append(boxj);
        boxa.append(boxc);
    }
    $('.colligation').append(boxa)
    // // 楼层select值 
    $('.build').on('change', function () {
        if (a == 1) {

        } else {
            var newid = $(this).attr("data-etprsId");
            $.ajax({
                url: '/Etprs/Etprs/changeRoom',
                type: 'get',
                data: {
                    newid: newid,
                    build: $('.build option:selected').text(),
                },
                dataType: 'json',
                success: function (res) {
                    $(".floor").find("option").remove();
                    for (floKey in res.floor) {
                        var floa = $("<option>" + res.floor[floKey] + "</option>");
                        $('.floor').append(floa);
                        $('.floor').selectpicker('refresh')
                    }
                }
            })
        }
    })
    // $(".floor").find("option").remove();
    $(function () {
        // 鼠标放上，信息出现
        $(".colligation").on("mouseover", "i", function (event) {
            var target = $(event.target);
            target.next().next().toggle();
        })
        // 鼠标移开，信息消失
        $(".colligation").on("mouseout", "i", function (event) {
            var target = $(event.target);
            target.next().next().toggle();
        })
        // 鼠标点击，右侧栏数据更新
        $(".colligation").on("click", "i", function (event) {
            var target = $(event.target);
            // 点击房间，添加到右侧状态栏
            var h = target.next().text() + ":" + target.next().next().children().children().text();
            $('.roomget').tokenfield('createToken', '' + h + '㎡')
            $('.tim-start').val()
            //点击右侧显示合同开始时间与结束时间
            for (flo in res.floorRoom) {
                // 判断是否为办公室
                // 判断是否有公司
                for (num in res.floorRoom[flo].office) {
                    if (res.floorRoom[flo].office[num].roomNo == target.next().text()) {
                        $('.custom').html(res.floorRoom[flo].office[num].etprsName)
                        $('.end').html(res.floorRoom[flo].office[num].area + ' ㎡')
                        $('.start').html(res.floorRoom[flo].office[num].num)
                        $('.pay').html(res.floorRoom[flo].office[num].price + ' ' + res.floorRoom[flo].office[num].unitName)

                    }
                }
                // 判断是否为工位
                for (num in res.floorRoom[flo].station) {
                    if (res.floorRoom[flo].station[num].roomNo == target.next().text()) {
                        $('.custom').html(res.floorRoom[flo].station[num].etprsName)
                        $('.end').html(res.floorRoom[flo].station[num].area + ' ㎡')
                        $('.start').html(res.floorRoom[flo].station[num].num)
                        $('.pay').html(res.floorRoom[flo].station[num].price + '    ' + res.floorRoom[flo].office[num].unitName)
                    }
                }
            }
        })
    })
}


