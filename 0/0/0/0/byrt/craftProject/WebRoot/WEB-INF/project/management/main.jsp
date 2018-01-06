<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>手艺网</title>
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/style.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/media.css">	
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>js/jsall.js"></script>
</head>
<frameset rows="80px,*" frameborder="NO" border="0" framespacing="0">
	<frame name="top" src="<%=basePath%>management/top.htm" scrolling="No"  style="min-height: 80px;min-width: 1366px"></frame>
	<frame name="main" src="<%=basePath%>management/zpgl.htm" class="bg-e9" style="padding-top:10px;">
	<script type="text/javascript">

</script>
	</frame>
	<noframes>
	<body>您的浏览器无法处理框架！
	</body>	
	</noframes>
</frameset>

</html>