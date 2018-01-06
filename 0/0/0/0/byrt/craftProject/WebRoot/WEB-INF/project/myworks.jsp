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
	<script>
	    var userAgentInfo = navigator.userAgent;
	    var Agents = ["Android", "iPhone",
	                "SymbianOS", "Windows Phone",
	                "iPad", "iPod"];
	    var flag = true;
	    for (var v = 0; v < Agents.length; v++) {
	        if (userAgentInfo.indexOf(Agents[v]) > 0) {
	            flag = false;
	            break;
	        }
	    }
	    if(flag == false){
	    	location.href="<%=basePath%>commens/myworks-mob.htm";
	    }
	</script>
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
			<a   href="<%=basePath%>commens/worklist-design.htm"  class="navone design"></a>
			<a   href="<%=basePath%>commens/myworks.htm" class="navone myhome" > </a>
		</div>
	</div>
	<div class="cont">
		<div class="w100">
			<div class="blacktitle">
				 <span class="mywork"></span>
			</div>
			<div class="entrytable w100">
				<div class="writebg">
					<form action="" name="grBm" id="grBm">
					<input type="hidden" name=type value="0">
					<div class="oneline">
						<div class="onein">
							<div class="ltext">姓　　名：</div>
							<div class="rinput">
								 <p id="use_nam">***</p>
							</div>
						</div>
						<div class="onein">
							<div class="ltext">性　　别：</div>
							<div class="rinput">
								 <p id="use_sex">***</p>
							</div>
						</div>
						<div class="onein">
							<div class="ltext">年　龄：</div>
							<div class="rinput">
								<p id="age">***</p>
							</div>
						</div>
					</div>
					<div class="oneline">
						<div class="onein">
							<div class="ltext">联系电话：</div>
							<div class="rinput">
								<p id="use_mob">***</p>
							</div>
						</div>
						<div class="onein">
							<div class="ltext">微信/QQ：</div>
							<div class="rinput">
								<p id="third_acc">***</p>
							</div>
						</div>
						<div class="onein">
							<div class="ltext">身份证：</div>
							<div class="rinput">
								 <p id="use_idc">***</p>
							</div>
						</div>
					</div>
					<div class="oneline">
						<div class="ltext">学校/单位：</div>
						<div class="rinput lang">
							 <p id="use_unit">***</p>
						</div>
					</div>
					<div class="oneline">
						<div class="ltext">通讯地址：</div>
						<div class="rinput lang">
							<p id="use_add">***</p>
						</div>
					</div>
					<div class="oneline">
						<div class="ltext">个人简介：</div>
						 <p id="use_profile">***</p>
						<div class="clear"></div>
					</div>
					</form>
					<div class="updateXx" onclick="goEntry()"></div>
				</div>
			</div>
			<div class="works">
				<!-- <div class="bbox clearfix" name="bbox" id="myworks">
				</div> -->
				<div class="bbox clearfix" name="bbox" id="myworks">
					<%-- <div class="workone">
						<a href="detail/1.htm"> <img name="imgfile1" src="<%=basePath%>images/1.jpg"
							alt="">
						</a>
						<div class="padlr">
							<p class="workname">
								<a href="javascript:void(0)" name="worksName">123</a>
							</p>
							<p class="grayfont">
								作品组别：<span name="group">非遗专题</span>
							</p>
							<p class="grayfont">
								创作时间：<span name="createTime">2017-10-10</span>
							</p>
							<p class="grayfont">
								审核状态：<span name="reason">待审核</span>
							</p>
						</div>
					</div>
					<div class="workone">
						<a href="detail/1.htm"> <img name="imgfile1" src="<%=basePath%>images/1.jpg"
							alt="">
						</a>
						<div class="padlr">
							<p class="workname">
								<a href="javascript:void(0)" name="worksName">123</a>
							</p>
							<p class="grayfont">
								作品组别：<span name="group">非遗专题</span>
							</p>
							<p class="grayfont">
								创作时间：<span name="createTime">2017-10-10</span>
							</p>
							<p class="grayfont">
								审核状态：<span name="reason">待审核</span> 
							</p>
						</div>
					</div> --%>
				</div>
			</div>
			<div style="clear:both;"></div>
			<div class="w100" style="margin-top:40px;margin-left: 20px;">
					<div class="jxUpload" onclick="goUpload()"></div>
				</div>
			<div class="pages">
				<div id="Pagination"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>js/page/js/jquery.pagination.js"></script>
	<script type="text/javascript">
		var shareUrl = "";
		var total = 0;
		var page = 1;
		var rows = 20;
		function pageList(paraP){
			//console.log(paraP)
			$.ajax({
				url:'<%=basePath%>Opus/selOpusByUserId',
				type:"post",
				dataType:"json",
				success:function(data){
					if("0"==data.status){
						var json = data.data;
						if(json.basOpus.length > 0 ){
							$("div.bbox").empty();
						}
						$.each(json.basOpus,function(i,v){
							var cloneHtml = '';
							var typ = ''; 
							if(v.group_id == "22" || v.group_id == "25" || v.group_id == "23" || v.group_id == "26" || v.group_id == "24" ){
								typ = '1';
							}else if(v.group_id == "14" || v.group_id == "18" || v.group_id == "15" || v.group_id == "19" || v.group_id == "16" || v.group_id == "20" || v.group_id == "17" || v.group_id == "21"){
								typ = '0';
							}
							cloneHtml =
								'<div class="workone">'+
								'<a href="<%=basePath%>commens/mydetail/'+v.id+'.htm?type='+typ+'"> <img name="imgfile1"  src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'">'+
								'</a>'+
								'<div class="padlr">'+
								'	<p class="workname">'+
								'		<a href="javascript:void(0)" name="worksName">'+v.opus_name+'</a>'+
								'	</p>'+
								'	<p class="grayfont">'+
								'		作品组别：<span name="group">'+v.name+'</span>'+
								'	</p>'+
								'	<p class="grayfont">'+
								'		创作时间：<span name="createTime">'+getLocalDateAndTime(v.creative_time)+'</span>'+
								'	</p>'+
								'	<p class="grayfont">'+
								'		审核状态：<span name="reason">'+getState(v.state)+'</span>'+
								'	</p>'+
								'</div>'+
							'	</div>';
							$("#myworks").append(cloneHtml);
						})
						$.each(json.basUser,function(i,v){
							 $("#use_nam").html(v.use_nam);
							 var s = v.use_sex == 0 ? "男" : "女" ;
							 $("#use_sex").html(s);
							 $("#age").html(v.age);
							 $("#use_mob").html(v.use_mob);
							 $("#use_idc").html(v.use_idc);
							 $("#third_acc").html(v.third_acc);
							 $("#use_unit").html(v.use_unit);
							 $("#use_profile").html(v.use_profile);
							 $("#use_add").html(v.reg_name+v.are_name+v.use_add);
						})
					}
				}
			})
			/* $("#Pagination").pagination(total,{
				items_per_page:rows,
				current_page:page-1,
				callback: pageselectCallback
			}); */
		}
		$(function(){
			pageList(0);
		})
		function pageInit(){
			$("#Pagination").pagination(total,{
				items_per_page:rows,
				current_page:page-1,
				callback: pageList
			});
			$("#Pagination a").not($(":has(i)")).addClass("page");
		}
	 
		function getState(val){
			var name = "";
			if(val=="1"){
				name="待审核";
			}else if(val=="2"){
				name="审核通过";
			}else if(val=="3"){
				name="审核未通过";
			}
			return name;
		}
		Date.prototype.format = function (fmt) { //author: meizz 
		    var o = {
		        "M+": this.getMonth() + 1, //月份 
		        "d+": this.getDate(), //日 
		        "h+": this.getHours(), //小时 
		        "m+": this.getMinutes(), //分 
		        "s+": this.getSeconds(), //秒 
		        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
		        "S": this.getMilliseconds() //毫秒 
		    };
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var k in o)
		    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		    return fmt;
		}
	</script>
	<script>
		function setShareUrl(cmd, config) {            
	        if (shareUrl) {
	            config.bdUrl = shareUrl;    
	        }
	        return config;
	    }
		window._bd_share_config = {
			common : {
				onBeforeClick:setShareUrl,					
				bdText : '“中国手艺”创意设计比赛',
				bdDesc : '“中国手艺”创意设计比赛，由中国手艺网主办，新戎集团承办。比赛以“手传承，艺风尚”为宗旨，面向海内外各界人士征集作品，并高度关注非物质文化遗产传承人群和手工艺创业者的人才培养与产品转化。',
				bdUrl : '<%=basePath%>commens/index.htm',
				bdPic : '自定义分享图片'
			},
			share : [{
				"tag" : "share_1",
				"bdSize" : 32,
				"bdCustomStyle":'<%=basePath%>css/share.css'
			}]
		}
		with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
	
		function goUpload(){
			location.href = "<%=basePath%>commens/upload.htm";
		}	
		function goEntry(){
			location.href = "<%=basePath%>commens/entry.htm";
		}		
	</script>
	
	<div class="perW100"> 
		<div class="footerbg">
			 <%-- <img src="<%=basePath%>img/footer.png" alt=""> --%>
		</div>
	</div>	

</body>
</html>
