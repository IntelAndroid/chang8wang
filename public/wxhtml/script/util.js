var rooturl="";
var picurl="";
if(!rooturl){
  rooturl="http://172.16.151.96/bfuhuaqi/index.php";
  picurl="http://172.16.151.96/bfuhuaqi";
}

function pageinit(api){
  api.parseTapmode();
  var header;
  if($api.dom('header')){
    header=$api.dom('header');
    $api.fixStatusBar(header);
  }
  var btnback=$api.byId("btnback");
  if(btnback){
    $api.addEvt($api.byId("btnback"), 'click', function(){
      api.closeWin();
    });
  }
}

function getUserInfo(field) {
  var userinfo=$api.getStorage('userInfo');
  if(userinfo){
    return userinfo[field];
  }else{
    return "";
  }
}

function getStorage(field) {
  return $api.getStorage(field)
}
function gettoken() {
  return $api.getStorage('token');
}
function gologin() {
  api.openWin({
      name: 'login',
      url: 'widget://html/login/login.html',
      bounces: false,
      slidBackEnabled:false
  });
}
function update(table,data,where) {
  api.ajax({
      url: 'http://172.16.151.188/bfuhuaqi/index.php/app/Appcommon/updateData',
      method: 'post',
      data: {
          values: {
              "token": gettoken(),
              "table": table,
              "data": data,
              "where": where
          }
      }
  }, function(ret, err) {
    var rlt=result(ret, err);
    return rlt;
  });
}
function result(ret, err) {
  var rlt=1;
  if(err["code"]&&err["code"]=='0'){
    rlt=0;
  }else{
    if(ret["code"]=='0'){
      if(ret["login"]&&ret["login"]=='1'){
        gologin();
      }
      rlt=0;
    }
  }
  return rlt;
}

function backquit(api) {
  //重要，登录页不能返回
        var quitflag = false;
    api.addEventListener({
        name: 'keyback'
    }, function(ret, err) {
      if (false == quitflag) {
          api.toast({
              msg: '再按一次退出',
              duration: 2000,
              location: 'bottom'
          });
          quitflag = true;
          setTimeout(function() {
              quitflag = false;
          }, 2000);
      } else {
          api.closeWidget({
              silent: true
          });
      }
    });
}
