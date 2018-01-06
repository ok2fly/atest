/**
 * Created by 9haohealth on 2014/7/9.
 */

/**
 *  日期格式化
 *  Modify by dukai
 */
Date.prototype.Format = function(formatStr)
{
    var str = formatStr;
    var Week = ['日','一','二','三','四','五','六'];

    str=str.replace(/yyyy|YYYY/,this.getFullYear());
    str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));

    str=str.replace(/MM/,this.getMonth()>=9?this.getMonth()+1:'0' + (this.getMonth()+1));
    str=str.replace(/M/g,this.getMonth());

    str=str.replace(/w|W/g,Week[this.getDay()]);

    str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());
    str=str.replace(/d|D/g,this.getDate());

    str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());
    str=str.replace(/h|H/g,this.getHours());
    str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());
    str=str.replace(/m/g,this.getMinutes());

    str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());
    str=str.replace(/s|S/g,this.getSeconds());

    return str;
}

/* 字符操作相关 */

/**
 *  去除空格
 *  Modify by dukai
 */
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 *  是否以某字符结尾
 *  Modufy by dukai
 */
String.prototype.endWith=function(s){
    if(s==null||s==""||this.length==0||s.length>this.length)
        return false;
    if(this.substring(this.length-s.length)==s)
        return true;
    else
        return false;
    return true;
}

/**
 * 是否包含某字符
 * Modify by dukai
 */
String.prototype.contains=function(s){
    if(s==null||s==""||this.length==0||s.length>this.length)
        return false;
    if(this.indexOf(s) >= 0)
        return true;
    else
        return false;
    return true;
}

/**
 * 检查输入字符串是否为空或者全部都是空格
 * @param obj
 * @returns {boolean}
 * Modify by dukai
 */
function isNullOrBlank(obj){
    if(obj==null || obj==''){
        return true;
    }
    return false;
}

/**
 * 检查输入字符串空转为空格 方便展示
 * @param obj
 * @returns {boolean}
 * Modify by dukai
 */
function nullToBlank(str){
    return str==null?'':str;
}

/**
 * AJAX工具中间件
 * @param dataType  数据类型
 * @param methodType POST or GET
 * @param url   请求地址
 * @param params    参数
 * @param onComplete    成功回调
 * @param onError   错误回调
 * @param isalert   是否弹出全屏遮罩层
 * @param errorTipsCtrl 错误信息提示层
 * @param loadingCtrl   加载层
 * @constructor
 *  Modify by dukai
 */
function AjaxEx(dataType,methodType, url, params, onComplete, onError, isalert, errorTipsCtrl ,loadingCtrl) {
    if (isalert) {
        // TODO 弹出遮罩
    }
    AjaxMethod(dataType,methodType, url, params, onComplete, onError,isalert, errorTipsCtrl,loadingCtrl);
}

/**
 *
 * AJAX实现封装
 * @param dataType  数据类型
 * @param url   请求地址
 * @param params    参数
 * @param onComplete    成功回调
 * @param onError   错误回调
 * @param isalert   是否弹出全屏遮罩层
 * @param errorTipsCtrl 错误信息提示层
 * @param loadingCtrl   加载层
 * @constructor
 *  Modify by dukai
 */
function AjaxMethod(dataType,methodType, url, params, onComplete, onError,isalert, errorTipsCtrl,loadingCtrl){
    if(loadingCtrl != undefined){
        //TODO 加载层操作
    }
    if(errorTipsCtrl != undefined){
        //TODO 错误提示层操作
    }

    $
        .ajax({
            type : methodType,
            dataType : dataType,
            url : url,
            data : params,
            success : function(data, status, xhr) {
                if (isalert) {
                    try{
                        //TODO 全局遮罩层控制
                    }catch(e){}}
                switch (xhr.status) {
                    case 200:
                        if(loadingCtrl != undefined){
                            //TODO 加载层操作
                        }
                        if (onComplete == null || onComplete == undefined) {
                            // 状态为200且没有给出适用函数
                        } else {
                            if (dataType != "JSON" && dataType != 'json') {
                                // 返回数据不为json直接调用适用函数
                                onComplete(data, status, xhr);
                            } else {
                                if (data != null) {
                                    if (data.state != null && data.state==0) {
                                        // 返回为json且返回successed为true调用适用函数
                                        onComplete(data, status, xhr);
                                    } else {
                                        // 返回为json且返回successed为false调用onError函数
                                        if (onError == null
                                            || onError == undefined) {
                                            // 无错误函数
                                        } else {
                                            onError(data, status, xhr);
                                        }
                                    }
                                } else {
                                }
                            }
                        }
                        break;
                    default:
                        //不可预知的错误发生,请稍后再试
                }
            },
            complete : function(xhr, textStatus) {
                if (isalert) {
                    try{
                        //TODO 全局遮罩层控制
                    }catch(e){}}
                if (xhr.status == 200) {
                    return;
                }
                switch (xhr.status) {
                    case 400:
                        break;
                    case 401:
                        break;
                    case 403:
                        break;
                    case 404:
                        break;
                    case 500:
                        break;
                    case 503:
                        break;
                    case 0:
                        break;
                    default:
                        console.log("错误状态："+xhr.status);
                }
            }
        })
}
/*
 * 用途：检查输入对象的值是否符合E-Mail格式 输入：str 输入的字符串 返回：如果通过验证返回true,否则返回false
 * @author jianghe
 */
function isEmail(str) {
	var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
	if (myReg.test(str))
		return true;
	return false;
}
/*
 * 用途：检查输入字符串是否只由英文字母和数字组成 输入： s：字符串 返回： 如果通过验证返回true,否则返回false
 * @author jianghe 
 */
function isNumberOrLetter(s) {// 判断是否是数字或字母
	var regu = "^[0-9a-zA-Z]+$";
	var re = new RegExp(regu);
	if (re.test(s)) {
		return true;
	} else {
		return false;
	}
}
/*
 * 用途：检查输入对象的值是否符合整数格式 输入：str 输入的字符串 返回：如果通过验证返回true,否则返回false
 * @author jianghe
 */
function isInteger(str) {
	var regu = /^[-]{0,1}[0-9]{1,}$/;
	return regu.test(str);
}
/**
 * 定义简单Map
 * @author jianghe
 */
function getMap() {//初始化map_,给map_对象增加方法，使map_像Map  
         var map_ = new Object();  
         map_.put = function(key, value) {  
             map_[key+'_'] = value;  
         };  
         map_.get = function(key) {  
             return map_[key+'_'];  
         };  
         map_.remove = function(key) {  
             delete map_[key+'_'];  
         };  
         map_.keyset = function() {  
             var ret = "";  
             for(var p in map_) {  
                 if(typeof p == 'string' && p.substring(p.length-1) == "_") {  
                     ret += ",";  
                     ret += p.substring(0,p.length-1);  
                 }  
             }  
             if(ret == "") {  
                 return ret.split(",");  
             } else {  
                 return ret.substring(1).split(",");  
             }  
         };  
         return map_;  
}