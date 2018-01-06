$(function(){
	var isIe = BrowserType();
	if(isIe.indexOf("IE") > -1){
		if(isIe != "IE9" && isIe != "IE10" && isIe != "IE11" ){
			window.location.href=jumpPageUrl+"commens/warn.htm";
		}
	} 
	  
	$(document).keydown(function(event){
		if(event.keyCode==13){
			login();
		}
	}); 
})



/////// 登录
function login(){
	httpurl=$("#hurl").val();
	var loginName = $('#loginName').val();
	var password = $('#password').val();
	  $.ajax({
		  url:httpurl+"user/userLogin",
		  data:"loginName="+loginName+"&password="+password,
		  dataType:"json",
		  type:"post",
		  success:function(data){	
			  if(data.status == 0){
				  window.location.href=httpurl+"management/main";
			  }else{
				  layer.alert(data.user);
			  }
		  }
	});
		 
}
 