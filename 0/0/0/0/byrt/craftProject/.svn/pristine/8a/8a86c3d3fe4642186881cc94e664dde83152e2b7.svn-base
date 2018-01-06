$(function(){
	if($(".login_main,.grayc_line").length>0){
		val_hid();
	};
	if($(".grayc_line").length>0){
		findPass(0);
	}

	$(".input_val").click(function() {
			$(this).parent().children("input").focus();
	});
	$(".close").click(function(){closediv()})
})
function val_hid(){
	function getOs() { 
    	var OsObject = ""; 
   		if(document.all&&( navigator.appVersion.match(/7./i)=="7."|| navigator.appVersion.match(/8./i)=="8.")) { 
        	return true; 
   		} else{
	   		return false;
		}
	} 
	var IE = getOs();
	$(".login_in").each(function(e){
		$(this).children("input").focus(function() {
				$(this).parent().children(".input_val").hide();
		});
		$(this).children("input").blur(function() {
			if($.trim($(this).val())=="")
				$(this).parent().children(".input_val").show();
			else
				$(this).parent().children(".input_val").hide();
		});
			if(IE){
				$(this).bind("propertychange",function(){
					$(this).children(".input_val").hide();
				})
			}else{
				$(this).bind("input",function(){
					$(this).children(".input_val").hide();
				})
			}
		if($.trim($(this).children("input").val())!="")
			$(this).children(".input_val").hide();
	})
}
function findPass(a){
	if(parseInt(a)==0||parseInt(a)==1||parseInt(a)==2||parseInt(a)==3){
		$(".mainc_line").remove();
		$(".grayc_line").append("<div class='mainc_line wid"+a+"'></div>");
		
		$(".box_int").removeClass("act");
		for(var i=0;i<=a;i++)
			$(".box_int").eq(i).addClass("act");
		$(".liucheng").hide();
		$(".liucheng").eq(a).show();
	}
}