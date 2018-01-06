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
	<title>“中国手艺”创意设计比赛</title>
	<link rel="stylesheet" href="<%=basePath%>css/common.css">
	<link rel="stylesheet" href="<%=basePath%>css/main.css">
	<link rel="stylesheet" href="<%=basePath%>css/type980.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.cookie.js"></script>
	<script>
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
	    	location.href="<%=basePath%>commens/entry-mob.htm";
	    }
	</script>
	</head>
<body>

<div class="wid100 logbn" style="height:60px;background:#7E2626;">
		<div class="w1318">
			<a href="<%=basePath%>"><img class="logo" src="<%=basePath%>images/20131018110134.png" style="margin-left: 25px;">
			</a>
			<div class="logotext" style="margin-left: 30px;">
					<span style="color:#fff;font-size:14px;font-family:'微软雅黑',Arial,Verdana;display:block;">中华人民共和国文化部主管 </span>
					<span style="color:#fff;font-size:14px;font-family:'微软雅黑',Arial,Verdana;display:block;">中国文化传媒集团（中国文化报社）主办 </span>
			</div>
			 
			<div class="rmenu" style='clear: both; margin-top: -65px;margin-left:10px;'>
				<div class="topmenu">
						<div class="loginbox" style="overflow:hidden;">
							<a id="uselogin2" class="fl" href="<%=basePath%>commens/login.htm">参赛登录</a>
						</div>
				</div>
			</div>
		</div>			
	</div>
	<div class="banner">
	</div>
	<div class="menu">
		<div class="w100">
			<a   href="<%=basePath%>commens/index.htm"  class="navone home"></a>
			<a   href="<%=basePath%>commens/rule.htm"  class="navone detail "></a>
			<a   href="<%=basePath%>commens/worklist.htm"  class="navone gongyi"></a>
			<a   href="<%=basePath%>commens/worklist-design.htm"  class="navone design"></a>
			<a   href="<%=basePath%>commens/entry.htm" class="navone entry" > </a>
		</div>
	</div>
<div class="cont">
		<div class="w100">
			<div class="blacktitle">
				参赛流程
			</div>
		</div>
		<div class="process"></div>
		<div class="nextbtn" onclick="process()">我知道了，下一步</div>
	</div>
 	<script type="text/javascript">
		function process(){
			window.location.href="entry.htm";
		}
	</script>
 
	<div class="perW100"> 
		<div class="footerbg">
			 <%-- <img src="<%=basePath%>img/footer.png" alt=""> --%>
		</div>
	</div>	
</body>
</html>
