<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>系统配置</title>
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/style.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/topnavleft.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/media.css">
</head>

<frameset cols="330px,*" frameborder="NO" border="0" framespacing="0">
	<frame name="left" src="<%=basePath%>management/zpgl/menu.htm"></frame>
	<!-- 根据权限打开右侧页面 -->
	<frame name="right" id="yytj_right" src="<%=basePath%>${menu[0].module_url}"></frame>
	<noframes>
	<body>您的浏览器无法处理框架！</body>
	</noframes>
</frameset>

</html>