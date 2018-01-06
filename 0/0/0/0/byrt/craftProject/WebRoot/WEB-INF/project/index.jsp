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
	    if(flag == false){
	    	location.href="<%=basePath%>commens/index-mob.htm";
	    }
	    
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
	            				 if(i < 9){
	            					 var d = data.data.judge[i];
		            				 htm += '<div class="one">'+
		            						'<div class="img" style="height: 200px;">'+
				         					'<img  src="'+d.basPic.picUrl+'"  onerror="<%=basePath%>images/pingshen/liukuili.jpg"  alt="">'+
				         					'<p class="name">'+d.name+'</p>'+
				         					'<p class="job">'+d.judgeIntr+'</p>'+
				         					'</div>'+
				         					'</div>';
	            				 }
	            			 }
	            			 $("#judges").html(htm);
	            		 }
	            	 }else{
	            		 alert(data.msg);
	            	 }
	            }  
	        });  
	    })
	    
	    function goMy(){
	    	$.ajax({
	    		url:'<%=basePath%>Opus/selOpusByUserId',
	    		type:"post",
	    		dataType:"json",
	    		success:function(data){
	    			if("0"==data.status){
	    				var json = data.data;
	    				 if(json.basUser.length > 0 ){
	    					  window.location.href="<%=basePath%>commens/myworks.htm";
	    				 }else{
	    					  window.location.href="<%=basePath%>commens/entry.htm";
	    				 }
	    			}else{
	    				window.location.href="<%=basePath%>commens/entry.htm";
	    			}
	    		}
	    	})
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
	<div class="banner-index">
		<a   href="javascript:void(0);" class="entry" onclick="goMy()" > </a>
	</div>
	<div class="nav">
		<div class="w100">
			<a  href="<%=basePath%>commens/index.htm"  class="navone home"></a>
			<a  href="<%=basePath%>commens/rule.htm"  class="navone detail"></a>
			<a  href="<%=basePath%>commens/worklist.htm"  class="navone gongyi"></a>
			<a  href="<%=basePath%>commens/worklist-design.htm"  class="navone design"></a>
		</div>
	</div>
	<div class="perW100"> 
		<div class="w100 bslc">
			 
		</div>
	</div>
	<div class="w100 bsfz">
		 
	</div>
	<div class="perW100 "> 
		<div class="w100" style="height: 1020px">
			<div class="w100 jxsz"></div>
			 
		</div>
	</div>
	<div class="w100 pwjb" style="position: relative;">
		<div class="judges" id="judges">  
			 
		</div>
	</div>
	<div class="perW100"> 
		<div class="w100 lxfs">
			 
		</div>
	</div>
	<div class="perW100"> 
		<div class="footerbg">
			  
		</div>
	</div>	
</body>
</html>
