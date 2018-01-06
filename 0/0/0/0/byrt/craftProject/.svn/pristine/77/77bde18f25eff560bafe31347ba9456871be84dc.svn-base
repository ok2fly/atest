<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/media.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/wbox.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
</head>
<body class="bg-e9">
<!-- ./ header --> 
<!-- main  展开样式：   max-leftnav  收起样式：   min-leftnav -->
<div class="main max-leftnav"> 
  <!--  leftnav -->
 
  <!-- ./ leftnav --> 
  <!-- right main  -->
  <div class="righmain"> 
    <!-- viewFramework -->
    <div class="viewFramework"> 
      <!-- top 搜索条件 -->
      <div class="bg-ff pb18 pl15 pt9 clr">
       		<h2 class="lh30">查询条件</h2>
        	<div class="query">
        		<span class="fl">作品名称</span>
          		<input type="text" id="work_nam" placeholder="请输入.." class="fl quinput ml0" style="margin-right: 20px;">          
          		
          		<span class="fl">作者名称</span>
          		<input type="text" id="use_nam" placeholder="请输入.." class="fl quinput ml0" style="margin-right: 20px;">  
          		
          		<span class="fl">组别</span>
	           	<select class="fl qusele" id="fl_qusele_qu1"  style="margin-right: 20px;" >
	           		<option value="qxz">--请选择--</option>
	           		<option  value="14">织绣组</option>
					<option  value="18">印染组</option>
					<option  value="15">编织组</option>
					<option  value="19">烧制组</option>
					<option  value="16">金工组</option>
					<option  value="20">髹漆组</option>
					<option  value="17">雕塑组</option>
					<option  value="21">刻绘组</option>
					<option  value="22">服装组</option>
					<option  value="25">配饰组</option>
					<option  value="23">家纺组</option>
					<option  value="26">家装组</option>
					<option  value="24">文创组</option>
	           	</select> 
           </div> 
           <div class="query"> 
           		<span class="fl">起止时间</span>
		          <input type="text" value="" id="d4321" class="fl quinput w145 ml0 Wdate cscd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'d4322\',{d:-90});}'})">
		          <span class="fl">&nbsp;&nbsp;-</span>
		          <input type="text" value="" id="d4322" class="fl quinput w145 ml0 Wdate cscd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'d4321\',{d:90});}'})">   	  
	            <span class="fl pl8">审核状态</span>
	            <select class="fl qusele" id="fl_qusele_qu2" >
		            <option value="qxz">--请选择--</option>
		            <option value="1">未审核</option>
		            <option value="2">审核通过</option>
		            <option value="3">审核未通过</option>
	           </select>    
	            <div class="fr">
	            	<input type="button" value="查询" class="querybut fl ml20">
        		</div> 
          </div>
        
      </div>
      <!-- ./ top 搜索条件 --> 
      <!-- 搜索列表 -->
      <div class="mt15 pl8 pr8 pb18 bg-ff pt9">
        <div class="fanlist-f clr wauto">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="fanlist-list">
            <tr>
              <th width="5%">作品名称</th>
              <th width="5%">作者名称</th>
              <th width="10%">组名</th>
              <th width="10%">状态</th>
              <th width="5%">创建时间</th>
              <th width="5%">热度</th>
              <th width="10%">投票数</th>
              <th width="10%">操作</th>
            </tr>
            <tbody id="shuju">
            	<tr><td colspan='8'>暂无数据</td></tr>
            </tbody>
          </table>
          <div class="tcdPageCode"></div>  
          <div class="blank0"></div>
        </div>
      </div>
      <!-- ./ 搜索列表 --> 
    </div>
    <!-- ./ viewFramework --> 
  </div>
  <!-- ./ right main --> 
</div>
<!-- ./ main --> 
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script> 
<script src="<%=basePath%>js/jquery.page.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>js/base.js"></script> 
<script src="<%=basePath%>js/jsall.js"></script> 
<script src="<%=basePath%>js/wbox.js"></script> 
<script src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<script >
$(function(){
	getDicData() ;
 
	$(".querybut").click(function(){
		getDicData()
	})
	 
})

 
function getDicData(){
	var param = "";
	if($("#work_nam").val()!=""){
		param += "&&opusName="+$("#work_nam").val();
	}
	if($("#use_nam").val()!=""){
		param += "&&userName="+$("#use_nam").val();
	}
	if($("#d4321").val()!=""){
		param += "&&sta_time="+$("#d4321").val();
	}
	if($("#d4322").val()!=""){
		param += "&&end_time="+$("#d4322").val();
	}
	if($("#fl_qusele_qu2").val()!="qxz" && $("#fl_qusele_qu2").val()!=null){
		param += "&&state="+$("#fl_qusele_qu2").val();
	}
	if($("#fl_qusele_qu1").val()!="qxz" && $("#fl_qusele_qu1").val()!=null){
		param += "&&groupId="+$("#fl_qusele_qu1").val();
	}
	if(param!=""){
		param = param.substring(2,param.length);
	}
	var countAll=0;
    var currentPage = 1;
	$.ajax({                
		type : "get",
		url: url+ "Opus/selAllOpus",
		data : param ,
		dataType : "json",
		success : function(data) {							
			if (data.status == "0") {
				countAll = data.data.TotalPage;
    			currentPage = data.data.CurrentPage;
				var html= "";
				$.each(data.data.basOpus.opus,function(index,man){
		            var sta =  man.state == 1 ? "未审核" :  man.state == 2 ? "审核通过" : "审核未通过";
		            var shenheHtm = '';
		            if(man.state == 1){
		            	 shenheHtm += '<a href="#" target="_self" onclick="setShenHe('+man.id+',2)"  >审核通过</a><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="#" target="_self" onclick="setShenHe('+man.id+',3)"  >审核不通过</a>';
		            }
		            
					html += ' <tr> '+
							'  <td>'+man.opus_name+'</td> '+
		              		' <td>'+man.use_nam+'</td> '+
		              		' <td>'+man.name+'</td> '+
		              		' <td>'+sta+'</td> '+
		             		'  <td>'+getLocalDateAndTime(man.creative_time,2)+'</td> '+
		            		'  <td>'+man.opus_hot+'</td> '+
		            		'  <td>'+man.vote[0].vote+'</td> '+
		             	 	' <td> '+
		              		' <a href="<%=basePath%>management/zpxq.htm?id='+man.id+'" >查看</a> '+ shenheHtm +
		             		' </td> '+
		          			' </tr>  ';
				})
				$(".tcdPageCode").createPage({
   			        pageCount:countAll,
   			        current:currentPage,
   			        backFn:function(p){
   			        	 getPageData(param,p);
   			        }
   			    });
				if(data.data.length == 0){
					html = "<tr><td colspan='8'>暂无数据</td></tr>";
				}
				$("#shuju").empty().append(html);
			}else{
				layer.alert(data.msg);
			}
		}
	});
}

function getPageData(param,p){
	if(param != ""){
		param += "&currentPage="+p;
	}else{
		param = "currentPage="+p;
	}
	var htmls ="";
	$.ajax({                
		type : "get",
		url: url+ "Opus/selAllOpus",
		data : param,
		dataType : "json",
		success : function(data) {							
			if (data.status == "0") {
				var html= "";
				$.each(data.data.basOpus.opus,function(index,man){
		            var sta =  man.state == 1 ? "未审核" :  man.state == 2 ? "审核通过" : "审核未通过";
		            var shenheHtm = '';
		            if(man.state == 1){
		            	 shenheHtm += '<a href="#" target="_self" onclick="setShenHe('+man.id+',2)"  >审核通过</a><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="#" target="_self" onclick="setShenHe('+man.id+',3)"  >审核不通过</a>';
		            }
		            
					html += ' <tr> '+
							'  <td>'+man.opus_name+'</td> '+
		              		' <td>'+man.use_nam+'</td> '+
		              		' <td>'+man.name+'</td> '+
		              		' <td>'+sta+'</td> '+
		             		'  <td>'+getLocalDateAndTime(man.creative_time,2)+'</td> '+
		            		'  <td>'+man.opus_hot+'</td> '+
		            		'  <td>'+man.vote[0].vote+'</td> '+
		             	 	' <td> '+
		              		' <a href="<%=basePath%>management/zpxq.htm?id='+man.id+'" >查看</a> '+ shenheHtm +
		             		' </td> '+
		          			' </tr>  ';
				})
				if(data.data.length == 0){
					html = "<tr><td colspan='8'>暂无数据</td></tr>";
				}
				$("#shuju").empty().append(html);
			}else{
				layer.alert(data.msg);
			}
		}
	});
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
				 	getDicData();
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