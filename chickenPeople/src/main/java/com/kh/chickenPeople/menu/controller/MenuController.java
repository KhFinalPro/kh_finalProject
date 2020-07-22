package com.kh.chickenPeople.menu.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ModelAndView menuSearch(@RequestParam(value="menuName",required=false) String menuName,
							 @RequestParam(value="menuCategory",required=false) String menuCategory,
							 @RequestParam(value="status_s",required=false)String status_s,
							 @RequestParam(value="page",required=false)Integer page,
							 SearchStatus menuSearch, HttpSession session,
							 ModelAndView mv){
//		System.out.println("---------------------------------");
//		System.out.println("menuName:"+menuName);
//		System.out.println("menuCategory:"+menuCategory);
//		System.out.println("menuStatus:"+status_s);
//		System.out.println("page:"+page);
		
		//초기값 
		int currentPage=1;
		int listCount=0;
		PageInfo pi = null;
		ArrayList<Menu> resultMenuList = null;
		ArrayList<Brand> selectBrandList = menuService.selectBrandList();

		//첫번째 페이지가 아닐 때
		if(page!=null) {
			currentPage=page;
		}
		
		if(menuCategory!=null) {							//menuCategory가 존재할 때
			if(menuName.equals("")) {
				menuName=null;
				menuSearch.setSearchName(menuName);
			}else {
				menuSearch.setSearchName(menuName);
			}
			menuSearch.setSearchCategory(menuCategory);
			menuSearch.setSearchStatus(status_s);
			listCount = menuService.getSearchListCount(menuSearch);
			pi = Pagination.getPageInfo(currentPage, listCount);
			resultMenuList = menuService.selectMenuSearchList(menuSearch,pi);
			
			mv.addObject("searchStatus",menuSearch);
			mv.addObject("listCount",listCount);

		}else {
			listCount=menuService.getListCount();
			pi = Pagination.getPageInfo(currentPage, listCount);
			resultMenuList = menuService.selectMenuList(pi);
			mv.addObject("searchStatus",menuSearch);
			mv.addObject("listCount",listCount);
		}
		
		mv.addObject("brandList",selectBrandList);
		mv.addObject("menuList",resultMenuList);
		mv.addObject("pi",pi);
		mv.setViewName("systemAdmin/menu/systemAdminMenu");
		
		return mv;
	}
	
	@RequestMapping(value="systemAdminMenuDeatil.do", method=RequestMethod.GET)
	public ModelAndView goMenuDetail(ModelAndView mv, SearchStatus searchStatus,
									 @RequestParam(value="menuNum") int menuNum,
									 @RequestParam(value="page",required=false) Integer page,
									 @RequestParam(value="menuName") String menuName,
									 @RequestParam(value="menuCategory") String menuCategory,
									 @RequestParam(value="status_s") String status_s) {
//		System.out.println("menuNum:"+menuNum);
//		System.out.println("page:"+page);
//		System.out.println("menuName:"+menuName);
//		System.out.println("menuCategory:"+menuCategory);
//		System.out.println("menuStatus:"+status_s);
//		System.out.println("-------------------------");
//		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		searchStatus.setSearchCategory(menuCategory);
		searchStatus.setSearchName(menuName);
		searchStatus.setSearchStatus(status_s);
		
		ArrayList<Brand> selectBrandList = menuService.selectBrandList();
		Menu m = menuService.selectOneMenu(menuNum);
		
		if(m!=null) {
			mv.addObject("brandList",selectBrandList);
			mv.addObject("menu",m);
			mv.addObject("page",currentPage);
			mv.addObject("searchStatus",searchStatus);
			mv.setViewName("systemAdmin/menu/systemAdminMenuDetail");
		}
		return mv;
	}
	
	@RequestMapping(value="deleteMenu.do",method=RequestMethod.GET)
	public String goDeleteMenu(Model mv,
							   @RequestParam(value="menuNum",required=false)int menuNum,
							   @RequestParam(value="menuYN", required=false)String menuYN) {
		
		int result=0;
		System.out.println("상태:"+menuYN);
		if(menuYN.equals("N")){
			System.out.println("NN");
			result = menuService.changeMenuY(menuNum);
		}
		if(menuYN.equals("Y")) {
			System.out.println("YY");
			result = menuService.changeMenuN(menuNum);			
		}
		System.out.println(result);
		mv.addAttribute("menuName","");
		mv.addAttribute("menuCategory","total");
		mv.addAttribute("status_s","N");
		
		return "redirect:systemAdminMenu.do";
	}
}
