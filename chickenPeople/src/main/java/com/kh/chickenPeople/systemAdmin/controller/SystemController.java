package com.kh.chickenPeople.systemAdmin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.systemAdmin.model.service.SystemService;
import com.kh.chickenPeople.systemAdmin.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Controller
public class SystemController {
	
	@Autowired
	SystemService sService;
	
	@RequestMapping(value="systemAdmin.do", method=RequestMethod.GET)
	public String goSystemAdminMain() {
		return "systemAdmin/systemAdminMain";
	}
	
	@RequestMapping(value="systemAdminBrand.do", method=RequestMethod.GET)
	public String goBrandList() {
		return "systemAdmin/systemAdminBrand";
	}
	
	@RequestMapping(value="systemAdminStore.do", method=RequestMethod.GET)
	public String goStoreList() {
		return "systemAdmin/systemAdminStore";
	}
	
	@RequestMapping(value="systemAdminMenu.do", method=RequestMethod.GET)
	public ModelAndView goMenuList(ModelAndView mv,
								   @RequestParam(value="page",required=false)Integer page) {
		int currentPage=1;
		System.out.println("page:"+page);
		if(page!=null) {
			currentPage=page;
		}
		
		int listCount = sService.getListCount();
		System.out.println("listCount:"+listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println("PageInfo pi:"+pi);
		
		ArrayList<Menu> selectMenuList = sService.selectMenuList(pi);
		for(int i = 0; i<selectMenuList.size();i++) {
			System.out.println(selectMenuList.get(i));
		}
		if(selectMenuList!=null) {
			mv.addObject("menuList",selectMenuList);
			mv.addObject("pi",pi);
			mv.setViewName("systemAdmin/systemAdminMenu");			
//		}else {
//			mv.addObject("menuList","메뉴 조회를 실패했습니다.");
//			mv.setViewName("systemAdmin/systemAdminMenu");			
		}
		return mv;
	}
	
	@RequestMapping(value="menuSearch.do", method=RequestMethod.GET)
	public String menuSearch(@RequestParam(value="menuName",required=false) String menuName,
							 @RequestParam(value="menuCategory",required=false) String menuCategory,
							 @RequestParam(value="status",required=false)String status,
							 @RequestParam(value="page",required=false)Integer page){
		System.out.println("menuName:"+menuName+"\nmenuCategory:"+menuCategory+"\nstatus:"+status);
		
		ArrayList<Menu> resultMenuList = sService.searchMenuList();
		return null;
	}
	
	@RequestMapping(value="systemAdminCoupon.do", method=RequestMethod.GET)
	public String goCouponList() {
		return "systemAdmin/systemAdminCoupon";
	}
	
	@RequestMapping(value="systemAdminReport.do", method=RequestMethod.GET)
	public String goReportList(){
		return "systemAdmin/systemAdminReport";
	}
	
	
	
	

}
