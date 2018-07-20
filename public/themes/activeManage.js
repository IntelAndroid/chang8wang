var activeName = '';
var start = '';
var end = '';
var status = '';
// 活动管理导出start
function actEeport() {
    $.ajax({
       //location.href= url: 'http://192.168.0.119:8003/activity/activity/exportAct',
        type: 'post',
        data: {
            search: activeName,
            start: start,
            end: end,
            status: status
        },
        dataType: 'json',
        success: function (room) {
        }
    })
    location.href="{url:('/activity/activity/exportAct/search/')}";
};
// 活动管理导出end


//获取活动状态start
$('#activeState').on('change', function () {
    status = $('#activeState option:selected').val()
    actInquiry()        
})
//获取活动状态end


// 点击查询，获取活动状态start
$('#addChlidMenu').on('click', function () {
    // 活动名称
    activeName = $('.activeName').val()
    // 活动开始及结束时间
    // 将年月转化成-，日删除
    //start = $('input[name="start"]').val().replace(/\年/, '-').replace(/\月/, '-').replace(/\日/, '')
    start = $('input[name="start"]').val();
    //end = $('input[name="end"]').val().replace(/\年/, '-').replace(/\月/, '-').replace(/\日/, '')
    end = $('input[name="end"]').val();
    actInquiry()
})
// 点击查询，获取活动状态end

// 导出按钮触发start
$('#saveChlidMenu').on('click', function () {
    actEeport()
})
// 导出按钮触发end