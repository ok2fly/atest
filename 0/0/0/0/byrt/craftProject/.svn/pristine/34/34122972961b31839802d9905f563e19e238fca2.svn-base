<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>注册登录-“中国手艺”创意设计比赛</title>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/user/reg.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jsall.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/base.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/login.css">
	 
	<script type="text/javascript">
	
	function tab(key,a){
		$(".login_left").hide();
		$("#tab"+key).show();
		
		$(a).parent().parent().find("li").removeClass("active");
		$(a).parent().addClass("active");
	}
	</script>
</head>
<body>
	<div class="header disnone">
		<div class="wid990">
			<div class="top">
				<div class="fl">
					<span>您好！欢迎来到中国手艺-创意设计比赛！</span><a href="<%=basePath%>commens/login.htm"> [登录]</a><a href="<%=basePath%>commens/reg.htm">  [免费注册]</a>
				</div>
			</div>
		</div>
	</div>
	<div class="wid990 disnone" >
		<div class="banner">
			<div class="logo_box">
				<a href="<%=basePath%>commens/index.htm" class="logo"><img src="<%=basePath%>images/20131018110134.png"></a>
				<div class="fg"></div>
				<div class="logo_by">欢迎注册</div>
			</div>
			<div class="kouhao">我的创意,我的生活！</div>
		</div>
	</div>
	<div class="wid990">
		<div class="border bgbai">
			<div class="h2 tabheader">
				<ul>
					<li class="active" id="li-1"><a onclick="tab(1,this)">邮箱注册</a></li>
					<li  id="li-2"><a  onclick="tab(2,this)">手机号注册</a></li>
				</ul>
			</div>
			<div class="login_left"  id="tab1">
				<div class="left_text">
					<b>*</b><span>邮箱：</span>
				</div>
				<input type="text" class="text_in" name=userEmail id=userEmail>
				<!-- <div class="h"></div>
				<div class="left_text">
					<b>*</b><span>验证码：</span>
				</div>
				<div class="jiaoyanbox">
					<input type="text" class="text_in jiaoyan" id="checkCode">
					<div class="yanzhengma" id="refreshCode">发送验证码</div>
				</div> -->
				<div class="h"></div>
				<div class="left_text">
					<b>*</b><span>登录密码：</span>
				</div>
				<input type="password" class="text_in"  name=userPwd id=userPwd>
				<div class="h_5"></div>

				<div class="left_text">
					<b>*</b><span>确认密码：</span>
				</div>
					<div class="text_in_ceng"></div>
					<input type="password" class="text_in"  name="confirmPassword" id="confirmPassword" style="display:none">
				<div class="h"></div>
				<div class="a_line disnone-pc" style=" margin-right: 10px;    margin-bottom: 10px;">
	                <div class="fr">
	                    <a href="<%=basePath%>/commens/login.htm" class="main_color">已有账号请登录</a>
	                </div>
	                <div class="clear"></div>
	            </div>
				<div class="left_kong">
					<button id="register_btn" value="立即注册">立即注册</button>
				</div>
			</div>
			<div class="login_left" id="tab2" style="display:none;">
				<div class="left_text">
					<b>*</b><span>手机号：</span>
				</div>
				<input type="text" class="text_in" name=userMob id=userMob onBlur="changeMob(this.value)"  > 
				<div class="h"></div>

				<div class="left_text">
					<b>*</b><span>验证码：</span>
				</div>
				<div class="jiaoyanbox">
					<input type="text" class="text_in jiaoyan" id="checkCodeMob">
					<div class="text_tal okey" style="display:none;"></div>
					<div class="yanzhengma" id="refreshCodeMob">发送验证码</div>
					<div class="yanzhengma" id="refreshCodeMob-click" style="display:none;"></div>
				</div>
				<div class="h"></div>
				<div class="left_text">
					<b>*</b><span>登录密码：</span>
				</div>
				<input type="password" class="text_in"  name=userPwdMob id=userPwdMob>
				<div class="h_5"></div>

				<div class="left_text">
					<b>*</b><span>确认密码：</span>
				</div>
					<div class="text_in_ceng"></div>
					<input type="password" class="text_in"  name="confirmPasswordMob" id="confirmPasswordMob" style="display:none">
				<div class="h"></div>
				<div class="a_line disnone-pc" style=" margin-right: 10px;    margin-bottom: 10px;">
	                <div class="fr">
	                    <a href="<%=basePath%>/commens/login.htm" class="main_color">已有账号请登录</a>
	                </div>
	                <div class="clear"></div>
	            </div>
				<div class="left_kong">
					<button id="register_btn_mob" value="立即注册">立即注册</button>
				</div>
			</div>
			<div class="h2"></div>
		</div>
	</div>
</body>
</html>