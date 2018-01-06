<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>设备管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/topnavleft.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/wbox.css">
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>js/leftnav.js"></script>
<script src="<%=basePath%>js/baseManage.js"></script>
<script src="<%=basePath%>js/wbox.js"></script>
</head>
<body class="bg-e9">
	<!--  leftnav -->
	<div class="leftnav">
		<div class="twoleftnav">
			<dl>
				<c:forEach items="${list }" var="m" varStatus="status">
						<c:choose>
						<c:when test = "${status.index == 0}">
							<dd class="active">
						</c:when>
						<c:otherwise>
							<dd >
						</c:otherwise>
						</c:choose>
							<span class="parent_">
								<!-- 为了点击时，显示第一个子节点菜单 -->
								<c:choose>
									<c:when test = "${empty m.menu}">
										<a href="<%=basePath%>${m.module_url }" target="right">${m.module_name }</a>
									</c:when>
									<c:otherwise>
										<c:forEach items="${m.menu }" var="n" varStatus="status">
											<c:if test = "${status.index == 0}">
												 <a href="<%=basePath%>${n.module_url }" target="right">${m.module_name }</a>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<i class="active"></i>
							</span>
							<ul>
								<c:forEach items="${m.menu }" var="n">
									<li><a href="<%=basePath%>${n.module_url }" target="right" class="rightClass">${n.module_name }</a></li>
								</c:forEach>
							</ul>
						</dd>
				</c:forEach>
			</dl>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
	   $(".rightClass").each(function(i,data){
		   $(this).click(function(){			   
			   $(this).parent().parent().find(".rightClass").css("color","#666")
			   $(this).css("color","red");
		   })
	   })
	   
	   $(".parent_").click(function(){			   
			   $(".rightClass").css("color","#666") 
	   })
	})
	</script>
	<!-- ./ leftnav -->
</body>
</html>