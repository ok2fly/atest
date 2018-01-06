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
 				location.href = "<%=basePath%>commens/worklist-design-mob-group.htm"
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
				作品展示-创意设计
			</div>
			<div class="searchbox">
				<input type="text" class="searchmob" placeholder="输入作者名/作品名/作品编号以搜索.."  id="searchText"  value="${searchText}" ><i class="seaicon"></i>
			</div>
	</div>
	<div class="w100 bggrag minh">
		<div style="padding:10px 20px;"  id="sheji">
			<!-- <div class="group-detail"  >
				 服装组
			</div>
			<div class="group-item-mob"  >
				<div class="group-workone">
					<a></a>
					<span class="tpxx"><b></b>2</span> <i><b></b>32</i>
				</div>
				<div class="group-workone">
					<a></a>
					<span class="tpxx"><b></b>2</span> <i><b></b>32</i>
				</div>
			</div>
			<div class="group-detail"  >
				 织绣组
			</div>
			<div class="group-item-mob"  >
			</div> -->
		</div>
	</div>
	 <script type="text/javascript">
	 	$(function(){
	 		var  searchText = $("#searchText").val();
	 		var searchVo = {} 
	 		searchVo.search = searchText ;
	 		searchVo.parent_id = 13 ;
	 		$.ajax({
				url:'<%=basePath%>Opus/selOpusByLike',
				data:searchVo,
				type:"post",
				dataType:"json",
				success:function(data){
					if("0"==data.status){
						//pageInit();
						$("#sheji").empty();
						//创意设计
						var arr = new Array();
						
						var cloneHtml22 = '';
						var cloneHtml25 = '';
						var cloneHtml23 = '';
						var cloneHtml26 = '';
						var cloneHtml24 = '';
						
						var cloneHtml22cou = 0;
						var cloneHtml25cou = 0;
						var cloneHtml23cou = 0;
						var cloneHtml26cou = 0;
						var cloneHtml24cou = 0;
						$.each(data.data.opus13Map.opusList,function(i,v){
							if(v.group_id == '22'){
								if(cloneHtml22cou < 2){
									cloneHtml22 += 
												'<div class="group-workone">'+
												'<a  href="worklist-design-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"><b></b>'+v.vote_count+'</span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml22cou++;
							}
							if(v.group_id == '25'){
								if(cloneHtml25cou < 2){
									cloneHtml25 += 
												'<div class="group-workone">'+
												'<a  href="worklist-design-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"><b></b>'+v.vote_count+'</span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml25cou++;
							}
							if(v.group_id == '23'){
								if(cloneHtml23cou < 2){
									cloneHtml23 += 
												'<div class="group-workone">'+
												'<a  href="worklist-design-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"><b></b>'+v.vote_count+'</span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml23cou++;
							}
							if(v.group_id == '26'){
								if(cloneHtml26cou < 2){
									cloneHtml26 += 
												'<div class="group-workone">'+
												'<a  href="worklist-design-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"><b></b>'+v.vote_count+'</span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml26cou++;
							}
							if(v.group_id == '24'){
								if(cloneHtml24cou < 2){
									cloneHtml24 += 
												'<div class="group-workone">'+
												'<a  href="worklist-design-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"><b></b>'+v.vote_count+'</span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml24cou++;
							}
								
						})
						var pin = "";
						if(cloneHtml22 != ''){
							pin += '<div class="group-detail"  >服装组	</div>'+
									'<div class="group-item-mob"  >'+cloneHtml22+'</div>'
						}
						if(cloneHtml25 != ''){
							pin += '<div class="group-detail"  >配饰组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml25+'</div>'
						}
						if(cloneHtml23 != ''){
							pin += '<div class="group-detail"  >家纺组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml23+'</div>'
						}
						if(cloneHtml26 != ''){
							pin += '<div class="group-detail"  >家装组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml26+'</div>'
						}
						if(cloneHtml24 != ''){
							pin += '<div class="group-detail"  >文创组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml24+'</div>'
						}
						
						$("#sheji").append(pin);
					}
				}
			})
	 	})
	 </script>
</body>
</html>
