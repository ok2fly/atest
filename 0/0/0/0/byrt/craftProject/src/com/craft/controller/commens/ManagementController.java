package com.craft.controller.commens;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.craft.common.Const;
import com.craft.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/management")
public class ManagementController {
	
	@RequestMapping("/login")
	public String login(HttpSession session,HttpServletRequest req) {
		 
		return "management/login";
	}
	


	@RequestMapping("/top")
	public String top(HttpSession session,HttpServletRequest req) {
		User user = (User) session .getAttribute(Const.CURRENT_USER);
        session.setAttribute("user", user);
		return "management/top";
	}

	@RequestMapping("/main")
	public String main(HttpSession session,HttpServletRequest req) {
		//定义跳转路径
		String returnStr = "management/main";
		
		return returnStr;
	}

	
	@RequestMapping("/{url}/menu")
	public String menu(@PathVariable String url, HttpSession session,HttpServletRequest req) {
		
		List list=new ArrayList();
		
		if (url .equals("xtpz")) {
			list = getMenu("xtpz");
		} else if (url .equals("zpgl")) {
			list = getMenu("zpgl");
		}  
		 
		req.setAttribute("list", list);
		return  "management/menu";
		 
	}

	private List getMenu( String type_url) {
		List list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(type_url.equals("zpgl")){
			map.put("module_url", "management/zplb.htm");
			map.put("module_name", "作品列表");
			list.add(map);
		}else if(type_url.equals("xtpz")){
			map.put("module_url", "management/zhgl.htm");
			map.put("module_name", "用户管理");
			list.add(map);
		}
		return list;
	}
	
	//作品管理
	@RequestMapping("/zpgl")
	public String downzpgl(HttpSession session,HttpServletRequest req) {
		//定义返回的list
		List list=new ArrayList();
		List menuList =  (List) session .getAttribute("menu");
		list = getMenu("zpgl");
		req.setAttribute("menu", list);
		return "management/zpgl/main";
	}
	
	@RequestMapping("/zplb")
	public String downzpglzpgl() {
		return "management/zpgl/zpgl";
	}
	
	@RequestMapping("/zpxq")
	public String  downzpxq(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "management/zpgl/zpxq";
	}
	
	//系统管理
	@RequestMapping("/xtpz")
	public String downxt(HttpSession session,HttpServletRequest req) {
		//定义返回的list
		List list=new ArrayList();
		List menuList =  (List) session .getAttribute("menu");
		list = getMenu("xtpz");
		req.setAttribute("menu", list);
		return "management/xtpz/main";
	}
	
	@RequestMapping("/zhgl")
	public String downjs() {
		return "management/xtpz/zhgl";
	}
	
	@RequestMapping("/zhxg")
	public String jsxg(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "management/xtpz/zhxg";
	}
	
	@RequestMapping("/zhxz")
	public String jsxz(HttpSession session,HttpServletRequest req) {
		return "management/xtpz/zhxz";
	}
	
	
}
