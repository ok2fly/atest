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
	    if(flag == true){
	    	location.href="<%=basePath%>commens/myworks.htm";
	    }
	</script>
	</head>
<body class="bgimg">
			<!-- <div class="blacktitle" style="padding:20px 20px 0;">
				
			</div> -->
			<div class="w100 bggrag h60">
				 <div class="navbtn" >
				 	 <div><a class="lastBtn"></a></div>
				 	 <div><a class="homeBtn"></a></div>
				 </div>
			 </div>
			<div class="w100 bggrag">
				<div class="blacktitle" style="padding:20px;">
					我的主页
				</div>
			</div>
			<div class="bggrag minh" >
				<div class="perinfo">
					<div class="name" id="use_nam">***</div>
					<div class="fl" id="use_sex">***</div><div class="fl" style="margin-left:15px;" id="age">***</div>
					<div style="clear:both;"></div>
					<div class="inf">手机号码：<span id="use_mob">***</span></div>
					<div class="inf">微信/QQ：<span id="third_acc">***</span></div>
					<div class="inf">身份证：<span id="use_idc">***</span></div>
					<div class="inf">学校/单位：<span id="use_unit">***</span></div>
					<div class="inf">通讯地址：<span id="use_add">***</span></div>
					<div class="inf">个人简介：<span id="use_profile">***</span></div>
				</div>
				<div class="uploadbtn xgcsxx" onclick="goEntry()"></div>
				<div class="mywork-mob clearfix" name="bbox" >
					<div class="name">我的作品</div>
					<div id="myworks">
						<%-- <div class="workmobone">
							<a href="detail/1.htm" class="im"> 
								<img name="imgfile1" src="<%=basePath%>images/1.jpg" alt=""  >
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
									 <span name="reason" style="float:right">待审核</span>
								</p>
							</div>
						</div> --%>
					</div>
				</div>
				<div class="uploadbtn jxsc" onclick="goUpload()"></div>
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
						$("div.bbox").empty();
						$.each(json.basOpus,function(i,v){
							var cloneHtml = '';
							var l = ''
							if(v.opus_type  == 0){
								l = '<%=basePath%>commens/worklist-design-mob-detail.htm?id='+v.id;
							}else{
								l = '<%=basePath%>commens/worklist-mob-detail.htm?id='+v.id;
							}
							cloneHtml =
								'<div class="workmobone">'+
								'<a href="'+l+'" class="im"> '+
								'<img name="imgfile1" style="width:80%"  src="'+v.picLst[0].picThum+'"	alt="" onerror="this.src=\'<%=basePath%>images/1.jpg\'" >'+
								'</a>'+
								'<div class="padlr">'+
								'	<p class="workname">'+
								'		<a href="javascript:void(0)" name="worksName">'+v.opus_name+'</a>'+
								'	</p>'+
								'	<p class="grayfont">'+
								'		作品组别：<span name="group">'+v.name+'</span>'+
								'	</p>'+
								'	<p class="grayfont">'+
								'	创作时间：<span name="createTime">'+getLocalDateAndTime(v.creative_time)+'</span>'+
									'	 <span name="reason" style="float:right">'+getState(v.state)+'</span>'+
								'	</p>'+
								'	</div>'+
								'</div>';
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
			location.href = "<%=basePath%>commens/upload-mob.htm";
		}	
		function goEntry(){
			location.href = "<%=basePath%>commens/entry-mob.htm";
		}	
</script>
	
	 
<script type="text/javascript">
</body>
</html>
