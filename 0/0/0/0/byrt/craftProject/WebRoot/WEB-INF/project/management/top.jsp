<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/topnavleft.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/media.css">
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>js/jsall.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	 
	function exitLogin(){
		top.location.href = url + "user/exitLogin";
	}
	
</script>
</head>
<body>
	<%--<input type="hidden" id="rol_id" value="${user.rolId}">--%>
	<div class="header clr">
		<div class="topnav">
			 <a href='<%=basePath%>management/zpgl.htm' target='main'><i class='bg1'></i>作品管理</a>
			 <a href='<%=basePath%>management/xtpz.htm' target='main'><i class='bg2'></i>系统配置</a>
		</div>
		<div class="headrigh">
			<span>欢迎！${sessionScope.user.useNam } </span><a href="javascript:void(0);" onclick="exitLogin();" target="_top"><i></i>退出</a>
		</div>
	</div>	
	<script type="text/javascript">
	   function cpxxxs(key){		
		   var ids= $(key).attr("id");
		   var text=$(key).find('span').html();
		   setCookie("jcxxId", ids);
		   setCookie("jcssName", text);
	   }
	</script>
</body>
</html>