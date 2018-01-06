
/**
 * 公共配置文件
 */
  
var url = "";
var jumpPageUrl = "";
var url = "http://139.196.235.134/";
//var url = "http://localhost:8080/craft/";


$(function(){
	checkUseIsLogin();
	
	$(".lastBtn").click(function(){
		window.history.go(-1);
	})
	$(".homeBtn").click(function(){
		window.location.href =  url;
	})
})

/**
* 将秒数换成时分秒格式
*/
function formatSeconds(value) {
    var theTime = parseInt(value);// 秒
    var theTime1 = 0;// 分
    var theTime2 = 0;// 小时
    if(theTime > 60) {
        theTime1 = parseInt(theTime/60);
        theTime = parseInt(theTime%60);
            if(theTime1 > 60) {
            theTime2 = parseInt(theTime1/60);
            theTime1 = parseInt(theTime1%60);
            }
    }
        var result = ""+parseInt(theTime)+"秒";
        if(theTime1 > 0) {
        result = ""+parseInt(theTime1)+"分"+result;
        }
        if(theTime2 > 0) {
        result = ""+parseInt(theTime2)+"小时"+result;
        }
    return result;
}


/**
 * 获取两个时间的差 
 */
function getSjC(end,start){
   var resultData = "";
   var total = (end - start)/1000;
   var day = parseInt(total / (24*60*60));//计算整数天数
   var afterDay = total - day*24*60*60;//取得算出天数后剩余的秒数
   var hour = parseInt(afterDay/(60*60));//计算整数小时数
   var afterHour = total - day*24*60*60 - hour*60*60;//取得算出小时数后剩余的秒数
   var min = parseInt(afterHour/60);//计算整数分
   var afterMin = total - day*24*60*60 - hour*60*60 - min*60;//取得算出分后剩余的秒数
   if(day == 0){
	   if(hour == 0){
		   if(min == 0){
			   resultData = afterMin+"秒";
		   }else{
			   resultData = min+"分"+afterMin+"秒";
		   }
	   }else{
		   resultData = hour+"小时"+min+"分"+afterMin+"秒";
	   }
   }else{
	   resultData = day+"天"+hour+"小时"+min+"分"+afterMin+"秒";
   }
   return resultData;
}
/**
 * 判断用户是否登录 
 * @returns
 */
function checkUseIsLogin() {
	$.ajax({
		  url:url+"user/getUserInfo",
		  dataType:"json",
		  type:"get",
		  async : false,
		  success:function(data){	
			  if(data != "" && data != null && data != undefined){
				   var htm =  '<div class="loginbox" style="overflow:hidden;">'+
							  ' <a href="javascript:redirectEvent()">'+data.data.useNam+'</a>' + 
							  ' <a href="javascript:exitEvent()">退出</a>'+
							  '</div>';
				   $(".topmenu").html(htm);
			  } 
		 }
	});
}

function redirectEvent(){
	window.location.href = url+"commens/myworks.htm";
	/*$.ajax({
		  url:url+"user/logout",
		  dataType:"json",
		  type:"get",
		  async : false,
		  success:function(data){	
			  if(data != "" && data != null && data != undefined){
				   var htm =  ' <div class="loginbox" style="overflow:hidden;">'+
							   '<a id="uselogin2" class="fl" href="'+url+'commens/login.htm">参赛登录</a>'+
							   '</div>';
				   $(".topmenu").html(htm);
				   window.reload();
			  } 
		 }
	});*/
}

function exitEvent(){
	  var htm =  ' <div class="loginbox" style="overflow:hidden;">'+
			   '<a id="uselogin2" class="fl" href="'+url+'commens/login.htm">参赛登录</a>'+
			   '</div>';
	$(".topmenu").html(htm);
	window.location.href = url+"user/logout";
	/*$.ajax({
		  url:url+"user/logout",
		  dataType:"json",
		  type:"get",
		  async : false,
		  success:function(data){	
			  if(data != "" && data != null && data != undefined){
				   var htm =  ' <div class="loginbox" style="overflow:hidden;">'+
							   '<a id="uselogin2" class="fl" href="'+url+'commens/login.htm">参赛登录</a>'+
							   '</div>';
				   $(".topmenu").html(htm);
				   window.reload();
			  } 
		 }
	});*/
}
/**
 * 刷新用户的数据 - 微信功能
 * @returns
 */
function refreshUse(id) {
	 if(getCookie("Userflag")  && getCookie("Userflag") == "1"){
		 $.ajax({
			  url:url+"getUseInf.htm",
			  data:"id="+id,
			  dataType:"json",
			  type:"post",
			  async : false,
			  success:function(data){	
				  if(data.resultcode == "USR000"){
					  localStorage.setItem("wxUser", JSON.stringify(data));
				  }else{
					  alert(data.desc);
				  }
			 }
		});
	 }else{
		 if(localStorage.getItem("wxUser")){
			 localStorage.removeItem("wxUser")
		 }
	 }
}

/**
 * 获取url的参数 - 微信功能
 * @param name 参数名称
 * @returns
 */
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) return unescape(r[2]); return null;
}

/**
 * 展示产品信息的弹出框
 * @param hre  产品信息页面地址
 */
function showWindow(hre){
	if(window.parent.frames["main"]){
		if(window.parent.frames["main"].layer){
			window.parent.frames["main"].layer.open({
				  type: 2,
			      title: '产品信息',
			      shadeClose: true,
			      shade: false,
			      area: ['850px', '300px'],
			      content:  hre
			});	
		}else{
			if(window.parent.frames["main"].frames["right"].layer){
				window.parent.frames["main"].frames["right"].layer.open({
					  type: 2,
				      title: '产品信息',
				      shadeClose: true,
				      shade: false,
				      area: ['850px', '300px'],
				      content:  hre
				});	
			} 
		}
	} 
}


/**
 * 获取数据是否返回-
 * @param val 参数值
 * @returns
 */
function getIs_(val){
	if(val == "" || val == undefined || val == null || val == "undefined"){
		return "-";
	}else{
		return  val;
	} 
}


/**
 * 获取数据是否返回0  -  微信 pc端共用
 * @param val 参数值
 * @returns
 */
function getIsZero(val){
	if(val == "" || val == undefined || val == null || val == "undefined"){
		return 0;
	}else{
		return  val;
	} 
}

/**
 * 获取数据是否返回无
 * @param val 参数值
 * @returns
 */
function getIsNull(val){
	if(val == "" || val == undefined || val == null || val == "undefined"){
		return "无";
	}else{
		return  val;
	} 
}

/**
 * 判断是否为空
 * @param {} val
 * @return {Boolean}
 */
function isNull(val){
	if (null==val||$.trim(val)==''||'null'==val || undefined == val || 'undefined' == val) {
		return true;
	}else{
		return false;
	}
}

/**
 * 时间戳转换成时间
 * @param nS 时间戳
 * @param type 转换类型 
 *  1 年月日时分秒  2 年月日 3 时分秒 4 年月 5 月日 6 时分 7 分秒 8 年 9 月 10 日 11 时 12 分 13秒
 */
function getLocalDateAndTime(nS,type){
	if(nS == undefined || nS == null || nS == "" || nS == "undefined"){
		return "无";
	}else{
		 var myDate = new Date(parseInt(nS)); 
	     var $_year = myDate.getFullYear(); 
	     var $_month = parseInt(myDate.getMonth())+1; 
	     var $_day = myDate.getDate(); 
		 var hours = myDate.getHours();
		 var minutes = myDate.getMinutes();
		 var second = myDate.getSeconds();
		 
		 var $_f_date = "";
		 switch (type) {
			case 1:
				$_f_date = $_year +"-"+add0($_month)+"-"+add0($_day)+" "+add0(hours)+":"+add0(minutes)+":"+add0(second); 
				break;
			case 2:
				$_f_date =  $_year +"-"+add0($_month)+"-"+add0($_day); 
				break;
			case 3:
				$_f_date =  add0(hours)+":"+add0(minutes)+":"+add0(second); 
				break;
			case 4:
				$_f_date =  $_year +"-"+add0($_month);
				break;
			case 5:
				$_f_date =  add0($_month)+"-"+add0($_day);
				break;
			case 6:
				$_f_date =  add0(hours)+":"+add0(minutes);
				break;
			case 7:
				$_f_date =  add0(minutes)+":"+add0(second);
				break;
			case 8:
				$_f_date =  $_year;
				break;
			case 9:
				$_f_date =  add0($_month);
				break;
			case 10:
				$_f_date =  add0($_day);
				break;
			case 11:
				$_f_date =  add0(hours);
				break;
			case 12:
				$_f_date =  add0(minutes);
				break;
			case 13:
				$_f_date =  add0(second);
				break;
			default:
				break;
		}
	     return $_f_date;
	}
}
 
 

function add0(m){return m<10?'0'+m:m }

 


//-----cookie操作=-------
function setCookie(name,value)
{
	var Days = 30;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

function getCookie(name)
{
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
	return unescape(arr[2]);
	else
	return null;
}

function delCookie(name)
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if(cval!=null)
	document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function setCookie(name,value,time)
{
	var str = name + "=" + escape(value); 
	if(time > 0){//为0时不设定过期时间，浏览器关闭时cookie自动消失 
		var date = new Date(); 
		var ms = time*3600*1000; 
		date.setTime(date.getTime() + ms); 
		str += "; expires=" + date.toGMTString(); 
	} 
	document.cookie = str; 
}
/*
 * 截取字符串方法
 */
function jqzflast(key){
	  key=key.substring(0,key.length-1);
	  return key;
}
/**
 * 重新获取用户数据
 */
function updateUserData(userId){
	 $.ajax({
		  url:url+"getIntegratMonitorLeftSide.htm",
		  data:"use_id="+userId,
		  dataType:"json",
		  type:"post",
		  success:function(data){	
			  if(data.resultcode == "USR000"){
				  sessionStorage.setItem("userData",JSON.stringify(data));
			  }else{
				  layer.alert(data.desc);
			  }
		  }
	 });
}
/*function setCookie(name,value,time)
{
	var strsec = getsec(time);
	var exp = new Date();
	exp.setTime(exp.getTime() + strsec*1);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}*/

//session示例代码
/*function saveStorage(id){
	var target = document.getElementById(id);
	var str = target.value;
	sessionStorage.setItem("userData",str);
}

function loadStorage(id){
	var target = document.getElementById(id);
	var msg = sessionStorage.getItem("userData");
	target.innerHTML = msg;
}*/
//---------------兼容 ---------------------------
$(function(){  
	 
	  //判断浏览器是否支持placeholder属性
  supportPlaceholder='placeholder' in document.createElement('input'),
 
  placeholder=function(input){
 
    var text = input.attr('placeholder'),
    defaultValue = input.defaultValue;
 
    if(!defaultValue){	 
      input.val(text).addClass("phcolor");
    }
 
    input.focus(function(){
 
      if(input.val() == text){
   
        $(this).val("");
      }
    });
 
  
    input.blur(function(){
 
      if(input.val() == ""){
       
        $(this).val(text).addClass("phcolor");
      }
    });
 	    
  };
 
  //当浏览器不支持placeholder属性时，调用placeholder函数
  if(!supportPlaceholder){
 
    $('input').each(function(){
 
      text = $(this).attr("placeholder");
 
      if($(this).attr("type") == "text"){	 
        placeholder($(this));
      }
    });
  }	 
  
  
  /* ----------------文本框必填-------------------*/
  $(".requiredInp").after('<span class="fill" >*</span>');
});                                                                                                
/* 
 * 描述：判断浏览器信息 
 */  
//判断当前浏览类型  
function BrowserType()  
{  
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
    var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器  
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器  
    var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1 && !isIE; //判断是否IE的Edge浏览器  
    var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器  
    var isSafari = userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1; //判断是否Safari浏览器  
    var isChrome = userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1; //判断Chrome浏览器  

    if (isIE)   
    {  
         var reIE = new RegExp("MSIE (\\d+\\.\\d+);");  
         reIE.test(userAgent);  
         var fIEVersion = parseFloat(RegExp["$1"]);  
         if(fIEVersion == 7){ return "IE7";}  
         else if(fIEVersion == 8){ return "IE8";}  
         else if(fIEVersion == 9){ return "IE9";}  
         else if(fIEVersion == 10){ return "IE10";}  
         else if(fIEVersion == 11){ return "IE11";}  
         else{ return "0"}//IE版本过低  
     }//isIE end  
       
     if (isFF) {  return "FF";}  
     if (isOpera) {  return "Opera";}  
     if (isSafari) {  return "Safari";}  
     if (isChrome) { return "Chrome";}  
     if (isEdge) { return "Edge";}  
 }//myBrowser() end  
   
//判断是否是IE浏览器  
function isIE(){  
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器  
    if(isIE)  
    {  
        return "1";  
    }  
    else  
    {  
        return "-1";  
    }  
}  
   
   
 //判断是否是IE浏览器，包括Edge浏览器  
function IEVersion(){  
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器  
    var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1 && !isIE; //判断是否IE的Edge浏览器  
    if(isIE)  
    {  
         var reIE = new RegExp("MSIE (\\d+\\.\\d+);");  
         reIE.test(userAgent);  
         var fIEVersion = parseFloat(RegExp["$1"]);  
         if(fIEVersion == 7)  
         { return "IE7";}  
         else if(fIEVersion == 8)  
         { return "IE8";}  
         else if(fIEVersion == 9)  
         { return "IE9";}  
         else if(fIEVersion == 10)  
         { return "IE10";}  
         else if(fIEVersion == 11)  
         { return "IE11";}  
         else  
         { return "0"}//IE版本过低  
    }  
	else if(isEdge)  
	{  
	  return "Edge";  
	}  
    else  
    {  
        return "-1";//非IE  
    }  
}  

