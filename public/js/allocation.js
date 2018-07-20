/*
* 2018-02-08 房间分配
* Modify  whl
* */
$(document).ready(function () {
    // 切换楼层对应楼座
    $('.polling').on('click', function () {
        $('.colligation').html('')
        build = $('.build option:selected').text();
        floor = $('.floor option:selected').text();
        room = $('.room').val();
        statu = $('.statu option:selected').val();
        var url = $(this).attr("data-url");
        // 房间分配需要的企业ID
        var etprsId = $(this).attr('data-etprsId');
        // 数据获取函数
        getBuildRoom(1, etprsId, url);
    });
    // 房间分配数据提交
    $('.finish').on('click', function () {
        var url = $(this).attr("data-url");
        var jump = $(this).attr("data-jump");
        var roomInfo = ''
        // 房间id获取
        // 获取的value值通过'，'转化成数组
        var strArr = $('.roomget').val().split(',')
        // 循环数组
        var array = [];
        for (arr in strArr) {
            // 数组的每一项值
            // 截取从第一位到':'位
            array.push(strArr[arr].slice(strArr[arr].search(/\w/g), strArr[arr].indexOf(':')))
            $('.icon-title').each(function () {
                if (array[arr] == $(this).html()) {
                    if (roomInfo == '') {
                        roomInfo = $(this).attr('value');
                    } else {
                        roomInfo = roomInfo + ',' + $(this).attr('value');
                    }
                }
            })
        }
        // 提交
        confirmAllo(roomInfo, url, jump);
    })
});

// 初始化数据
var build = '';//楼座
var floor = '';//楼层
var room = '';//房间号
var statu = '';//房间状态

/*
* 获取页面数据
* @param  a
* @param  etprsId  企业ID
* */
function getBuildRoom(a, etprsId, url) {
    var data = {};
    data.id = etprsId;
    data.build = build;
    data.floor = floor;
    data.room = room;
    data.status = statu;
    cstmpost("", url, data, function (res) {
        var etprsId = res.etprsInfo.id;
        $("#addChlidMenu").attr('data-etprsId', etprsId);
        $("#etprsName").text(res.etprsInfo.name);
        // 渲染默认的合同开始时间  以及结束时间
        $(".fin-start").val(res.pactStart);
        $(".fin-end").val(res.pactEnd);
        if (a == 1) {
            // 切换楼层对应楼座
            infor(res, 1);
        } else {
            // 无需切换
            infor(res)
        }
    });
};


/*
* 完成分配提交接口
* @param  roomInfo  要分配的房间信息
* @return location= /Etprs/Etprs/Sign   id=合同id etprsId=企业ID
* */
function confirmAllo(roomInfo, url, jump) {
    var data = {};
    data.etprsId = $("#addChlidMenu").attr("data-etprsId");
    data.roomInfo = roomInfo;
    cstmpost(".finish", url, data, function (res) {
        if (res["code"] == '1') {
            session("signId", res["data"]);
            session("signEtprsId", res["etprsId"]);
            toastr.success(res["msg"]);
            setTimeout(function () {
                location.href = jump;
            }, 1000);
        } else {
            toastr.error(res["msg"]);
        }
    });
}

/*
* 切换楼座对应楼层
* @param res   本页面数据
* @param a     是否切换
* */
function infor(res, a) {
    // 楼座select值
    $('.colligation').html("")
    if (a == 1) {

    } else {
        $(".build").find("option").remove();
        for (buiKey in res.build) {
            var buia = $("<option>" + res.build[buiKey] + "</option>");
            $('.build').append(buia);
            $('.build').selectpicker('refresh');
            $(".floor").find("option").remove();
            $(".floor").find("option").remove();
            var floa = $("<option value=''>" + "选择楼层" + "</option>");
            $('.floor').append(floa);
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
            if (res.floorRoom[res.floor[key]].pic != null) {
                //楼层盒子
                var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25' onclick=\"showBuildPic($(this))\" title=\"点击查看楼层布局图\" data-$(this)=\".example-modal-lg\" data-toggle=\"modal\" data-href=" + res.floorRoom[res.floor[key]].pic + " style=\"cursor:pointer;\"><span title='点击查看楼层布局图'><a  class=\"inline-block showBuildPic\" >" + room[0].floor + "</a></span></div>")
            } else {
                //楼层盒子
                var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25'><span >" + room[0].floor + "</span></div>")
            }
        } else {
            if (res.floorRoom[res.floor[key]].pic != null) {
                var boxb = $("<div class='col-lg-1 col-md-1 col-sm-12 col-xs-12 bg-blue-grey-100 padding-top-25 padding-bottom-25' onclick=\"showBuildPic($(this))\" title=\"点击查看楼层布局图\" data-$(this)=\".example-modal-lg\" data-toggle=\"modal\" data-href=" + res.floorRoom[res.floor[key]].pic + " style=\"cursor:pointer;\"><span ><a  class=\"inline-block showBuildPic\"  >" + roomNo[0].floor + "</a></span></div>")
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
                var boxg = $("<i class='icon iconfont icon-wodefangjian font-size-40'></i>")
                //房间编号
                //判断有无企业名称
                if (room[num].etprsName == null) {
                    var infor = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>状态:</span><span class='col-sm-7 text-left'>" + room[num].statusName + "</span></p>")
                } else {
                    var infor = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>企业名称:</span><span class='col-sm-7 text-left'>" + room[num].etprsName + "</span></p>")
                }
                // 判断面积是否为0，是加入工位数，否加入面积
                if (room[num].area == 0) {
                    var inforb = '';
                    var infora = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>工位数:</span><span class='col-sm-7 text-left stationArea'>" + room[num].num + "个</span></p>")
                } else {
                    var infora = '';
                    var inforb = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>面积:</span><span class='col-sm-7 text-left stationArea'>" + room[num].area + "㎡</span></p>")
                }
                var boxh = $("<div class='icon-title' value = " + room[num].id + ">" + room[num].roomNo + "</div>")
                //鼠标放上显示房间信息
                var boxz = $("<div class = 'icon-box icon-box1'></div>")
                var inforc = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>单价:</span><span class='col-sm-7 text-left'>" + room[num].price + room[num].unitName + "</span></p>")

                //房间颜色判断
                //var color = room[num].statusName;
                var status = room[num].status;
                var selfuse = room[num].status;
                if (selfuse != '3') {
                    if (status == 0) {
                        //boxg.addClass('colorgreen')
                    } else if (status == 1) {
                        boxg.attr('value', '1')
                        boxg.addClass('coloryellow')
                        // 显示到右侧状态栏
                        var h = room[num].roomNo + ":" + room[num].area;
                        //$('.roomget').tokenfield('createToken', '' + h + '㎡')
                        boxg.addClass('colorred')
                    } else if (status == 2) {
                        boxg.attr('value', '1')
                        boxg.addClass('colorgreen')
                    }
                } else {
                    boxg.attr('value', '1')
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
                if (room[num].cubicle) {
                    sessionStorage.setItem(room[num].id, JSON.stringify(room[num].cubicle))
                }
            }
        }
        if (roomNo != undefined) {
            for (number in roomNo) {//工位循环
                //工位外部盒子2
                var boxh = $("<div class='col-lg-1 col-md-1 col-sm-2 col-xs-3 padding-10 icondemo-wrap vertical-align' data-name='alert'></div>")
                //工位外部盒子1
                var boxi = $("<div class='icondemo vertical-align-middle' style = 'position:relative'></div>")
                //工位图标
                var boxk = $("<i class='icon iconfont icon-desk font-size-30'></i>")
                //工位编号
                var boxl = $("<div class='icon-title' value = " + roomNo[number].id + ">" + roomNo[number].roomNo + "</div>")
                //鼠标放上显示工位信息
                var boxm = $("<div class = 'icon-box icon-box1'></div>")
                //判断有无企业名称
                if (roomNo[number].etprsName == null) {
                    var information = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>状态:</span><span class='col-sm-7 text-left'>" + roomNo[number].statusName + "</span></p>")
                } else {
                    var information = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>企业名称:</span><span class='col-sm-7 text-left'>" + roomNo[number].etprsName + "</span></p>")
                }
                // 判断面积是否为0，是加入工位数，否加入面积
                if (roomNo[number].area == 0) {
                    var informationb = '';
                    var informationa = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>工位数:</span><span class='col-sm-7 text-left stationArea'>" + roomNo[number].num + "个</span></p>")
                } else {
                    var informationa = '';
                    var informationb = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>面积:</span><span class='col-sm-7 text-left stationArea'>" + roomNo[number].area + "㎡</span></p>")
                }
                var informationc = $("<p class='col-sm-12'><span class='col-sm-5 text-right'>单价:</span><span class='col-sm-7 text-left'>" + roomNo[number].price + roomNo[number].unitName + "</span></p>")

                //工位颜色判断
                var status = roomNo[number].status;
                var selfuse = roomNo[number].status;
                if (selfuse != '3') {
                    if (status == 0) {
                        //boxg.addClass('colorgreen')
                    } else if (status == 1) {
                        boxk.attr('value', '1')
                        boxk.addClass('coloryellow')
                        // 显示到右侧状态栏
                        var h = roomNo[number].roomNoNo + ":" + roomNo[number].area;
                        $('.roomNoget').tokenfield('createToken', '' + h + '㎡')
                    } else if (status == 2) {
                        boxk.attr('value', '1')
                        boxk.addClass('colorgreen')
                    }
                } else {
                    boxk.attr('value', '1')
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
                    id: res.etprsInfo.id,
                    build: $('.build option:selected').text(),
                },
                dataType: 'json',
                success: function (response) {
                    $(".floor").find("option").remove();
                    var floa = $("<option value=''>" + "选择楼层" + "</option>");
                    $('.floor').append(floa);
                    for (floKey in response.floor) {
                        var floa = $("<option>" + response.floor[floKey] + "</option>");
                        $('.floor').append(floa);
                        $('.floor').selectpicker('refresh')
                    }
                    $('.polling').click();
                }
            })
        }
        return false;
    })
    // $(".floor").find("option").remove();
    $(function () {
        // 鼠标放上，信息出现
        $(".colligation").on("mouseover", "i", function (event) {
            $(this).next().next().css('display', 'block');
        })
        // 鼠标移开，信息消失
        $(".colligation").on("mouseout", "i", function (event) {
            $(this).next().next().css('display', 'none');
        })
        // 鼠标点击，右侧栏数据更新
        $(".colligation").on("click", "i", function (event) {
            if (a == 1) {

            } else {
                $('.roomsta').html('')
                console.log($(this).next().attr('value'))
                if (sessionStorage.getItem($(this).next().attr('value'))) {
                    $.each(JSON.parse(sessionStorage.getItem($(this).next().attr('value'))), function () {
                        //工位颜色判断
                        var status = $(this)[0].status;
                        let color = '';
                        let value = '';
                        if (status == 0) {
                            //boxg.addClass('colorgreen')
                        } else if (status == 1) {
                            color = '#f2a654'
                            value = '1'
                        } else if (status == 2) {
                            color = '#46be8a'
                            value = '1'
                        }
                        let roomsta = '<div class="col-md-4" style="color:' + color + '" value="' + value + '"><label class="icon-title" value="' + $(this)[0].id
                            + '" area="' + $(this)[0].area + '">'
                            //   +'<input type="checkbox">'
                            + $(this)[0].roomNo + '</label></div>';
                        $('.roomsta').append(roomsta);


                    })
                    toastr.warning('请在右侧栏中选择工位')
                } else if ($(this).attr('value') == 1) {
                    toastr.warning('入驻房间必须为空闲状态')
                    return false;
                } else {
                    // 点击房间，添加到右侧状态栏
                    var roomInfo = ''
                    // 房间id获取
                    // 获取的value值通过'，'转化成数组
                    var strArr = $('.roomget').val().split(',')
                    // 循环数组
                    var array = [];
                    // 数组的每一项值
                    // 截取从第一位到':'位
                    for (arr in strArr) {
                        array.push(strArr[arr].slice(strArr[arr].search(/\w/g), strArr[arr].indexOf(':')))
                    }
                    if ($.inArray($(this).next().text() + '', array) == -1) {
                        var h = $(this).next().text() + ":" + $(this).next().next().find('.stationArea').text();
                        $('.roomget').tokenfield('createToken', '' + h)
                    } else {
                        toastr.warning('该房间已添加');
                        return false;
                    }
                    toastr.success('添加成功');
                }
            }
        })
        // 循环数组
        var array = [];
        $("body").on("click", "label", function () {
            if (a == 1) {

            } else {
            // 房间内工位点击右侧栏中显示
            var roomInfo = ''
            // 获取的value值通过'，'转化成数组
            var strArr = $('.roomget').val().split(',')
            // 截取从第一位到':'位
            array = [];
            for (arr in strArr) {
                array.push(strArr[arr].slice(strArr[arr].search(/\w/g), strArr[arr].indexOf(':')))
            }
            if ($(this).parent().attr('value') == '1') {
                toastr.warning('入驻房间必须为空闲状态');
                return false;
            } 
            if ($.inArray($(this).text() + '', array) == -1) {
                var h = $(this).text() + ":" + $(this).attr('area') + "㎡";
                // + $(this).next().next().find('.stationArea').text();
                $('.roomget').tokenfield('createToken', '' + h)
            } else {
                toastr.warning('该房间已添加');
                return false;
            }
            toastr.success('添加成功');
        }
        })
    })
        // 第一个房间内若有工位，则默认显示
    if (sessionStorage.getItem($('.form:first').find('i').next().attr('value'))) {
        $('.roomsta').html('');
        $.each(JSON.parse(sessionStorage.getItem($('.form:first').find('i').next().attr('value'))), function () {
            //工位颜色判断
            var status = $(this)[0].status;
            let color = '';
            let value = '';
            if (status == 0) {
                //boxg.addClass('colorgreen')
            } else if (status == 1) {
                color = '#f2a654'
                value = '1'
            } else if (status == 2) {
                color = '#46be8a'
                value = '1'
            }
            let roomsta = '<div class="col-md-4" style="color:' + color + '" value="' + value + '"><label class="icon-title" value="' + $(this)[0].id
                + '" area="' + $(this)[0].area + '">'
                //   +'<input type="checkbox">'
                + $(this)[0].roomNo + '</label></div>';
            $('.roomsta').append(roomsta);
        })
    } else {
        $('.roomsta').html('')
    }
}

