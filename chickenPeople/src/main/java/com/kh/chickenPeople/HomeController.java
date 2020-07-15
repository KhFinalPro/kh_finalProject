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
	public String home(Locale locale, Model model) {
		
		
		return "home";
	}
	
	@RequestMapping(value="homeSearch.do")
	public ModelAndView homeSearch(ModelAndView mv, String search_input)
	{
		System.out.println(search_input);
		ArrayList<Store> list = mainService.search(search_input);
		for(Store s: list)
		{
			System.out.println(s);
		}
		
		if(!list.isEmpty())
		{
			mv.addObject("searchList", list);
			mv.setViewName("");
		}
		else
		{
			
		}
		return mv;
	}
	
}
