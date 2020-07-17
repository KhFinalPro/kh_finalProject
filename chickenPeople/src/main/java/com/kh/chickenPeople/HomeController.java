package com.kh.chickenPeople;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.chickenPeople.main.model.service.MainService;
import com.kh.chickenPeople.member.model.vo.Member;

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
	public String home(Locale locale, Model model, HttpSession session){

		Member m = new Member("Admin", "관리자");

		session.setAttribute("loginUser", m);

		System.out.println("login :"+m);

		return "home";
	}
}
