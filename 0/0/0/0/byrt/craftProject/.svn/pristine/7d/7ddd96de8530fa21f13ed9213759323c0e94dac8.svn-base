$().ready(function() {
	var username = Login.getCookie("username");
	if ($.trim(username) != "") {
		$("#username").next().css("display", "none");
		$("#username").val(username);
	}
	Login.init();
});
var usernameFlag = true;
var pwdFlag = true;
var Login = {
	init : function() {
		$("#username").focus(function() {
			$("#username").nextAll(".error").first().css("display", "none");
			$("#password").nextAll(".error").first().css("display", "none");
		});
		$("#username").blur(
				function() {
					var username = $("#username").val();
					if (username == null || $.trim(username) == "") {
						$("#username").nextAll(".error").first().text(
								"!用户名不能为空");
						$("#username").nextAll(".error").first().css("display",
								"block");
						usernameFlag = false;
					} else {
						$.ajaxSetup( {
							async : false,
							cache : false
						});
						 
					}
				});
		$("#password").blur(
				function() {
					var password = $("#password").val();
					if (password == null || $.trim(password) == "") {
						$("#password").nextAll(".error").first().text("请输入密码");
						$("#password").nextAll(".error").first().css("display",
								"block");
						pwdFlag = false;
					} else {
						$("#password").nextAll(".error").first().css("display",
								"none");
						pwdFlag = true;
					}
				});

		$(".login_btn").click(function() {
			Login.doLogin();
		});
        document.onkeydown = function(e){
            var ev = document.all ? window.event : e;
            if(ev.keyCode==13) {
                Login.doLogin();
            }
        }
	},
	doLogin : function() {
		if (usernameFlag && pwdFlag) {
			$.ajaxSetup( {
				async : false,
				cache : false
			});
			var username = $("#username").val();
			var password = $("#password").val();
			$.post(url+"user/login", {
				"username" : username,
				"password" : password
			},
			function(data) {
				if ("0"==data.status) {
					Login.keepUsernameCookie();
					var userAgentInfo = navigator.userAgent;
				    var Agents = ["Android", "iPhone",
				                "SymbianOS", "Windows Phone",
				                "iPad", "iPod"];
				    var flag = true;
				    for (var v = 0; v < Agents.length; v++) {
				        if (userAgentInfo.indexOf(Agents[v]) > 0) {
				            flag = false;
				            break;
				        }
				    }
				    if(flag == false){
			  	    	$.ajax({
			  	    		url:url+'Opus/selOpusByUserId',
			  	    		type:"post",
			  	    		dataType:"json",
			  	    		success:function(data){
			  	    			if("0"==data.status){
			  	    				var json = data.data;
			  	    				 if(json.basUser.length > 0 ){
			  	    					  window.location.href=url+"commens/myworks-mob.htm";
			  	    				 }else{
			  	    					  window.location.href=url+"commens/entry-mob.htm";
			  	    				 }
			  	    			}else{
			  	    				window.location.href=url+"commens/entry-mob.htm";
			  	    			}
			  	    		}
			  	    	})
				    	 
				    }else{
				    	window.location.href=url+"commens/index.htm";
				    }
					
				}else {
					$("#password").nextAll(".error").first().text(
							"您输入的账户名和密码不匹配，请重新输入");
					$("#password").nextAll(".error").first().css("display",
							"block");
				}

			},"json");
		}

	},
	keepUsernameCookie : function() {
		if ($("#keepUsername").prop("checked")) {
			var username = $("#username").val();
			Login.setCookie("username", username, {
				expires : 365
			});
		} else {
			Login.setCookie("username", "");
		}
	},
	setCookie : function(name, value) {
		var Days = 365; //此 cookie 将被保存 30 天
		var exp = new Date(); //new Date("December 31, 9998");
		exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
		document.cookie = name + "=" + escape(value) + ";expires="
				+ exp.toGMTString();
	}, //两个参数，一个是cookie的名子，一个是值 
	getCookie : function(name) {
		var arr = document.cookie.match(new RegExp("(^| )" + name
				+ "=([^;]*)(;|$)"));
		if (arr != null)
			return unescape(arr[2]);
		return null;
	}//取cookies函数        
}