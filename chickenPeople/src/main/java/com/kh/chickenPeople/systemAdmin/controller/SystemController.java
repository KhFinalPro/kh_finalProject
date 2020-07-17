package com.kh.chickenPeople.systemAdmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SystemController {
	
	@RequestMapping(value="systemAdmin.do", method=RequestMethod.GET)
	public String goSystemAdminMain() {
		return "systemAdmin/systemAdminMain";
	}
	
	@RequestMapping(value="systemAdminBrand.do", method=RequestMethod.GET)
	public String goBrandList() {
		return "systemAdmin/systemAdminBrand";
	}
	
	@RequestMapping(value="systemAdminStore.do", method=RequestMethod.GET)
	public String goStoreList() {
		return "systemAdmin/systemAdminStore";
	}
	
	@RequestMapping(value="systemAdminMenu.do", method=RequestMethod.GET)
	public String goMenuList() {
		return "systemAdmin/systemAdminMenu";
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
