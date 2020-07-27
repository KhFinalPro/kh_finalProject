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
	
	@RequestMapping("searchStore.do")
	public ModelAndView searchStore(ModelAndView mv, String brand_code, String menu_name) {
		
		ArrayList<Store> storeList = mainService.searchStore(brand_code);
		
		if(!storeList.isEmpty())
		{
			mv.addObject("storeList", storeList);
			mv.addObject("menu_name", menu_name);
			mv.setViewName("main/mainMenuSearch");
		}
		else
		{
			System.out.println("비어있음");
		}
		return mv;
	}
	
	@RequestMapping(value="homeSearch.do")
	public ModelAndView homeSearch(ModelAndView mv, Search s) throws MainException
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
