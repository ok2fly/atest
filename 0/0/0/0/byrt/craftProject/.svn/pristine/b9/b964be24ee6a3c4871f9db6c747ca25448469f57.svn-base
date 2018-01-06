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
	<title>“中国手艺”创意设计比赛</title>
	<link rel="stylesheet" href="<%=basePath%>css/common.css">
	<link rel="stylesheet" href="<%=basePath%>css/main.css">
	<link rel="stylesheet" href="<%=basePath%>css/type980.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jsall.js"></script>
	 <script type="text/javascript">
	 	$(function(){
	 		$(".ctgy").click(function(){
	 			location.href = "<%=basePath%>commens/worklist-mob.htm"
	 		}) 
	 		$(".cysj").click(function(){
	 			location.href = "<%=basePath%>commens/worklist-design-mob.htm"
	 		}) 
	 		$(".seaicon").click(function(){
	 			var searchText = $("#searchText").val();
	 			location.href = "<%=basePath%>commens/search-mob.htm?searchText="+searchText;
	 		}) 
	 	})
	 </script>
	</head>
<body class="bgimg">
	 <div class="w100 bggrag h60">
			 <div class="navbtn" >
			 	 <div><a class="lastBtn"></a></div>
			 	 <div><a class="homeBtn"></a></div>
			 </div>
	 </div>
	 <div class="w100 bggrag">
			<div class="blacktitle" style="padding:10px 20px 0;">
				作品展示
			</div>
			<div class="searchbox">
				<input type="text" class="searchmob" placeholder="输入作者名/作品名/作品编号以搜索.."  id="searchText" ><i class="seaicon"></i>
			</div>
	</div>
	<div class="bggrag">
		<div class="w100 ctgy">
			 <%-- <img src="<%=basePath%>img/process.png" alt=""> --%>
		</div>
		<div class="w100 cysj">
			<%--  <img src="<%=basePath%>img/categories.png" alt=""> --%>
		</div>
	</div>
	
</body>
</html>
