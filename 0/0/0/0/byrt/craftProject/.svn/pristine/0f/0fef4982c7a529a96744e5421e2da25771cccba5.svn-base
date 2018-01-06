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
	<title>“中国手艺”创意设计比赛</title>
	<link rel="stylesheet" href="<%=basePath%>css/common.css">
	<link rel="stylesheet" href="<%=basePath%>css/main.css">
	<link rel="stylesheet" href="<%=basePath%>css/type980.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jsall.js"></script>
	</head>
<body>

	<div class="wid100 logbn"  >
		<div class="w1318">
			<a href="<%=basePath%>"><img class="logo" src="<%=basePath%>img/logocom.png"  >
			</a>
			<div class="rmenu"  >
				<div class="topmenu">
						<div class="loginbox" style="overflow:hidden;">
							<a id="uselogin2" class="fl" href="<%=basePath%>commens/login.htm">参赛登录</a>
						</div>
				</div>
			</div>
		</div>
	</div>		
	<div class="banner">
	</div>
	<div class="menu">
		<div class="w100">
			<a   href="<%=basePath%>commens/index.htm"  class="navone home"></a>
			<a   href="<%=basePath%>commens/rule.htm"  class="navone detail "></a>
			<a   href="<%=basePath%>commens/worklist.htm"  class="navone gongyi act"></a>
			<a   href="<%=basePath%>commens/worklist-design.htm"  class="navone design"></a>
			<a   href="<%=basePath%>commens/entry.htm" class="navone entry" > </a>
		</div>
	</div>
	<div class="cont" >
		<div class="w100">
			<div class="group">
				<div class="item zxz act" id="14"></div>
				<div class="item yrz" id="18"></div>
				<div class="item bzz" id="15"></div>
				<div class="item szz" id="19"></div>
				<div class="item jgz" id="16"></div>
				<div class="item xqz" id="20"></div>
				<div class="item dsz" id="17"></div>
				<div class="item khz" id="21"></div>
			</div>
		</div>
	</div>
<div class="cont" style="padding-top:0;">
		<div class="w100">
			<div class="blacktitle">
				<span class="show"></span>
				<div class="paixu">
					<div class="pxone act" name="createTimeDesc" id="createTimeDesc">最新作品</div>
					<div class="pxone" name="voteDesc" id="voteDesc">最热作品</div>
					<select name="province" onchange="Province_onchange(this.value);"    id="selectProvince" class="pxone">
			                 <option value="选择省" >选择省</option>
			       		</select>
			       		<select name=chinacity onchange="MM_jumpMenu(this.value)" id="selectCity"class="pxone">
			                 <option value="选择市" >选择市</option>
			        	</select>
					<select name="ageGroup" id="ageGroup" class="pxone" onchange="loadDataBy(0)">
						<option value="all">作者年龄</option>
						<option value="14-17">14-17</option>
						<option value="18-25">18-25</option>
						<option value="26-32">26-32</option>
						<option value="33-40">33-40</option>
						<option value="41-45">41-45</option>
						<option value="46-200">45岁以上</option>
					</select>
				</div>
			</div>
			<div class="works">
				<div class="bbox clearfix" id="worksBox">
					<%-- <div class="workone">
						<a href="detail/1.htm" class="imgi"> <img src="<%=basePath%>images/1.jpg"
							alt="" onerror="this.src='<%=basePath%>images/1.jpg'"></a>
						<div class="padlr">
							<p class="workname">
								<a href="javascript:void(0)">123</a>
							</p>
							<div class="workuser"
								style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; course: hand;">
								作者：刘海丽</div>
							<div class="ups">
								<span id="vote_3"><i><b></b>32</i></span> 
							</div>
						</div>
					</div> --%>
				</div>
			</div>
			<div class="pages">
				<div id="Pagination"></div>
			</div>
		</div>
	</div>
	<!--  -->
	<script type="text/javascript" src="<%=basePath%>js/page/js/jquery.pagination.js"></script>
	<script type="text/javascript">
		var searchVo = {};
		searchVo.id = 14;
		searchVo.creativeTime = 1;
		searchVo.opusHot = null;
		
		$(function(){
			loadDataBy(0);
		})
		
		$("#createTimeDesc").click(function(){
			$("#createTimeDesc").addClass("act");
			$("#voteDesc").removeClass("act");
			searchVo.creativeTime = 1;
			searchVo.opusHot = null;
			loadDataBy(0);
		})
		$("#voteDesc").click(function(){
			$("#voteDesc").addClass("act");
			$("#createTimeDesc").removeClass("act");
			searchVo.creativeTime = null;
			searchVo.opusHot = 1;
			loadDataBy(0);
		})
		 
		
		$(".item").click(function(){
			$(".item").removeClass("act");
			$(this).addClass("act");
			searchVo.id = $(this).attr("id");
			loadDataBy(0);
		})
		
		
		function loadSearch(){
			searchVo.areaId = tmpCityId;
			searchVo.pro = proId;
			
			if($("#ageGroup").val()!="all"){
				searchVo.ageGroup = $("#ageGroup").val();
			}else{
				searchVo.ageGroup = null;
			}
			 
		}
		function loadDataBy(paraP){
			page = paraP+1;
			loadSearch();
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
								'<div class="workone">'+
								'<a href="detail/'+v.id+'.htm?type=1" class="imgi"> <img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
								'<div class="padlr">'+
								'<p class="workname">'+
								'<a href="detail/'+v.id+'.htm?type=1">'+v.opus_name+'</a>'+
								'</p>'+
								'<div class="workuser"	style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; course: hand;">作者：'+v.use_nam+'</div>'+
								'<div class="ups">'+
								'<span><i><b></b>'+v.opus_hot+'</i></span>'+
								'</div>'+
								'</div>'+
								'</div>';
							$("#worksBox").append(cloneHtml);
						})
					}
				}
			})
		}
		function pageInit(){
			$("#Pagination").pagination(total,{
				items_per_page:rows,
				current_page:page-1,
				callback: loadDataBy
			});
			$("#Pagination a").not($(":has(i)")).addClass("page");
		}
		
	</script>
	<script type="text/javascript">
		/* 城市选择 */
		var proId = '';
		var tmpCityId='';
		
		$(function(){
			$.ajax({  
	            type : "POST",  
	            url : "<%=basePath%>Opus/selBasReg",
	            dataType:"json",
	            success : function(data) { 
	            	 if(data.status == 0){
	            		 if(data.data.basRegLst.length > 0){
	            			 var htm = '<option value=选择省>选择省</option>';
	            			 for(var i =0 ; i <  data.data.basRegLst.length ; i++){
	            				 var d = data.data.basRegLst[i];
	            				 htm += '<option value='+d.id+'>'+d.reg_nam+'</option>';
	            			 }
	            			 $("#selectProvince").empty().html(htm);
	            		 }
	            	 }else{
	            		 alert(data.msg);
	            	 }
	            }  
	        });  
		})
		
		/**
		 *点击选择城市
		 */
		function MM_jumpMenu(val){  
			var  cityId = $("#selectCity").val();
			if(cityId == "选择市"){
				tmpCityId = '';
			}else{
				tmpCityId = cityId;
			}
			 
			loadDataBy(0);
		}
 
		 
		/* 选择省  */
		function Province_onchange(x)
		{ 
			//需要省的-
			var provinceS = $("#selectProvince").val();
			console.log(provinceS)
			if(provinceS == "选择省"){
				proId = '';
				tmpCityId ='';
				$("#selectCity").empty().html('<option value=选择市>选择市</option>');
			}else{
				proId = provinceS;
				citySet(proId);
			}
			 
			loadDataBy(0);
			
		}
	 
		
		/*设置市*/
		function citySet(name)
		{ 
			$.ajax({  
	            type : "POST",  
	            url : "<%=basePath%>Opus/selBasRegCity",
	            data : "id="+name,
	            dataType:"json",
	            success : function(data) { 
	            	 if(data.status == 0){
	            		 if(data.data.basRegCity.length > 0){
	            			 var htm = '<option value=选择市>选择市</option>';
	            			 for(var i =0 ; i <  data.data.basRegCity.length ; i++){
	            				 var d = data.data.basRegCity[i];
	            				 htm += '<option value='+d.id+'>'+d.reg_nam+'</option>';
	            			 }
	            			 $("#selectCity").empty().html(htm);
	            		 }
	            	 }else{
	            		 alert(data.msg);
	            	 }
	            }  
	        });  
		}
	</script>
	
	 <div class="perW100"> 
		<div class="footerbg">
			 <%-- <img src="<%=basePath%>img/footer.png" alt=""> --%>
		</div>
	</div>	

</body>
</html>
