// JavaScript Document

$(function(){
	
	/*
		left 展开收起
	*/
	$("#lf-openbut").click(function(){
		$(".main").removeClass("max-leftnav").addClass("min-leftnav");		
		});
	/*
		right 展开收起
	*/
	$("#rg-openbut").click(function(){
		if($(this).hasClass("rg-sh"))
		{
			$(this).removeClass("rg-sh").addClass("rg-zk");
			$(".righfannav").addClass("w0");
			
		}else
		{
			$(this).addClass("rg-sh").removeClass("rg-zk");	
			$(".righfannav").removeClass("w0");
		}
		
		});
	
	
	//切换查询与特别关注
	$("#letopnav1 span").click(function(){		
		$(this).addClass("active").siblings().removeClass("active");
		var letnav=$("#letopnav1 span").index(this);
		$('#letopnav3 span').eq(letnav).addClass("active").siblings().removeClass("active");
		$("#letsoso>div").eq(letnav).show().siblings().hide();
	});
	
	// 收起后的导航 点击切换效果
	$('#letopnav3 span').click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		$(".main").removeClass("min-leftnav").addClass("max-leftnav");
		var letnav=$("#letopnav3 span").index(this);
		$('#letopnav1 span').eq(letnav).addClass("active").siblings().removeClass("active");
		$("#letsoso>div").eq(letnav).show().siblings().hide();
	});
		
		
	//切换区域与线路
	$("#letopnav2 span").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var letnav=$("#letopnav2 span").index(this);
		$("#statlist>div").eq(letnav).show().siblings().hide();
		});
	
	//statlist  点击添加特别关注     2016-07-22  修改
	$(".statlist li").find("span").on("click",function(){
		if($(this).parent().hasClass("active"))
		{
			$(this).parent().removeClass("active");
		}else{
			$(this).parent().addClass("active");
		}		
	});
	
	// left nav 区域 展开与收起效果
	$(".statname em").on('click',function(){
		if($(this).hasClass("active"))
		{
			$(this).removeClass("active");
			$(this).parent().next("div").show();			
		}else{
			$(this).addClass("active");
			$(this).parent().next("div").hide();		    
		}				
	});
		
	//总排行榜
	$("#letnav span").click(function(){		
		$(this).addClass("active").siblings().removeClass("active");
		var letnav=$("#letnav span").index(this);
		$("#letnav1>div").eq(letnav).show().siblings().hide();	
	})

// 方格列表与横列表切换
	$("#fannav span").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var letnav=$("#fannav span").index(this);
		$("#fannavlist>div").eq(letnav).show().siblings().hide();
	
	})

//设备管理 left nav 
	$(".twoleftnav dd").find("span").click(function(){
		$(this).parent().addClass("active").siblings().removeClass("active");
	});

//用户角色管理 
	$(".chboxtable tr th").find("i").on('click',function(){
		if($(this).hasClass("active"))
		{
			$(this).removeClass("active");
			$(this).parent().parent().parent().next('tbody').hide();
			$(this).parent().parent().parent().parent().next('div').show();
			
		}
		else
		{
			$(this).addClass("active");
			$(this).parent().parent().parent().next('tbody').show();
			$(this).parent().parent().parent().parent().next('div').hide();
		}
	});	
	
	//故障分析
	$(".faultnav em").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var letnav=$(".faultnav em").index(this);
		$(".mt15_gzfx>div").eq(letnav).show().siblings().hide();
	});

// 风机列表 排序
	$(".asc").on('click',function(){
		if($(this).hasClass("upicon"))
		{
			$(this).addClass('dowicon').removeClass('upicon');
		}
		else
		{
			$(this).removeClass('dowicon').addClass('upicon');	
		}			
		});


///////////*** 场站对比  **/
	//场站对比
	$(".openbox").find(".inpbutsel").click(function(){
			$(this).next("div.sel_div").show();
		});
		//取消
	$(".nobut").click(function(){
		$(this).parent().parent().hide();		
		});
	//确定1
	$("#statiokbut").click(function(){
		obj = $("input[name='statone']");		
		check_val = [];
		for(k in obj){
		if(obj[k].checked)
			check_val.push(obj[k].value);
		}
		$("#statione").val(check_val).attr("title",check_val);
		$(this).parent().parent().hide();	
		});
	//确定
	$("#statiokbut3").click(function(){
		obj = $("input[name='stattow']");		
		check_val = [];
		for(k in obj){
		if(obj[k].checked)
			check_val.push(obj[k].value);
		}
		$("#statitwo").val(check_val).attr("title",check_val);
		$(this).parent().parent().hide();	
		});
	//确定2
	$("#statitwobut").click(function(){
		obj = $("input[name='statwo']");
		check_val = [];
		for(k in obj){
		if(obj[k].checked)
			check_val.push(obj[k].value);
		}
		
		$("#statitwo").val(check_val).attr("title",check_val);
		$(this).parent().parent().hide();	
	});
	$('label').on('click',function(){
		$(this).prev("input[type='checkbox']").attr('checked','checked');
	});


// 确定选中效果
	 $("#okselectd").on('click',function(){
		 var checkCz = "";
		 if($("#statitwo").val()==''||$("#statione").val()=='')
		 {
			 layer.alert('场站不能为空，请选择场站');
				return; 
		}
		 else
		 {
			$("#selespan1").text($("#selectop1 option:selected").text()+'：');
			$("#selespan2").text($("#selectop2 option:selected").text()+'：');
			//场站1
			obj1 = $("input[name='statone']");
			check_val1 = [];
			for(i in obj1){
				if(obj1[i].checked)
					{
						check_val1.push("<em class=\"xinxi\">"+obj1[i].value+"<i>X</i></em>");
						checkCz = checkCz + obj1[i].value+"-";
					}					
			}
			if($("#selespan1").parent().children('em'))
			{
				$("#selespan1").parent().children('em').remove();
				$("#selespan1").parent().append(check_val1);			
			}
			else
			{
				$("#selespan1").parent().append(check_val1);				
			}
			
			
			//场站2
			obj = $("input[name='statwo']");
			check_val = [];
			for(k in obj){
				if(obj[k].checked)
					{
						check_val.push("<em>"+obj[k].value+"<i>X</i></em>");
						checkCz = checkCz + obj1[k].value+"-";
					}
				
			}
			if($("#selespan2").parent().children('em'))
			{
				$("#selespan2").parent().children('em').remove();
				$("#selespan2").parent().append(check_val);
			}
			else
			{
				$("#selespan2").parent().append(check_val);				
			}
			$(".selebgf2").show(); 
			
			//清除被选中的checkbox
			inpbox()
		 }
		 
		 $("#checkCz").val(checkCz); 
		 
		 
		 //已选场站  选中状态 与 移除场站
		$(".region em").on('click',function(){
			$(this).addClass("active").siblings().removeClass("active");
		});
		$(".region em").find('i').on('click',function(){
			$(this).parent().remove();
		});  
		
	 });
	
		
//指标选中与取消状态		
 $("#quotaindex em").on('click',function(){	
	 if($(this).hasClass("active"))
	 {					
		$(this).removeClass("active");		
	 }
	 else
	 {	   
		$(this).addClass("active");	 
	}
 });		
/*** ./  场站对比  **/	
});




//清除被选中的checkbox
function inpbox(){
	obj=$("input[type='checkbox']");

	obj.attr('checked',false);
	$("#statione").val('').attr("title",'');
	$("#statitwo").val('').attr("title",'');
	
	
	}


