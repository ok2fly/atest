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
				location.href = "<%=basePath%>commens/worklist-mob-group.htm"
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
				作品展示-传统工艺
			</div>
			<div class="searchbox">
				<input type="text" class="searchmob" placeholder="输入作者名/作品名/作品编号以搜索.." id="searchText"  value="${searchText}"  ><i class="seaicon"></i>
			</div>
	</div>
	<div class="w100 bggrag minh">
		<div style="padding:10px 20px;" id="chuantong">
			<!-- <div class="group-detail"  >
				 服装组
			</div>
			<div class="group-item-mob"  >
				<div class="group-workone">
					<a></a>
					<span class="tpxx"></span> <i><b></b>32</i>
				</div>
				<div class="group-workone">
					<a></a>
					<span class="tpxx"></span> <i><b></b>32</i>
				</div>
			</div>
			<div class="group-detail"  >
				 织绣组
			</div>
			<div class="group-item-mob"  >
				<div class="group-workone">
					<a></a>
					<span class="tpxx"></span> <i><b></b>32</i>
				</div>
				<div class="group-workone">
					<a></a>
					<span class="tpxx"></span> <i><b></b>32</i>
				</div>
			</div> -->
		</div>
	</div>
	 <script type="text/javascript">
	 	$(function(){
	 		var  searchText = $("#searchText").val();
	 		var searchVo = {} 
	 		searchVo.search = searchText ;
	 		searchVo.parent_id = 12 ;
	 		$.ajax({
				url:'<%=basePath%>Opus/selOpusByLike',
				data:searchVo,
				type:"post",
				dataType:"json",
				success:function(data){
					if("0"==data.status){
						//pageInit();
						$("#chuantong").empty();
						//创意设计
						var arr = new Array();
						
						var cloneHtml14 = '';
						var cloneHtml18 = '';
						var cloneHtml15 = '';
						var cloneHtml19 = '';
						var cloneHtml16 = '';
						var cloneHtml20 = '';
						var cloneHtml17 = '';
						var cloneHtml21 = '';
						
						var cloneHtml14cou = 0;
						var cloneHtml18cou = 0;
						var cloneHtml15cou = 0;
						var cloneHtml19cou = 0;
						var cloneHtml16cou = 0;
						var cloneHtml20cou = 0;
						var cloneHtml17cou = 0;
						var cloneHtml21cou = 0;
						
						
						$.each(data.data.opus12Map.opusList,function(i,v){
							if(v.group_id == '14'){
								if(cloneHtml14cou < 2){
									cloneHtml14 += 
										'<div class="group-workone">'+
										'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
										'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
										'</div>';
								}
								cloneHtml14cou++;
							}
							if(v.group_id == '18'){
								if(cloneHtml18cou < 2){
									cloneHtml18 += 
												'<div class="group-workone">'+
												'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml18cou++;
							}
							if(v.group_id == '15'){
								if(cloneHtml15cou < 2){
									cloneHtml15 += 
												'<div class="group-workone">'+
												'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml15cou++;
							}
							if(v.group_id == '19'){
								if(cloneHtml19cou < 2){
									cloneHtml19 += 
												'<div class="group-workone">'+
												'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml19cou++;				
							}
							if(v.group_id == '16'){
								if(cloneHtml16cou < 2){
									cloneHtml16 += 
												'<div class="group-workone">'+
												'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml16cou++;		
							}
							if(v.group_id == '20'){
								if(cloneHtml20cou < 2){
									cloneHtml20 += 
												'<div class="group-workone">'+
												'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml20cou++;	
							}
							if(v.group_id == '17'){
								if(cloneHtml17cou < 2){
									cloneHtml17 += 
												'<div class="group-workone">'+
												'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml17cou++;	
							}
							if(v.group_id == '21'){
								if(cloneHtml21cou < 2){
									cloneHtml21 += 
												'<div class="group-workone">'+
												'<a  href="worklist-mob-group.htm?groupId='+v.group_id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
												'<span class="tpxx" id="vote_'+v.id+'"></span> <i><b></b>'+v.opus_hot+'</i>'+
												'</div>';
								}
								cloneHtml21cou++;
							}
								
						})
						var pin = "";
						if(cloneHtml14 != ''){
							pin += '<div class="group-detail"  >织绣组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml14+'</div>'
						}
						if(cloneHtml18 != ''){
							pin += '<div class="group-detail"  >印染组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml18+'</div>'
						}
						if(cloneHtml15 != ''){
							pin += '<div class="group-detail"  >编织组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml15+'</div>'
						}
						if(cloneHtml19 != ''){
							pin += '<div class="group-detail"  >烧制组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml19+'</div>'
						}
						if(cloneHtml16 != ''){
							pin += '<div class="group-detail"  >金工组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml16+'</div>'
						}
						if(cloneHtml20 != ''){
							pin += '<div class="group-detail"  >髹漆组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml20+'</div>'
						}
						if(cloneHtml17 != ''){
							pin += '<div class="group-detail"  >雕塑组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml17+'</div>'
						}
						if(cloneHtml21 != ''){
							pin += '<div class="group-detail"  >刻绘组</div>'+
									'<div class="group-item-mob"  >'+cloneHtml21+'</div>'
						}
						
						$("#chuantong").append(pin);
					}
				}
			})
	 	})
	 </script>
</body>
</html>
