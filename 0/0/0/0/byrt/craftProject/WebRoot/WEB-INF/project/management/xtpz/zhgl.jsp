<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>   
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
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/style.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/topnavleft.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/media.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/wbox.css">
<style>
</style>
</head>
<body class="bg-e9" > 
 <!-- right main  -->
  <div class="righmain"> 
    <!-- viewFramework -->
    <div class="viewFramework"> 
      <input type="hidden" name = "com_id" id="com_id" value="${user.com_id}" >
      <!-- top 搜索条件 -->
      <div class="bg-ff pb18 pl15 pt9 clr">
        <h2 class="lh30">查询条件</h2>
        <div class="query">
          <span class="fl">用户账号</span>
          <input type="text" id="user_name" value="" placeholder="请输入.." class="fl quinput ml0">
           <span class="fl ml10">手机号</span>
          <input type="text" id="mob" value="" placeholder="请输入.." class="fl quinput ml0">
          <div class="fr">
	          <input type="button" value="查询" onclick="getComData()" class="querybut fl ml20">
	          <a href="#" target="_self" id="addUser" data-title="账户管理" data-url="<%=basePath%>management/zhxz.htm" data-height="350" data-width="600" class="querybut fl ml20 wbox" >新增</a> 
          </div>
        </div>
      </div>
      <!-- ./ top 搜索条件 --> 
      <!-- 搜索列表 -->
      <div class="mt15 pl8 pr8 pb18 bg-ff pt9">
        <div class="fanlist-f clr wauto">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="fanlist-list">
            <tr>
              <th width="5%">用户账号</th>
              <th width="8%">姓名</th>
              <th width="5%">性别</th>
              <th width="11%">联系电话</th>
              <th width="15%">身份证号</th>
              <th width="15%">地址</th>
              <th width="15%">操作</th>
            </tr>
            <tbody id="tbodys">
            
            </tbody>
            
          </table>
          <div class="blank0"></div>
        </div>
      </div>
      <!-- ./ 搜索列表 --> 
    </div>
    <!-- ./ viewFramework --> 
  </div>
  <!-- ./ right main --> 
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>js/jsall.js"></script>
<script src="<%=basePath%>js/base.js"></script> 
<script src="<%=basePath%>js/wbox.js"></script>
<script type="text/javascript">
var wBox ;
$(function() {
	getComData();
	 
	$("#addUser").click(function(){
		  wBox = $("#wbox").wBox({
				title:"账户管理", 
				target:$("#addUser").attr("data-url"),
				requestType:"iframe", 
				iframeWH:{
					width:600, 
					height:350
				}
			});  
			wBox.showBox();
	});
}); 
function getComData(){
	  var user_name = $("#user_name").val();
	  var mob = $("#mob").val();
	  var BasData=[];
	  var param = "";
	  if(user_name != "" && user_name != undefined  ){
		  param +=  "userName="+user_name;
	  } 
	  if(mob != "" && mob != undefined  ){
		  param +=  "userMob="+mob;
	  }
	  $.ajax({
		  url:url+"Opus/selAllUserByNameAndMob",
		  data:param,
		  dataType:"json",
		  async: false,
		  type:"post",
		  success:function(data){
			  if(data.status=="0"){
				  var BasData = data.data;
				  var html = "";
				  if(BasData.length == 0 ){
					  html = "<tr><td colspan='7'>暂无数据</td></tr>";
				  }else{
					  for (var i = 0; i < BasData.length; i++) {
						   var sex = BasData[i].use_sex == 1 ?  "男" : "女" ;
						   var state = BasData[i].use_sta == 1 ?  "可用" : "不可用" ;
							html+='<tr><td>'+BasData[i].use_mob+'</td>'+
					           '<td>'+BasData[i].use_nam+'</td>'+
					           '<td>'+sex+'</td>'+
					           '<td>'+BasData[i].use_mob+'</td>'+
					           '<td>'+getIsNull(BasData[i].use_idc)+'</td>'+
					           '<td>'+BasData[i].use_add+'</td>'+
					           '<td><a href="#" target="_self" class="wbox" data-title="用户信息管理" data-url="<%=basePath%>management/zhxg.htm?id='+BasData[i].id+'" data-height="350" data-width="600">修改</a><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="javascript:void(0);" onclick="del('+BasData[i].id+')" target="_self">删除</a></td></tr>"';
					  }	
				  }
				  $("#tbodys").html(html);
			   }else{
				   layer.alert(data.msg);
			   }
		  }
	  })
}
 

function del(id){
	 layer.confirm("确定删除？",function(){		
		 $.ajax({
			  url:url+"Opus/delUser",
			  data:"id="+id,
			  dataType:"json",
			  async: false,
			  type:"post",
			  success:function(data){
				  if(data.status=="0"){
					  layer.msg("删除成功");
					  getComData();
				  }else{
					  layer.alert(data.msg); 
				  }
			  }
		 });
	})
}
</script>
</body>
</html>
 
