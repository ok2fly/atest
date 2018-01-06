/**
 *@param widthTmp 限制最小宽度值
 *@param heightTmp 限制的最小高度值
 *@param size 限制的最大范围，单位为K 如果值为0，表示无大小限制
 *@param callback 回调函数
 */
function uploadPhoto(obj,widthTmp,heightTmp,size,callbackFn){
	if(!size){
		size = 0;
	}
	var fid = $(obj).attr("id");
	var uploadPic = $("#"+fid).val();
		//.textbox("getValue");
    if (uploadPic == "") {
    	alert("请选择图像!")
        return;
    }
    var fileType = checkImage(uploadPic);
    
   	var imgObj = new Object();
   	imgObj.width = widthTmp;
	imgObj.height = heightTmp;
	imgObj.size = size;
	imgObj.fileType = fileType;
    if (fileType) {
        $.ajaxFileUpload({
            url : baseUrl+'/common/uploadPhoto.w',
            secureuri : false,
            fileElementId : fid,//文件选择框的id属性
            data:imgObj,//划定的图片大小
            dataType : 'json',//服务器返回的格式，可能是text
            success: function (data) {
                //data = eval('(' + data + ')');
                if (data.code != 0) {
            		var reS = '上传图片失败！请检查您上传的图片大小，宽度不能小于'+widthTmp+',高度不能小于'+heightTmp;
            		if(size!=0){
            			if(size>1000){
            				var sizeM = size/1000;
            				reS +=',同时最大不允许超过'+sizeM+"M"
            			}else{
            				reS +=',同时最大不允许超过'+size+"k"
            			}
            		}
                    alert(reS);
                }else{
                	callbackFn(""+data.result+"",fid);
                }
            },
            /*不知为何不行
             * success : function (data, status){
            	if (data.code != 0) {
            		var reS = '上传图片失败！请检查您上传的图片大小，宽度不能小于'+widthTmp+',高度不能小于'+heightTmp;
            		if(size!=0){
            			reS +=',同时最大不允许超过'+size+"k"
            		}
                    alert(reS);
                }else{
                	callback(data.result,fid);
                }
            },*/
            error:function (req, status, e){
            	console.log(req);
                //alert('上传图像失败！');
            }
        });
    } else {
    	//alert('文件只支持GIF，BMP，JPG,PNG');
        alert('文件只支持JPG,PNG');
    }
}
//判断文件类型 -- 只支持GIF，BMP，JPG,PNG
function checkImage(fileName) {
    if (fileName.lastIndexOf(".") != -1) {
        fileType = (fileName.substring(fileName.lastIndexOf(".") + 1,
            fileName.length)).toLowerCase();
        var suppotFile = new Array();
       /* suppotFile[0] = "gif";
        suppotFile[1] = "bmp";
        suppotFile[2] = "jpg";*/
       suppotFile[0] = "jpg";
       suppotFile[1] = "png"; 
        for (var i = 0; i < suppotFile.length; i++) {
            if (suppotFile[i] == fileType) {
                return fileType;
            } else {
                continue;
            }
        }
    }
    return false;
}