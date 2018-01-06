package com.craft.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.craft.base.BaseController;
import com.craft.base.Pager;
import com.craft.common.result.JsonResponse;
import com.craft.pojo.Judge;
import com.craft.pojo.User;
import com.craft.common.Const;
import com.craft.service.IJudgeService;
import com.craft.service.IOpusService;
import com.craft.service.sendsms.SendSMSService;
import com.craft.util.IpUtil;
import com.craft.util.MD5Util;
import com.craft.util.StringUtil;
import com.sun.org.apache.bcel.internal.generic.NEW;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @author -.-- .- -. --.    --.. ..   .- -.
 */
@Controller
@RequestMapping("/Opus/")
public class OpusController extends BaseController {


    @Autowired
    private IOpusService iOpusService;

    @Autowired
    private SendSMSService sendSMSService;


    /**
     * 作品展示 查询
     *
     * @return
     */
    @RequestMapping(value = "selOpus")
    @ResponseBody
    public Object selOpus(HttpServletRequest request, HttpServletResponse response) {

        Pager page = new Pager();

        String currentPage = request.getParameter("currentPage");

        if (currentPage != null && !currentPage.isEmpty()) {

            page.setCurrentPage(Integer.parseInt(currentPage));

        }


        String staAge = null;

        String endAge = null;

        String id = request.getParameter("id");

        String age = request.getParameter("age");

        if (StringUtil.isNotBlank(age)) {

            String[] aStrings = age.split("-");

            staAge = aStrings[0];

            endAge = aStrings[1];
        }

        String creativeTime = request.getParameter("creativeTime");

        String opusHot = request.getParameter("opusHot");

        String regId = request.getParameter("regId");

        String regFatId = request.getParameter("regFatId");

        Map<String, Object> inpOpusMap = new HashMap<String, Object>();

        inpOpusMap.put("currentPage", page.getCurrentPage());
        inpOpusMap.put("start", page.getStart());

        inpOpusMap.put("id", id);
        inpOpusMap.put("staAge", staAge);
        inpOpusMap.put("endAge", endAge);
        inpOpusMap.put("creativeTime", creativeTime);
        inpOpusMap.put("opusHot", opusHot);
        inpOpusMap.put("regId", regId);
        inpOpusMap.put("regFatId", regFatId);


        Map<String, Object> basOpuscount = iOpusService.selOpusByNewHotAgeCount(inpOpusMap);

        page.setTotalCount(Integer.parseInt(basOpuscount.get("count").toString()));

        inpOpusMap.put("evertPage", page.getEveryPage());

        JsonResponse<Map<String, Object>> opusLst = iOpusService.selOpus(inpOpusMap);

        Map<String, Object> temp = opusLst.getData();
        Map<String, Object> map2 = new HashMap<String, Object>();
        map2.put("opusLst", temp);
        map2.put("CurrentPage", page.getCurrentPage());
        map2.put("EveryPage", page.getEveryPage());
        map2.put("TotalCount", page.getTotalCount());
        map2.put("TotalPage", page.getTotalPage());

        return JsonResponse.createBySuccess(map2);
    }

    /**
     * @return 查看作品详情
     */
    @RequestMapping(value = "selOpusByOpusId")
    @ResponseBody
    public Object selOpusByOpusId(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");


        Map<String, Object> inpOpusMap = new HashMap<String, Object>();

        inpOpusMap.put("id", id);

        JsonResponse<Map<String, Object>> opusLst = iOpusService.selOpusByOpusId(inpOpusMap);

        return opusLst;
    }


    /**
     * 查看所有省
     *
     * @return
     */
    @RequestMapping(value = "selBasReg")
    @ResponseBody
    public Object selBasReg(HttpServletRequest request, HttpServletResponse response) {


        JsonResponse<Map<String, Object>> basRegLst = iOpusService.selBasReg();

        return basRegLst;
    }


    /**
     * id查询所有市
     *
     * @return
     */
    @RequestMapping(value = "selBasRegCity")
    @ResponseBody
    public Object selBasRegCity(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        Map<String, Object> inMap = new HashMap<String, Object>();

        inMap.put("id", id);

        JsonResponse<Map<String, Object>> basRegCity = iOpusService.selBasRegCity(inMap);

        return basRegCity;
    }

    /**
     * id查询所有区
     *
     * @return
     */
    @RequestMapping(value = "selBasRegArea")
    @ResponseBody
    public Object selBasRegArea(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        Map<String, Object> inMap = new HashMap<String, Object>();

        inMap.put("id", id);

        JsonResponse<Map<String, Object>> basRegArea = iOpusService.selBasRegArea(inMap);

        return basRegArea;
    }

    /**
     * 省、市，查询年龄
     *
     * @return
     */
    @RequestMapping(value = "selAgeByCityArea")
    @ResponseBody
    public Object selAgeByCityArea(HttpServletRequest request, HttpServletResponse response) {

        //省 id
        String regId = request.getParameter("regId");
        //市 id
        String regFatId = request.getParameter("regFatId");

        Map<String, Object> inMap = new HashMap<String, Object>();

        inMap.put("regId", regId);

        inMap.put("regFatId", regFatId);

        JsonResponse<Map<String, Object>> basAge = iOpusService.selAgeByCityArea(inMap);

        return basAge;
    }


    /**
     * 投票
     *
     * @return
     */
    @RequestMapping(value = "vote")
    @ResponseBody
    public Object vote(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("***********************************************");

        System.out.println("getIpAddr:" + IpUtil.getIpAddr(request));

		/* * System.out.println("getRemoteAddr:"+IpUtil.getRemoteAddr(request));
		 * System.out.println("getClientIpAddr:"+IpUtil.getClientIpAddr(request));
		 * System.out.println("getClientIpAddress:"+IpUtil.getClientIpAddress(request));
		 * 
		 */

        //获取ip
        String ip = IpUtil.getIpAddr(request);
        //获取作品id
        String opusId = request.getParameter("opusId");

        Map<String, Object> inMap = new HashMap<String, Object>();

        inMap.put("ip", ip);

        inMap.put("opusId", opusId);

        JsonResponse<Map<String, Object>> vote = iOpusService.vote(inMap);


        return vote;
    }


    /**
     * 热度
     *
     * @return
     */
    @RequestMapping(value = "opusHot")
    @ResponseBody
    public Object opusHot(HttpServletRequest request, HttpServletResponse response) {

        //获取作品id
        String opusId = request.getParameter("opusId");

        Map<String, Object> inMap = new HashMap<String, Object>();

        inMap.put("opusId", opusId);

        JsonResponse<Map<String, Object>> vote = iOpusService.opusHot(inMap);


        return vote;
    }


    /**
     * 用户id查询详情以及作品信息
     *
     * @return
     */
    @RequestMapping(value = "selOpusByUserId")
    @ResponseBody
    public Object selOpusByUserId(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        User user = getCurrentUser(session);
        if (user == null) {
            return JsonResponse.createByErrorMessage("请登录");
        }

        // 获取作品id
        String id = user.getId().toString();

        Map<String, Object> inMap = new HashMap<String, Object>();

        inMap.put("id", id);

        JsonResponse<Map<String, Object>> vote = iOpusService.selOpusByUserId(inMap);


        return vote;
    }


    /**
     *
     *
     * @return
     *//*
	@RequestMapping(value = "regist")
	@ResponseBody
	public Object regist(HttpServletRequest request,HttpServletResponse response) {

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		

		Map<String, Object> inMap = new HashMap<String, Object>();

		inMap.put("name", name);
		inMap.put("password", password);
		inMap.put("email", email);
		inMap.put("stat", 0);//0未激活 1激活
		inMap.put("code", UUIDUtils.getUUID()+UUIDUtils.getUUID());

		JsonResponse<Map<String, Object>> vote = iOpusService.regist(inMap);

		
		
		if (vote.isSuccess()) {

			request.setAttribute(Const.CURRENT_USER, vote.getData());
		}

		return vote;
	}
	*/


    //***************************************************手机号码 注册*******start*********************************

    /**
     * 注册 获取手机验证码
     *
     * @return
     * @throws UnsupportedEncodingException
     * @throws Exception
     */
    @RequestMapping(value = "code")
    @ResponseBody
    public Object code(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        String mob = request.getParameter("mob");

        if (mob == null && mob.isEmpty()) {

            return JsonResponse.createByErrorMessage("请输入手机号");
        }

        System.out.println(mob);

        int x_param = sendSMSService.sendSms(mob, 1, null);

        System.out.println(x_param);

        return x_param;

    }


    /**
     * 手机注册
     *
     * @return
     * @throws UnsupportedEncodingException
     * @throws Exception
     */
    @RequestMapping(value = "registMob")
    @ResponseBody
    public JsonResponse<Object> registMob(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        String name = request.getParameter("name");

        String password = request.getParameter("password");

        String mob = request.getParameter("mob");

        String code = request.getParameter("code");

        String x_param = request.getParameter("x_param");

        if (code != x_param) {

            return JsonResponse.createByErrorMessage("失败");

        } else {

            Map<String, Object> userMap = new HashMap<String, Object>();

            userMap.put("name", name);

            userMap.put("password", password);

            userMap.put("mob", mob);

            iOpusService.addUser(userMap);

            return JsonResponse.createBySuccessMessage("成功");

        }


    }

    //***************************************************手机号码 注册********end********************************


    /**
     * 手机端 查看作品
     *
     * @return
     */
    @RequestMapping(value = "selOpusByLike")
    @ResponseBody
    public Object selOpusByLike(HttpServletRequest request, HttpServletResponse response) {


        String parent_id = request.getParameter("parent_id");

        String search = request.getParameter("search");

        Map<String, Object> opusMap = new HashMap<String, Object>();

        opusMap.put("parent_id", parent_id);

        opusMap.put("search", search);

        JsonResponse<Map<String, Object>> basOpus = iOpusService.selOpusByLike(opusMap);

        return basOpus;
    }

    /**
     * 查看所有作品
     *
     * @return
     */
    @RequestMapping(value = "selAllOpus")
    @ResponseBody
    public Object selAllOpus(HttpServletRequest request, HttpServletResponse response) {

        Pager page = new Pager();

        String currentPage = request.getParameter("currentPage");

        if (currentPage != null && !currentPage.isEmpty()) {

            page.setCurrentPage(Integer.parseInt(currentPage));

        }

        //作者名称
        String userName = request.getParameter("userName");
        //作品名称
        String opusName = request.getParameter("opusName");
        //作品状态
        String state = request.getParameter("state");
        //作品组别
        String groupId = request.getParameter("groupId");
        //作品创建时间
        String sta_time = request.getParameter("sta_tim");
        String end_time = request.getParameter("end_tim");

        Map<String, Object> Map = new HashMap<String, Object>();

        Map.put("currentPage", page.getCurrentPage());
        Map.put("start", page.getStart());

        Map.put("userName", userName);
        Map.put("opusName", opusName);
        Map.put("state", state);
        Map.put("groupId", groupId);
        Map.put("sta_time", sta_time);
        Map.put("end_time", end_time);


        Map<String, Object> basOpuscount = iOpusService.selAllOpusCount(Map);


        page.setTotalCount(Integer.parseInt(basOpuscount.get("count").toString()));

        Map.put("evertPage", page.getEveryPage());

        JsonResponse<Map<String, Object>> basOpus = iOpusService.selAllOpus(Map);

        Map<String, Object> temp = basOpus.getData();
        Map<String, Object> map2 = new HashMap<String, Object>();
        map2.put("basOpus", temp);
        map2.put("CurrentPage", page.getCurrentPage());
        map2.put("EveryPage", page.getEveryPage());
        map2.put("TotalCount", page.getTotalCount());
        map2.put("TotalPage", page.getTotalPage());
    	
        return JsonResponse.createBySuccess(map2);
    }

    /**
     * 后台 作品审核
     *
     * @return
     */
    @RequestMapping(value = "updOpusState")
    @ResponseBody
    public Object updOpusState(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");


        //state 2 审核通过   3 审核不通过
        String state = request.getParameter("state");

        Map<String, Object> Map = new HashMap<String, Object>();

        Map.put("id", id);

        Map.put("state", state);

        JsonResponse<List<Map<String, Object>>> basOpus = iOpusService.updOpusState(Map);

        return basOpus;
    }


//********************use_use 表的操作***Do not ask me, I do not know what it means to do so, the manager told me to write this.***************************************************************************************    

    /**
     * @return 添加
     */
    @RequestMapping(value = "insertUse")
    @ResponseBody
    public Object insertUse(HttpServletRequest request, HttpServletResponse response) {
        //账号
        String acc_num = request.getParameter("acc_num");
        //用户邮箱
        String use_mal = request.getParameter("use_mal");
        //用户姓名
        String use_nam = request.getParameter("use_nam");
        //用户性别(1为男，2为女，0为默认值，不予以显示)
        String use_sex = request.getParameter("use_sex");
        //用户手机号码
        String use_mob = request.getParameter("use_mob");
        //用户身份证号码
        String use_idc = request.getParameter("use_idc");
        //用户通讯地址
        String use_add = request.getParameter("use_add");
        //用户专业
        String use_maj = request.getParameter("use_maj");
        //籍贯
        String pla_ori = request.getParameter("pla_ori");
        //密码
        String use_pas = request.getParameter("use_pas");
        String password = MD5Util.MD5EncodeUtf8(use_pas);
        //备注
        String remark = request.getParameter("remark");

        Map<String, Object> Map = new HashMap<String, Object>();

        Map.put("acc_num", acc_num);
        Map.put("use_mal", use_mal);
        Map.put("use_nam", use_nam);
        Map.put("use_sex", use_sex);
        Map.put("use_mob", use_mob);
        Map.put("use_idc", use_idc);
        Map.put("use_add", use_add);
        Map.put("use_maj", use_maj);
        Map.put("pla_ori", pla_ori);
        Map.put("use_pas", password);
        Map.put("remark", remark);
        Map.put("crt_tim", new Date());//创建时间

        JsonResponse<List<Map<String, Object>>> basOpus = iOpusService.insertUse(Map);

        return basOpus;
    }


    /**
     * @return 回显
     */
    @RequestMapping(value = "selectUserById")
    @ResponseBody
    public Object selectUserById(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        Map<String, Object> Map = new HashMap<String, Object>();

        Map.put("id", id);

        JsonResponse<List<Map<String, Object>>> basOpus = iOpusService.selectUserById(Map);
        return basOpus;
    }


    /**
     * @return 修改
     */
    @RequestMapping(value = "updateUser")
    @ResponseBody
    public Object updateUser(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String acc_num = request.getParameter("acc_num");
        String use_mal = request.getParameter("use_mal");
        String use_nam = request.getParameter("use_nam");
        String use_sex = request.getParameter("use_sex");
        String use_mob = request.getParameter("use_mob");
        String use_idc = request.getParameter("use_idc");
        String use_add = request.getParameter("use_add");
        String use_maj = request.getParameter("use_maj");
        String pla_ori = request.getParameter("pla_ori");
    	/*String use_pas = request.getParameter("use_pas");
    	String  password = MD5Util.MD5EncodeUtf8(use_pas);*/
        String remark = request.getParameter("remark");

        Map<String, Object> Map = new HashMap<String, Object>();
        Map.put("id", id);
        Map.put("acc_num", acc_num);
        Map.put("use_mal", use_mal);
        Map.put("use_nam", use_nam);
        Map.put("use_sex", use_sex);
        Map.put("use_mob", use_mob);
        Map.put("use_idc", use_idc);
        Map.put("use_add", use_add);
        Map.put("use_maj", use_maj);
        Map.put("pla_ori", pla_ori);
        //Map.put("use_pas",password);
        Map.put("remark", remark);
        Map.put("mod_tim", new Date());

        JsonResponse<List<Map<String, Object>>> basOpus = iOpusService.updateUser(Map);

        return basOpus;
    }

    /**
     * @return 删除
     */
    @RequestMapping(value = "delUser")
    @ResponseBody
    public Object delUser(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        Map<String, Object> Map = new HashMap<String, Object>();

        Map.put("id", id);

        JsonResponse<List<Map<String, Object>>> basOpus = iOpusService.delUser(Map);

        return basOpus;
    }

    /**
     * @return 查询
     * 模糊 userName 姓名    userMob 手机号
     */
    @RequestMapping(value = "selAllUserByNameAndMob")
    @ResponseBody
    public Object selAllUserByNameAndMob(HttpServletRequest request, HttpServletResponse response) {

        String userName = request.getParameter("userName");
        String userMob = request.getParameter("userMob");

        Map<String, Object> Map = new HashMap<String, Object>();

        Map.put("userName", userName);
        Map.put("userMob", userMob);

        JsonResponse<List<Map<String, Object>>> basOpus = iOpusService.selAllUserByNameAndMob(Map);

        return basOpus;
    }


    //**************************************************************************************************************


}
