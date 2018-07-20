// 获取后端数据start
function sum() {
    $.ajax({
        url: 'http://192.168.0.120:8003/Meetroom/Meetroom/getMtroomList',
        type: 'get',
        data: {

        },
        dataType: 'json',
        success: function (room) {
            sessionStorage.setItem('curDate', '' + room.curDate)
            // 在session里存储获取数据长度
            sessionStorage.setItem('num', '' + room.data.length)
            // 循环获取的数据
            for (var key = 0; key < room.data.length - 1; key++) {
                // 改变循环之后的房间id（轮播需要）
                $('.roomRank').find('#exampleResponsive').attr('id', 'exampleResponsive' + key)
                //    将需要往页面插入的数据包装
                var ab = $('<div class="col-md-12 padding-0 margin-top-10 margin-bottom-30 roomRank"></div>')
                //    插入数据
                ab.append($('.roomRank').html())
                $('.roomleft').append(ab)
                // 将第一条数据的id恢复
                $('.roomSpecial').children('div:first-child').children().attr('id', 'exampleResponsive')

            }
            // 将每一个房间的唯一id加到HTML的value中
            $.each($('.roomRank'), function (i) {
                var $roomRank = $('.roomRank')[i];
                // 房间id
                $(this).attr('value', room.data[i].id)
              
                // 会议室名称
                $(this).find('button:eq(0)').text(room.data[i].mtrName)
                  // 加入会议室data-id
                  $(this).find('button:eq(0)').attr({
                    'data-id':'' + room.data[i].id
              })
                  // 加入data-id
                  $(this).find('.goAplList').attr({
                    'data-id':'' + room.data[i].id
              })
                  // 加入确认预定data-id
                  $(this).find('.order').attr({
                    'data-id':'' + room.data[i].id
              })
                // 会议室价格
                $(this).find('.pay').children().text(room.data[i].price)
                // 会议市容纳人数
                $(this).find('.peopleNum').children().text(room.data[i].acceptName)
                // 将后台获取的时间添加到HTML中
                // 判断页面房间与获取到的数据是否对应
                var $this = $(this);
                if ($(this).attr('value') == room.data[i].id) {
                    // 判断有无房间信息
                    if (room.data[i].timeLine == undefined) {

                    } else {
                        //判断已预订审合通过房间
                        $.each(room.data[i].timeLine, function (i) {
                            // 截取获取到的时间，判断上午或下午
                            var startTime = $(this)[0].starttimeStr.substring('', $(this)[0].starttimeStr.indexOf(':'))
                            var aplId = $(this)[0].aplId
                            var startTimeb = $(this)[0].starttimeStr
                            var endTime = $(this)[0].endtimeStr
                            var prevAll = $this.find('.timeCenter').parent().children()
                            var status = $(this)[0].status
                            $.each(prevAll, function (i) {
                                if (prevAll[i].getAttribute('value') == startTimeb) {
                                    if(status == 7001002){
                                        $(this).addClass("timeactive");
                                        $(this).nextAll().addClass("timeactive");
                                    }else if(status == 7001001){
                                        $(this).addClass("timeactive1");                                        
                                        $(this).nextAll().addClass("timeactive1");                                        
                                    }
                                    $(this).addClass("mtOrderDetail");
                                    $(this).addClass("order");
                                    $(this).attr({
                                        "data-id":'' + aplId,
                                        'data-target':"#logsForm1",
                                        'data-toggle':"modal",
                                        'aria-hidden':"true"
                                    });
                                    $(this).nextAll().attr({
                                        "data-id":'' + aplId,
                                        'data-target':"#logsForm1",
                                        'data-toggle':"modal",
                                        'aria-hidden':"true"
                                    });
                                    $(this).nextAll().addClass("mtOrderDetail");
                                    $(this).nextAll().addClass("order");
                                }
                                if (prevAll[i].getAttribute('value') == endTime) {
                                    $(this).nextAll().attr({
                                        "data-id":'',
                                        'data-target':"",
                                        'data-toggle':"",
                                        'aria-hidden':""
                                    });                                    
                                    $(this).nextAll().removeClass("timeactive");
                                    $(this).nextAll().removeClass("timeactive1");
                                    $(this).nextAll().toggleClass("mtOrderDetail");
                                    var $id2 = $(this).attr('id') 
                                }
                            })

                        })
                    }
                }
            })
        }
    })
};
sum()
// 点击收藏，排序
$('.roomleft').on('click','.collect',function(){
    var tar = $(event.target)
    // 点击心形样式
   tar.children('i').toggleClass("fa-heart-o")
   tar.children('i').toggleClass("fa-heart")
    $('.roomleft').prepend(tar.parents('.roomRank'))
})