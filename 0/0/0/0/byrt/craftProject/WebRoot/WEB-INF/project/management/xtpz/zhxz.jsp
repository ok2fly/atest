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
<title>组织机构管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/pop.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/wbox.css">
</head>
<body id="bodysten">
<div class="pt18">
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="poptable">
		<input type="hidden" id="comId" value="${user.com_id}" >
		<tr>
			<th>用户账号</th>
			<td><input type="text" value="" id="acc_num" placeholder="请输入用户账号" class="popinput requiredInp"></td>
			<th>用户邮箱</th>
			<td><input type="text" value=""  id="use_mal" placeholder="请输入用户邮箱" class="popinput requiredInp"></td> 
		</tr>
		<tr>
			<th>密码</th>
			<td><input type="password" value=""  id="use_pas"  class="popinput requiredInp"></td>
			<th>确认密码</th>
			<td><input type="password" value=""  id="use_pas_again"  class="popinput requiredInp"></td>
		</tr>
		<tr>
			<th>姓名</th>
			<td><input type="text" value=""  id="use_nam"  placeholder="请输入姓名" class="popinput requiredInp"></td>
			<th>性别</th>
			<td><select class="popinput w162 requiredInp" id="use_sex" ><option value="0">无</option><option value="1">男</option><option value="2">女</option></select></td>
		</tr>
		<tr>
			<th>身份证号</th>
			<td><input type="text" value=""  id="use_idc" placeholder="请输入身份证号" class="popinput"></td>
			<th>通讯地址</th>
			<td><input type="text" value="" id="use_add"  placeholder="请输入通讯地址" class="popinput"></td>
		</tr>
		<tr>
			<th>联系电话</th>
			<td><input type="text" value="" id="use_mob" placeholder="请输入联系电话" class="popinput requiredInp"></td>
			<th>专业</th>
			<td><input type="text" value="" id="use_maj" placeholder="请输入专业" class="popinput"></td>
		</tr>
		<tr>
			<th>籍贯</th>
			<td><input type="text" value="" id="pla_ori" placeholder="请输入籍贯" class="popinput"></td>
			<th>备注</th>
			<td><input type="text" value="" id="remark" placeholder="请输入备注" class="popinput"></td>
		</tr>
	</table>
	<a id="close" class="wBox_close" style="width:200px;height:20px;"></a>
	<div class="tc pt25">
		<button class="popbut" onclick="return insert();">确定</button></div>
	</div>
</div>
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>js/jsall.js"></script>
<script src="<%=basePath%>js/wbox.js"></script>
<script src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
	
})


var count = 0;
function insert(){
	var reFlag = false ; 
   	$(".requiredInp").each(function(){
	   if($(this).val() == "" || $(this).val() == undefined ){
		   reFlag = true;
		   return ;
	   }
   	}); 
   	if(reFlag){
	   layer.alert("请完善信息！");
	   return;
   	}
   	
	var use_pas_again = $("#use_pas_again").val();
	var use_pas = $("#use_pas").val();
	if(use_pas_again != use_pas){
		//$(".popbut").removeClass("wBox_close");
		layer.alert("两次密码不一致!");
		return ;
	}else{
		save();
	}
}

function save(){
	var use_pas = $("#use_pas").val();
	var acc_num = $("#acc_num").val();
	var use_mal = $("#use_mal").val();
	var use_nam = $("#use_nam").val();
	var use_sex = $("#use_sex").val();
	var use_mob = $("#use_mob").val();
	var use_idc = $("#use_idc").val();
	var use_add = $("#use_add").val();
	var use_maj = $("#use_maj").val();
	var pla_ori = $("#pla_ori").val();
	var remark = $("#remark").val();
	 $.ajax({
		  url:url+"Opus/insertUse",
		  data: "acc_num="+acc_num 
		  		+"&&use_mal="+use_mal
		  		+"&&use_nam="+use_nam
		  		+"&&use_sex="+use_sex
		  		+"&&use_mob="+use_mob
		  		+"&&use_idc="+use_idc
		  		+"&&use_add="+use_add
		  		+"&&use_maj="+use_maj
		  		+"&&pla_ori="+pla_ori
		  		+"&&remark="+remark
		  		+"&&use_pas="+use_pas ,
		  dataType:"json",
		  async: false,
		  type:"post",
		  success:function(data){
			  if(data.status=="0"){
				  var wBox = parent.document.getElementById("wBox");
				  window.parent.getComData();
				  $(wBox).find(".wBox_close").click();
				  window.parent.layer.msg("添加成功");
			  }else{
				  layer.alert(data.msg);
			  }
		  }
	 });
}
</script>
</body>
</html>
