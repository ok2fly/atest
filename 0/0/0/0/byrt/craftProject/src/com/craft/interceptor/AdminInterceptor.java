/**
 * @Title: CheckLoginInterceptor.java
 * @Package com.xjtraffic.interceptor
 * @Description: TODO(用一句话描述该文件做什么)
 * @author dingkunjie
 * @date 2016年1月27日 上午10:21:16
 * @version V1.0
 */
package com.craft.interceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.craft.common.Const;
import com.craft.common.result.JsonResponse;
import com.craft.pojo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * 检查是否具有管理员权限
 */
public class AdminInterceptor implements HandlerInterceptor {

    private Logger logger = LoggerFactory.getLogger(this.getClass());


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
        }else {
            if (user.getUseTyp() != 1){
                JsonResponse<Object> result = JsonResponse.createByErrorMessage("您没有权限");
                PrintWriter writer = response.getWriter();
                writer.write(JSON.toJSONString(request));
                writer.flush();
                writer.close();

                return false;
            }
        }

        return true;
    }

}
