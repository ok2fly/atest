$().ready(function () {
    Reg.init();
});
var passwordflag = true;
var emailflag = true;
var checkCodeFlag = true;

var passwordmobflag = true;
var mobflag = true;
var checkCodemobFlag = true;

var tmpCode = "";
var tmpEmailCode = "";
var countdown=60;
var regTime = '';
	
var oldMob = '';
function changeMob(val){
	if(oldMob != val){
		countdown = 0 ;
		Reg.setTimeCode();
	} 
}

var Reg = {
    init: function () {

        $("#userEmail")
            .focus(
            function () {
                if ($("#userEmail").next().is("p")) {
                    $("#userEmail").next().remove();
                }
                $("#userEmail")
                    .after(
                        "<p class=\"text_tal\">邮箱可作为登录账号</p>");
            });
        $("#userPwd").focus(
            function () {
                if ($("#userPwd").next().is("p")) {
                    $("#userPwd").next().remove();
                }
                $("#userPwd").after(
                    "<p class=\"text_tal\">6-20位字符，可由大小写英文、数字或符号组成</p>");
            });
        $("#confirmPassword").focus(
            function () {
                if ($("#confirmPassword").next().is("p")) {
                    $("#confirmPassword").next().remove();
                }
                $("#confirmPassword").after(
                    "<p class=\"text_tal\">请再次输入登录密码</p>");
            });
        
        
        $("#userMob").focus(
        function () {
            if ($("#userMob").next().is("p")) {
                $("#userMob").next().remove();
            }
            $("#userMob")
                .after(
                    "<p class=\"text_tal\">手机号可作为登录账号</p>");
	        });
	    $("#userPwdMob").focus(
	        function () {
	            if ($("#userPwdMob").next().is("p")) {
	                $("#userPwdMob").next().remove();
	            }
	            $("#userPwdMob").after(
	                "<p class=\"text_tal\">6-20位字符，可由大小写英文、数字或符号组成</p>");
	        });
	    $("#confirmPasswordMob").focus(
	        function () {
	            if ($("#confirmPasswordMob").next().is("p")) {
	                $("#confirmPasswordMob").next().remove();
	            }
	            $("#confirmPasswordMob").after(
	                "<p class=\"text_tal\">请再次输入登录密码</p>");
	        });
    
	    
    
        $("#userEmail").blur(function () {
            Reg.checkUserEmail();
        });
 
        $("#userPwd").blur(function () {
            Reg.checkUserPwd();
        })
        $("#userPwd").keyup(function () {
            Reg.checkUserPwd();
        });
        $("#confirmPassword").blur(function () {
            Reg.confirmPassword();
        });
        
        
        
        $("#userMob").blur(function () {
            Reg.checkUserMob();
        });
 
        $("#userPwdMob").blur(function () {
            Reg.checkUserPwdMob();
        })
        $("#userPwdMob").keyup(function () {
            Reg.checkUserPwdMob();
        });
        $("#confirmPasswordMob").blur(function () {
            Reg.confirmPasswordMob();
        });
        
        
        $("#refreshCodeMob").click(
            function () {
            		var userMob = $("#userMob").val();
                	$.post(
                    url+"/user/code",
                    {
                        "mob": userMob
                    },
                    function (data) {
                    	oldMob = userMob;
                        if (data != undefined && data != "" ) {
                        	tmpCode = data;
                        	alert("验证码发送成功！");
                        	Reg.setTimeCode();
                        } else {
                             alert("验证码发送失败，请重新发送");
                        }
                    });
        	}
        );

        $("#register_btn").click(function () {
        		Reg.checkUserEmail();
                Reg.checkUserPwd();
                Reg.confirmPassword();
               //Reg.checkCode();
                Reg.doReg();
        });
        $("#register_btn_mob").click(function () {
	    		Reg.checkUserMob();
	            Reg.checkUserPwdMob();
	            Reg.confirmPasswordMob();
	            Reg.checkCodeMob();
	            Reg.doRegMob();
            
        });
    },
    /**
     * 检查用户邮箱
     * @return {TypeName}
     */
    checkUserEmail: function () {
        var userEmail = $("#userEmail").val();
        var tmpEmailflag = true ;
        var tmpEmailflag2 = true ;
        if (userEmail == null || $.trim(userEmail) == "") {
            !$("#userEmail").next("p").remove();
            $("#userEmail").after("<p class=\"text_tal error\">！邮箱不能为空</p>");
            tmpEmailflag = false;
            return;
        }
        if (!Reg.isEmailFormat(userEmail)) {
            !$("#userEmail").next("p").remove();
            $("#userEmail").after("<p class=\"text_tal error\">！邮箱格式有误</p>");
            tmpEmailflag2 = false;
            return;
        }
        if(tmpEmailflag && tmpEmailflag2){
        	emailflag = true;
        }
        /*$
            .post(
            "/user/verifyEmail.w",
            {
                "userEmail": userEmail
            },
            function (data) {

                if ("success" == data) {
                    !$("#userEmail").next("p").remove();
                    $("#userEmail").after(
                        "<p class=\"text_tal okey\"></p>");
                    emailflag = true;
                } else {
                    !$("#userEmail").next("p").remove();
                    $("#userEmail")
                        .after(
                            "<p class=\"text_tal error\">邮箱已被注册，请重新输入或使用该邮箱<a href='/page/login.jsp' style='color:#2c9494;background:#fff;text-decoration:underline'>登录</a></p>");
                    emailflag = false;
                }
            });*/
    },
    /**
     * 检查用户手机
     * @return {TypeName}
     */
    checkUserMob: function () {
    	var userMob = $("#userMob").val();
    	if (userMob == null || $.trim(userMob) == "") {
    		!$("#userMob").next("p").remove();
    		$("#userMob").after("<p class=\"text_tal error\">！电话不能为空</p>");
    		mobflag = false;
    		return;
    	}
    	if (!Reg.isMobFormat(userMob)) {
    		!$("#userMob").next("p").remove();
    		$("#userMob").after("<p class=\"text_tal error\">！电话格式有误</p>");
    		mobflag = false;
    		return;
    	}
    },
    checkUserPwd: function () {
        var userPwd = $("#userPwd").val();

        if (userPwd.length >= 6 && userPwd.length <= 20) {
            if (/[a-zA-Z]+/.test(userPwd) && /[0-9]+/.test(userPwd)
                && /[^A-Za-z0-9]+/.test(userPwd)) {
                Reg.userPwdFormat(3);
            } else if (/[a-zA-Z]+/.test(userPwd) || /[0-9]+/.test(userPwd)
                || /[^A-Za-z0-9]+/.test(userPwd)) {
                if (/[a-zA-Z]+/.test(userPwd) && /[0-9]+/.test(userPwd)) {
                    Reg.userPwdFormat(2);
                } else if (/\[a-zA-Z]+/.test(userPwd) && /\W+\D+/.test(userPwd)) {
                    Reg.userPwdFormat(2);
                } else if (/[0-9]+/.test(userPwd) && /\W+\D+/.test(userPwd)) {
                    Reg.userPwdFormat(2);
                } else {
                    Reg.userPwdFormat(1);
                }
            }
            $("#userPwd").next("p").remove();
            $("#userPwd").after("<p class=\"text_tal okey\"></p>");
            $("#confirmPassword").css("display", "block");
            $("#confirmPassword").prev().css("display", "none");
            passwordflag = true;
        } else {
            Reg.userPwdFormat(null);
            if (userPwd == null || $.trim(userPwd) == "") {
                $("#userPwd").next("p").remove();
                $("#userPwd").after("<p class=\"text_tal error\">！密码不能为空</p>");

            } else if (userPwd.length > 20 || userPwd.length < 6) {
                $("#userPwd").next("p").remove();
                $("#userPwd").after(
                    "<p class=\"text_tal error\">密码为6-20个字符</p>");
            }
            passwordflag = false;
        }
    },
    checkUserPwdMob: function () {
    	var userPwdMob = $("#userPwdMob").val();
    	
    	if (userPwdMob.length >= 6 && userPwdMob.length <= 20) {
    		if (/[a-zA-Z]+/.test(userPwdMob) && /[0-9]+/.test(userPwdMob)
    				&& /[^A-Za-z0-9]+/.test(userPwdMob)) {
    			Reg.userPwdMobFormat(3);
    		} else if (/[a-zA-Z]+/.test(userPwdMob) || /[0-9]+/.test(userPwdMob)
    				|| /[^A-Za-z0-9]+/.test(userPwdMob)) {
    			if (/[a-zA-Z]+/.test(userPwdMob) && /[0-9]+/.test(userPwdMob)) {
    				Reg.userPwdMobFormat(2);
    			} else if (/\[a-zA-Z]+/.test(userPwdMob) && /\W+\D+/.test(userPwdMob)) {
    				Reg.userPwdMobFormat(2);
    			} else if (/[0-9]+/.test(userPwdMob) && /\W+\D+/.test(userPwdMob)) {
    				Reg.userPwdMobFormat(2);
    			} else {
    				Reg.userPwdMobFormat(1);
    			}
    		}
    		$("#userPwdMob").next("p").remove();
    		$("#userPwdMob").after("<p class=\"text_tal okey\"></p>");
    		$("#confirmPasswordMob").css("display", "block");
    		$("#confirmPasswordMob").prev().css("display", "none");
    		passwordMobflag = true;
    	} else {
    		Reg.userPwdMobFormat(null);
    		if (userPwdMob == null || $.trim(userPwdMob) == "") {
    			$("#userPwdMob").next("p").remove();
    			$("#userPwdMob").after("<p class=\"text_tal error\">！密码不能为空</p>");
    			
    		} else if (userPwdMob.length > 20 || userPwdMob.length < 6) {
    			$("#userPwdMob").next("p").remove();
    			$("#userPwdMob").after(
    			"<p class=\"text_tal error\">密码为6-20个字符</p>");
    		}
    		passwordMobflag = false;
    	}
    },
    userPwdFormat: function (sign) {
        $("#userPwd").nextAll(".h:first").children().first().show();
        $("#userPwd").nextAll(".h:first").children().first().children()
            .removeClass("dadao");
        if (sign == 3) {
            $("#userPwd").nextAll(".h:first").children().first().children().eq(
                2).addClass("dadao");$("#userPwd").nextAll(".h:first").children().first().children().eq(
                1).addClass("dadao");$("#userPwd").nextAll(".h:first").children().first().children().eq(
                0).addClass("dadao");
        } else if (sign == 2) {
            $("#userPwd").nextAll(".h:first").children().first().children().eq(
                1).addClass("dadao");$("#userPwd").nextAll(".h:first").children().first().children().eq(
                0).addClass("dadao");
        } else if (sign == 1) {
            $("#userPwd").nextAll(".h:first").children().first().children().eq(
                0).addClass("dadao");
        } else {
            $("#userPwd").nextAll(".h:first").children().first().hide();
        }
    },
   
    userPwdMobFormat: function (sign) {
        $("#userPwdMob").nextAll(".h:first").children().first().show();
        $("#userPwdMob").nextAll(".h:first").children().first().children()
            .removeClass("dadao");
        if (sign == 3) {
            $("#userPwdMob").nextAll(".h:first").children().first().children().eq(
                2).addClass("dadao");$("#userPwdMob").nextAll(".h:first").children().first().children().eq(
                1).addClass("dadao");$("#userPwdMob").nextAll(".h:first").children().first().children().eq(
                0).addClass("dadao");
        } else if (sign == 2) {
            $("userPwdMob").nextAll(".h:first").children().first().children().eq(
                1).addClass("dadao");$("#userPwdMob").nextAll(".h:first").children().first().children().eq(
                0).addClass("dadao");
        } else if (sign == 1) {
            $("#userPwdMob").nextAll(".h:first").children().first().children().eq(
                0).addClass("dadao");
        } else {
            $("#userPwdMob").nextAll(".h:first").children().first().hide();
        }
    },

    isEmailFormat: function (email) {
        var pattern = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
        if (email != "" && !(pattern.test(email))) {
            return false;
        } else if (email == '') {
            return false;
        } else {
            return true;
        }
    },
    
    isMobFormat: function (mob) {
    	var pattern = /^[1][3,4,5,7,8][0-9]{9}$/;  
    	if (mob != "" && !(pattern.test(mob))) {
    		return false;
    	} else if (mob == '') {
    		return false;
    	} else {
    		return true;
    	}
    },

    confirmPassword: function () {
        var userPwd = $("#userPwd").val();
        var confirmPassword = $("#confirmPassword").val();
        if (confirmPassword == null || $.trim(confirmPassword) == "") {
            $("#confirmPassword").next("p").remove();
            $("#confirmPassword").after(
                "<p class=\"text_tal error\">！确认密码不能为空</p>");
            passwordflag = false;

        } else if (confirmPassword != userPwd) {
            $("#confirmPassword").next("p").remove();
            $("#confirmPassword").after(
                "<p class=\"text_tal error\">两次密码输入不一致</p>");
            passwordflag = false;
        } else if (confirmPassword == userPwd) {
            $("#confirmPassword").next("p").remove();
            $("#confirmPassword").after("<p class=\"text_tal okey\"></p>");
            passwordflag = true;
        }
    },
    confirmPasswordMob: function () {
    	var userPwdMob = $("#userPwdMob").val();
    	var confirmPasswordMob = $("#confirmPasswordMob").val();
    	if (confirmPasswordMob == null || $.trim(confirmPasswordMob) == "") {
    		$("#confirmPasswordMob").next("p").remove();
    		$("#confirmPasswordMob").after(
    		"<p class=\"text_tal error\">！确认密码不能为空</p>");
    		passwordMobflag = false;
    		
    	} else if (confirmPasswordMob != userPwdMob) {
    		$("#confirmPasswordMob").next("p").remove();
    		$("#confirmPasswordMob").after(
    		"<p class=\"text_tal error\">两次密码输入不一致</p>");
    		passwordMobflag = false;
    	} else if (confirmPasswordMob == userPwdMob) {
    		$("#confirmPassword").next("p").remove();
    		$("#confirmPassword").after("<p class=\"text_tal okey\"></p>");
    		passwordMobflag = true;
    	}
    },
    checkCode: function () {
    	var checkCode = $("#checkCode").val();
    	if (checkCode   == tmpEmailCode ) {
    		$("#checkCode").next().removeClass("error");
    		$("#checkCode").next().css("display", "none");
    		checkCodeFlag = true;
    	} else  {
    		$("#checkCode").next().addClass("error");
			$("#checkCode").next().css("display", "block");
			checkCodeFlag = false;
    	}
    },
    checkCodeMob: function () {
    	var checkCodeMob = $("#checkCodeMob").val();
    	if (checkCodeMob   == tmpCode ) {
    		$("#checkCodeMob").next().removeClass("error");
    		$("#checkCodeMob").next().css("display", "none");
    		checkCodemobFlag = true;
    	} else  {
    		$("#checkCodeMob").next().addClass("error");
			$("#checkCodeMob").next().css("display", "block");
			checkCodemobFlag = false;
    	}
    },
    setTimeCode : function(){
    	if (countdown == 0) {
    		$("#refreshCodeMob-click").hide();
            $("#refreshCodeMob").show();
            $("#refreshCodeMob").text("获取验证码");
            countdown = 60;
            clearTimeout(regTime);
            return;
       } else {
    	   $("#refreshCodeMob-click").show();
    	   $("#refreshCodeMob").hide();
            $("#refreshCodeMob-click").text("(" + countdown + ") s 重新发送");
            countdown--;
            regTime = setTimeout(function() { Reg.setTimeCode() },1000)
       }
    },
    doReg: function () {
    	$.ajaxSetup({
    		async: false,
    		cache: false
    	});
        var userEmail = $("#userEmail").val();
        var password = $("#userPwd").val();
        if (passwordflag && emailflag   ) {
            $.post(url+"/user/register", {
                "type": 0,
                "useMal": userEmail,
                "usePas": password 
            }, function (data) {
                if ("0" == data.status) {
                	alert(data.msg);
                    /*$.ajaxSetup( {
        				async : false,
        				cache : false
        			});
        			$.post(url+"user/login", {
        				"username" : userEmail,
        				"password" : password
        			},
        			function(data) {
        				if ("0"==data.status) {
        					window.location.href=url+"commens/index.htm";
        				}else {
        					 alert(data.msg);
        				}
        			},"json");*/
                } else {
                	alert(data.msg);
                }

            });
        }
    },
    doRegMob: function () {
    	$.ajaxSetup({
    		async: false,
    		cache: false
    	});
    	var userEmailMob = $("#userMob").val();
    	var passwordMob = $("#userPwdMob").val();
    	var checkCodeMob = $("#checkCodeMob").val();
    	if (userEmailMob && passwordMob && checkCodeMob
    	) {
    		$.post(url+"user/registMob", {
    			"mob": userEmailMob,
    			"password": passwordMob,
    			"code": checkCodeMob,
    			"x_param": tmpCode 
    			
    		}, function (data) {
    			if ("0" == data.status) {
    				$.ajaxSetup( {
        				async : false,
        				cache : false
        			});
        			$.post(url+"user/login", {
        				"username" : userEmailMob,
        				"password" : passwordMob
        			},
        			function(data) {
        				if ("0"==data.status) {
        					window.location.href=url+"commens/index.htm";
        				}else {
        					 alert(data.msg);
        				}
        			},"json");
    			} else {
    				alert(data.msg);
    				//location.href = url + "commens/reg.htm";
    			}
    			
    		});
    	}
    },
    getRandomStrings: function (len) {
        len = len || 32;
        var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'; // 默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1
        var maxPos = $chars.length;
        var pwd = '';
        for (i = 0; i < len; i++) {
            pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
        }
        return pwd;
    },
    checkUrl:function(url) {
        var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
            + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
            + "(([0-9]{1,3}/.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
            + "|" // 允许IP和DOMAIN（域名）
            + "([0-9a-z_!~*'()-]+/.)*" // 域名- www.
            + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]/." // 二级域名
            + "[a-z]{2,6})" // first level domain- .com or .museum
            + "(:[0-9]{1,4})?" // 端口- :80
            + "((/?)|" // a slash isn't required if there is no file name
            + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
        var re=new RegExp(strRegex);
        //re.test()
        if (re.test(str_url)){
            return (true);
        }else{
            return (false);
        }
    }

}