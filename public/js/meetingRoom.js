// 获取后端数据start
function sum() {
    var build = $(".rqst_build").val();
    var floor = $(".rqst_floor").val();
    var id2 = $(".mtroomNameList").val();
    var date2 = $(".datemt").val();// ? $(".datemt").val() : sessionStorage.getItem('curDate');
    var url = $("#mtroomUrl").val();
    $.ajax({
        url: url,
        type: 'get',
        data: {
            build: build,
            floor: floor,
            id: id2,
            date: date2
        },
        dataType: 'json',
        success: function (room) {
            console.log(room)
            sessionStorage.setItem('curDate', '' + room.curDate)
            if (room.data.length == 0) {
                return false;
            }
            for (var key = 0; key < room.data.length; key++) {
                //改变循环之后的房间id（轮播需要）
                $('.roomRank').find('#exampleResponsive').attr('id', 'exampleResponsive' + key)
                //将需要往页面插入的数据包装
                var ab = $('<div class="col-md-12 padding-0 margin-top-10 margin-bottom-30 roomRk"></div>')
                //插入数据
                ab.append($('.roomRank').html())
                $('.roomleft').append(ab)
                //将第一条数据的id恢复
                $('.roomSpecial').children('div:first-child').children().attr('id', 'exampleResponsive')
                $('#exampleResponsive' + key).slick({
                    dots: true,
                    infinite: false,
                    speed: 500,
                    slidesToShow: 24,
                    slidesToScroll: 16,
                    responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3,
                            infinite: true,
                            dots: true
                        }
                    }, {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    }, {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                    ]
                });
                $('#exampleResponsive' + key).find('.slick-next').click();
            }
            // 将每一个房间的唯一id加到HTML的value中
            $.each($('.roomRk'), function (i) {
                var $roomRank = $('.roomRk')[i];
                // 房间id
                $(this).attr('value', room.data[i].id)
                // 会议室审核数量
                if (room.data[i].number > 0) {
                    $(this).find(".aplNum").text('(' + room.data[i].number + ')');
                }
                $(this).find(".fname").text(room.data[i].fullyName);
                $(this).find(".fname").attr({
                    'data-id': '' + room.data[i].id
                });
                // 加入会议室data-id
                $(this).find('button:eq(0)').attr({
                    'data-id': '' + room.data[i].id
                })
                // 加入data-id
                $(this).find('.goAplList').attr({
                    'data-id': '' + room.data[i].id
                })
                // 收藏的数据ID
                $(this).find('.collect').attr({
                    'data-id': '' + room.data[i].id
                })
                if (room.data[i].isCollect) {
                    // 收藏后渲染实心
                    $(this).find('.collect').find("i").attr({
                        'class': 'fa-heart'
                    })
                } else {
                    $(this).find('.collect').find("i").attr({
                        'class': 'fa fa-heart-o'
                    })
                }
                // 加入确认预定data-id
                $(this).find('.order').attr({
                    'data-id': '' + room.data[i].id
                })
                // 会议室价格
                $(this).find('.pay').text(room.data[i].price)
                // 会议市容纳人数
                $(this).find('.peopleNum').children().text(room.data[i].acceptName)
                // 将后台获取的时间添加到HTML中
                // 判断页面房间与获取到的数据是否对应
                var $this = $(this);
                if ($(this).attr('value') == room.data[i].id) {
                    // 判断有无房间信息
                    if (room.data[i].timeLine == undefined) {
                        $this.find('.timeCenter').parent().children().removeClass("timechoose");
                        $this.find('.timeCenter').parent().children().removeClass("timeactive1");
                        $this.find('.timeCenter').parent().children().removeClass("timeactive");
                    } else {
                        $this.find('.timeCenter').parent().children().removeClass("timeactive");
                        //判断已预订审合通过房间
                        $.each(room.data[i].timeLine, function (i) {
                            // 截取获取到的时间，判断上午或下午
                            var startTime = $(this)[0].starttimeStr.substring('', $(this)[0].starttimeStr.indexOf(':'))
                            var aplId = $(this)[0].aplId
                            var startTimeb = $(this)[0].starttimeStr
                            var starta = $(this)[0].status
                            var endTime = $(this)[0].endtimeStr
                            var starta = $(this)[0].status

                            var prevAll = $this.find('.timeCenter').parent().children()
                            if (starta == 7001002) {
                                $.each(prevAll, function (i) {
                                    if (prevAll[i].getAttribute('value') == startTimeb) {
                                        aaa = prevAll[i].getAttribute('id')
                                    }
                                    if (prevAll[i].getAttribute('value') == endTime) {
                                        var bbb = prevAll[i].getAttribute('id')
                                        $.each(prevAll, function (b) {
                                            if (aaa <= prevAll[b].getAttribute('id') && bbb > prevAll[b].getAttribute('id')) {
                                                $(this).addClass("timechoose");
                                                $(this).addClass("mtOrderDetail");
                                                $(this).addClass("order");
                                                $(this).attr({
                                                    "data-id": '' + aplId,
                                                    'data-target': "#logsForm1",
                                                    'data-toggle': "modal",
                                                    'aria-hidden': "true"
                                                });
                                                $(this).attr('onclick', 'orderDetail($(this))')
                                            }
                                        })
                                    }

                                })
                            } else {
                                $.each(prevAll, function (i) {
                                    if (prevAll[i].getAttribute('value') == startTimeb) {
                                        aaa = prevAll[i].getAttribute('id')
                                    }
                                    if (prevAll[i].getAttribute('value') == endTime) {
                                        var bbb = prevAll[i].getAttribute('id')
                                        $.each(prevAll, function (b) {
                                            if (aaa <= prevAll[b].getAttribute('id') && bbb > prevAll[b].getAttribute('id')) {
                                                $(this).addClass("timeactive1");
                                                $(this).addClass("mtOrderDetail");
                                                $(this).addClass("order");
                                                $(this).attr({
                                                    "data-id": '' + aplId,
                                                    'data-target': "#logsForm1",
                                                    'data-toggle': "modal",
                                                    'aria-hidden': "true"
                                                });
                                                $(this).attr('onclick', 'orderDetail($(this))')
                                            }
                                        })
                                    }
                                })
                            }

                        })
                    }
                }
            })
        }
    })
};
// 点击时触发变色
var $idNum = NaN;
$('.roomleft').on('click', '.timebox', function (event) {
    var target = $(event.target);
    // 颜色转化
    var tarParent = target.parent().children();
    // 选中当前被点击的id
    var $clickId = target.attr('id');
    // 点击时，当前若为绿色，颜色消失
    if(!target.parent().children().hasClass('timeactive')){
         $idNum = NaN;
    }
     if ($(this).hasClass('timeactive')) {
        $(this).removeClass('timeactive')
        $(this).nextAll().removeClass('timeactive')
    } else if ($(this).hasClass('timechoose')) {
        // 判断有无已分配房间，若有则无法点击
    } else {
        if ($(this).hasClass('timechoose') || $(this).hasClass('timeactive1')) {
            
        } else {
            target.toggleClass("timeactive");            
        }
        // 点击时循环该行所有元素
        $.each(tarParent, function (i) {
            // 判断该行以前有无被选中元素
            if ($(this).hasClass('timeactive')) {
                // 存储被选中元素id
                $idNum = $(this).attr('id')
            }
            // 将两个id中间所有盒子颜色改变)
            if ($(this).attr('id') >= $idNum && $(this).attr('id') <= $clickId) {
                if ($(this).hasClass('timechoose') || $(this).hasClass('timeactive1')) {
                    $(this).nextAll().removeClass("timeactive")
                    toastr.error('选择的房间存在被选择的房间')
                    return false;
                } else {
                    $(this).addClass("timeactive")
                }
            } else {
                $(this).removeClass("timeactive")
            }
        })
    }

})

// 确认预定时价格
$('.duepayAll').on('change', '.timeChoice,.timeChoiceend', function () {
    var tmChoice = $('.timeChoice').val()
    var tmChoiceend = $('.timeChoiceend').val()
    // 开始时间
    var timestart = tmChoice.substring(0, tmChoice.search(/\d/))
    // 结束时间
    var endstart = tmChoiceend.substring(0, tmChoiceend.search(/\d/))
    // 截取上下午后的整点
    var timestarta = tmChoice.substring(tmChoice.search(/\d/), tmChoice.search(':'));
    var endstarta = tmChoiceend.substring(tmChoiceend.search(/\d/), tmChoiceend.search(':'));
    // 截取半点
    var timestartb = tmChoice.substring(tmChoice.search(':') + 1);
    var endstartb = tmChoiceend.substring(tmChoiceend.search(':') + 1);
    // 判断是否为下午12:00或12:30
    var timeend = tmChoiceend.substring(tmChoiceend.search(/\d/));
    // 判断是否为上午12:00或12:30
    var timestartend = tmChoice.substring(tmChoice.search(/\d/));
    // 判断上下午
    if (timestart == '上午') {
        // 判断有无半点
        // 判断是否为上午12:00或12:30
        if (timestartend == '12:00' || timestartend == '12:30') {
            if (timestartb > 0) {
                timestarta = 1;
            } else {
                timestarta = 0;
            }
        } else if (timestartb > 0) {
            timestarta = timestarta * 2 + 1;
        } else {
            timestarta = timestarta * 2;
        }
    } else if (timestartend == '12:00' || timestartend == '12:30') {
        // 判断有无半点
        if (timestartb > 0) {
            timestarta = ((timestarta) - 0) * 2 + 1;
        } else {
            timestarta = ((timestarta) - 0) * 2;
        }
    } else {
        // 判断有无半点
        if (timestartb > 0) {
            timestarta = ((timestarta) - 0 + 12) * 2 + 1;
        } else {
            timestarta = ((timestarta) - 0 + 12) * 2;
        }
    }
    // 判断上下午
    if (endstart == '上午') {
        // 12:00价格
        if (timeend == '12:00') {
            endstarta = ((endstarta) - 0 + 12) * 2;
        } else if(timeend == '12:30'){
            endstarta = 1;
        }else if (endstartb > 0) {
            // 判断有无半点
            endstarta = endstarta * 2 + 1;
        } else {
            endstarta = endstarta * 2;
        }
    } else if (timeend == '12:00' || timeend == '12:30') {
        // 判断有无半点
        if (endstartb > 0) {
            endstarta = ((endstarta) - 0) * 2 + 1;
        } else {
            endstarta = ((endstarta) - 0) * 2;
        }
    } else {
        // 判断有无半点
        if (endstartb > 0) {
            endstarta = ((endstarta) - 0 + 12) * 2 + 1;
        } else {
            endstarta = ((endstarta) - 0 + 12) * 2;
        }
    }
    $('.duepay').text((endstarta - timestarta) * $('.oneselfPay').text() / 2)
    $('#curPrice').val((endstarta - timestarta) * $('.oneselfPay').text() / 2)
    if ($('.duepay').text() > 0) {

    } else {
        $('#curPrice').val(0)
        $('.duepay').text('0')
    }
})

// 点击预定，获取时间
$('.roomleft').on('click', '.order', function (event) {
    var target = $(event.target);
    // 声明选中时间的盒子
    var $timstart = []
    var $timend = []
    var $timAll = []
    // 获取当前时间盒子
    var $tim = target.parents('.roomRk').find('.timebox')
    $.each($tim, function () {
        if ($(this).hasClass('timeactive')) {
            $timstart.push($(this).attr('value'))
            $timAll.push($(this))
            // 预定时间推后半小时
            if ($timAll[$timAll.length - 1].attr('value') == '23:30') {
                $timstart.push('00:00')
            } else {
                $timstart.push($timAll[$timAll.length - 1].next().attr('value'))
            }
        }
    })
    // 开始时间
    switch($timstart[0])
    {
        case '00:00':
            $('.timeChoice').val('' + '上午' + '12:00');
            break;
        case '00:30':
            $('.timeChoice').val('' + '上午' + '12:30')
            break;
        case '01:00':
        case '01:30':
        case '02:00':
        case '02:30':
        case '03:00':
        case '03:30':
        case '04:00':
        case '04:30':
        case '05:00':
        case '05:30':
        case '06:00':
        case '06:30':
        case '07:00':
        case '07:30':
        case '08:00': 
        case '08:30': 
        case '09:00':
        case '09:30':
        case '10:00':
        case '10:30':
        case '11:00':
        case '11:30':   
            $('.timeChoice').val('' + '上午' + $timstart[0])
            break;
        case '12:00' :
        case '12:30':
            $('.timeChoice').val('' + '下午' + $timstart[0])
            break;
        case '13:00':
        case '13:30':
        case '14:00':
        case '14:30':
        case '15:00':
        case '15:30':
        case '16:00':
        case '16:30':
        case '17:00': 
        case '17:30':
        case '18:00':
        case '18:30':
        case '19:00':
        case '19:30':
        case '20:00': 
        case '20:30':
        case '21:00':
        case '21:30':
        case '22:00':
        case '22:30':
        case '23:00':
        case '23:30' :
        //console.log('aaa')
        var starttime = ($timstart[0].substring('', $timstart[0].indexOf(':')) - 12) + $timstart[0].substring($timstart[0].indexOf(':'))
            $('.timeChoice').val('' + '下午' + starttime)
            break;
    }
    // if ($timstart[0] == '00:00') {
    //     $('.timeChoice').val('' + '上午' + '12:00')
    // } else if ($timstart[0] == '00:30') {
    //     $('.timeChoice').val('' + '上午' + '12:30')
    // } else if ($timstart[0] == '01:00' || $timstart[0] == '01:30' || $timstart[0] == '02:00' || $timstart[0] == '02:30' || $timstart[0] == '03:00' || $timstart[0] == '03:30' || $timstart[0] == '04:00' || $timstart[0] == '04:30' || $timstart[0] == '05:00' || $timstart[0] == '05:30' || $timstart[0] == '06:00' || $timstart[0] == '06:30' || $timstart[0] == '07:00' || $timstart[0] == '07:30' || $timstart[0] == '08:00' || $timstart[0] == '08:30' || $timstart[0] == '09:00' || $timstart[0] == '09:30' || $timstart[0] == '10:00' || $timstart[0] == '10:30' || $timstart[0] == '11:00' || $timstart[0] == '11:30') {
    //     $('.timeChoice').val('' + '上午' + $timstart[0])
    // } else if ($timstart[0] == '12:00' || $timstart[0] == '12:30') {
    //     $('.timeChoice').val('' + '下午' + $timstart[0])
    // } else if ($timstart[0] == '13:00' || $timstart[0] == '13:30' || $timstart[0] == '14:00' || $timstart[0] == '14:30' || $timstart[0] == '15:00' || $timstart[0] == '15:30' || $timstart[0] == '16:00' || $timstart[0] == '16:30' || $timstart[0] == '17:00' || $timstart[0] == '17:30' || $timstart[0] == '18:00' || $timstart[0] == '18:30' || $timstart[0] == '19:00' || $timstart[0] == '19:30' || $timstart[0] == '20:00' || $timstart[0] == '20:30' || $timstart[0] == '21:00' || $timstart[0] == '21:30' || $timstart[0] == '22:00' || $timstart[0] == '22:30' || $timstart[0] == '23:00' || $timstart[0] == '23:30') {
    //     var starttime = ($timstart[0].substring('', $timstart[0].indexOf(':')) - 12) + $timstart[0].substring($timstart[0].indexOf(':'))
    //     $('.timeChoice').val('' + '下午' + starttime)
    // }
    // 结束时间
    switch($timstart[$timstart.length - 1]){
        case '00:00':
            $('.timeChoiceend').val('' + '上午' + '12:00');
            break;
        case '00:30':
            $('.timeChoiceend').val('' + '上午' + '12:30');
            break;
            case '01:00':
            case '01:30':
            case '02:00':
            case '02:30':
            case '03:00':
            case '03:30':
            case '04:00':
            case '04:30':
            case '05:00':
            case '05:30':
            case '06:00':
            case '06:30':
            case '07:00':
            case '07:30':
            case '08:00': 
            case '08:30': 
            case '09:00':
            case '09:30':
            case '10:00':
            case '10:30':
            case '11:00':
            case '11:30':              
            $('.timeChoiceend').val('' + '上午' + $timstart[$timstart.length - 1])
            break;
        case '12:00':
        case '12:30':
            $('.timeChoiceend').val('' + '下午' + $timstart[$timstart.length - 1])
            break;
            case '13:00':
            case '13:30':
            case '14:00':
            case '14:30':
            case '15:00':
            case '15:30':
            case '16:00':
            case '16:30':
            case '17:00': 
            case '17:30':
            case '18:00':
            case '18:30':
            case '19:00':
            case '19:30':
            case '20:00': 
            case '20:30':
            case '21:00':
            case '21:30':
            case '22:00':
            case '22:30':
            case '23:00':
            case '23:30' :    
            var endtime = ($timstart[$timstart.length - 1].substring('', $timstart[$timstart.length - 1].indexOf(':')) - 12) + $timstart[$timstart.length - 1].substring($timstart[$timstart.length - 1].indexOf(':'))
            $('.timeChoiceend').val('' + '下午' + endtime)
            break;        
    }
    // if ($timstart[$timstart.length - 1] == '00:00') {
    //     $('.timeChoiceend').val('' + '上午' + '12:00')
    // } else if ($timstart[$timstart.length - 1] == '00:30') {
    //     $('.timeChoiceend').val('' + '上午' + '12:30')
    // } else if ($timstart[$timstart.length - 1] == '00:00' || $timstart[$timstart.length - 1] == '00:30' || $timstart[$timstart.length - 1] == '01:00' || $timstart[$timstart.length - 1] == '01:30' || $timstart[$timstart.length - 1] == '02:00' || $timstart[$timstart.length - 1] == '02:30' || $timstart[$timstart.length - 1] == '03:00' || $timstart[$timstart.length - 1] == '03:30' || $timstart[$timstart.length - 1] == '04:00' || $timstart[$timstart.length - 1] == '04:30' || $timstart[$timstart.length - 1] == '05:00' || $timstart[$timstart.length - 1] == '05:30' || $timstart[$timstart.length - 1] == '06:00' || $timstart[$timstart.length - 1] == '06:30' || $timstart[$timstart.length - 1] == '07:00' || $timstart[$timstart.length - 1] == '07:30' || $timstart[$timstart.length - 1] == '08:00' || $timstart[$timstart.length - 1] == '08:30' || $timstart[$timstart.length - 1] == '09:00' || $timstart[$timstart.length - 1] == '09:30' || $timstart[$timstart.length - 1] == '10:00' || $timstart[$timstart.length - 1] == '10:30' || $timstart[$timstart.length - 1] == '11:00' || $timstart[$timstart.length - 1] == '11:30') {
    //     $('.timeChoiceend').val('' + '上午' + $timstart[$timstart.length - 1])
    // } else if ($timstart[$timstart.length - 1] == '12:00' || $timstart[$timstart.length - 1] == '12:30') {
    //     $('.timeChoiceend').val('' + '下午' + $timstart[$timstart.length - 1])
    // } else if ($timstart[$timstart.length - 1] == '13:00' || $timstart[$timstart.length - 1] == '13:30' || $timstart[$timstart.length - 1] == '14:00' || $timstart[$timstart.length - 1] == '14:30' || $timstart[$timstart.length - 1] == '15:00' || $timstart[$timstart.length - 1] == '15:30' || $timstart[$timstart.length - 1] == '16:00' || $timstart[$timstart.length - 1] == '16:30' || $timstart[$timstart.length - 1] == '17:00' || $timstart[$timstart.length - 1] == '17:30' || $timstart[$timstart.length - 1] == '18:00' || $timstart[$timstart.length - 1] == '18:30' || $timstart[$timstart.length - 1] == '19:00' || $timstart[$timstart.length - 1] == '19:30' || $timstart[$timstart.length - 1] == '20:00' || $timstart[$timstart.length - 1] == '20:30' || $timstart[$timstart.length - 1] == '21:00' || $timstart[$timstart.length - 1] == '21:30' || $timstart[$timstart.length - 1] == '22:00' || $timstart[$timstart.length - 1] == '22:30' || $timstart[$timstart.length - 1] == '23:00' || $timstart[$timstart.length - 1] == '23:30') {
    //     var endtime = ($timstart[$timstart.length - 1].substring('', $timstart[$timstart.length - 1].indexOf(':')) - 12) + $timstart[$timstart.length - 1].substring($timstart[$timstart.length - 1].indexOf(':'))
    //     $('.timeChoiceend').val('' + '下午' + endtime)
    // }
    $('.oneselfPay').text(target.parents('.roomRk').find('.pay').text())
    $('.timeChoice').change();
})