package com.kh.chickenPeople.systemAdmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SystemController {
	
	@RequestMapping(value="admin/selectReport", method=RequestMethod.GET)
	public ModelAndView selectReportList(ModelAndView mv) {
		return mv;
	}

}
