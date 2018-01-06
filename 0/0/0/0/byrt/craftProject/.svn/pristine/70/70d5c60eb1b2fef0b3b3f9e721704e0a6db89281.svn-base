package com.craft.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.craft.base.BaseController;
import com.craft.common.Const;
import com.craft.common.result.JsonResponse;
import com.craft.pojo.Opus;
import com.craft.pojo.User;
import com.craft.service.IOpusService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/upload")
public class UploadController extends BaseController {

	@Autowired
	IOpusService iOpusService;

	@Value("${img.upload.path}")
	String imgPath;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true)); // true:允许输入空值，false:不能为空值
	}

	@ApiOperation("上传作品")
	@RequestMapping(value = "opus", method = RequestMethod.POST)
	@ResponseBody
	public Object uploadOpus(
			HttpSession session,
			Opus opus,
			HttpServletRequest request,
			@ApiParam(value = "图片列表") @RequestParam("files") MultipartFile[] files) {
		User user = getCurrentUser(session);
		if (user == null) {
			return JsonResponse.createByErrorMessage("请登录");
		}

		boolean hasFile = false;
		for (MultipartFile file : files) {
			if (file != null && !file.isEmpty()) {
				hasFile = true;
				break;
			}
		}
		if (!hasFile) {
			return JsonResponse.createByErrorMessage("没有选择上传的文件");
		}

		opus.setUserId(user.getId());

		return iOpusService.uploadOpus(opus, files);

	}

}
