package com.craft.controller;


import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import com.craft.base.BaseController;
import com.craft.common.result.JsonResponse;
import com.craft.pojo.Judge;
import com.craft.pojo.Opus;
import com.craft.pojo.User;
import com.craft.service.IJudgeService;
import com.craft.service.IOpusService;
import com.craft.service.IUserService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.http.HttpResponse;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.List;


@Controller
@RequestMapping("admin")
public class AdminController extends BaseController {

    @Autowired
    private IJudgeService judgeService;


    @Autowired
    private IOpusService opusService;

    @Autowired
    private IUserService userService;

    @ApiOperation(value = "添加评委", httpMethod = "post")
    @RequestMapping(value = "addJudge", method = RequestMethod.POST)
    @ResponseBody
    public Object insertMatchJudge(@ApiParam(name = "judge", value = "评委信息", required = true) Judge judge,
                                   @ApiParam(value = "评委图片") @RequestParam("files") MultipartFile file) {

        return judgeService.insertSelective(judge, file);

    }

    @ApiOperation(value = "修改评委信息", httpMethod = "get")
    @RequestMapping(value = "updateJudge", method = RequestMethod.GET)
    @ResponseBody
    public Object updateMatchJudge(@ApiParam(name = "judge", value = "评委信息", required = true) Judge judge,
                                   @ApiParam(value = "评委图片") @RequestParam("files") MultipartFile file) {
        return judgeService.updateSelective(judge, file);
    }

    @ApiOperation(value = "删除评委信息", httpMethod = "get")
    @RequestMapping(value = "deleteJudge", method = RequestMethod.GET)
    @ResponseBody
    public Object deleteJudge(@ApiParam(name = "judgeId", value = "评委 id ", required = true) String judgeId) {
        int count = judgeService.delete(judgeId);
        if (count > 0) {
            return JsonResponse.createBySuccessMessage("删除成功");
        } else {
            return JsonResponse.createByErrorMessage("删除失败");
        }

    }


    @ApiOperation(value = "修改投票数", httpMethod = "get")
    @RequestMapping(value = "updateOpusHot", method = RequestMethod.GET)
    @ResponseBody
    public Object updateOunt(@ApiParam(name = "opusId", value = "作品 id ", required = true) Integer opusId,
                             Integer count) {
        int cout = opusService.upOpusHot(opusId, count);
        if (count > 0) {
            return JsonResponse.createBySuccessMessage("修改成功");
        } else {
            return JsonResponse.createByErrorMessage("修改失败");
        }
    }

    @ApiOperation("修改作品")
    @RequestMapping(value = "opus", method = RequestMethod.GET)
    @ResponseBody
    public Object uploadOpus(
            Opus opus,
            HttpServletRequest request,
            @ApiParam(value = "图片列表") @RequestParam("files") MultipartFile[] files) {

        return opusService.updateOpus(opus, files);

    }


    @ApiOperation("导出用户信息")
    @RequestMapping(value = "exportUsersInfo", method = RequestMethod.GET)
    @ResponseBody
    public Object exportUsersInfo(HttpServletResponse response) {


        List<User> list = userService.selectAllUser();

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("用户信息","用户"),
                User.class, list);


        OutputStream os = null;
        try {


            //下载显示的文件名，解决中文名称乱码问题
            String name = "用户信息.xls";
            String downloadFielName = new String(name.getBytes("UTF-8"), "iso-8859-1");

            // 设置强制下载不打开
            response.setContentType("application/force-download");
            response.setHeader("Content-Disposition", "attachment;fileName=" + downloadFielName);
            response.setContentType("application/octet-stream");


            if (workbook != null ){
                os  = response.getOutputStream();
                workbook.write(os);
                workbook.close();

                return JsonResponse.createBySuccess();
            }

            return JsonResponse.createByError();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return JsonResponse.createByError();

    }


}
