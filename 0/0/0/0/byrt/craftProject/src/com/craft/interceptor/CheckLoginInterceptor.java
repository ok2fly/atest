/**
 * @Title: CheckLoginInterceptor.java
 * @Package com.xjtraffic.interceptor
 * @Description: TODO(用一句话描述该文件做什么)
 * @author dingkunjie
 * @date 2016年1月27日 上午10:21:16
 * @version V1.0
 */
package com.craft.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.craft.common.Const;
import com.craft.common.result.ResponseCode;
import com.craft.pojo.User;
import com.craft.util.EhcacheUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * @Title: CheckLoginInterceptor.java
 * @Package com.xjtraffic.interceptor
 * @Description: 检查是否登录拦截器
 * @author dingkunjie
 * @date 2016年1月27日 上午10:21:16
 * @version V1.0
 */
public class CheckLoginInterceptor implements HandlerInterceptor {

    //日志
    private Logger logger = LogManager.getLogger(this.getClass().getName());

    @Autowired
    private EhcacheUtil ehcacheUtil;

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception exception)
            throws Exception {

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav) throws Exception {

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Const.CURRENT_USER);

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/commens/login");
            return false;
        }

        return true;
    }

}
