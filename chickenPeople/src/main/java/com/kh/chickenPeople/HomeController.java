package com.kh.chickenPeople;


import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.main.model.service.MainService;
import com.kh.chickenPeople.main.model.vo.BestMenu;
import com.kh.chickenPeople.member.model.vo.Member;
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
		mv.setViewName("home");
		return mv;
	}
	
	
	
	
}
