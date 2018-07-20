
// 获取后端数据start
function sum() {
   /* if(sessionStorage.getItem('curDate')){
        $(".datemt").val(sessionStorage.getItem('curDate'));
    }*/
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
            sessionStorage.setItem('curDate', '' + room.curDate)
            if (room.data.length == 0) {
                return
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
                // 轮播插件
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
                // 房间id
                $(this).attr('value', room.data[i].id)
                // 会议室审核数量
                if (room.data[i].number > 0) {
                    $(this).find(".aplNum").text(room.data[i].number);
                } else {
                    $(this).find(".aplNum").text('');
                }
                $(this).find(".fname").text(room.data[i].fullyName);
                $(this).find(".fname").attr({
                    'data-id': '' + room.data[i].id
                });
                // 会议室名称
                //$(this).find('button:eq(0)').text(room.data[i].fullyName)
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
                // 加入确认预定data-id
                $(this).find('.order').attr({
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
                // 会议室价格
                $(this).find('.pay').children().text(room.data[i].price + '元/小时')
                // 会议市容纳人数
                $(this).find('.peopleNum').children().text(room.data[i].acceptName)
                // 判断页面房间与获取到的数据是否对应
                var $this = $(this);
                if ($(this).attr('value') == room.data[i].id) {
                    // 判断有无房间信息
                    if (room.data[i].timeLine == undefined) {
                        $this.find('.timeCenter').parent().children().removeClass("timeactive");
                        $this.find('.timeCenter').parent().children().removeClass("timeactive1");
                    } else {
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
                                                $(this).addClass("timeactive");
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