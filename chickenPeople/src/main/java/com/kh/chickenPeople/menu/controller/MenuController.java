package com.kh.chickenPeople.menu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.menu.model.service.MenuService;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller("menuController")
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@RequestMapping(value="systemAdminMenu.do", method=RequestMethod.GET)
	public ModelAndView goMenuList(ModelAndView mv,
								   @RequestParam(value="page",required=false)Integer page) {
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		ArrayList<Brand> selectBrandList = menuService.selectBrandList();
		int listCount = menuService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Menu> selectMenuList = menuService.selectMenuList(pi);
		
		if(selectMenuList!=null) {
			mv.addObject("menuList",selectMenuList);
			mv.addObject("brandList",selectBrandList);
			mv.addObject("pi",pi);
			mv.setViewName("systemAdmin/systemAdminMenu");			
		}else {
//			mv.addObject("menuList","메뉴 조회를 실패했습니다.");
//			mv.setViewName("systemAdmin/systemAdminMenu");			
		}
		return mv;
	}
	
	@RequestMapping(value="menuSearch.do", method=RequestMethod.GET)
	public String menuSearch(@RequestParam(value="menuName") String menuName,
							 @RequestParam(value="menuCategory",required=false) String menuCategory,
							 @RequestParam(value="status",required=false)String status,
							 @RequestParam(value="page",required=false)Integer page,
							 SearchStatus menuSearch){

		menuSearch.setSearchName(menuName);
		menuSearch.setSearchCategory(menuCategory);
		menuSearch.setSearchStatus(status);
		System.out.println(menuSearch);
		
		ArrayList<Menu> resultMenuList = menuService.selectMenuSearchList(menuSearch);
		
		if(resultMenuList!=null) {
			for(int i = 0; i<resultMenuList.size();i++) {
				
				System.out.println(resultMenuList.get(i));
			}
		}else {
			System.out.println("출력");
		}
		
		return null;
	}

}
