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
			<a   href="<%=basePath%>commens/worklist.htm"  class="navone gongyi"></a>
			<a   href="<%=basePath%>commens/worklist-design.htm"  class="navone design act"></a>
			<a   href="<%=basePath%>commens/entry.htm" class="navone entry" > </a>
		</div>
	</div>
	<div class="cont" >
		<div class="w100">
			<div class="group" style="width:300px;">
				<div class="item fzz act" id="22"></div>
				<div class="item psz" id="25"></div>
				<div class="item jfz" id="23"></div>
				<div class="item jzz" id="26"></div>
				<div class="item wcz" id="24"></div>
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
				<!-- <div class="bbox clearfix" id="worksBox">
				&nbsp;
				</div> -->
				<div class="bbox clearfix" id="worksBox">
					<%-- <div class="workone">
						<a href="#" class="imgi"> <img src="<%=basePath%>images/1.jpg"
							alt="" onerror="this.src='<%=basePath%>images/1.jpg'"><span>3000003</span></a>
						<div class="padlr">
							<p class="workname">
								<a href="detail/1.htm">123</a>
							</p>
							<div class="workuser"
								style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; course: hand;">
								作者：刘海丽</div>
							<div class="ups">
								<span id="vote_3"><b></b>2</span> <i><b></b>32</i>
								<div class="upbtn" onclick="voteBtn(&quot;3&quot;)">投票</div>
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
		searchVo.id = 22;
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
								'<a href="javascript:void(0);" class="imgi" id="'+v.id+'"> <img src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'"></a>'+
								'<div class="padlr">'+
								'<p class="workname">'+
								'<a href="detail/'+v.id+'.htm?type=2">'+v.opus_name+'</a>'+
								'</p>'+
								'<div class="workuser"	style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; course: hand;">作者：'+v.use_nam+'</div>'+
								'<div class="ups">'+
								'<span id="vote_'+v.id+'"><i><b></b>'+v.opus_hot+'</i></span><i><b></b>'+v.vote[0].vote+'</i>'+
								'<div class="upbtn" id="btn_'+v.id+'" onclick="voteBtn('+v.id+')" >投票</div>'
								'</div>'+
								'</div>'+
								'</div>';
							$("#worksBox").append(cloneHtml);
						})
						var old = '';
						$(".imgi").hover(function(){
							if($(this).parent().find(".padlr").find(".ups").find(".upbtn").hasClass("over")){
								
							}else{
								old = $(this).find("img").attr("src");
								$(this).find("img").attr("src","<%=basePath%>img/tp.png");
								$(this).click(function(){
									voteBtn($(this).attr("id"));
									return false;
								})
							}
							
						},function(){
							if($(this).parent().find(".padlr").find(".ups").find(".upbtn").hasClass("over")){
								
							}else{
								$(this).find("img").attr("src",old);
							}
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
		
		
		function voteBtn(id){
			$.ajax({
				url:'<%=basePath%>Opus/vote',
				data:{opusId:id},
				type:"post",
				dataType:"json",
				success:function(data){
					if("0"==data.status){
						$("#vote_"+id).html('<i><b></b>'+32+'</i>');
						$("#btn_"+id).text("已投票");
						$("#btn_"+id).addClass("over");
						alert("恭喜您投票成功");
					}else{
						alert("投票失败")
					}
				}
			}) 
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
	<script type="text/javascript">
	//$("div.categorylist >div.categoryname[val="+$.cookie("childType")+"]").trigger("click");
	</script>
	<script>
		window._bd_share_config = {
			common : {
				onBeforeClick:setShareUrl,					
				bdText : '“中国手艺”创意设计比赛',
				bdDesc : '“中国手艺”创意设计比赛，由中国手艺网主办，新戎集团承办。比赛以“手传承，艺风尚”为宗旨，面向海内外各界人士征集作品，并高度关注非物质文化遗产传承人群和手工艺创业者的人才培养与产品转化。',
				bdUrl : '<%=basePath%>commens/index.htm',
				bdPic : '<%=basePath%>images/banner.jpg',
				summary:'a'
			},
			share : [{
				"tag" : "share_1",
				"bdSize" : 32,
				"bdCustomStyle":'<%=basePath%>css/share.css'
			}]
		}
		with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];

		function baiduShare(){
			if(window._bd_share_main!=undefined){
				window._bd_share_main.init(); 
			}
		}
		function setShareUrl(cmd, config) {            
            console.log("baidushare:"+shareUrl)
            console.log(""+picThum)
            if (shareUrl) {
                config.bdUrl = shareUrl;
                config.bdPic = picUrl;
            }
            return config;
        }
		
	</script>
<script id='bdshare' type="text/javascript"></script>
	
	<div class="perW100"> 
		<div class="footerbg">
			 <%-- <img src="<%=basePath%>img/footer.png" alt=""> --%>
		</div>
	</div>	

</body>
</html>
