package com.kh.chickenPeople;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.main.model.exception.MainException;
import com.kh.chickenPeople.main.model.service.MainService;
import com.kh.chickenPeople.store.model.vo.Store;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	MainService mainService;
	
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv) {
		
		//베스트 치킨집 top5
		ArrayList<Store> bestList = mainService.bestListSelect();
		for(Store s : bestList)
		{
			System.out.println(s);
		}
		if(!bestList.isEmpty())
		{
			mv.addObject("bestList", bestList);
		}
		return mv;
	}
	
	@RequestMapping(value="homeSearch.do")
	public ModelAndView homeSearch(ModelAndView mv, String search_input) throws MainException
	{
		System.out.println(search_input);
		ArrayList<Store> list = mainService.search(search_input);
		for(Store s: list)
		{
			System.out.println(s);
		}
		
		if(!list.isEmpty())
		{
			mv.addObject("search", search_input);
			mv.addObject("searchList", list);
			mv.setViewName("main/mainSearch");
		}
		else
		{
			mv.addObject("msg", "검색결과가 없습니다.");
			mv.setViewName("common/header");
//			throw new MainException("검색 실패");
		}
		return mv;
	}
	
}
