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
    <title>注册登录</title>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jsall.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/user/zq_reg.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/user/login.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/base.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/login.css">
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

<div class="wid990 disnone">
    <div class="banner">
        <div class="logo_box">
            <a href="<%=basePath%>commens/index.htm" class="logo"><img src="<%=basePath%>images/20131018110134.png"></a>

            <div class="fg"></div>
            <div class="logo_by">欢迎登录</div>
        </div>
        <div class="kouhao">我的创意,我的生活！</div>
    </div>
</div>
<div class="wid990">
    <div class="login_img disnone">
        <img src="<%=basePath%>images/login_img.jpg" alt="">
    </div>
    <div class="login_main bgbai">
        <div class="border">
            <div class="login_name">
                登录名：
            </div>
            <div class="login_in">
                <input type="text" id="username" name="username">

                <div class="input_val">邮箱/用户名</div>
                <div class="error"></div>
            </div>
            <div class="h2"></div>
            <div class="login_name">
                登录密码：
            </div>
            <div class="login_in">
                <input type="password" id="password" name="password">

                <div class="input_val">请输入密码</div>
                <div class="error"></div>
            </div>
            <div class="h2"></div>
            <div class="a_line ">
                <div class="fl disnone">
                    <input type="checkbox" id="keepUsername" checked="checked">
                    <span>记住用户名</span>
                </div>
                <div class="fr">
                    <a href="<%=basePath%>/commens/reg.htm" class="main_color">免费注册</a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="h_5"></div>
            <button class="login_btn">登 &nbsp &nbsp &nbsp录</button>
            <div class="h_5"></div>
            
        </div>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
