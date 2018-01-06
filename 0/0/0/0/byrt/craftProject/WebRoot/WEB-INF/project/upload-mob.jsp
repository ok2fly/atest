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
	<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-form.js"></script>
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
	    	location.href="<%=basePath%>commens/upload.htm";
	    }
	</script>
	</head>
<body class="bgimg">
		<div class="w100 bggrag h60">
			 <div class="navbtn" >
			 	 <div><a class="lastBtn"></a></div>
			 	 <div><a class="homeBtn"></a></div>
			 </div>
		 </div>
		<div class="w100 bggrag">
			<div class="blacktitle" style="padding:20px;">
				上传作品
			</div>
		</div>
		<form action="" id="uploadModel"  enctype="multipart/form-data">
		<div class="uploadmodel w100">
			<div class="uploadtitle">参赛作品 </div>
			<div class="uploadbox bggrag">
				<!-- <div class="toptext">上传作品<span><i>※</i>上传要求:作品图片最多5张，最少1张，单张800*800px，300dpi，大小不超过5M。作品名称最多12个字。</span></div> -->
				<div class="upimgbox">
					 <div class="bbox clearfix" id="imgbox1">
						<div class="upimgone">
							<div class="imgone">
								<input type="file" id="imgbox1file1" name="files"  onchange="change(this)" >
								<img id="imgbox1file1-check" alt="" name="pic" style="width: 100px;height: 100px; border: none;">
							</div>
						</div>
						<div class="upimgone">
							<div class="imgone">
								<input type="file" id="imgbox1file2" name="files" onchange="change(this)" >
								<img id="imgbox1file2-check" alt="" name="pic" style="width: 100px;height: 100px; border: none;">
							</div>
						</div>
						<div class="upimgone">
							<div class="imgone">
								<input type="file" id="imgbox1file3" name="files" onchange="change(this)" >
								<img id="imgbox1file3-check" alt="" name="pic" style="width: 100px;height: 100px; border: none;">
							</div>
						</div>
						<div class="upimgone">
							<div class="imgone">
								<input type="file" id="imgbox1file4" name="files" onchange="change(this)">
								<img id="imgbox1file4-check" alt="" name="pic" style="width: 100px;height: 100px; border: none;">
							</div>
						</div>
						<div class="upimgone">
							<div class="imgone">
								<input type="file" id="imgbox1file5" name="files"  onchange="change(this)" >
								<img id="imgbox1file5-check" alt="" name="pic" style="width: 100px;height: 100px; border: none;">
							</div>
						</div>
					</div>  
				</div>
				<!-- <div class="tishi clearfix"><i>※上传要求:</i><span>作品图片最多5张，最少1张，单张800*800px，300dpi，大小不超过5M。<br>
           提交图片须包含作品整体展示图、三视图（正视图、俯视图、左视图）。</span></div> -->
				<div class="upinfobox">
					<div class="oneline">
						<div class="oneinfo">
							<div class="leftt">作品名称：</div>
							<div class="rightin">
								<input type="text" name="opusName"  maxlength="12" >
							</div>
						</div>
					</div>
					<div class="oneline">
						<div class="oneinfo">
							<div class="leftt">选择组别：</div>
							<div class="rightin">
								<select  name="groupId" id=""  >
									<option value="" selected="selected">请选择类别</option>
									<option value="14" pre="ZT">织绣组</option>
									<option value="18" pre="CX">印染组</option>
									<option value="15" pre="FY">编织组</option>
									<option value="19" pre="DY">烧制组</option>
									<option value="16" pre="WB">金工组</option>
									<option value="20" pre="BY">髹漆组</option>
									<option value="17" pre="BY">雕塑组</option>
									<option value="21" pre="BY">刻绘组</option>
									<option value="22" pre="BY">服装组</option>
									<option value="25" pre="BY">配饰组</option>
									<option value="23" pre="BY">家纺组</option>
									<option value="26" pre="BY">家装组</option>
									<option value="24" pre="BY">文创组</option>
									
								</select>
							</div>
						</div>
					</div>
					<div class="oneline">
						<div class="oneinfo timer">
							<div class="leftt">创作时间：</div>
							<div class="rightin">
								<input type="text" name="creativeTime" class="tcal" class="Wdate"  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
							</div>
						</div>
					</div>
					<div class="oneline">
						<div class="oneinfo">
							<div class="leftt">作品材质：</div>
							<div class="rightin">
								<input type="text" name="material" maxlength="15">
							</div>
						</div>
					</div>
					<div class="oneline">
						<div class="oneinfo">
							<div class="leftt">制作工艺：</div>
							<div class="rightin">
								<input type="text" name="productionProcess" maxlength="50">
							</div>
						</div>
					</div>
					<div class="oneline">
						<div class="leftt">作品简介：</div>
						<textarea name="introduction" id="" cols="30" rows="10" onkeyup="checkWords(this)"></textarea>
						<div class="clear"></div>
						<div class="inleng">0/200</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<div class="w100 bggrag"  >
			<!-- <div class="checks"><input type="checkbox" id="okToRule"><span onclick="showRuleDetail()">我已阅读并接受参赛须知</span></div> -->
			<div class="uploadbtn uploadmob" style="margin-top:0;"></div>
		</div>
	
	<script type="text/javascript">
	
	$(function(){
		 
		$.ajax({
			url:'<%=basePath%>Opus/selOpusByUserId',
			type:"post",
			dataType:"json",
			success:function(data){
				if("0"==data.status){
					var json = data.data;
					 if(json.basUser.length > 0 ){
						  
					 }else{
						 window.location.href = url+"commens/entry-mob.htm";
					 }
				}
			}
		})
	})
	
	
	function change(a){
		 var id = $(a).attr("id");
		var checkId = id+"-check";
		 var pic = document.getElementById(id+"-check"),

	        file = document.getElementById(id);


	    var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();

	     // gif在IE浏览器暂时无法显示

	     if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){

	         alert("图片的格式必须为png或者jpg或者jpeg格式！"); 

	         return;

	     }

	     var isIE = navigator.userAgent.match(/MSIE/)!= null,

	         isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;

	 

	     if(isIE) {

	        file.select();

	        var reallocalpath = document.selection.createRange().text;

	        // IE6浏览器设置img的src为本地路径可以直接显示图片

	         if (isIE6) {

	            pic.src = reallocalpath;

	         }else {

	            // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现

	             pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\"" + reallocalpath + "\")";

	             // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片

	             pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';

	         }

	     }else {

	        html5Reader(file,checkId);

	     }
	     
	     //隐藏默认的图片
	     $("#"+id).parent().css("background","none");
	}
	 
	
	function html5Reader(file,id){

	     var file = file.files[0];

	     var reader = new FileReader();

	     reader.readAsDataURL(file);

	     reader.onload = function(e){

	         var pic = document.getElementById(id);

	         pic.src=this.result;

	     }

	 }
	
	function strwordslength(words){
		var l = words.length; 
		return l; 
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
	function checkBeforeUpdate(){
		if(!$("#okToRule").prop("checked")){
			alert("请阅读并同意我们的参赛须知！")
			return false;
		}
		return true;
 	}
 	$("div.uploadbtn").on("click",function(){
 		 /* var result = checkBeforeUpdate();
		if(!result){
			return false;
		} */
 		var isOk = true;
		var works = {};
		works.file1=$("#imgbox1file1").val();
		works.file2=$("#imgbox1file2").val();
		works.file3=$("#imgbox1file3").val();
		works.file4=$("#imgbox1file4").val();
		works.file5=$("#imgbox1file5").val();
		works.opusName=$("input[name=opusName]").val();
		works.groupId=$("select[name=groupId]").val();
		works.creativeTime=$("input[name=creativeTime]").val();
		works.material=$("input[name=material]").val();
		works.productionProcess=$("input[name=productionProcess]").val();
		works.introduction=$("textarea[name=introduction]").val();
		
		var piclist = new Array();
		 if((works.file1==""&&works.file2==""&&works.file3==""&&works.file4==""&&works.file5=="")
				||works.opusName==""||works.groupId==""||works.creativeTime==""
				||works.material==""||works.productionProcess==""||works.introduction==""){
			alert("作品信息请填写完整！");
			isOk = false;
			return false;
		}else if(works.opusName.length>=13){
			alert("作品名称保持在12个字以内！")
			isOk = false;
			return false;
		}else if(works.material.length>=16){
			alert("作品材质保持在15个字以内！")
			isOk = false;
			return false;
		}else if(works.productionProcess.length>=51){
			alert("制作工艺保持在50个字以内！")
			isOk = false;
			return false;
		}else if(strwordslength(works.introduction)>200){
			alert("描述信息不要超过规定字数");
			isOk = false;
			return false;
		} 
		
		if(!isOk){
			return false;
		}
		 
		
		
		<%-- var formFile = new FormData($('#uploadModel')[0]);
		var indexlayer = layer.load(1, {
			  shade: [0.5,'#fff'] //0.1透明度的白色背景
		});
 		$.ajax({  
		    type: "POST",  
		    url: "<%=basePath%>upload/opus",
		    data: formFile, 
		    dataType:"json",
		   /*  contentType : 'application/json;charset=utf-8', //设置请求头信息   */
		    contentType: false,
            processData: false,
		    success: function(data){ 
		    	layer.close(indexlayer);  //关闭 loading 
		    	if(data.status=="0"){
		    		var confW = '恭喜您上传成功！工作人员会快马加鞭的对您提交的作品进行审核，请耐心等待！'
		    		layer.confirm(confW,{
		    	        title:'',
		    	        btn:['我知道了']
		    	    }, function(){
		    	    	  window.location.href="<%=basePath%>commens/myworks-mob.htm";
		    	    });
		    	}else{
		    		alert(data.msg);
		    	}
		    },  
		    error: function(res){  
		    	layer.close(indexlayer);  //关闭 loading 
		    	layer.alert("上传错误");
		    }  
		});   --%>
		var indexlayer = layer.load(1, {
			  shade: [0.5,'#fff'] //0.1透明度的白色背景
		});
		var option = {
	         　　 	url : '<%=basePath%>upload/opus',
	        　　  	type : 'POST',
	         　　 	dataType : 'json',
         　　 	 	contentType: false,
            processData: false,
	        　　  	success : function(data) {
	           　　 			layer.close(indexlayer);  //关闭 loading 
			    	if(data.status=="0"){
			    		var confW = '恭喜您上传成功！工作人员会快马加鞭的对您提交的作品进行审核，请耐心等待！'
			    		layer.confirm(confW,{
			    	        title:'',
			    	        btn:['我知道了']
			    	    }, function(){
			    	    	  window.location.href="<%=basePath%>commens/myworks-mob.htm";
			    	    });
			    	}else{
			    		alert(data.msg);
			    	}
	      },
	      error: function(res){  
		    	layer.close(indexlayer);  //关闭 loading 
		    	layer.alert("上传错误");
		  }  
	  }
      $("#uploadModel").ajaxSubmit(option);
      return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
 	})
	</script>
	
	<script src="<%=basePath%>js/layer/layer.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>js/guid.js"></script> 
	<!--  -->
	<!-- <script src="/js/require.min.js"></script> -->
	<!-- <script src="/js/main.js"></script> -->
	<!--  -->
	<!-- <script type="text/javascript">
	function showRuleDetail(){
		layer.confirm(
				'1.参赛作品须是参赛者原创作品，未侵犯任何他人的任何专利、著作权、商标权及其他知识产权；作品未以任何形式进入商业渠道。<br/>'
				+'2.参赛者务必保证所填写各项信息准确和真实,由于输入错误或虚假信息而引发的一切后果将由参赛者自行承担。<br/>'
				+'3.赛事评审结束前，参赛作品不得一稿多投；参赛者亦不得将参赛作品转让于第三方、或授权第三方使用。<br/>'
				+'4.专题赛、单项赛金、银、铜获奖作品经与原作者协商后将由主办方永久收藏，长期进行线上专题展示，并作为特别策划版块参与中国手艺网在全国范围文化类展会的现场展览。<br/>'
				+'5.每位参赛者最多参与3个组别的比赛，且提交参赛作品的总件数不超过5件。<br/>',{
	        area:'780px',
	        title:'参赛须知',
	        btn:['我知道了']
	    })
	}
	
    //alert("xaa") 
	</script>	 -->
</body>
</html>
