$(function(){
	$(".areamenu").hide();
    $(".area").click(function(){
        $(this).addClass("aui-active").siblings().removeClass("aui-active");
        $(".areamenu").slideToggle(500).siblings("ul").slideUp(200);
    });
    $(".mjmenu").hide();
    $(".mj").click(function(){
        $(this).addClass("aui-active").siblings().removeClass("aui-active");
        $(".mjmenu").slideToggle(500).siblings("ul").slideUp(200);
    });
    $(".typemenu").hide();
    $(".typemenu li .typemenu2").hide();
    $(".type").click(function(){
        $(this).addClass("aui-active").siblings().removeClass("aui-active");
        $(".typemenu").slideToggle(500).siblings("ul").slideUp(200);
    });
    $(".typemenu li").click(function(){
        $(this).children().show();
        $(this).siblings().children().hide();
    });
    $(".area").click(function(){
        $(".area i").toggleClass("aui-icon-top").toggleClass("aui-icon-down");
    });
    $(".type").click(function(){
        $(".type i").toggleClass("aui-icon-top").toggleClass("aui-icon-down");
    });
    $(".mj").click(function(){
        $(".mj i").toggleClass("aui-icon-top").toggleClass("aui-icon-down");
    });
})
$(function(){
	//  孵化器详情关注及内容展开、收起开始
	$(".guanzhu").click(function(){
		$(".guanzhu i").toggleClass("fa-heart").toggleClass("fa-heart-o");
	});
	$('.content .more').click(function() {
		$('.content .more i').toggleClass('aui-icon-down').toggleClass('aui-icon-top');
        $('.content .nr').toggleClass('content1').toggleClass('content2');
        $(this).toggleClass('content2');
        if ($('.content .more span').text() == "收起") $('.content .more span').text("展开")
        else $('.content .more span').text("收起");
    })
	$('.zmcontent .zmmore').click(function() {
		$('.zmcontent .zmmore i').toggleClass('aui-icon-down').toggleClass('aui-icon-top');
        $('.zmcontent .nr').toggleClass('zmcontent1').toggleClass('zmcontent2');
        $(this).toggleClass('zmcontent2');
        if ($('.zmcontent .zmmore span').text() == "收起") $('.zmcontent .zmmore span').text("展开")
        else $('.zmcontent .zmmore span').text("收起");
    })
	//  孵化器详情关注及内容展开、收起结束
})
$(function(){
	//	轮播开始
	var slide = new auiSlide({
        container:document.getElementById("aui-slide"),
        // "width":300,
        "height":240,
        "speed":300,
        "autoPlay": 3000, //自动播放
        "pageShow":true,
        "pageStyle":'dot',
        "loop":true,
        'dotPosition':'center',
    })

    function currentFun(index) {
        
    }
    //	轮播结束
	//  弹出层开始
	var popup = new auiPopup();
    function showPopup(){
        popup.show(document.getElementById("bottom"))
    }

    var bar = document.querySelectorAll(".aui-bar-btn");
    if(bar){
        for(var i=0; i<bar.length;i++){
            var d = bar[i];
            var tab = new auiTab({
                element:bar[i],
                repeatClick:true
            },function(ret){
                if(ret.dom.parentNode.getAttribute("type") && ret.dom.parentNode.getAttribute("type")=="count"){
                    var count = parseInt(document.getElementById("count").value);
                    if(ret.index==2)return;
                    if(ret.index==1){

                         document.getElementById("count").value = count-1;
                    }
                    if(ret.index==3){
                         document.getElementById("count").value = count+1;
                    }
                }
            });

        }
    }
	//	弹出层结束
})
