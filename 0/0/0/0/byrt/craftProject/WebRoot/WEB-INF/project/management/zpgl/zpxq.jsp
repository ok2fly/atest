<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
</head>
<body id="bodysten">
<div class="pt18">
	<input type="hidden" id="id" value="${id}" >
	<!-- right main  -->
  <div class="righmain"> 
    <!-- viewFramework -->
    <div class="viewFramework"> 
      <!-- top 搜索条件 -->
      <div class="bg-ff pb18 pl15 pt9 clr">
         <div class="fanlist-f clr  mt10">
	          	<div class="bg-ff ">
	               <table cellpadding="0"  border="0"  width="80%"  class="tabb6f2">
	                  <tr>
	                    <th >作品名称：</th>
	                    <td   id="h210_01"></td>
	                    <th  >作者名称：</th>
	                    <td  id="h210_02"></td>
                     </tr>
                     <tr>
	                    <th>组名：</th>
	                    <td id="h210_03"></td>
	                    <th>状态：</th>
	                    <td id="h210_04"></td>
	                  </tr>
	                  <tr>
	                    <th>创建时间：</th>
	                    <td id="h210_05"></td>
	                    <th>热度：</th>
	                    <td id="h210_06"></td>
                    </tr>
                     <tr>
	                    <th>投票数：</th>
	                    <td id="h210_07"></td>
	                    <th></th>
	                    <td id="h210_08">
	                    </td>
	                  </tr>
	                </table>
	            </div>        
        </div>  
         <div id="imglist" class="mt10">
	 	 </div>
		 <div class="query" id="shenhe"> 
			 
		 </div>
		  <div class="query" > 
			<a href="<%=basePath%>management/zplb.htm" target="_self" class="querybut">返回</a>
		 </div>
      </div>
      
      <!-- ./ 搜索列表 --> 
    </div>
    <!-- ./ viewFramework --> 
  </div>
  <!-- ./ right main --> 
	 
</div>
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>js/jsall.js"></script>
<script type="text/javascript">
 
var id = $("#id").val();
$(function(){
	
	getData(id);
})

/**
 * 获取数据
 */
function getData(id){
	$.ajax({
		url:'<%=basePath%>Opus/selOpusByOpusId?id='+id,
		type:"post",
		dataType:"json",
		success:function(data){
			if("0"==data.status){
				var imgList = '';
				if(data.data.opus.length > 0 ){
					$.each(data.data.opus,function(index,d){
						if(d.id == id ){
							var d = data.data.opus[0];
							var sta =  d.state == 1 ? "未审核" :  d.state == 2 ? "审核通过" : "审核未通过";
							$("#h210_01").html(d.opus_name);
							$("#h210_02").html(d.use_nam);
							$("#h210_03").html(d.name);
							$("#h210_04").html(sta);
							
							$("#h210_05").html(getLocalDateAndTime(d.creative_time,2));
							$("#h210_06").html(d.opus_hot);
							$("#h210_07").html(d.vote[0].vote);
							
							var imgList = '';
							for (var i = 0; i < d.picLst.length; i++) {
								var img = d.picLst[i];
								imgList += '<div class="perW100"> '+
											'<div class="w100 detailimg">'+
											'<img src="'+img.picUrl+'"  onerror="this.src=\'<%=basePath%>images/2.png\'"  alt="">'+
											'</div>'+
											'</div>';
							}
							$("#imglist").html(imgList);
							
							var  shenheHtm = '';
							 if(d.state == 1){
				            	 shenheHtm += '<a href="#" target="_self"  class="querybut" onclick="setShenHe('+d.id+',2)"  >审核通过</a><a href="#" target="_self" class="querybut" onclick="setShenHe('+d.id+',3)"  >审核不通过</a>';
				            }
							$("#shenhe").html(shenheHtm);
						}
					})
					
				}
			}
		}
	})
	
}
	  

function setShenHe(id,stat){
	layer.confirm("确定审核？",function(){
		$.ajax({                
			type : "post",
			url: url+ "Opus/updOpusState",
			data : "id="+id+"&state="+stat ,
			dataType : "json",
			success : function(data) {							
				if (data.status == "0") {
					layer.msg("审核成功");
					getData(id);
				}else{
					layer.alert(data.msg);
				}
			}
		});	
	});
}
</script>
</body>
</html>
