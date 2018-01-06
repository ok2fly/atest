package com.craft.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.craft.base.BaseController;
import com.craft.common.result.JsonResponse;
import com.craft.common.result.ResponseCode;
import com.craft.common.Const;
import com.craft.pojo.MatchOrg;
import com.craft.service.IMatchOrgService;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/MatchOrg/")
public class MatchOrgController extends BaseController{


    @Autowired
    private IMatchOrgService iMatchOrgService;

    /**
     * 比赛组织结构 查询所有
     *
     * @return
     */
    @RequestMapping(value = "selectMatchOrg")
    @ResponseBody
    public Object selectMatchOrg(HttpServletRequest request,HttpServletResponse response) {
    	
		JsonResponse<List<MatchOrg>> listMatchOrgs = iMatchOrgService.selectMatchOrg();
        return listMatchOrgs;
		
		
    }


    
    /**
     * 首页
     *
     * @return
     */
    @RequestMapping(value = "selectFirst")
    @ResponseBody
    public Object selectFirst(HttpServletRequest request,HttpServletResponse response) {
    	
		JsonResponse<Map<String, Object>> listMatchOrgs = iMatchOrgService.selectMatchNew();
        return listMatchOrgs;
		
		
    }
    

}
