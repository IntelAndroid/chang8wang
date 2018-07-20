$(function(){
    if($('.resettable').length>0){window.onresize = function () {$('.resettable').bootstrapTable('resetView');}
        $('.resettable').attr('data-page-size','20');
    }
});

function baseadd(url,msg,modelsize){
    $.post(url, function(data) {
        show_modal(msg,data,modelsize);
    });
}
function baseedit(tableId,url,msg,modelsize){
    id=singleCheck(tableId);
    if(id!=null){
        $.post(url,{id:id}, function(data) {
            show_modal(msg,data,modelsize);
        });
    }else{
        toastr.warning("没有记录ID");
    }
}

function basedelete(tableId,url,id){
    var data='<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button><h4 class="modal-title" id="myModalLabel"></h4></div><div class="modal-body">确定要删除么？</div><div class="modal-footer"><button class="btn btn-primary" onclick="common_delete(\''+url+'\',\''+id+'\',\''+tableId+'\')">确定</button><button class="btn btn-glyph " data-dismiss="modal" onclick="return false;">取消</span></button></div>';
    show_modal("提示",data,"modal-sm");
}
function common_delete(url,id,tableId){
    $.post(url, {id: id}, function (data) {
        if (data.code == 1) {
            toastr.success(data.msg);
            $("#" + tableId).bootstrapTable('refresh');
            $('#myModal').modal('hide');
        }else if(data.code == 0){
            toastr.warning(data.msg);
        }else{
            toastr.error(data.msg);
        }
    });
}

function getIdSelections(tableId) {
    var $table = $("#"+tableId);
    var selections=$table.bootstrapTable('getSelections');
    var chk_value =[];
    $.each(selections, function(index, value, array) {
        chk_value.push(value.id);
    });
    return chk_value;
}
function singleCheck(tableId){
    var ids=getIdSelections(tableId);
    if(ids.length!=1){
        toastr.warning("必须且只能选择一条记录");
        return null;
    }
    var id=ids[0];
    return id;
}
function mulitecheck(tableId){
    var ids=getIdSelections(tableId);
    if(ids.length==0){
        toastr.warning("至少选择一条记录");
        return null;
    }
    ids=ids.join(",");
    return ids;
}
function show_modal(title, data,modalsize){
    $('#myModal').remove();
    if($('#myModal').length == 0) {
        $('body').append('<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog '+modalsize+'"><div class="modal-content"></div></div></div>');
    }
    $('#myModal .modal-content').html(data);
    $('#myModalLabel').html(title);
    $('#myModal').modal('show');
}
function serializeJson(formdata){
    var serializeObj={};
    $(formdata).each(function(){
        serializeObj[this.name]=serializeObj[this.name]?serializeObj[this.name]+","+this.value:this.value;
    });
    return serializeObj;
};
function serializeData(formId){
    var serializeObj={};
    var formdata=$("#"+formId).serializeArray();
    $(formdata).each(function(){
        serializeObj[this.name]=serializeObj[this.name]?serializeObj[this.name]+","+this.value:this.value;
    });
    return serializeObj;
};
function cstmpost(id,url,data,fun){
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "json",
        beforeSend: function(){
            if(id!=""){
                $(id).attr({ disabled: "disabled" });
            }
        },
        success: function(res){
            if(res["code"]=='2'){
                //请先登录
                var logurl=$("#log_url").val();
                if(logurl==undefined||logurl==null||logurl==''){
                    logurl="/user/Login/login";
                }
                location.href=logurl;
            }
            //注册待完善用户
            if(res["code"]=='3'){
                //var jumpurl=res["data"];
                session('userId',res["data"]['id']);
                session('mobile',res["data"]['mobile']);
                //location.href="/user/rgst/rgstiqbt";
            }
            if(res["code"]=='4'){
                //var jumpurl=res["data"];
                session('userId',res["data"]['id']);
                session('mobile',res["data"]['mobile']);
                //location.href="/user/rgst/rgstiqbt";
                //客户完善信息
                alert("客户完善信息");
            }
            fun(res);
        },
        complete: function(){
            if(id!=""){
                $(id).removeAttr("disabled");
            }
        },
        error: function (data) {
            console.info("error: " + data.responseText);
        }
    });
}

function smntUploadFile(files,smnt,url,dir) {
    for (var i = 0; i < files.length; i++) {
        var obj = files[i];
        data = new FormData();
        data.append("file", obj);
        $.ajax({
            data: data,
            type: "POST",
            url: url,
            cache: false,
            contentType: false,
            processData: false,
            success: function(url) {
                smnt.summernote('insertImage', dir+url, 'image name'); // the insertImage API
            }
        });
    }

}