$(function(){
	// placeholder support, author sunxushe
	if(!_supportPlaceholder()){
		$('input[type=text]').each(function(){
			var $this = $(this),
				_placeholder = $this.attr('placeholder');
			if(_placeholder){
				if(!$this.val()) $this.val(_placeholder)
				$this.on('focus',function(){
					if($(this).val()==_placeholder) $this.val('')
				})
				$this.on('blur',function(){
					if($(this).val()=='') $this.val(_placeholder)
				})
			}
		});
	}
	// 检测是否支持Placeholder
	function _supportPlaceholder(){
		return 'placeholder' in document.createElement('input')
	}
	// 重写replaceAll
	String.prototype.replaceAll = function(s1,s2) { 
		return this.replace(new RegExp(s1,"gm"),s2); 
	}
	// 重新 trim
	String.prototype.trim = function () {
		return this.replace(/^\s\s*/, '' ).replace(/\s\s*$/, '' );
	};
	// 判断是否是数字
	String.prototype.isNumber=function(){
		if (!/^\d+(\.\d+)?$/.test(this))  return false;  
		return true;	
	}
	// 	校验手机号码的正确性
	String.prototype.isMobile=function(){
		return /^1[3-9]\d{9}$/.test(this);
	}
	// 新增日期格式化函数
	Date.prototype.format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
})

$(document).ready(function() {
    $(".topdown-toggle").hover(function(){
		$(this).parent().addClass("open");
	},function(){
		$(this).parent().removeClass("open");
		});
	
	$(".dropdown-menu").hover(function(){
		$(this).parent().addClass("open");
	},function(){
		$(this).parent().removeClass("open");
	});
	
});



function removeNode(node){
 if(node && node.parentNode){
	     node.parentNode.removeChild(node);
	 }
}
	
function nameFormart(name){
	var data=document.getElementsByName(name);
	for(var i = 0; i< data.length; i++){
		var da=data[i].innerText;
		if(da.indexOf(".")>0){
			if ((da.length-da.indexOf(".")-1)<2) {
				data[i].innerText=da+"0";
			}else{
				data[i].innerText=da.substring(0,da.indexOf(".")+3);
			}
		}else{
			data[i].innerText=da+".00";
		}
	}
}
	
function classNameFormart(className){
	var data=document.getElementsByClassName(className);
	for(var i = 0; i< data.length; i++){
		var da=data[i].innerText;
		if(da.indexOf(".")>0){
			if ((da.length-da.indexOf(".")-1)<2) {
				data[i].innerText=da+"0";
			}else{
				data[i].innerText=da.substring(0,da.indexOf(".")+3);
			}
		}else{
			data[i].innerText=da+".00";
		}
	}
}
	
function idFormart(id){
	var allMoney=document.getElementById(id);
	var temp=allMoney.innerText;
	if(temp.indexOf(".")>0){
		if ((temp.length-temp.indexOf(".")-1)<2) {
			allMoney.innerText=temp+"0";
		}else{
			allMoney.innerText=temp.substring(0,temp.indexOf(".")+3);
		}
	}else{
		allMoney.innerText=temp+".00";
	}
}
	
function strFormart(str){
	var temp=str;
	if(temp.indexOf(".")>0){
		if ((temp.length-temp.indexOf(".")-1)<2) {
			temp=temp+"0";
		}else{
			temp=temp.substring(0,temp.indexOf(".")+3);
		}
	}else{
		temp=temp+".00";
	}
	return temp;
}
	
/** 
 * 验证是否为数字 
 * @param oNum 
 * @return 
 */  
function isNumber(oNum) {  
    if (!oNum)  
        return false;  
    var strP = /^\d+(\.\d+)?$/;  
    if (!strP.test(oNum))  
        return false;  
    try {  
        if (parseFloat(oNum) != oNum)  
            return false;  
    } catch (ex) {  
        return false;  
    }  
    return true;  
}
	
/**
 * 校验手机号码的正确性
 * @param val
 * @returns {Boolean}
 */
function checkMobile(val){
	if (isNull(val)) {
		return false;
	}
	var reg = /^1[3-9]\d{9}$/;
	if( !reg.test(val)){
		return false; 
	}else{
		return true;							
	}
}
	
/**
 * 判断是否为空
 * @param {} val
 * @return {Boolean}
 */
function isNull(val){
	if (null==val||$.trim(val)==''||'null'==val || undefined == val || 'undefined' == val) {
		return true;
	}else{
		return false;
	}
}
/**
 * 校验input是否有值
 * input必须有requiredInput class
 * select必须有requiredSelect class
 * 需要禁用的按钮必须有J_btnSub class
 */
function checkInput(){
	 var flag=true;
     var input=$('.requiredInput');
     var select=$('.requiredSelect');
     for(var i=0;i<input.length;i++){
    	 if(!flag){
    		 continue;
    	 }
    	 if(isNull(input[i].value)){
    		 flag=false;
    	 }else{
    		 flag=true;
    	 }
     }
     for(var i=0;i<select.length;i++){
    	 if(!flag){
    		 continue;
    	 }
    	 if(isNull(select[i].value)||select[i].value.indexOf('请选择')>=0){
    		 flag=false;
    	 }else{
    		 flag=true;
    	 }
     }
     if(!flag){
    	 if(!$(".J_btnSub").hasClass("disabled")){
         	$(".J_btnSub").addClass("disabled");
    	 }
    	 $(".J_btnSub").attr("disabled",true);
     }else{
         $(".J_btnSub").removeClass("disabled");
         $(".J_btnSub").removeAttr("disabled");
     }
}

/**
 * 比较两个日期的大小
 * 日期格式为xxxx-xx-xx
 * @param {String} dateSmall	比较小的日期
 * @param {String} dateBig		比较大的日期
 * @return {int}	返回第二个日期减去第一个日期的毫秒数 
 */
function getDateDiff(dateSmall,dateBig){
	if(isNull(dateSmall)||isNull(dateBig)){
		showAlert("日期参数为空！");
		return;
	}else{
		var dateS=new Date(dateSmall.replace(/-/g,"/"));
		var dateB=new Date(dateBig.replace(/-/g,"/"));
		return dateB.getTime()-dateS.getTime();
	}
}  	
/**
 * 打开一个子窗口
 * @param {Object} url	子窗口地址
 * @param {Object} height	高度（默认800）
 * @param {Object} width	宽度（默认500）
 * @param {Object} options	自定义参数（若此参数不为空，则以此参数优先，宽度、高度都忽略）
 * @return {TypeName} 
 */
function openWindow(url,height,width,options){
	var height="700";
	var width="1000";
	var winOption ="";
	if(isNull(url)){
		alert('地址为空！');
		return;
	}
	if(isNumber(height)){
		height=height;
	}
	if(isNumber(width)){
		width=width;
	}
	if(!isNull(options)){
		winOption=options;
	}else{
		winOption="height="+height+",width="+width+",top=50,left=50,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,fullscreen=0";
	}
	 window.open(url,window, winOption);
}
/**
 * 关闭当前窗口不提示
 */
function closeWindow(){
	window.opener=null;      
	window.open('','_self');      
	window.close();  
}
/**
 * area区域树选择控件
 * @param {Object} basePath	项目根路径
 * @param {Object} id		当前区域的id
 * @param {Object} checkStyle	选择方式单选S/多选M
 * @return {TypeName} 
 */
function checkArea(basePath,id,checkStyle){
	var url="comm/areaTree.jsp?R="+Math.round(100);
	if(isNull(basePath)){
		alert("参数basePath为空！");
		return;
	}
	url=basePath+url;
	if(!isNull(id)){
		url=url+"&id="+id;
	}
	if(!isNull(checkStyle)){
		url=url+"&checkStyle="+checkStyle;
	}
	openWindow(url,'','','');
}
/**
 * 机构组织树选择控件
 * @param {Object} basePath	项目的根路径
 * @param {Object} id		当前所在机构的id
 * @param {Object} checkStyle	选择方式单选S/多选M
 * @return {TypeName} 
 */
function checkBranch(basePath,id,checkStyle){
	var url="comm/branchTree.jsp?R="+Math.round(100);
	if(isNull(basePath)){
		alert("参数basePath为空！");
		return;
	}
	url=basePath+url;
	if(!isNull(id)){
		url=url+"&id="+id;
	}
	if(!isNull(checkStyle)){
		url=url+"&checkStyle="+checkStyle;
	}
	openWindow(url,'','','');
}

/**
 * 根据key值获取url中搜索的value
 * 
 * @author 孙叙社
 * @date 2016年5月6日
 * @param key
 * @returns
 */
function getHashKeyValue(key){
	var _search = window.location.search,
		arr;
	if(!key || !_search) return;
	arr = _search.substring(1, _search.length).split('&');
	for ( var i=0;i<arr.length;i++) {
		var split=arr[i].split('=');
		if(split[0]==key) return split[1];
	}
}

/**
 * @Description 轮播
 * @Author 		Jin L
 * @Date 		2016年5月10日 下午3:43:17
 */
$.fn.imgscroll = function(o){
	var defaults = {
		speed: 40,
		amount: 0,
		width: 1,
		dir: "left"
	};
	o = $.extend(defaults, o);
	
	return this.each(function(){
		var _li = $("li", this);
		_li.parent().parent().css({overflow: "hidden", position: "relative"}); //div
		_li.parent().css({margin: "0", padding: "0", overflow: "hidden", position: "relative", "list-style": "none",height:"80px"}); //ul
		_li.css({position: "relative", overflow: "hidden"}); //li
		if(o.dir == "left") _li.css({float: "left"});
		
		//初始大小
		var _li_size = 0;
		for(var i=0; i<_li.size(); i++)
			_li_size += o.dir == "left" ? _li.eq(i).outerWidth(true) : _li.eq(i).outerHeight(true);
		
		//循环所需要的元素
		if(o.dir == "left") _li.parent().css({width: (_li_size*3)+"px"});
		_li.parent().empty().append(_li.clone()).append(_li.clone()).append(_li.clone());
		_li = $("li", this);

		//滚动
		var _li_scroll = 0;
		function gotoo(){
			_li_scroll += o.width;
			if(_li_scroll > _li_size)
			{
				_li_scroll = 0;
				_li.parent().css(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll });
				_li_scroll += o.width;
			}
				_li.parent().animate(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll }, o.amount);
		}
		
		//开始
		var move = setInterval(function(){ gotoo(); }, o.speed);
		_li.parent().hover(function(){
			clearInterval(move);
		},function(){
			clearInterval(move);
			move = setInterval(function(){ gotoo(); }, o.speed);
		});
	});
};

/**
 * 异步加载省,可以传入一个参数 ，作为需要绑定市的dom元素的id， 或者在省选择器元素
 * 上加data-city-id=""属性，指定需要绑定的市的id,不建议使用id以外的选择器
 * 
 * @author 孙叙社
 * @date 2016年5月19日
 * @param o
 */
$.fn.initProvince = function(cityId){
	var _this        = $(this),
		_citySelct   = '', // 需要绑定的市的选择器
		_value		 = '',
		_defaultValue= '',
		_provinceUrl = '../area/getProvinceList.do', // 请求省的地址
		_cityUrl 	 = '../area/getCityByProvinceId.do';  // 市的地址
	
	if(!cityId)
		cityId       = $(this).data('city-id');
	
	// 异步请求省
	_ajax(_provinceUrl,'post',function(data){_callback(data,_this)},{});
	
	// 对市绑定change事件
	if(cityId){
		_citySelct   = $('#'+cityId);
		
		_defaultValue = $(_this).data('default-value');
		// 判断省是否有默认值
		if(_defaultValue){
			_ajax(_cityUrl,'post',function(data){_callback(data,_citySelct)},{id:_defaultValue});
		}
		
		_this.unbind('change.initProvince');
		_this.on('change.initProvince',function(){
			_value   = $(_this).val();
			if(_value)
				_ajax(_cityUrl,'post',function(data){_callback(data,_citySelct)},{id:_value});
			else _citySelct.html('<option value="">--请选择--</option>');
		})
	}
	
	// 回调函数
	function _callback(data,obj){
		if(!data) return;
		var _defultValue = $(obj).data('default-value'), // 默认要回显的值
			_slect		 = '',
			_html        = '';
		_html += '<option value="">--请选择--</option>';
		$.each(data,function(index,item){
			if(!!_defultValue && _defultValue == item.id)
			{
				_slect       = 'selected="selected"';
				_defultValue = undefined;
				$(obj).data('default-value','');
			}
			_html += '<option value="'+ item.id +'" '+ _slect +'>  '+item.name+'  </option>'; // 拼接html
			_slect = '';
		})
		$(obj).html(_html);
	}
	
	function _ajax(url,type,callback,data){
		if(!type) type = 'post';
		$.ajax({
			url		: url,
			data	: data,
			type	: type,
			dataType: 'json',
			timeout	: 10000,
			success	: callback,
			error	: function(data){
				alert('异步请求失败，请检查您的网络！');
			},
			complete: function(xhl,status){
				if(status=='timeout') alert('请求超时，请检查您的网络！');
			}
		})
	}
	
	return this;
}
