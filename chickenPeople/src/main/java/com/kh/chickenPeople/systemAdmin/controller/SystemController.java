package com.kh.chickenPeople.systemAdmin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.systemAdmin.model.service.SystemService;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Controller
public class SystemController {
	
	@Autowired
	SystemService sService;
	
	@RequestMapping(value="systemAdmin.do", method=RequestMethod.GET)
	public String goSystemAdminMain() {
		return "systemAdmin/systemAdminMain";
	}
	

	
	@RequestMapping(value="systemAdminStore.do", method=RequestMethod.GET)
	public String goStoreList() {
		return "systemAdmin/systemAdminStore";
	}
	
		
	@RequestMapping(value="systemAdminCoupon.do", method=RequestMethod.GET)
	public String goCouponList() {
		return "systemAdmin/systemAdminCoupon";
	}
	
	@RequestMapping(value="systemAdminReport.do", method=RequestMethod.GET)
	public String goReportList(){
		return "systemAdmin/systemAdminReport";
	}
	
	
	
	

}
