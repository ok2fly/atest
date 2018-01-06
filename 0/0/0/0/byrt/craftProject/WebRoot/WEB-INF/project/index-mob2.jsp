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
	    	location.href="<%=basePath%>commens/index.htm";
	    }
	    
	</script>
	 <script>
	 $(function(){
	    	$.ajax({  
	            type : "POST",  
	            url : "<%=basePath%>MatchOrg/selectFirst",
	            dataType:"json",
	            success : function(data) { 
	            	 if(data.status == 0){
	            		 if(data.data.judge.length > 0){
	            			 var htm = '';
	            			 for(var i =0 ; i <  data.data.judge.length ; i++){
	            				 var d = data.data.judge[i];
	            				 htm += '<div class="one">'+
	            						'<div class="img" style="height: 200px;">'+
			         					//'<img src="'+d.basPic.picUrl+'" alt="">'+
			         					'<img src="<%=basePath%>images/pingshen/liukuili.jpg" alt="">'+
			         					'<p class="name">'+d.name+'</p>'+
			         					'<p class="job">'+d.judgeIntr+'</p>'+
			         					'</div>'+
			         					'</div>';
	            			 }
	            			 $("#judges").html(htm);
	            		 }
	            	 }else{
	            		 alert(data.msg);
	            	 }
	            }  
	        });  
	    })
	 </script>
	</head>
<body class="bggrag">
	<div class="wid100 logbn" style="height:60px;background:#7E2626;">
		<div class="w1318">
			<a href="<%=basePath%>"><img class="logo" src="<%=basePath%>images/20131018110134.png" style="margin-left: 25px;">
			</a>
			<div class="logotext" style="margin-left: 30px;">
					<span style="color:#fff;font-size:14px;font-family:'微软雅黑',Arial,Verdana;display:block;">中华人民共和国文化部主管 </span>
					<span style="color:#fff;font-size:14px;font-family:'微软雅黑',Arial,Verdana;display:block;">中国文化传媒集团（中国文化报社）主办 </span>
			</div>
			 
			<div class="rmenu" style='clear: both; margin-top: -65px;margin-left:10px;'>
				<div class="topmenu">
						<div class="loginbox" style="overflow:hidden;">
							<a id="uselogin2" class="fl" href="<%=basePath%>commens/login.htm">参赛登录</a>
						</div>
				</div>
			</div>
		</div>			
	</div>
	<div class="banner-index">
		<a   href="javascript:void(0);" class="log" > </a>
		<a   href="javascript:void(0);" class="text" > </a>
		<a   href="<%=basePath%>commens/entry-mob.htm" class="entry" > </a>
		<a   href="<%=basePath%>commens/workshow-mob.htm" class="llgd" > </a>
	</div>
	<div class="nav">
		<div class="w100">
			<a  href="<%=basePath%>commens/index.htm"  class="navone home"></a>
			<a  href="<%=basePath%>commens/rule.htm"  class="navone detail"></a>
			<a  href="<%=basePath%>commens/worklist.htm"  class="navone gongyi"></a>
			<a  href="<%=basePath%>commens/worklist-design.htm"  class="navone design"></a>
		</div>
	</div>
	<div class="w100 bslc">
	
	</div>
	<div class="w100 bsfz">
	
	</div>
	<!-- <div class="w100 bsfz-title">
	
	</div>
	<div class="bsfz1" style="float:left;width:50%;">
	
	</div>
	<div class="bsfz2" style="float:left;width:50%;margin-top:40px;">
	
	</div> -->
	<div style="clear:both;"></div>
	<div class="w100 jxsz-title">
	
	</div>
	<div class="w100 jxsz">
	
	</div>
	<div class="w100 pwjb" style="position: relative;">
		<div class="judges" id="judges">  
			 
		</div>
	</div>
</body>
</html>
