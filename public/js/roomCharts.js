$(document).ready(function () {
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
            array.push(strArr[arr].slice(0, strArr[arr].indexOf(':')));
            $('.icon-title').each(function () {
                for (aaa in array) {
                    if (array[aaa] == $(this).text()) {
                        id = $(this).attr('value') + ',' + id
                    }
                }
            })
        }

    })
    $('.polling').on('click', function () {
        $('.colligation').html('')
        var url = $(this).attr("data-url");
        build = $('.build option:selected').text();
        floor = $('.floor option:selected').text();
        room = $('.room').val();
        statu = $('.statu option:selected').val();
        sum(1, url);
    });
});
// 初始化数据
var build = '';//楼座
var floor = '';//楼层
var room = '';//房间号
var statu = '';//房间状态
// 页面刚载入后台获取数据
function sum(a, url) {
    $.ajax({
        url: url,
        type: 'get',
        data: {
            build: build,
            floor: floor,
            room: room,
            status: statu,
        },
        dataType: 'json',
        success: function (res) {
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
            var floa = $("<option >" + '选择楼层' + "</option>");
            $('.floor').append(floa);
            for (floKey in res.floor) {
                var floa = $("<option>" + res.floor[floKey] + "</option>");
                $('.floor').append(floa);
                $('.floor').selectpicker('refresh')
            }
        }
    }
    console.log(res);
    //楼层外部盒子
    var boxa = $("<div class='col-md-12 padding-0 text-center'></div>")
    $('.colligation').html('')
    for (key in res.floor) { //楼层循环
        var room = res.floorRoom[res.floor[key]].office;
        var roomNo = res.floorRoom[res.floor[key]].station;
        /*  if (room != undefined) {
              //楼层盒子
              var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25'>" + room[0].floor + "</div>")
          } else {
              var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25'>" + roomNo[0].floor + "</div>")
          }*/
        if (room != undefined) {
            if (res.floorRoom[res.floor[key]].pic != null) {
                //楼层盒子
                var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25' onclick=\"showBuildPic($(this))\" title=\"点击查看楼层布局图1111\" data-$(this)=\".example-modal-lg\" data-toggle=\"modal\" data-href=" + res.floorRoom[res.floor[key]].pic + " style=\"cursor:pointer;\"><span title='点击查看楼层布局图'><a  class=\"inline-block showBuildPic\" >" + room[0].floor + "</a></span></div>")
            } else {
                //楼层盒子
                var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25'><span >" + room[0].floor + "</span></div>")
            }
        } else {
            if (res.floorRoom[res.floor[key]].pic != null) {
                var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25' onclick=\"showBuildPic($(this))\" title=\"点击查看楼层布局图1111\" data-$(this)=\".example-modal-lg\" data-toggle=\"modal\" data-href=" + res.floorRoom[res.floor[key]].pic + " style=\"cursor:pointer;\"><span ><a  class=\"inline-block showBuildPic\"  >" + roomNo[0].floor + "</a></span></div>")
            } else {
                var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25'><span >" + roomNo[0].floor + "</span></div>")
            }
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
                var boxg = $("<i class='con iconfont icon-wodefangjian font-size-40' aria-hidden='true'></i>")
                //房间编号
                var boxh = $("<div class='icon-title' value = " + room[num].id + ">" + room[num].roomNo + "</div>")
                //鼠标放上显示房间信息
                var boxz = $("<div class = 'icon-box icon-box1'></div>")
                //判断有无企业名称
                if(room[num].etprsName == null){
                    var infor = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>状态:</span><span class='col-sm-7 text-left'>" + room[num].statusName + "</span></p>")
                }else{
                    var infor = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>企业名称:</span><span class='col-sm-7 text-left'>" + room[num].etprsName + "</span></p>")
                }
                // 判断面积是否为0，是加入工位数，否加入面积
                if (room[num].area == 0) {
                    var inforb = '';
                    var infora = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>工位数:</span><span class='col-sm-7 text-left'>" + room[num].num + "个</span></p>")
                } else {
                    var infora = '';
                    var inforb = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>面积:</span><span class='col-sm-7 text-left'>" + room[num].area + "</span></p>")
                }
                var inforc = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>单价:</span><span class='col-sm-7 text-left'>" + room[num].price + room[num].unitName + "</span></p>")
                //房间颜色判断
                //var color = room[num].statusName;
                var status = room[num].status;
                var selfuse = room[num].status;
                if (selfuse != '3') {
                    if (status == 0) {
                        //boxg.addClass('colorgreen')
                    } else if (status == 1) {
                        boxg.addClass('coloryellow')
                        // 显示到右侧状态栏
                        var h = room[num].roomNo + ":" + room[num].area;
                        //$('.roomget').tokenfield('createToken', '' + h + '㎡')
                        boxg.addClass('colorred')
                    } else if (status == 2) {
                        boxg.addClass('colorgreen')
                    }
                } else {
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
                var boxk = $("<i class='icon iconfont icon-desk font-size-30' aria-hidden='true'></i>")
                //工位编号
                var boxl = $("<div class='icon-title' value = " + roomNo[number].id + ">" + roomNo[number].roomNo + "</div>")
                //鼠标放上显示工位信息
                var boxm = $("<div class = 'icon-box icon-box1'></div>")
                //判断有无企业名称
                if(roomNo[number].etprsName == null){
                    var information = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>状态:</span><span class='col-sm-7 text-left'>" + roomNo[number].statusName + "</span></p>")
                }else{
                    var information = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>企业名称:</span><span class='col-sm-7 text-left'>" + roomNo[number].etprsName + "</span></p>")
                }
                // 判断面积是否为0，是加入工位数，否加入面积
                if (roomNo[number].area == 0) {
                    var informationb = '';
                    var informationa = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>工位数:</span><span class='col-sm-7 text-left'>" + roomNo[number].num + "个</span></p>")
                } else {
                    var informationa = '';
                    var informationb = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>面积:</span><span class='col-sm-7 text-left'>" + roomNo[number].area + "</span></p>")
                }
                var informationc = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>单价:</span><span class='col-sm-7 text-left'>" + roomNo[number].price + roomNo[number].unitName + "</span></p>")
                var status = roomNo[number].status;
                var selfuse = roomNo[number].status;
                if (selfuse != '3') {
                    if (status == 0) {
                        //boxg.addClass('colorgreen')
                    } else if (status == 1) {
                        boxk.addClass('coloryellow')
                        // 显示到右侧状态栏
                        var h = roomNo[number].roomNoNo + ":" + roomNo[number].area;
                        $('.roomNoget').tokenfield('createToken', '' + h + '㎡')
                        boxk.addClass('colorred')
                    } else if (status == 2) {
                        boxk.addClass('colorgreen')
                    }
                } else {
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
            var url = $(this).attr("data-url");
            $.ajax({
                url: url,
                type: 'get',
                data: {
                    build: $('.build option:selected').text(),
                },
                dataType: 'json',
                success: function (res) {
                    $(".floor").find("option").remove();
                    var floa = $("<option >" + '选择楼层' + "</option>");
                    $('.floor').append(floa);
                    for (floKey in res.floor) {
                        var floa = $("<option>" + res.floor[floKey] + "</option>");
                        $('.floor').append(floa);
                        $('.floor').selectpicker('refresh')
                    }
                    $('.polling').click();
                }
            })
        }
        // 刚加载，默认显示第一个
        function first() {
            for (flo in res.floorRoom) {
                // 判断是否为办公室
                // 判断是否有公司
                if (res.floorRoom[flo].office) {
                    $('.custom').html(res.floorRoom[flo].office[0].etprsName)
                    $('.end').parent("").parent().css('display', 'block');
                    $('.end').html(res.floorRoom[flo].office[0].area + ' ㎡')
                    $('.start').parent("").parent().css('display', 'none');
                    $('.pay').html(res.floorRoom[flo].office[0].price + ' ' + res.floorRoom[flo].office[0].unitName)
                } else {
                    $('.custom').html(res.floorRoom[flo].station[0].etprsName)
                    $('.end').parent("").parent().css('display', 'none');
                    $('.start').parent("").parent().css('display', 'block');
                    $('.start').html(res.floorRoom[flo].station[0].num)
                    $('.pay').html(res.floorRoom[flo].station[0].price + '  ' + res.floorRoom[flo].station[0].unitName)
                }

                return false;
            }
        }
        first();
        return false;
    })
    // $(".floor").find("option").remove();

        $(function () {
            if(a == 1){

            }else {
                // 鼠标放上，信息出现
                $(".colligation").on("mouseover", "i", function (event) {
                    $(this).next().next().toggle();
                })
                // 鼠标移开，信息消失
                $(".colligation").on("mouseout", "i", function (event) {
                    $(this).next().next().toggle();
                })
            }
            // 鼠标点击，右侧栏数据更新
            $(".colligation").on("click", "i", function (event) {
                // 点击房间，添加到右侧状态栏
                var h = $(this).next().text() + ":" + $(this).next().next().children().children().text();
                $('.tim-start').val()
                //点击右侧显示合同开始时间与结束时间
                for (flo in res.floorRoom) {
                    // 判断是否为办公室
                    // 判断是否有公司
                    for (num in res.floorRoom[flo].office) {
                        if (res.floorRoom[flo].office[num].roomNo == $(this).next().text()) {
                            $('.custom').html(res.floorRoom[flo].office[num].etprsName)
                            $('.end').parent("").parent().css('display', 'block');
                            $('.end').html(res.floorRoom[flo].office[num].area + ' ㎡')
                            $('.start').parent("").parent().parent().remove();
                            $('.pay').html(res.floorRoom[flo].office[num].price + ' ' + res.floorRoom[flo].office[num].unitName)
                        }
                    }
                    // 判断是否为工位
                    for (num in res.floorRoom[flo].station) {
                        if (res.floorRoom[flo].station[num].roomNo == $(this).next().text()) {
                            $('.custom').html(res.floorRoom[flo].station[num].etprsName)
                            $('.end').parent("").parent().css('display', 'none');
                            $('.start').html(res.floorRoom[flo].station[num].num)
                            $('.pay').html(res.floorRoom[flo].station[num].price + '    ' + res.floorRoom[flo].station[num].unitName)
                        }
                    }
                }
            })
            // 刚加载，默认显示第一个
            function first() {
                for (flo in res.floorRoom) {
                    // 判断是否为办公室
                    // 判断是否有公司
                    if (res.floorRoom[flo].office) {
                        $('.custom').html(res.floorRoom[flo].office[0].etprsName)
                        $('.end').parent("").parent().css('display', 'block');
                        $('.end').html(res.floorRoom[flo].office[0].area + ' ㎡')
                        $('.start').parent("").parent().css('display', 'none');
                        $('.pay').html(res.floorRoom[flo].office[0].price + ' ' + res.floorRoom[flo].office[0].unitName)
                    } else {
                        $('.custom').html(res.floorRoom[flo].station[0].etprsName)
                        $('.end').parent("").parent().css('display', 'none');
                        $('.start').parent("").parent().css('display', 'block');
                        $('.start').html(res.floorRoom[flo].station[0].num)
                        $('.pay').html(res.floorRoom[flo].station[0].price + '  ' + res.floorRoom[flo].station[0].unitName)
                    }

                    return false;
                }
            }
            first()
        })
}


