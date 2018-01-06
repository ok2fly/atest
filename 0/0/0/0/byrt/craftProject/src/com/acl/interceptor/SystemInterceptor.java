package com.acl.interceptor;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
* @ClassName: SystemInterceptor
* @Description: 拦截器
* @author malx
*
 */									
public class SystemInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LogManager.getLogger(SystemInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		String urlString = request.getRequestURL().toString();
		logger.debug("当前的URL为: " + urlString);
		logger.info("当前的URL为: " + urlString);
		System.out.println("当前的URL为: " + urlString);
        HttpSession session = request.getSession(false);
		if(session!=null){
//			if(session.getAttribute(Constants.SESSION_USERNAME)!=null){
//				return true;
//			}else{
//				//request.getRequestDispatcher("/login").forward(request, response);
//				return true;
//			}
			return true;
		}else{
			//request.getRequestDispatcher("/login").forward(request, response);
			return true;
		}
	}

}
