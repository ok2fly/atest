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
@RequestMapping("/commens")
public class CommensController {
	
	@RequestMapping("/login")
	public String login(HttpSession session,HttpServletRequest req) {
		 
		return "login";
	}
	
	@RequestMapping("/reg")
	public String reg(HttpSession session,HttpServletRequest req) {
		 
		return "reg";
	} 
	
	@RequestMapping("/index")
	public String index(HttpSession session,HttpServletRequest req) {
        User user = (User) session .getAttribute(Const.CURRENT_USER);
        session.setAttribute("user", user);
		return "index";
	} 

	 
	@RequestMapping("/rule")
	public String rule(HttpSession session,HttpServletRequest req) {
		 
		return "rule";
	}
	
	@RequestMapping("/worklist")
	public String worklist(HttpSession session,HttpServletRequest req) {
		 
		return "worklist";
	}
	@RequestMapping("/worklist-design")
	public String worklist_design(HttpSession session,HttpServletRequest req) {
		
		return "worklist-design";
	}
	
	@RequestMapping("/process")
	public String process(HttpSession session,HttpServletRequest req) {
		 
		return "process";
	}
	
	@RequestMapping("/entry")
	public String entry(HttpSession session,HttpServletRequest req) {
		
		return "entry";
	}
	
	
	@RequestMapping("/upload")
	public String upload(HttpSession session,HttpServletRequest req) {
		
		return "upload";
	}
	
	
	@RequestMapping("/myworks")
	public String myworks(HttpSession session,HttpServletRequest req) {
		
		return "myworks";
	}
	
	/**
	 * 
	 * @param id
	 * @param session
	 * @param req type 1 传统  2设计
	 * @return
	 */
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable String id,HttpSession session,HttpServletRequest req) {
		req.setAttribute("id", id);
		String type = req.getParameter("type");
		if("2".equals(type)){
			return "detail-design";
		}else{
			return "detail";
		}
	}
	
	/**
	 * 
	 * @param id
	 * @param session
	 * @param req  type 0 传统  1设计
	 * @return
	 */
	@RequestMapping("/mydetail/{id}")
	public String mydetail(@PathVariable String id,HttpSession session,HttpServletRequest req) {
		req.setAttribute("id", id);
		String type = req.getParameter("type");
		if("1".equals(type)){
			return "mydetail-design";
		}else{
			return "mydetail";
		}
	}
	 
	@RequestMapping("/index-mob")
	public String index_mob(HttpSession session,HttpServletRequest req) {
		 
		return "index-mob";
	} 
	
	
	@RequestMapping("/entry-mob")
	public String entry_mob(HttpSession session,HttpServletRequest req) {
		
		return "entry-mob";
	}
	
	@RequestMapping("/upload-mob")
	public String upload_mob(HttpSession session,HttpServletRequest req) {
		
		return "upload-mob";
	}
	
	@RequestMapping("/myworks-mob")
	public String myworks_mob(HttpSession session,HttpServletRequest req) {
		
		return "myworks-mob";
	}
	@RequestMapping("/workshow-mob")
	public String workshow_mob(HttpSession session,HttpServletRequest req) {
		
		return "workshow-mob";
	}
	/*传统工艺和创意设计的作品 - 搜索结果*/
	@RequestMapping("/search-mob")
	public String search_mob(HttpSession session,HttpServletRequest req) {
		String searchText = req.getParameter("searchText");
		req.setAttribute("searchText", searchText);
		return "search-mob";
	}
	
	/*所有分组的创意设计作品*/
	@RequestMapping("/worklist-design-mob")
	public String worklist_design_mob(HttpSession session,HttpServletRequest req) {
		String searchText = req.getParameter("searchText");
		req.setAttribute("searchText", searchText);
		return "worklist-design-mob";
	}
	/*所有分组的传统工艺作品*/
	@RequestMapping("/worklist-mob")
	public String worklist_mob(HttpSession session,HttpServletRequest req) {
		String searchText = req.getParameter("searchText");
		req.setAttribute("searchText", searchText);
		return "worklist-mob";
	}
	/*创意设计某一组的作品*/
	@RequestMapping("/worklist-design-mob-group")
	public String worklist_design_mob_group(HttpSession session,HttpServletRequest req) {
		String groupId = req.getParameter("groupId");
		req.setAttribute("groupId", groupId);
		return "worklist-design-mob-group";
	}
	
	/*传统工艺某一组的作品*/
	@RequestMapping("/worklist-mob-group")
	public String worklist_mob_group(HttpSession session,HttpServletRequest req) {
		String groupId = req.getParameter("groupId");
		req.setAttribute("groupId", groupId);
		return "worklist-mob-group";
	}
	
	/*创意设计某一作品详情*/
	@RequestMapping("/worklist-design-mob-detail")
	public String worklist_design_mob_detail(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "worklist-design-mob-detail";
	}
	
	/*传统工艺某一作品详情*/
	@RequestMapping("/worklist-mob-detail")
	public String worklist_mob_detail(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "worklist-mob-detail";
	}
	
	
}
