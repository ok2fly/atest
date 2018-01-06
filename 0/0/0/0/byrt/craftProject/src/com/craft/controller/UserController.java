package com.craft.controller;

import com.craft.base.BaseController;
import com.craft.common.Const;
import com.craft.common.result.JsonResponse;
import com.craft.pojo.User;
import com.craft.pojo.UserCompetitionInfo;
import com.craft.service.IEmailService;
import com.craft.service.IOpusService;
import com.craft.service.IUserService;
import com.craft.service.sendsms.SendSMSService;
import com.craft.util.CaptchaUtils;
import com.craft.util.MD5Util;
import com.craft.util.StringUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@Api(value = "用户", description = "用户")
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private IUserService iUserService;
    @Autowired
    private IEmailService emailService;

    @Value("${url.path}")
    String urlPath;

    @Autowired
    private SendSMSService sendSMSService;

    @Autowired
    private IOpusService iOpusService;

    @ApiOperation(value = "用户登录", httpMethod = "post")
    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public Object login(
            @ApiParam(name = "username", value = "手机号或邮箱", required = true) @RequestParam(required = true) String username,
            @ApiParam(name = "password", value = "密码", required = true) @RequestParam(required = true) String password,
            HttpSession session) {
        if (StringUtil.isBlank(username) || StringUtil.isBlank(password)) {
            return JsonResponse.createByErrorMessage("参数错误");
        }

        JsonResponse<User> response = iUserService.login(username, password);
        if (response.isSuccess()) {
            session.setAttribute(Const.CURRENT_USER, response.getData());
            logger.info("用户登录成功，{}", response.getData());
            return response;
        }
        return response;
    }

    @ApiOperation(value = "获取用户信息")
    @RequestMapping(value = "getUserInfo", method = RequestMethod.GET)
    @ResponseBody
    public Object getUserInfo(HttpSession session) {

        User user = getCurrentUser(session);
        if (user != null) {
            User userInfo = iUserService.getUserInfo(user.getId());
            session.setAttribute(Const.CURRENT_USER, userInfo);
            return JsonResponse.createBySuccess(userInfo);
        }

        return JsonResponse.createBySuccess(user);
    }

    @ApiOperation(value = "填写参赛信息登记")
    @RequestMapping(value = "/fillInfo", method = RequestMethod.GET)
    @ResponseBody
    public Object fillInfo(HttpSession session, UserCompetitionInfo info) {
        User currentUser = (User) session.getAttribute(Const.CURRENT_USER);
        if (currentUser == null) {
            return JsonResponse.createByErrorMessage("用户未登录");
        }
        info.setUseId(currentUser.getId());
        JsonResponse<UserCompetitionInfo> response = iUserService.fillInfo(info);

        return response;

    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<String> register(User user,
                                         @ApiParam(name = "type", value = "注册类型：0-邮箱，1-手机号", required = true) @RequestParam(defaultValue = "0") int type) {
        JsonResponse<String> register = iUserService.register(user, type);
        if (register.isSuccess()) {

            // 发送激活邮件
            String code = CaptchaUtils.generateCode();

            StringBuilder content = new StringBuilder();
            content.append("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！<br>");
            content.append("<a href=\" " + urlPath + "user/activeUser?email=");
            content.append(user.getUseMal());
            content.append("&code=");
            content.append(code);
            content.append("\"> " + urlPath + "/user/activeUser?email=");
            content.append(user.getUseMal());
            content.append("&code=");
            content.append(code);
            content.append("</a>");
            emailService.sendEmail(user.getUseMal(), content.toString(), "激活邮件");

        }

        return register;
    }

    @ApiOperation(value = "邮件激活用户")
    @RequestMapping(value = "activeUser", method = RequestMethod.GET)
    public String activeUser(String email, String code, HttpServletRequest req) {
        String msg = "";
        if (StringUtil.isBlank(email) || StringUtil.isBlank(code)) {
            msg = "参数错误";
        }

        JsonResponse<String> register = iUserService.active(email, code);
        if (register.isSuccess()) {
            return "login";
        }
        msg = "异常";
        req.setAttribute("msg", msg);
        return "error/reg";
    }

    @ApiOperation(value = "修改参赛信息")
    @RequestMapping(value = "/updateInfo", method = RequestMethod.GET)
    @ResponseBody
    public Object updateInfo(HttpSession session, UserCompetitionInfo info) {
        User currentUser = (User) session.getAttribute(Const.CURRENT_USER);
        if (currentUser == null) {
            return JsonResponse.createByErrorMessage("用户未登录");
        }
        info.setUseId(currentUser.getId());
        return iUserService.updateInfo(info);

    }
    
    /**
     * 退出系统
     *
     * @param session Session
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "退出登录")
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();

        return "index";
    }

    // ***************************************************手机号码
    // 注册*******start*********************************

    /**
     * 注册 获取手机验证码
     *
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "code")
    @ResponseBody
    public Object code(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        String mob = request.getParameter("mob");

        if (mob == null || mob.isEmpty()) {

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
    public JsonResponse<Object> registMob(HttpServletRequest request, HttpServletResponse response)
            throws UnsupportedEncodingException {

        String name = request.getParameter("name");

        String paw = request.getParameter("password");

        String password = MD5Util.MD5EncodeUtf8(paw);

        System.out.println(password);

        String mob = request.getParameter("mob");

        String code = request.getParameter("code");

        String x_param = request.getParameter("x_param");

        if (!code.equals(x_param)) {

            return JsonResponse.createByErrorMessage("验证码不正确，请重新输入");

        } else {

            Map<String, Object> userMap = new HashMap<String, Object>();

            userMap.put("name", mob);

            userMap.put("password", password);

            userMap.put("mob", mob);

            return iOpusService.addUser(userMap);

        }

    }

    // ***************************************************手机号码
    // 注册********end********************************

    /**
     * 登录入口（登录主方法）
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "userLogin", method = RequestMethod.POST)
    @ResponseBody
    public Object userLogin(HttpServletRequest request, HttpSession session) {

        Map<String, Object> returnMap = new HashMap<String, Object>();
        try {
            // 登录名
            String loginName = request.getParameter("loginName");
            // 密码
            String password = request.getParameter("password");
            // 新建一个用于存放用户信息的map集合
            Map<String, Object> userMap = new HashMap<String, Object>();

            Map<String, Object> map = new HashMap<String, Object>();

            map.put("loginName", loginName);

            if (!StringUtil.isEmpty(password)) {
                // 将输入进来的密码转成MD5加密的方式
                String md5NewPasswd = MD5Util.MD5EncodeUtf8(password);

                map.put("md5NewPasswd", md5NewPasswd);
                // 使用输入进来的登录名、转换完成的MD5密码，进入数据库中查询用户信息
                map = (Map<String, Object>) iUserService.userLogin(map);
                // 如返回的用户信息中，reason字段不为空
                if (map != null && map.get("reason") != null) {
                    // 取出reason字段为何值
                    // 如果获取的用户详情不为空
                    if (map.get("userMap") != null) {

                        userMap = (Map<String, Object>) map.get("userMap");


                        session.removeAttribute(Const.CURRENT_USER);
                        // 将获取到的用户信息传给前端页面，并放入session缓存中
                        User user = new User();
                        user.setId(Integer.valueOf(userMap.get("id").toString()));
                        user.setUseNam(userMap.get("use_nam").toString());

                        // 设定该登录后的页面session过期时间为2小时,以秒为单位
                        session.setMaxInactiveInterval(2 * 60 * 60);
                        session.setAttribute(Const.CURRENT_USER, user);

                        returnMap.put("status", 0);
                        returnMap.put("user", userMap);
                    } else {
                        returnMap.put("status", 1);
                        returnMap.put("user", map.get("reason"));
                    }
                } else {
                    returnMap.put("status", 1);
                    returnMap.put("msg", "错误");
                }

            }
        } catch (Exception e) {
            System.out.println("IntegratMonitorController getIntegratMonitorLeftSide--------->" + e.getMessage());
        }
        return returnMap;
    }
    /**
     * 退出登录
     * 
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "exitLogin")
    public String exitLogin(HttpServletRequest request, HttpSession session) {
        // 清除session中的用户信息
        request.getSession().removeAttribute(Const.CURRENT_USER);
        // 跳转至登录页面
        return "/management/login";
    }
}
