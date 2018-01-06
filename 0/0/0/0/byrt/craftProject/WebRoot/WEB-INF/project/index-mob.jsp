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
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-touch-fullscreen" content="YES">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="pragram" content="no-cache">
	
	<link rel="stylesheet" href="<%=basePath%>css/common.css">
	<link rel="stylesheet" href="<%=basePath%>css/main.css">
	<link rel="stylesheet" href="<%=basePath%>css/type980.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.cookie.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main2.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/endpic.css">
	<script type="text/javascript" src="<%=basePath%>js/offline.js"></script>
	<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">
	 
	 
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
	            				 if(i < 8 ){
	            					 htm += '<div class="one">'+
	            						'<div class="img" style="height: 250px;">'+
			         					//'<img src="'+d.basPic.picUrl+'" alt="">'+
			         					'<img src="http://'+d.basPic.picUrl+'"  onerror="<%=basePath%>images/pingshen/liukuili.jpg"  alt="">'+
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
	    					  window.location.href="<%=basePath%>commens/myworks-mob.htm";
	    				 }else{
	    					  window.location.href="<%=basePath%>commens/entry-mob.htm";
	    				 }
	    			}else{
	    				window.location.href="<%=basePath%>commens/entry-mob.htm";
	    			}
	    		}
	    	})
	    }
	 </script>
	</head>
<body class="bggrag pc no-3d" style="-webkit-user-select: none;" >
 	<section class="u-arrow">
        <p class="css_sprite01"></p>
    </section>
    <section class="p-ct transformNode-2d"  >
        <div class="translate-back" >
        	<div class="m-page m-fengye" data-page-type="info_pic3" data-statics="info_list" >
                <div class="page-con lazy-finish banner-index" data-position="50% 50%" data-size="cover" style="background-image: url(<%=basePath%>img/bgred.png); background-size: cover;  background-position: 50% 50%;">
	                <a   href="javascript:void(0);" class="log" > </a>
					<a   href="javascript:void(0);" class="text" > </a>
					<a   href="javascript:void(0);" class="entry" onclick="goMy()" > </a>
					<a   href="<%=basePath%>commens/workshow-mob.htm" class="llgd" > </a>
                </div>
            </div>
            <div class="m-page m-bigTxt f-hide" data-page-type="bigTxt" data-statics="info_list"  >
                <div class="page-con j-txtWrap lazy-finish" data-position="50% 50%" data-size="cover" style="background-image: url(<%=basePath%>img/processmobnew.png); background-size: cover; background-position: 50% 50%;"></div>
            </div>
            <div class="m-page m-bigTxt f-hide" data-page-type="bigTxt" data-statics="info_list"  >
                <div class="page-con j-txtWrap lazy-finish" data-position="50% 50%" data-size="cover" style="background-image: url(<%=basePath%>img/categoriesmobnew.png); background-size: cover; background-position: 50% 50%;"></div>
            </div>
            <div class="m-page m-bigTxt f-hide" data-page-type="bigTxt" data-statics="info_list" >
                <div class="page-con j-txtWrap lazy-finish" data-position="50% 50%" data-size="cover" style="background-image: url(<%=basePath%>img/awardsmobnew.png); background-size: cover; background-position: 50% 50%;"></div>
            </div>
            <div class="m-page m-bigTxt f-hide" data-page-type="bigTxt" data-statics="info_list"  >
                <div class="page-con j-txtWrap lazy-finish btmbanner"    data-position="50% 50%" data-size="cover" style="background-image: url(<%=basePath%>img/judgemob.png); background-size: cover; background-position: 50% 50%;">
                	<div class="judges" id="judges">  
			 			
					</div>
					<a   href="javascript:void(0);" class="entry" onclick="goMy()" > </a>
                </div>
            </div>
        </div>
    </section>
    <script src="<%=basePath%>js/init.mix.js" type="text/javascript" charset="utf-8"></script>
   
    <script src="<%=basePath%>js/99_main.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
