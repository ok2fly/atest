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
	 		$(".group-workone").click(function(){
	 			 if($(this).attr("type") == 1){
	 				location.href = "<%=basePath%>commens/worklist-mob.htm"
	 			 }else{
	 				location.href = "<%=basePath%>commens/worklist-design-mob.htm"
	 			 }
	 		}) 
	 	})
	 </script>
	</head>
<body class="bgimg">
	 <div class="w100">
			<div class="blacktitle" style="padding:10px 20px 0;">
				作品展示
			</div>
			<div class="searchbox">
				<input type="text" class="searchmob" placeholder="输入作者名/作品名/作品编号以搜索.." id="searchText"  value="${searchText}" ><i class="seaicon"></i>
			</div>
	</div>
	<div class="w100">
		<div style="padding:10px 20px;">
			<div class="group-detail"  >
				 传统工艺
			</div>
			<div class="group-item-mob"   id="chuantong" >
				<!-- <div class="group-workone" type="1">
					<a></a>
					<span class="tpxx"></span> <i><b></b>32</i>
				</div>
				<div class="group-workone" type="1">
					<a></a>
					<span class="tpxx"></span> <i><b></b>32</i>
				</div> -->
			</div>
			<div class="group-detail"  >
				 创意设计
			</div>
			<div class="group-item-mob"  id="sheji">
				<!-- <div class="group-workone" type="2">
					<a></a>
					<span class="tpxx"><b></b>2</span> <i><b></b>32</i>
				</div>
				<div class="group-workone" type="2">
					<a></a>
					<span class="tpxx"><b></b>2</span> <i><b></b>32</i>
				</div> -->
			</div>
		</div>
	</div>
	
	 <script type="text/javascript">
	 	$(function(){
	 		var  searchText = $("#searchText").val();
	 		var searchVo = {} 
	 		searchVo.search = searchText ;
	 		$.ajax({
				url:'<%=basePath%>Opus/selOpusByLike',
				data:searchVo,
				type:"post",
				dataType:"json",
				success:function(data){
					if("0"==data.status){
						//pageInit();
						$("#chuantong").empty();
						$("#sheji").empty();
						//传统
						$.each(data.data.opus12Map.opusList,function(i,v){
							if(i < 2){
								cloneHtml1 =
									'<div class="group-workone">'+
									'<a  href="worklist-mob.htm?searchText='+searchText+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
									'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
									'</div>';
								$("#chuantong").append(cloneHtml1);
							}
							
						})
						//创意设计
						$.each(data.data.opus13Map.opusList,function(i,v){
							if(i < 2){
								cloneHtml2 =
									'<div class="group-workone">'+
									'<a  href="worklist-design-mob.htm?searchText='+searchText+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
									'<span class="tpxx" id="vote_'+v.id+'"><b></b>'+v.vote_count+'</span> <i><b></b>'+v.opus_hot+'</i>'+
									'</div>';
								$("#sheji").append(cloneHtml2);
							}
						})
					}
				}
			})
	 	})
	 </script>
</body>
</html>
