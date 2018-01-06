package com.craft.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commensPC")
public class CommonPCController {
	
	
	/*  各个页面的首页   */
	@RequestMapping("/{url}/main")
	public String urlmain(@PathVariable String url, HttpSession session,HttpServletRequest req) {
		//定义跳转路径
		String returnStr = "zhjk/main";
		if (url.equals("zhjk")) {
			String app_typ_id = req.getParameter("app_typ_id");
			String pws_id = req.getParameter("pws_id");
			String typ_ide = req.getParameter("typ_ide");
			req.setAttribute("app_typ_id",app_typ_id);
			req.setAttribute("pws_id",pws_id);
			req.setAttribute("typ_ide",typ_ide);
			returnStr = "zhjk/main";
		} else if (url .equals("ywgl")) {
			returnStr = "ywgl/main";
		}  else if (url .equals("khgl")) {
			returnStr = "khgl/main";
		} else if (url .equals("tjfx")) {
			returnStr = "tjfx/main";
		} else if (url .equals("xtgl")) {
			returnStr = "xtgl/main";
		} else if (url .equals("rcbg")) {
			returnStr = "rcbg/main";
		} else if (url .equals("zcgl")) {
			returnStr = "zcgl/main";
		} else if (url .equals("aqgl")) {
			returnStr = "aqgl/main";
		} else if (url .equals("jhgl")) {
			returnStr = "jhgl/main";
		} else if (url .equals("zsk")) {
			returnStr = "zsk/main";
		} 
		return returnStr;
	}
	
	/*  各个页面的顶部   */
	@RequestMapping("/{url}/top")
	public String top(@PathVariable String url,HttpSession session,HttpServletRequest req) {
		//定义跳转路径
		String returnStr = "top";
		if (url.equals("zhjk")) {
			String app_typ_id = req.getParameter("app_typ_id");
			String pws_id = req.getParameter("pws_id");
			String typ_ide = req.getParameter("typ_ide");
			req.setAttribute("app_typ_id",app_typ_id);
			req.setAttribute("pws_id",pws_id);
			req.setAttribute("typ_ide",typ_ide);
			returnStr = "zhjk/top";
		}
		return returnStr;
	}
	
	/*  各个页面的菜单   */
	@RequestMapping("/{url}/menu")
	public String menu(@PathVariable String url, HttpSession session,HttpServletRequest req) {
		//判断登录之后的主页面显示的页面，根据角色权限设置
		List menuList =  (List) session .getAttribute("menu");
		
		//定义返回的list
		List list=new ArrayList();
				
		if(menuList.size() > 0){
			//默认跳转到第一条菜单的页面
			Map<String, Object> map = (Map<String, Object>)menuList.get(0);
			String module_code = (String) map.get("module_code");
			if(url.equals("zhjk")){
				String app_typ_id = req.getParameter("app_typ_id");
				String pws_id = req.getParameter("pws_id");
				String typ_ide = req.getParameter("typ_ide");
				req.setAttribute("app_typ_id",app_typ_id);
				req.setAttribute("pws_id",pws_id);
				req.setAttribute("typ_ide",typ_ide);
				return "/zhjk/menu";
			}else if(url.equals("ywgl")){
				list = getMenu(menuList,"YWGL");
			}else if(url.equals("khgl") ){
				list = getMenu(menuList,"KHGL");
			}else if(url.equals("tjfx") ){
				list = getMenu(menuList,"TJFX");
			}else if(url.equals("xtgl") ){
				list = getMenu(menuList,"XTGL");
			}else if(url.equals("rcbg")){
				list = getMenu(menuList,"RCBG");
			}else if(url.equals("zcgl")){
				list = getMenu(menuList,"ZCGL");
			}else if(url.equals("aqgl") ){
				list = getMenu(menuList,"AQGL");
			}else if(url.equals("jhgl") ){
				list = getMenu(menuList,"JHGL");
			}else if(url.equals("zsk") ){
				list = getMenu(menuList,"ZSK");
			}      
			System.out.println("list---"+list);
			req.setAttribute("menu", list);
		} 
		
		return  "/menu";
	}
	
	
	/* 首页  */
	@RequestMapping("/main")
	public String main(HttpSession session,HttpServletRequest req) {
		Map<String, Object>  user = (Map<String, Object>)session .getAttribute("user");
		req.setAttribute("user", user);
		return "main";
	}
	
	/* 主页  */
	@RequestMapping("/index")
	public String index(HttpSession session,HttpServletRequest req) {
		
		//定义跳转路径
		String returnStr = "index";
		
		return returnStr;
	}
	
	/**
	 * 获取一级菜单下的下级菜单权限
	 * @param menuList
	 * @param type_url
	 * @return
	 */
	private List getMenu(List menuList, String code) {
		List list = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < menuList.size(); i++) {
			Map<String, Object> map = (Map<String, Object>) menuList.get(i); 
			String module_url = (String) map.get("module_code");
			if(module_url.indexOf(code) > -1 ){
				list =  (List) map.get("menu");
			}
		}
		return list;
	}
 
	
	/* 底部导航  */
	@RequestMapping("/bottom")
	public String bottom(HttpSession session,HttpServletRequest req) {
		Map<String, Object>  user = (Map<String, Object>)session .getAttribute("user");
		req.setAttribute("user", user);
		return "bottom";
	}
	/********************************* 综合监控 *********************************/
	
	
	/* 综合监控地图  */
	@RequestMapping("/map")
	public String map(HttpSession session,HttpServletRequest req) {
		
		return "zhjk/map";
	}
	
	/* 综合监控地图列表  */
	@RequestMapping("/maplist")
	public String maplist(HttpSession session,HttpServletRequest req) {
		
		return "zhjk/maplist";
	}

	/* 综合监控电站详情  */
	@RequestMapping("/detail")
	public String detail(HttpSession session,HttpServletRequest req) {
		
		return "zhjk/detail";
	}

	/* 综合监控设备列表  */
	@RequestMapping("/sblb")
	public String sblb(HttpSession session,HttpServletRequest req) {
		
		return "zhjk/sblb";
	}
	
	@RequestMapping("/zhjk/sb/sb")
	public String sb(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb";
	}
	
	/*储能电池*/
	@RequestMapping("/zhjk/sb/energy")
	public String energy(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/energy";
	}
	
	/*储能电池历史*/
	@RequestMapping("/zhjk/sb/energyhistory")
	public String energyhistory(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/energyhistory";
	}
	
	/*储能电池健康*/
	@RequestMapping("/zhjk/sb/energyhealthy")
	public String energyhealthy(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/energyhealthy";
	}
	
	/*电表*/
	@RequestMapping("/zhjk/sb/enwatch")
	public String enwatch(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/enwatch";
	}
	/*dc*/
	@RequestMapping("/zhjk/sb/dc")
	public String dc(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/dc";
	}
	/*dc健康*/
	@RequestMapping("/zhjk/sb/dchealthy")
	public String dchealthy(HttpSession session,HttpServletRequest req) {
		
		return "zhjk/sb/dchealthy";
	}
	/*dc历史*/
	@RequestMapping("/zhjk/sb/dchistory")
	public String dchistory(HttpSession session,HttpServletRequest req) {
		
		return "zhjk/sb/dchistory";
	}
	
	/*储能逆变器*/
	@RequestMapping("/zhjk/sb/storage")
	public String storage(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/storage";
	}
	/*储能逆变器历史*/
	@RequestMapping("/zhjk/sb/storagehistory")
	public String storagehistory(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/storagehistory";
	}
	/*变压器*/
	@RequestMapping("/zhjk/sb/transformer")
	public String transfotmer(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/transformer";
	}
	
	/*变压器历史*/
	@RequestMapping("/zhjk/sb/transformerhistory")
	public String transformerhistory(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/transformerhistory";
	}
	
	/*电能检测*/
	@RequestMapping("/zhjk/sb/powercheck")
	public String powercheck(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/powercheck";
	}
	
	/*环境检测*/
	@RequestMapping("/zhjk/sb/environment")
	public String environment(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/environment";
	}
	/*环境检测历史*/
	@RequestMapping("/zhjk/sb/environmenthistory")
	public String environmenthistory(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/environmenthistory";
	}
	/*汇流箱*/
	@RequestMapping("/zhjk/sb/headerbox")
	public String headerbox(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/headerbox";
	}
	/*交流充电桩*/
	@RequestMapping("/zhjk/sb/dcz")
	public String dcz(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/dcz";
	}
	/*直流充电桩*/
	@RequestMapping("/zhjk/sb/acz")
	public String acz(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/acz";
	}
	/*线路保护*/
	@RequestMapping("/zhjk/sb/protect")
	public String protect(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/protect";
	}
	/*线路保护历史*/
	@RequestMapping("/zhjk/sb/protecthistory")
	public String protecthistory(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/protecthistory";
	}
	/*解列*/
	@RequestMapping("/zhjk/sb/jielie")
	public String jielie(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/jielie";
	}
	
	/*解列历史*/
	@RequestMapping("/zhjk/sb/jieliehistory")
	public String jieliehistory(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/jieliehistory";
	}
	
	/*交流配电柜*/
	@RequestMapping("/zhjk/sb/peidiangui")
	public String peidiangui(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/peidiangui";
	}
	
	/*直流配电柜*/
	@RequestMapping("/zhjk/sb/zlpeidiangui")
	public String zlpeidiangui(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/zlpeidiangui";
	}
	
	/*微网*/
	@RequestMapping("/zhjk/sb/microgrid")
	public String microgrid(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String equNum = req.getParameter("equNum");
		req.setAttribute("id", id);
		req.setAttribute("equNum", equNum);
		return "zhjk/sb/microgrid";
	}
	
	
	
	/*储能电池*/
	@RequestMapping("/zhjk/sb/sb-energy")
	public String sb_energy(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-energy";
	}
	/*电表*/
	@RequestMapping("/zhjk/sb/sb-enwatch")
	public String sb_enwatch(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-enwatch";
	}
	/*dc*/
	@RequestMapping("/zhjk/sb/sb-dc")
	public String sb_dc(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-dc";
	}
	 
	/*储能逆变器*/
	@RequestMapping("/zhjk/sb/sb-storage")
	public String sb_storage(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-storage";
	}
	/*变压器*/
	@RequestMapping("/zhjk/sb/sb-transformer")
	public String sb_transfotmer(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-transformer";
	}
	
	/*电能检测*/
	@RequestMapping("/zhjk/sb/sb-powercheck")
	public String sb_powercheck(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-powercheck";
	}
	
	/*环境检测*/
	@RequestMapping("/zhjk/sb/sb-environment")
	public String sb_environment(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-environment";
	}
	
	/*汇流箱*/
	@RequestMapping("/zhjk/sb/sb-headerbox")
	public String sb_headerbox(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-headerbox";
	}
	/*交流充电桩*/
	@RequestMapping("/zhjk/sb/sb-dcz")
	public String sb_dcz(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-dcz";
	}
	/*直流充电桩*/
	@RequestMapping("/zhjk/sb/sb-acz")
	public String sb_acz(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-acz";
	}
	/*线路保护*/
	@RequestMapping("/zhjk/sb/sb-protect")
	public String sb_protect(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-protect";
	}
	/*解列*/
	@RequestMapping("/zhjk/sb/sb-jielie")
	public String sb_jielie(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-jielie";
	}
	
	/*直流配电柜*/
	@RequestMapping("/zhjk/sb/sb-zlpeidiangui")
	public String sb_zlpeidiangui(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-zlpeidiangui";
	}
	
	
	/*交流配电柜*/
	@RequestMapping("/zhjk/sb/sb-peidiangui")
	public String sb_peidiangui(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-peidiangui";
	}
	
	/*控制器*/
	@RequestMapping("/zhjk/sb/sb-kzq")
	public String sb_kzq(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-kzq";
	}
	
	/*微网*/
	@RequestMapping("/zhjk/sb/sb-microgrid")
	public String sb_microgrid(HttpSession session,HttpServletRequest req) {
		String app_typ_id = req.getParameter("app_typ_id");
		String pws_id = req.getParameter("pws_id");
		String typ_ide = req.getParameter("typ_ide");
		req.setAttribute("app_typ_id",app_typ_id);
		req.setAttribute("pws_id",pws_id);
		req.setAttribute("typ_ide",typ_ide);
		return "zhjk/sb/sb-microgrid";
	}
	 
	
	/*********************************综合监控 end *********************************/
	
	
	/********************************* 统计分析 *********************************/
	
	//TODO
	
	
	
	
	/*电站分析 - 综合分析*/
	@RequestMapping("/tjfx/dzfx/zhfx")
	public String tjfxdzfxzhfx(HttpSession session,HttpServletRequest req) {
		
		return "tjfx/dzfx/zhfx";
	}
	
	/*电站分析 - 电站分析 */
	@RequestMapping("/tjfx/dzfx/dzfx")
	public String tjfxdzfxdzfx(HttpSession session,HttpServletRequest req) {
		
		return "tjfx/dzfx/dzfx";
	}
	
	/*电站分析 - 电量与收益分析 */
	@RequestMapping("/tjfx/dzfx/dlysyfx")
	public String tjfxdzfxdlysyfx(HttpSession session,HttpServletRequest req) {
		
		return "tjfx/dzfx/dlysyfx";
	}
	
	/*电站分析 - 能耗分析 */
	@RequestMapping("/tjfx/dzfx/nhfx")
	public String tjfxdzfxnhfx(HttpSession session,HttpServletRequest req) {
		
		return "tjfx/dzfx/nhfx";
	}
	
	/*电站分析 - 太阳能分析 */
	@RequestMapping("/tjfx/dzfx/tynfx")
	public String tjfxdzfxtynfx(HttpSession session,HttpServletRequest req) {
		
		return "tjfx/dzfx/tynfx";
	}
	
	
	
	
	
	
	/*********************************统计分析 end *********************************/
	
	/********************************* 考核管理 *********************************/
	
	//TODO
	
	
	
	
	
	
	
	
	
	
	
	/*********************************考核管理 end *********************************/
	
	
	/********************************* 日常办公  *********************************/
	/*文档管理*/
	@RequestMapping("/rcbg/wdgl/list")
	public String rcbgwdgllist(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/wdgl/list";
	}
	/*添加类型*/
	@RequestMapping("/rcbg/wdgl/addType")
	public String addwdgllist(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/wdgl/addType";
	}
	/*文档上传*/
	@RequestMapping("/rcbg/wdgl/add")
	public String add(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "rcbg/wdgl/add";
	}
	
	/*修改文档类型*/
	@RequestMapping("/rcbg/wdgl/editType")
	public String editType(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "rcbg/wdgl/editType";
	}
	/*员工管理*/
	@RequestMapping("/rcbg/yggl/list")
	public String rcbgyggllist(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/yggl/list";
	}
	
	
	@RequestMapping("/rcbg/yggl/add")
	public String rcbgyggladd(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/yggl/add";
	}
	
	@RequestMapping("/rcbg/yggl/edit")
	public String rcbgyggledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "rcbg/yggl/edit";
	}
	
	/*客户管理*/
	@RequestMapping("/rcbg/khgl/list")
	public String rcbgkhgllist(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/khgl/list";
	}
	
	
	@RequestMapping("/rcbg/khgl/add")
	public String rcbgkhgladd(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/khgl/add";
	}
	
	@RequestMapping("/rcbg/khgl/edit")
	public String rcbgkhgledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "rcbg/khgl/edit";
	}
	 
	/*客户通讯录*/
	@RequestMapping("/rcbg/khtxl/list")
	public String rcbgkhtxllist(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/khtxl/list";
	}
	/*员工通讯录*/
	@RequestMapping("/rcbg/ygtxl/list")
	public String rcbgygtxllist(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/ygtxl/list";
	}
	/*意见反馈*/
	@RequestMapping("/rcbg/yjfk/list")
	public String rcbgyjfkllist(HttpSession session,HttpServletRequest req) {
		
		return "rcbg/yjfk/list";
	}
	
	
	
	
	
	
	
	
	
	
	
	/********************************* 日常办公  end *********************************/
	
	
	/********************************* 运维管理  *********************************/
	
	//TODO
	
	
	
	
	
	
	
	
	
	
	
	/********************************* 运维管理  end *********************************/
	
	
	/********************************* 资产管理  *********************************/
	
	//TODO
	
	
	
	
	
	
	
	
	
	
	
	/********************************* 资产管理  end *********************************/
	
	
	/********************************* 安全管理  *********************************/
	
	@RequestMapping("/aqgl/list")
	public String aqgllist(HttpSession session,HttpServletRequest req) {
		return "aqgl/list";
	}
	/*添加类型*/
	@RequestMapping("/aqgl/addType")
	public String addType(HttpSession session,HttpServletRequest req) {
		return "aqgl/addType";
	}
	/*修改类型*/
	@RequestMapping("/aqgl/editType")
	public String eidtType(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "aqgl/editType";
	}
	/*修改类型*/
	@RequestMapping("/aqgl/edit")
	public String eidt(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "aqgl/edit";
	}
	/*添加项目*/
	@RequestMapping("/aqgl/add")
	public String aqgladd(HttpSession session,HttpServletRequest req) {
		
		return "aqgl/add";
	}
	
	@RequestMapping("/aqgl/query")
	public String query(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "aqgl/query";
	}
	@RequestMapping("/aqgl/editFile")
	public String aqgleditFile(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "aqgl/editFile";
	}
	
	
	
	
	
	
	
	
	
	
	/********************************* 安全管理  end *********************************/
	
	
	/********************************* 计划管理  *********************************/
	
	//TODO
	
	
	
	
	
	
	
	
	
	
	
	/********************************* 计划管理  end *********************************/
	
	
	/*********************************系统配置 *********************************/
	
	/*电站配置*/
	@RequestMapping("/xtgl/dzpz/list")
	public String xtgldzpzlist(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/dzpz/list";
	}
	
	@RequestMapping("/xtgl/dzpz/add")
	public String xtgldzpzadd(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/dzpz/add";
	}
	
	@RequestMapping("/xtgl/dzpz/edit")
	public String xtgldzpzedit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/dzpz/edit";
	}
	
	/*业主管理*/
	@RequestMapping("/xtgl/yzgl/list")
	public String xtglyzgllist(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/yzgl/list";
	}
	
	@RequestMapping("/xtgl/yzgl/add")
	public String xtglyzgladd(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/yzgl/add";
	}
	
	@RequestMapping("/xtgl/yzgl/edit")
	public String xtglyzgledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/yzgl/edit";
	}
	
	/*合作伙伴管理管理*/
	@RequestMapping("/xtgl/hzhbgl/list")
	public String xtglhzhbgllist(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/hzhbgl/list";
	}
	
	@RequestMapping("/xtgl/hzhbgl/add")
	public String xtglhzhbgladd(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/hzhbgl/add";
	}
	
	@RequestMapping("/xtgl/hzhbgl/edit")
	public String xtglhzhbgledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/hzhbgl/edit";
	}
	
	/*组织机构管理*/
	@RequestMapping("/xtgl/zzjggl/list")
	public String xtglzzjggllist(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/zzjggl/list";
	}
	
	@RequestMapping("/xtgl/zzjggl/add")
	public String xtglzzjggladd(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/zzjggl/add";
	}
	
	@RequestMapping("/xtgl/zzjggl/edit")
	public String xtglzzjggledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/zzjggl/edit";
	}
	
	@RequestMapping("/xtgl/zzjggl/addDep")
	public String xtglzzjggladdDep(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/zzjggl/addDep";
	}
	
	@RequestMapping("/xtgl/zzjggl/editDep")
	public String xtglzzjggleditDep(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String com_id = req.getParameter("com_id");
		req.setAttribute("id", id);
		req.setAttribute("com_id", com_id);
		return "xtgl/zzjggl/editDep";
	}
	
	
	/*角色管理*/
	@RequestMapping("/xtgl/jsgl/list")
	public String xtgljsgllist(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/jsgl/list";
	}
	
	@RequestMapping("/xtgl/jsgl/add")
	public String xtgljsgladd(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/jsgl/add";
	}
	
	@RequestMapping("/xtgl/jsgl/edit")
	public String xtgljsgledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/jsgl/edit";
	}
	
	@RequestMapping("/xtgl/jsgl/editBut")
	public String xtgljsgleditBut(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		String rol_id = req.getParameter("rol_id");
		req.setAttribute("rol_id", rol_id);
		req.setAttribute("id", id);
		return "xtgl/jsgl/editBut";
	}
	
	/*告警码*/
	@RequestMapping("/xtgl/gjmwh/list")
	public String xtglgjmlist(HttpSession session,HttpServletRequest req) {
		return "xtgl/gjmwh/list";
	}
	/*告警类型添加*/
	@RequestMapping("/xtgl/gjmwh/add")
	public String xtglgjmadd(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/gjmwh/add";
	}
	/*告警类型添加*/
	@RequestMapping("/xtgl/gjmwh/addType")
	public String xtglgjmaddtype(HttpSession session,HttpServletRequest req) {
		return "xtgl/gjmwh/addType";
	}
	/*告警类型修改*/
	@RequestMapping("/xtgl/gjmwh/editType")
	public String xtglgjmedittype(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/gjmwh/editType";
	}
	/*告警修改*/
	@RequestMapping("/xtgl/gjmwh/edit")
	public String xtglgjmedit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/gjmwh/edit";
	}
	/*厂家信息*/
	@RequestMapping("/xtgl/sbsccjgl/list")
	public String xtglsbsccjgllist(HttpSession session,HttpServletRequest req) {
		return "xtgl/sbsccjgl/list";
	}
	/*厂家类型添加*/
	@RequestMapping("/xtgl/sbsccjgl/addType")
	public String xtglsbsccjgladdType(HttpSession session,HttpServletRequest req) {
		return "xtgl/sbsccjgl/addType";
	}
	/*厂家类型修改*/
	@RequestMapping("/xtgl/sbsccjgl/editType")
	public String sbsccjgleidtType(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sbsccjgl/editType";
	}
	/*厂家信息修改*/
	@RequestMapping("/xtgl/sbsccjgl/edit")
	public String sbsccjgleidt(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sbsccjgl/edit";
	}
	/*添加厂家信息*/
	@RequestMapping("/xtgl/sbsccjgl/add")
	public String sbsccjgladd(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/sbsccjgl/add";
	}
	
	/*设备型号管理*/
	@RequestMapping("/xtgl/sbxhgl/list")
	public String downsbxhgllist(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sbxhgl/list";
	}

	@RequestMapping("/xtgl/sbxhgl/add")
	public String downsbxhgladd(HttpSession session,HttpServletRequest req) {
		
		return "xtgl/sbxhgl/add";
	}
	
	
	@RequestMapping("/xtgl/sbxhgl/edit")
	public String downsbxhgledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sbxhgl/edit";
	}
	
	@RequestMapping("/xtgl/sbxhgl/addType")
	public String downsbxhgladdType(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sbxhgl/addType";
	}
	
	@RequestMapping("/xtgl/sbxhgl/editType")
	public String downsbxhgleditType(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sbxhgl/editType";
	}
	/*数据字典管理*/
	@RequestMapping("xtgl/sjzdgl/list")
	public String sjzdgllist(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sjzdgl/list";
	}
	
	@RequestMapping("xtgl/sjzdgl/add")
	public String sjzdgladd(HttpSession session,HttpServletRequest req) {
		return "xtgl/sjzdgl/add";
	}
	
	@RequestMapping("xtgl/sjzdgl/edit")
	public String sjzdgledit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sjzdgl/edit";
	}
	
	@RequestMapping("xtgl/sjzdgl/addType")
	public String sjzdaddtype(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sjzdgl/addType";
	}
	
	@RequestMapping("xtgl/sjzdgl/editType")
	public String sjzdeditType(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "xtgl/sjzdgl/editType";
	}
	
	
	/*********************************系统配置  end *********************************/
	
	
	/*********************************知识库 *********************************/
	
	@RequestMapping("/zsk/list")
	public String zsklist(HttpSession session,HttpServletRequest req) {
		
		return "zsk/list";
	}

	@RequestMapping("/zsk/add")
	public String zskadd(HttpSession session,HttpServletRequest req) {
		
		return "zsk/add";
	}
	
	
	@RequestMapping("/zsk/edit")
	public String zskedit(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "zsk/edit";
	}
	
	/*查询知识库下的文档*/
	@RequestMapping("/zsk/query")
	public String zskquery(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "zsk/query";
	}
	/*新增知识库类型*/
	@RequestMapping("/zsk/addType")
	public String zskaddType(HttpSession session,HttpServletRequest req) {
		
		return "zsk/addType";
	}
	/*修改知识库类型*/
	@RequestMapping("/zsk/editType")
	public String zskeditType(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "zsk/editType";
	}
	
	/*修改知识库类型*/
	@RequestMapping("/zsk/editFile")
	public String zskeditFile(HttpSession session,HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "zsk/editFile";
	}
	
	
	/*********************************知识库 end *********************************/

}
