package com.kh.chickenPeople.report.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.report.model.service.ReportService;
import com.kh.chickenPeople.report.model.vo.ReportCategory;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller
public class ReportController {

	@Autowired 
	ReportService rService;
	
	@RequestMapping(value="systemAdminReport.do", method=RequestMethod.GET)
	public ModelAndView reportPage(ModelAndView mv,
								   @RequestParam(value="searchId", required=false) String searchId,
								   @RequestParam(value="rptCategory", required=false)String searchCategory,
								   @RequestParam(value="status_s",required=false)String status,
								   @RequestParam(value="page",required=false)Integer page,
								   SearchStatus searchStatus) {
		
		System.out.println(searchId);
		System.out.println(searchCategory);
		System.out.println(status);
		
		ArrayList<ReportCategory> selectRCategory = rService.selectRCategory();
		
		
		mv.addObject("rCategory",selectRCategory);
		mv.setViewName("systemAdmin/systemAdminReport");
		return mv;
	}
}
