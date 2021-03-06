package com.kh.chickenPeople.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.main.model.exception.MainException;
import com.kh.chickenPeople.main.model.service.MainService;
import com.kh.chickenPeople.main.model.vo.Search;
import com.kh.chickenPeople.store.model.vo.Store;

@Controller
public class MainController {

	@Autowired
	MainService mainService;
	
	@RequestMapping("mypage.do")
	public String myPage()
	{
		return "mypage/mypageMain";
	}
	
	@RequestMapping("searchStore.do")
	public ModelAndView searchStore(ModelAndView mv, String brand_code, String menu_name) {
		
		ArrayList<Store> storeList = mainService.searchStore(brand_code);
		System.out.println("storeList : " + storeList);
		if(!storeList.isEmpty() && menu_name != null)
		{
			mv.addObject("storeList", storeList);
			mv.addObject("menu_name", menu_name);
			mv.setViewName("main/mainMenuSearch");
		}
		else
		{
			mv.addObject("storeList", storeList);
			mv.addObject("menu_name", "");
			mv.setViewName("main/mainMenuSearch");
		}
		return mv;
	}
	
	@RequestMapping(value="homeSearch.do")
	public ModelAndView homeSearch(ModelAndView mv, Search s, String latlng, String address) throws MainException
	{
		ArrayList<Store> list = mainService.search(s);
		
		if(!list.isEmpty())
		{
			mv.addObject("search_input", s.getSearch_input());
			mv.addObject("storeList", list);
			mv.setViewName("main/mainSearch");
		}
		else
		{
			mv.addObject("search_input", s.getSearch_input());
			mv.addObject("storeList", list);
			mv.setViewName("main/mainSearch");
		}
		return mv;
	}
}
