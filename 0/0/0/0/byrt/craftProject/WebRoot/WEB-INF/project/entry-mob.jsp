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
	<script type="text/javascript" src="<%=basePath%>js/base.js"></script>
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
	    	location.href="<%=basePath%>commens/entry.htm";
	    }
	</script>
	</head>
<body class="bgimg">
		 <div class="w100 bggrag h60">
			 <div class="navbtn" >
			  	<div><a class=""></a></div>
			 	 <div><a class="homeBtn"></a></div>
			 </div>
		 </div>
		<div class="w100 bggrag">
			<div class="blacktitle" style="padding:20px;">
				 参赛信息填写
			</div>
			<!-- <div class="prompt">※ 所有项均为必填，个人或团体只需填写一个</div> -->
		</div>
		<div class="entrytable w100 bggrag">
			<div class="writebg">
				<form action="" name="grBm" id="grBm">
				<div class="oneline">
					<div class="onein">
						<div class="ltext">姓　　名：</div>
						<div class="rinput">
							<input type="text" name="useNam" id="use_nam" maxlength="10">
						</div>
					</div>
					<div class="onein">
						<div class="ltext">性　　别：</div>
						<div class="rinput radiobox">
							<input type="radio" name="useSex" checked="checked" value=0 id="use_sex1">男　　
							<input type="radio" name="useSex" value="1"  id="use_sex0">女
						</div>
					</div>
					<div class="onein">
						<div class="ltext">年　龄：</div>
						<div class="rinput">
							<input type="text" name="age" id="age">
						</div>
					</div>
				</div>
				<div class="oneline">
					<div class="onein">
						<div class="ltext">联系电话：</div>
						<div class="rinput">
							<input type="text" name="useMob" id="use_mob">
						</div>
					</div>
					<div class="onein">
						<div class="ltext">微信/QQ：</div>
						<div class="rinput">
							<input type="text" name="thirdAcc"  id="third_acc" maxlength="10">
						</div>
					</div>
					<div class="onein">
						<div class="ltext">身份证：</div>
						<div class="rinput">
							<input type="text" name="useIdc" id="use_idc" maxlength="18">
						</div>
					</div>
				</div>
				<div class="oneline">
					<div class="ltext">学校/单位：</div>
					<div class="rinput lang">
						<input type="text" name="useUnit" id="use_unit" maxlength="30">
					</div>
				</div>
				<div class="oneline">
					<div class="ltext">通讯地址：</div>
					<div class="rinput lang">
						<select name="proId" onchange="Province_onchange(this.value);"    id="selectProvince" class="pxone">
			                 <option value="选择省" >选择省</option>
			       		</select>
			       		<select name="cityId" onchange="MM_jumpMenu(this.value)" id="selectCity"class="pxone">
			                 <option value="选择市" >选择市</option>
			        	</select>
						<input type="text" name="useAdd"  id="use_add" maxlength="100">
					</div>
				</div>
				<div class="oneline">
					<div class="ltext">个人简介：</div>
					<textarea name="useProfile"  cols="30" rows="10" onkeyup="checkWords(this)" id="use_profile"></textarea>
					<div class="clear"></div>
					<div class="inleng">0/200</div>
				</div>
				</form>
				<div class="sublime submob" onclick="checkForSend(0)"></div>
			</div>
		</div>
	 
<script type="text/javascript">
function strwordslength(words){
	var l = words.length; 
	/* var blen = 0; 
	for(i=0; i<l; i++) { 
		if ((words.charCodeAt(i) & 0xff00) != 0) { 
			blen ++; 
		} 
		blen ++; 
	} */
	return l;//blen;
}
function checkWords(obj){
	var words = $(obj).val();
	var length = strwordslength(words);
	if(length>200){
		//alert("描述信息不要超过规定字数");
		$(obj).siblings("div.inleng").html("<span style='color:red;'>超出范围"+length+"/200</span>");
		return false;
	}else{
		$(obj).siblings("div.inleng").text(length+"/200");
	}
}
	function checkName(type){
		if("0"==type){
			var name = $("#grBm input[name=useNam]").val();
			console.log(name);

			if($.isEmptyObject(name)){
				return "请填写姓名信息";
			}
			var age = $("#grBm input[name=age]").val();
			if(""==age){
				return "请填写年龄信息";
			}else{
				if(!$.isNumeric(age)||age<=0||99<=age){
					return "请填写正确年龄信息";
				}
			}
			var phone = $("#grBm input[name=useMob]").val();
			if(""==phone){
				return "请填写电话信息";
			}else{
				if(!phone.match(base.regExp.mobile)){
					return "电话格式不正确";
				}
			}
			var useIdc = $("#grBm input[name=useIdc]").val();
			if(""==useIdc){
				return "请填写身份证号";
			}else{
				if(!useIdc.match(base.regExp.cardno)){
					return "身份证号格式不正确";
				}
			}
			var thirdContact = $("#grBm input[name=thirdAcc]").val();
			if(""==thirdContact){
				return "请填写QQ或微信信息";
			}
			var unit = $("#grBm input[name=unit]").val();
			if(""==unit){
				return "请填写单位信息";
			}
			var province1 = $("#selectPrivince").val();
			var city1 = $("#selectCity").val();
			var address1 = $("#grBm input[name=useAdd]").val();
			if("选择省"==province1||"选择市"==city1||$.isEmptyObject(address1)){
				return "请填写完整的通信地址信息";
			}
			var descr = $("#grBm textarea[name=useProfile]").val();
			if($.isEmptyObject(descr)){
				return "请填写个人简介信息";
			}else if(descr.length>=200){
				return "请填写1-200之间的个人介绍信息";
			}
			return true;
		}
		return true;
	}
	
	function checkForSend(type){
		if("0"==type){//个人报名
			 //$("form").serialize();
			var checkRes = checkName(type);
			console.log(checkRes);
			if(true!=checkRes){ 
				alert(checkRes);
				return false;
			}else{
				$.ajax({
					url:"<%=basePath%>"+goUrl,
					type:"get",
					dataType:"json",
					data: $("#grBm").serialize(),
					success:function(data){
						if("0"==data.status){
							alert("参赛信息填写成功")
							window.location.href="upload-mob.htm";
						}else{
							alert(data.msg);
						}
					},
					error:function(){
						
					}
				})
			}
		} 
	}
</script>

<script type="text/javascript">
/* 城市选择 */
var proId = '';
var tmpCityId='';
var goUrl = '/user/fillInfo';
$(function(){
	getSheng();
	
	$.ajax({
		url:'<%=basePath%>Opus/selOpusByUserId',
		type:"post",
		dataType:"json",
		success:function(data){
			if("0"==data.status){
				var json = data.data;
				 if(json.basUser.length > 0 ){
					 goUrl = '/user/updateInfo';
					 $.each(json.basUser,function(i,v){
						 $("#use_nam").val(v.use_nam);
						 if(v.use_sex == 0 ){
							 $("use_sex1").removeAttr("checked") ; 
							 $("use_sex0").attr("checked");
						 }else{
							 $("use_sex0").removeAttr("checked") ; 
							 $("use_sex1").attr("checked");
						 }
						 $("#age").val(v.age);
						 $("#use_mob").val(v.use_mob);
						 $("#use_idc").val(v.use_idc);
						 $("#third_acc").val(v.third_acc);
						 $("#use_unit").val(v.use_unit);
						 $("#use_profile").html(v.use_profile);
						 $("#use_add").val(v.use_add);
						 getSheng(v.pro_id);
						 setTimeout(function(){
							MM_jumpMenu(v.city_id);
						 },8000) 
					})
				 }
			}
		}
	})
})

function getSheng(id){
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
        				 var se = '';
        				 if(id && id == d.id){
        					 se = "selected";
        					 Province_onchange(id);
            			 }
        				 htm += '<option value='+d.id+' '+se+'>'+d.reg_nam+'</option>';
        			 }
        			 $("#selectProvince").empty().html(htm);
        		 }
        	 }else{
        		 alert(data.msg);
        	 }
        }  
    });  
}
/**
 *点击选择城市
 */
function MM_jumpMenu(val){  
	 $("#selectCity").val(val);
	 var  cityId =  val;
	if(cityId == "选择市"){
		tmpCityId = '';
	}else{
		tmpCityId = cityId;
	}
	 
}

 
/* 选择省  */
function Province_onchange(x)
{ 
	//需要省的-
	 $("#selectProvince").val(x);
	 var provinceS = x 
	console.log(provinceS)
	if(provinceS == "选择省"){
		proId = '';
		tmpCityId ='';
		$("#selectCity").empty().html('<option value=选择市>选择市</option>');
	}else{
		proId = provinceS;
		citySet(proId);
	}
	
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
        				 htm += '<option value='+d.id+'   >'+d.reg_nam+'</option>';
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
</body>
</html>
