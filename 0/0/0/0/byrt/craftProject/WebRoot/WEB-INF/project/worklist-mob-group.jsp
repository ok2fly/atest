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
				location.href = "<%=basePath%>commens/worklist-mob-detail.htm"
	 		}) 
	 	})
	 </script>
	</head>
<body class="bgimg">
	 <input type="hidden" id="groupId" value="${groupId}">
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
				<input type="text" class="searchmob" placeholder="输入作者名/作品名/作品编号以搜索.."  ><i class="seaicon"></i>
			</div>
	</div>
	<div class="w100 bggrag minh">
		<div style="padding:10px 20px;">
			<div class="group-detail"   id="groupName" >
				 服装组
			</div>
			<div class="group-paixu act"  >
			   	最新作品
			</div>
			<div style="clear:both;"></div>
			<div class="group-item-mob"  id="worksBox" >
				<!-- <div class="group-workone">
					<a></a>
					<span class="tpxx"></span> <i><b></b>32</i>
				</div> -->
			</div>
		</div>
	</div>
	  <script type="text/javascript">
		var searchVo = {};
		searchVo.id = $("#groupId").val();
		searchVo.creativeTime = 1;
		
		$(function(){
			var nam = getGroup(searchVo.id);
			$("#groupName").html(nam);
			loadDataBy(0);
		})
		
		 
		 
		function getGroup(groupId){
			var retStrtr = "";
			if(groupId == "22"){
				retStrtr = "服装组";
			}else if(groupId == "25"){
				retStrtr = "配饰组";
			}else if(groupId == "23"){
				retStrtr = "家纺组";
			}else if(groupId == "26"){
				retStrtr = "家装组";
			}else if(groupId == "24"){
				retStrtr = "文创组";
			}else if(groupId == "14"){
				retStrtr = "织绣组";
			}else if(groupId == "18"){
				retStrtr = "印染组";
			}else if(groupId == "15"){
				retStrtr = "编织组";
			}else if(groupId == "19"){
				retStrtr = "烧制组";
			}else if(groupId == "16"){
				retStrtr = "金工组";
			}else if(groupId == "20"){
				retStrtr = "髹漆组";
			}else if(groupId == "17"){
				retStrtr = "雕塑组";
			}else if(groupId == "21"){
				retStrtr = "刻绘组";
			} 
			return retStrtr;
		}
		function loadDataBy(paraP){
			page = paraP+1;
			$.ajax({
				url:'<%=basePath%>Opus/selOpus',
				data:searchVo,
				type:"post",
				dataType:"json",
				success:function(data){
					if("0"==data.status){
						//pageInit();
						$("#worksBox").empty();
						$.each(data.data.opusLst.opus,function(i,v){
							cloneHtml =
								'<div class="group-workone">'+
								'<a  href="worklist-mob-detail.htm?id='+v.id+'" ><img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
								'<span class="tpxx" ></span> <i><b></b>'+v.opus_hot+'</i>'+
								'</div>';
							$("#worksBox").append(cloneHtml);
						})
					}
				}
			})
		}
		
	</script>
</body>
</html>
