package com.kh.chickenPeople.systemAdmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SystemController {
	
	@RequestMapping(value="systemAdmin.do", method=RequestMethod.GET)
	public String selectReportList() {
		return "systemAdmin/systemAdminMain";
	}

}
