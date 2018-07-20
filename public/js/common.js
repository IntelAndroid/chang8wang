$(function () {
    $(".rqst_build").on('change', function () {
        var url = $(this).attr("data-url");
        var curBuild = $(this).val();
        var fdefault = $(this).attr("data-default");
        if (curBuild == '') {
            $(".rqst_floor").html('<option value="">选择楼层</option>');
            $(".curFloor").html('<option value="">选择楼层</option>');
            return
        }
        // 切换楼层
        $.get(url, {build: curBuild, fdefault: fdefault}, function (res) {
            if (res) {
                var ophtml = '<option value="">选择楼层</option>';
                for (var tmp in res) {
                    if(tmp == fdefault){
                        ophtml = ophtml + '<option value="'+tmp+'" selected>'+res[tmp]+'</option>';

                    }else {
                        ophtml = ophtml + '<option value="' + tmp + '">' + res[tmp] + '</option>';
                    }
                }
                $(".rqst_floor").html(ophtml);
                $(".curFloor").html(ophtml);
            } else {
                $(".rqst_floor").html('<option value="">选择楼层</option>');
                $(".curFloor").html('<option value="">选择楼层</option>');
            }
        });
    });

    //上传图片插件  移除按钮
    $("button[class='dropify-clear']").click(function(){
        $(this).parent().prev().val('');
    })
});

// 存储session  没有value则是获取 session
function session(key, value) {
    if (value!=undefined) {
        sessionStorage.setItem(key, value)
    } else {
        return sessionStorage.getItem(key)
    }
}

/**
 * 上传图片
 * files  file
 */
function uploadFile(files, imageClass) {
    var dom = files;
    // 赋值的hidden input  id
    var id = files.attr('data-id');
    // 是否可以选择多图
    var isMultyple = files.attr('data-isMultyple');
    // 预览框
    var previewBox = files.attr('data-previewBox');
    // 最大上传图片数量
    var limitNum = files.attr('data-limit');
    // 上传类型限制
    var dir = files.attr('data-dir');
    // 右侧下载队列
    var downClass = files.attr('data-down');
    if (dir == "" || dir == undefined) {
        dir = 'default';
    }
    var ext = files.attr('data-ext');
    if (ext) {
        var ext = ext.split(",");
    } else {
        ext = 'jpg,jpeg,png,gif';
    }
    var size = files.attr('data-size');
    if (size == "" || size == undefined) {
        size = 2;
    }
    if (isMultyple) {
        if ($("#" + id).val() != '' && $("#" + id).val() != 0) {
            var idArr = $("#" + id).val().split(",");
        } else {
            var idArr = new Array();
        }
        if (idArr.length >= limitNum) {
            toastr.error("最多可以上传" + limitNum + "张图片");
            return
        }
    }
    if (imageClass) {
        var imageBox = $("#" + imageClass).find('img');
    }
    var url = files.attr('data-url');
    var files = files.get(0).files[0];
    var obj = files;
    data = new FormData();
    data.append("file", obj);
    data.append("dir", dir);
    data.append("ext", ext);
    data.append("size", size);
    $.ajax({
        data: data,
        type: "POST",
        url: url,
        cache: false,
        contentType: false,
        processData: false,
        success: function (res) {
            if (res.code == 0) {
                toastr.error(res.msg);
                return
            }
            if (isMultyple) {
                toastr.success("文件上传成功");
                var example = '<dd id="fileBox_WU_FILE_'+res.id+'" class="diyUploadHover">' +
                    '			<div class="viewThumb">					' +
                    '    <input type="hidden">				' +
                    '	    <div class="diyBar"> 		' +
                    '					<div class="diyProgress">0%</div> 	' +
                    '				    </div> 				' +
                    '	    <p class="diyControl" data-field="'+id+'" onclick="removeCurImg($(this),'+res.id+')">' +
                    '<span class="diyCancel" ><i></i></span>' +
                    '</p>					<img src="'+res.path+'"></div> 				</dd>';
                $('.' + previewBox).append(example);
                if ($("#" + id).val() != '' && $("#" + id).val() != 0) {
                    var idArr = $("#" + id).val().split(",");
                } else {
                    var idArr = new Array();
                }

                idArr.push(res.id);
                idArr = idArr.join(",");
                $("#" + id).val(idArr);
            } else {
                $("#" + id).val(res.id);
                if (imageClass) {
                    imageBox.attr('src', res.path);
                } else {
                    toastr.success("文件上传成功");
                    // 加入下载队列
                    var html = '<li role="presentation">\
                        <a onclick="downFile" data-id="' + res.id + '" role="menuitem" >' + res.fileName + '</a>\
                        </li>';
                    $("." + downClass).html(html);
                }
            }
        }
    }, 'JSON');
}

// 楼座布局图
function showBuildPic(obj) {
    var url = obj.attr("data-href");
    $("#buildPicUrl").attr("src",url);
}




function removeCurImg(obj,id){
    $('dl').html('<dd class="upload-pick"><input type="hidden" name="roomPics" id="roomPic" value=""><input type="file" data-id="roomPic"  data-url="/etprs/Etprs/ajaxUploads" data-isMultyple="true" data-previewBox="upload-ul" data-limit="1" onchange="uploadFile($(this))" data-size="0.5" data-dir="buildpic" style="width: 100%;height:100%;opacity: 0;"></dd>')
    
    var fieldName = obj.attr("data-field");
    // 删除图片区域
    $("#fileBox_WU_FILE_"+id).remove();
    var oldVal = $("#"+fieldName).val();
    if(oldVal && oldVal != undefined){
        oldVal = oldVal.split(",");
    }else{
        oldVal = new Array();
    }
    var newVal = new Array();
    for(var i=0;i<oldVal.length;i++){
        if(oldVal[i] != id){
            newVal.push(oldVal[i]);
        }
    }
    $("#"+fieldName).val(newVal.join(","));
}

function FileInput() {
    var oFile = new Object();
    //初始化fileinput控件（第一次初始化）
    oFile.Init = function (ctrlName, url, initImg, hidefield, previewBox) {
        var control = $('#' + ctrlName);
        var size = control.attr("data-size");
        var ext = control.attr("data-ext");
        if (size && size != undefined && size > 0) {
            size = size;
        } else {
            size = 2;
        }
        if (ext && ext != undefined) {
            ext = ext.split(",");
        } else {
            ext = ['jpg', 'jpeg', 'gif', 'png'];
        }
        allSize = 1024 * size;
        var serverExt = ext.join(",");
        //初始化上传控件的样式
        control.fileinput({
            showPreview: false,
            language: 'zh', //设置语言
            uploadUrl: url + "?cate=" + ctrlName + "&size=" + size+"&ext="+serverExt, //上传的地址..
            allowedFileExtensions: ext,//接收的文件后缀
            showPreview: false,
            xhr_process: false,
            showUpload: false, //是否显示上传按钮
            showCaption: true,//是否显示标题
            browseClass: "btn btn-primary btn-inline", //按钮样式
            dropZoneEnabled: false,//是否显示拖拽区域
            //initialPreview: initImg,
            maxFileSize: allSize,//单位为kb，如果为0表示不限制文件大小

            maxFileCount: 0, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: false,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！"
        }).on("filebatchselected", function (event, files) {
            $(this).fileinput("upload");
        }).on("filecleared", function (event, files) {
            if (hidefield != "") {
                $("#" + hidefield).val('');
            }
            $("." + previewBox).html('');
        });

        //导入文件上传完成之后的事件
        $("#" + ctrlName).on("fileuploaded", function (event, data, previewId, index) {
            if (data["response"]["code"] == 1) {
                var fId = data["response"]["id"];
                $("." + previewBox).html("");
                if (hidefield != "") {
                    $("#" + hidefield).val(data["response"]["id"]);
                }
                var html = '<li role="presentation">\
                        <a href="javascript:downFile(' + fId + ');"  role="menuitem" >' + data["response"]["fileName"] + '</a>\
                        </li>';
                $("." + previewBox).html(html);
                toastr.success("上传成功");
            } else {
                toastr.error(data["response"]["msg"]);
            }

        });
    }
    return oFile;
}


// 渲染数据  res 为后端返回数据  code  msg  data

function assign(res) {
    var res = res ? res : false;
    //alert(JSON.stringify(res));
    if (res.data) {
        // 把返回数据写入html  页面dom id要对应 返回数据字段
        for (var tmp in res.data) {
            switch (tmp) {
                case 'source':
                    $("#" + tmp).html(initSelect('source', '6001', '2', res.data[tmp]));
                    break;
                case 'from':
                    $("#" + tmp).html(initSelect('source', '6025', '2', res.data[tmp]));
                    break;
                case 'type'://客户类型
                    $('#' + tmp).html(initRadio('type', '6003', '2', res.data[tmp]));
                    break;
                case 'status':
                    $('#' + tmp).html(initSelect('status', '6008', '2', res.data[tmp]));
                    break;
                case 'rqst_build': //初始化楼座
                    initBuild('rqst_build', res.data[tmp], res.data["rqst_floor"]);
                    break;
                case 'bp': //bp文件渲染
                    if (res.data[tmp] && res.data[tmp] != undefined) {
                        var newbp = res.data[tmp].split(",");
                        if (newbp[1]) {
                            // 加入下载队列
                            var list = '<li role="presentation">\
                        <a href="javascript:downFile('+newbp[0]+');" data-id="' + newbp[0] + '" role="menuitem" >' + newbp[1] + '</a>\
                        </li>';
                            var box = $("."+tmp+"Preview");
                            $("#"+tmp).val(newbp[0]);
                            box.append(list);
                            $("#"+tmp).parent("span").find(".file-caption-name").text(newbp[1]);
                            $('#' + tmp).html('<a  href="javascript:downFile(' + newbp[0] + ');">' + newbp[1] + '</a>');
                        } else {
                            $('#' + tmp).html('<a>暂无文件</a>');
                        }
                    }
                    break;
                case 'buslic':     //营业执照渲染
                    if (res.data[tmp] && res.data[tmp] != undefined) {
                        var newbuslic = res.data[tmp].split(",");
                        if (newbuslic[1]) {
                            // 加入下载队列
                            var list = '<li role="presentation">\
                        <a href="javascript:downFile('+newbuslic[0]+');" data-id="' + newbuslic[0] + '" role="menuitem" >' + newbuslic[1] + '</a>\
                        </li>';
                            var box = $("."+tmp+"Preview");
                            box.append(list);
                            $("#"+tmp).parent("span").find(".file-caption-name").text(newbuslic[1]);
                            $("#"+tmp).val(newbuslic[0]);
                            $('#' + tmp).html('<a  href="javascript:downFile(' + newbuslic[0] + ');">' + newbuslic[1] + '</a>');
                        } else {
                            $('#' + tmp).html('<a>暂无文件</a>');
                        }
                    }
                    break;
                case 'pact':       //合同文件渲染
                    if (res.data[tmp] && res.data[tmp] != undefined) {
                        var newpact = res.data[tmp].split(",");
                        if (newpact[1]) {
                            // 加入下载队列
                            var list = '<li role="presentation">\
                        <a href="javascript:downFile('+newpact[0]+');" data-id="' + newpact[0] + '" role="menuitem" >' + newpact[1] + '</a>\
                        </li>';
                            var box = $("."+tmp+"Preview");
                            box.append(list);
                            $("#"+tmp).parent("span").find(".file-caption-name").text(newpact[1]);
                            $("#"+tmp).val(newpact[0]);
                            $('#' + tmp).html('<a target="_blank" href="javascript:downFile(' + newpact[0] + ');">' + newpact[1] + '</a>');
                        } else {
                            $('#' + tmp).html('<a>暂无文件</a>');
                        }
                    }
                    break;
                case 'roomIdNames':
                    var html = '';
                    for (var i = 0; i < res.data[tmp].length; i++) {
                        var cur = res.data[tmp][i].split(",");
                        html = html + '<div class="checkbox-custom checkbox-primary checkbox-inline">\
                                <input type="checkbox" name="roomInfo" value="' + cur[0] + '"  id="inputUnchecked' + i + '" checked>\
                            <label for="inputUnchecked' + i + '">' + cur[1] + '</label>\
                                </div>';
                    }
                    $("#" + tmp).html(html);
                    break;
                case 'roomListArr':
                    var html = '';
                    for (var i = 0; i < res.data[tmp].length; i++) {
                        html = html + '<label class="control-label padding-right-15">' + res.data[tmp][i] + '</label>';
                    }
                    $("#" + tmp).html(html);
                    break;
                case 'roomType':   //房间类型
                    $("#" + tmp).html(initSelect('type', '6011', '2', res.data[tmp]));
                    break;
                case 'selfuse':
                    if (res.data[tmp] == '3') {
                        $("#" + tmp).val(res.data[tmp]);
                        $("#" + tmp).attr("checked", "checked");
                    }
                case 'unit':       //房间单价
                    $("#" + tmp).html(initSelect('unit', '6009', '2', res.data[tmp]));
                    break;
                case 'dection':    //房间单价
                    $("#" + tmp).html(initSelect('dection', '6010', '2', res.data[tmp]));
                    break;
                case 'facilityselect': //配套
                    $('#' + tmp).html(initSelect('facility', '6005', '2', res.data[tmp]));
                    break;
                case 'imgDiv': //更多配套图facilityCheck
                    $('#' + tmp).html(initCheckbox('facilityCheck', '6005', '2', res.data[tmp]));
                    break;
                case 'facilityChecks': //配套facilityCheck
                    if($('#' + tmp).attr('id')!=undefined) {
                        $('#' + tmp).html(facilityChecks('facility', '6005', '2', res.data[tmp]));
                    }
                    break;
                case 'services': //提供服务
                    $('#' + tmp).html(initSelect('services', '6006', '2', res.data[tmp]));
                    break;
                case 'servicesCheck': //提供服务
                    if($('#' + tmp).attr('id')!=undefined){
                        $('#' + tmp).html(servicesCheck('services', '6006', '2', res.data[tmp]));
                    }
                    break;
                case 'workstyle': //办公方式
                    $('#' + tmp).html(initCheckbox('workstyle', '6007', '2', res.data[tmp]));
                    break;
                case 'cstmstatus'://客户状态
                    $('#' + tmp).html(initSelect('cstmstatus', '6002', '2', res.data[tmp]));
                    break;
                case 'reason'://跟进原因
                    $('#' + tmp).html(initRadio('reason', '6002', '3', res.data[tmp]));
                    break;
                case 'iqbttype'://场地类型
                    $('#' + tmp).html(initSelect('type', '6004', '2', res.data[tmp]));
                    break;
                case 'rgstsptRadio'://空间-是否提供注册
                    $('#' + tmp).html(initRadio('rgstspt', '7002', '2', res.data[tmp]));
                    break;
                case 'industry'://企业类型
                    $('#' + tmp).html(initSelect('industry', '6013', '2', res.data[tmp]));
                    break;
                case 'isRgstHere'://是否 单选
                    $('#' + tmp).html(initOneRadio('isRgstHere', res.data[tmp]));
                    break;
                case 'isMigrate'://是否 单选
                    $('#' + tmp).html(initOneRadio('isMigrate', res.data[tmp]));
                    break;
                case 'highetprs'://是否 单选
                    $('#' + tmp).html(initOneRadio('highetprs', res.data[tmp]));
                    break;
                case 'etprsStatus'://企业状态
                    $('#' + tmp).html(initSelect('type', '6015', '2', res.data[tmp]));
                    break;
                case 'cadut'://是否 单选
                    $('#' + tmp).html(initOneRadio('cadut', res.data[tmp]));
                    break;
                case 'isMerger'://是否 单选
                    $('#' + tmp).html(initOneRadio('isMerger', res.data[tmp]));
                    break;
                case 'roFinace'://融资轮次
                    $('#' + tmp).html(initSelect('roFinace', '6014', '2', res.data[tmp]));
                    break;
                case 'accept': //会议室容纳人数
                    $('#' + tmp).html(initSelect('accept', '6016', '2', res.data[tmp]));
                    break;
                case 'mtrFacility':
                    $('#'+ tmp).html(initCheckbox('facility', '6022', '2',res.data[tmp]));
                    break;
                case 'free':
                    $("#"+tmp).html(initOneRadio('free', res.data[tmp]));
                    break;
                case 'audit':
                    $("#"+tmp).html(initOneRadio('audit', res.data[tmp]));
                    break;
                case 'publish':
                    $("#"+tmp).html(initOneRadio('publish',res.data[tmp]));
                    break;
                case 'tagsCheck'://活动标签复选框
                    $("#"+tmp).html(initCheckbox('tags','6017','2',res.data[tmp]));
                    break;
                default:
                    $("#" + tmp).val(res.data[tmp]);
                    if (res.data[tmp] != null) {
                        $("#" + tmp).attr('value', res.data[tmp]);
                        $("#" + tmp).text(res.data[tmp]);
                    }
                    //$("#" + tmp).attr('src', '__PUBLIC__/' + res.data[tmp]);
                    $("#" + tmp).attr('alt', res.data[tmp]);
                    break;
            }
        }
    } else {
        $("#source").html(initSelect('source', '6001', '2', ''));
        //$("#iqbttype").html(initSelect('type','6004','2',''));//空间类型
        $("#type").html(initRadio('type', '6003', '2', ''));
        $("#status").html(initSelect('status', '6008', '2', ''));
        //// 如果页面有楼座需要获取   传入节点ID
        if ($("body ").find(".rqst_build").length > 0) {
            initBuild('rqst_build');
        }
        $("#cstmstatus").html(initSelect('cstmstatus', '6002', '2', ''));
        $("#reason").html(initRadio('reason', '6002', '3', ''));
        // 房间信息相关
        $("#roomType").html(initSelect('type', '6011', '2', ''));
        $("#unit").html(initSelect('unit', '6009', '2', ''));
        $("#dection").html(initSelect('dection', '6010', '2', ''));
        // 企业扩展信息相关
        $('#industry').html(initSelect('industry', '6013', '2', ''));
        $("#isRgstHere").html(initOneRadio('isRgstHere', ''));
        $('#roFinace').html(initSelect('roFinace', '6014', '2', ''));
        $('#etprsStatus').html(initSelect('etprsStatus', '6015', '2', ''));
        $("#isRgstHere").html(initOneRadio('isRgstHere', ''));
        $("#isMigrate").html(initOneRadio('isMigrate', ''));
        $("#highetprs").html(initOneRadio('highetprs', ''));
        $("#cadut").html(initOneRadio('cadut', ''));
        $("#isMerger").html(initOneRadio('isMerger', ''));
        //$('#imgDiv').html(initCheckbox('facility', '6005', '2', ''));
        // 会议室相关
        $('#accept').html(initSelect('accept', '6016', '2',''));
        $('#mtrFacility').html(initCheckbox('facility', '6022', '2',''));
        $("#free").html(initOneRadio('free', '7002002'));
        $("#audit").html(initOneRadio('audit', '7002002'));
        $("#publish").html(initOneRadio('publish', '7002001'));
    }
}

//产生随机数函数
function RndNum(n) {
    var rnd = "";
    for (var i = 0; i < n; i++)
        rnd += Math.floor(Math.random() * 10);
    return rnd;
}

// 切换楼层
function in_array(search, array) {
    for (var i in array) {
        if (array[i] == search) {
            return true;
        }
    }
    return false;
}

// 渲染单调checkbox  不是字典
function initOneCheckbox(fname, value, sdefault) {
    var selhtml = '';
    if (value == sdefault) {
        selhtml = '<div class="checkbox-custom checkbox-primary checkbox-inline">\
            <input type="checkbox" name="' + fname + '" value="\'+sdefault+\'" id="inputUnchecked" checked="">\
            <label for="inputUnchecked">&nbsp;</label>\
        </div>';
    } else {
        selhtml = '<div class="checkbox-custom checkbox-primary checkbox-inline">\
            <input type="checkbox" name="' + fname + '" value="' + sdefault + '" id="inputUnchecked" >\
            <label for="inputUnchecked">&nbsp;</label>\
        </div>';
    }
    return selhtml;
}

// 渲染是否
function initOneRadio(fname, sdefault) {
    var random = RndNum(3);
    switch (sdefault) {
        case '1':
            value = '1';
            ctValue = '0';
            break;
        case '是':
            value = '1';
            ctValue = '0';
            break;
        default:
            value = '7002001';
            ctValue = '7002002';
            break;
    }
    if (sdefault == '1' || sdefault == '是' || sdefault == '7002001') {
        var selhtml = '<div class="radio-custom radio-primary radio-inline" id="'+fname+'7002001">\n' +
            '                                                            <input type="radio" value="' + value + '" id="inputRadiosChecked' + random + '"\n' +
            '                                                                   name="' + fname + '" checked class="'+fname+'7002001">\n' +
            '                                                            <label for="inputRadiosChecked' + random + '">是</label>\n' +
            '                                                        </div>\n' +
            '                                                        <div class="radio-custom radio-primary radio-inline"  id="'+fname+'7002002">\n' +
            '                                                            <input type="radio" value="' + ctValue + '" id="inputRadiosUnchecked' + random + '"\n' +
            '                                                                   name="' + fname + '" class="'+fname+'7002002">\n' +
            '                                                            <label for="inputRadiosUnchecked' + random + '">否</label>\n' +
            '                                                        </div>';
    } else {
        var selhtml = '<div class="radio-custom radio-primary radio-inline">\n' +
            '                                                            <input type="radio" value="' + value + '" id="inputRadiosChecked' + random + '"\n' +
            '                                                                   name="' + fname + '" class="'+fname+'7002001">\n' +
            '                                                            <label for="inputRadiosChecked' + random + '">是</label>\n' +
            '                                                        </div>\n' +
            '                                                        <div class="radio-custom radio-primary radio-inline">\n' +
            '                                                            <input type="radio" value="' + ctValue + '" id="inputRadiosUnchecked' + random + '"\n' +
            '                                                                   name="' + fname + '" checked class="'+fname+'7002002">\n' +
            '                                                            <label for="inputRadiosUnchecked' + random + '">否</label>\n' +
            '                                                        </div>';
    }


    return selhtml;
}


// 渲染checkbox  字典表数据
function initCheckbox(fname, code, level, sdefault) {
    if (!code || code == 0 || code == undefined) {
        return false;
    }
    var selhtml = '';
    for (var i = 0; i < sysData.length; i++) {
        if (sysData[i].code && sysData[i].code.indexOf(code, 0) === 0 && sysData[i].level == level) {
            var sdefault = sdefault.split(",");
            if (in_array(sysData[i].code, sdefault)) {
                selhtml = selhtml + '<div class="checkbox-custom checkbox-primary checkbox-inline">\
                    <input type="checkbox" name="' + fname + '[]" id="inputUnchecked' + i + '" checked="">\
                    <label for="inputUnchecked' + i + '">&nbsp;' + sysData[i].name + '</label>\
                </div>';
            } else {
                selhtml = selhtml + '<div class="checkbox-custom checkbox-primary checkbox-inline">\
                    <input type="checkbox" name="' + fname + '[]" id="inputUnchecked' + i + '" >\
                    <label for="inputUnchecked' + i + '">&nbsp;' + sysData[i].name + '</label>\
                </div>';
            }
        }
    }
    selhtml = selhtml;
    return selhtml;
}

// 渲染checkbox
function initCheckbox(fname, code, level, sdefault) {
    if (!code || code == 0 || code == undefined) {
        return false;
    }
    var selhtml = '';
    if (fname == 'facilityCheck') {//如果是场地图片
        for (var i = 0; i < sysData.length; i++) {
            if (sysData[i].code &&  sysData[i].code.indexOf(code, 0) === 0 && sysData[i].level == level) {
                if (sdefault.includes(sysData[i].code)) {
                    selhtml += ['<div class=" checkbox-primary checkbox-inline fam" style="background: rgb(1, 190, 158); border: 0px;">',
                        '<label style="color: rgb(255, 255, 255);" id="' + sysData[i].code + '" value="' + sysData[i].code + '" >' + sysData[i].name + '</label>',
                        '<input type="hidden" id="v' + sysData[i].code + '" name="' + sysData[i].code + '" value="' + sysData[i].id + '">',
                        '</div>'].join("");
                } else {
                    selhtml += ['<div class=" checkbox-primary checkbox-inline fam" value="' + sysData[i].code + '">',
                        '<label style="color: rgb(0, 0, 0);" class="check' + sysData[i].code + '" value="' + sysData[i].code + '">' + sysData[i].name + '</label>',
                        '<input type="hidden" id="v' + sysData[i].code + '" name="' + sysData[i].code + '">',
                        '</div>'].join("");
                }

            }
        }
    } else {
        for (var i = 0; i < sysData.length; i++) {
            if (sysData[i].code && sysData[i].code.indexOf(code, 0) === 0 && sysData[i].level == level) {
                if (sdefault.includes(sysData[i].code)) {
                    selhtml += ['<div class="checkbox-custom checkbox-primary checkbox-inline">',
                        '				                                        <input type="checkbox" name="' + fname + '" id="' + sysData[i].code + '" value="' + sysData[i].code + '" checked>',
                        '				                                        <label for="' + sysData[i].code + '">' + sysData[i].name + '</label>',
                        '				                                    </div>'].join("");
                } else {
                    selhtml += ['<div class="checkbox-custom checkbox-primary checkbox-inline">',
                        '				                                        <input type="checkbox" name="' + fname + '" id="' + sysData[i].code + '" value="' + sysData[i].code + '" >',
                        '				                                        <label for="' + sysData[i].code + '">' + sysData[i].name + '</label>',
                        '				                                    </div>'].join("");

                }
            }
        }
    }
    return selhtml;
}

// 渲染select
function initSelect(fname, code, level, sdefault) {
    if (!code || code == 0 || code == undefined) {
        return false;
    }
    var selhtml = '';
    selhtml += '<option value="">' + '请选择' + '</option>';
    for (var i = 0; i < sysData.length; i++) {
        if (sysData[i].code && sysData[i].code.indexOf(code, 0) === 0 && sysData[i].level == level) {
            if (sysData[i].code == sdefault) {
                selhtml = selhtml + '<option value="' + sysData[i].code + '" selected>' + sysData[i].name + '</option>';
            } else {
                selhtml = selhtml + '<option value="' + sysData[i].code + '">' + sysData[i].name + '</option>';
            }
        }
    }
    selhtml = selhtml;
    return selhtml;
}


// 渲染radio
function initRadio(fname, code, level, sdefault) {
    if (!code || code == 0 || code == undefined) {
        return false;
    }

    var selhtml = '';
    if (sdefault.length == 0) {//如果没有默认值
        var m = 0;
        for (var i = 0; i < sysData.length; i++) {
            if (sysData[i].code &&  sysData[i].code.indexOf(code, 0) === 0 && sysData[i].level == level) {
                if (m == 0) {
                    selhtml = selhtml + '<div class="radio-custom radio-primary radio-inline"><input id="' + sysData[i].code + '"type="radio" name="' + fname + '" value="' + sysData[i].code + '" checked><label for="' + sysData[i].code + '">' + sysData[i].name + '</label></div>';
                    m++;
                } else {
                    selhtml = selhtml + '<div class="radio-custom radio-primary radio-inline"><input id="' + sysData[i].code + '" type="radio" name="' + fname + '" value="' + sysData[i].code + '" ><label for="' + sysData[i].code + '">' + sysData[i].name + '</label></div>';
                }
            }
        }
    } else {
        for (var i = 0; i < sysData.length; i++) {
            if (sysData[i].code && sysData[i].code.indexOf(code, 0) === 0 && sysData[i].level == level) {
                if (sysData[i].code == sdefault) {
                    selhtml = selhtml + '<div class="radio-custom radio-primary radio-inline"><input id="' + sysData[i].code + '"type="radio" name="' + fname + '" value="' + sysData[i].code + '" checked><label for="' + sysData[i].code + '">' + sysData[i].name + '</label></div>';
                } else {
                    selhtml = selhtml + '<div class="radio-custom radio-primary radio-inline"><input id="' + sysData[i].code + '" type="radio" name="' + fname + '" value="' + sysData[i].code + '" ><label for="' + sysData[i].code + '">' + sysData[i].name + '</label></div>';
                }
            }
        }
    }
    return selhtml;


}


