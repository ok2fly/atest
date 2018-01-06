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
	</head>
<body class="bgimg">
		<input type="hidden" id="id" value="${id}" >
		<div class="w100 bggrag h60">
			 <div class="navbtn" >
			 	 <div><a class="lastBtn"></a></div>
			 	 <div><a class="homeBtn"></a></div>
			 </div>
	 	</div>
		<div class="w100 bggrag minh">
			<div class="blacktitle" style="padding:10px 20px 0;">
				作品详情
			</div>
			<div class="displaybox">
				<div class="worktype"><div class="typ" id="workTyp">创意设计-织绣组</div><div class="num" id="workNum">20003</div></div>
				<div class="workname" id="workname">12第三方</div>
					<div class="workinfo clearfix">
						<div class="rightinfo">
							<span id="compName">刘海丽</span><br>
		                		<span id="unit"></span>
						</div>
					</div>
					<div class="workinfo clearfix">
							<div class="rightinfo" id="workDesc" style="text-indent: 30px;">
								“中国手艺”创意设计比赛，由中国手艺网主办，新戎集团承办。比赛以“手传承，艺风尚”为宗旨，面向海内外各界人士征集作品，并高度关注非物质文化遗产传承人群和手工艺创业者的人才培养与产品转化。
							</div>
					</div>
					<div id="imglist">
						<%-- <div class="perW100"> 
							<div class="w100">
									<img src="<%=basePath%>images/2.png" alt="">
							</div>
						</div> --%>
					</div>
					<div class="worktpl"><i class="lll"><b></b>2</i></div>
			</div>
		</div>
	<script type="text/javascript">
	var id = $("#id").val();
	$.ajax({
		url:'<%=basePath%>Opus/selOpusByOpusId',
		data:{id:id},
		type:"post",
		dataType:"json",
		success:function(data){
			if("0"==data.status){
				var imgList = '';
				if(data.data.opus.length > 0 ){
					var d = data.data.opus[0];
					$("#workTyp").html("传统工艺-"+d.name);
					$("#workNum").html(d.id);
					$("#workname").text(d.opus_name);
					$("#compName").text(d.use_nam);
					$("#unit").text();
					$("#workDesc").text(d.introduction)
					$(".lll").html('<b></b>'+d.opus_hot);
					for (var i = 0; i < d.picLst.length; i++) {
						var img = d.picLst[i];
						imgList += '<div class="perW100"> '+
									'<div class="w100 detailimg">'+
									'<img src="'+img.picUrl+'"  onerror="this.src=\'<%=basePath%>images/2.png\'"  alt="">'+
									'</div>'+
									'</div>';
					}
					$("#imglist").html(imgList);
				}
			}
		}
	})
	
	$.ajax({
		url:'<%=basePath%>Opus/opusHot',
		data:{opusId:id},
		type:"post",
		dataType:"json",
		success:function(data){
			 
		}
	})
	 
	</script>
	
	<script src="<%=basePath%>js/require.min.js"></script>
	<script src="<%=basePath%>js/main.js"></script>
 	<div class="perW100"> 
		<div class="footerbg">
			 <%-- <img src="<%=basePath%>img/footer.png" alt=""> --%>
		</div>
	</div>	

</body>
</html>
