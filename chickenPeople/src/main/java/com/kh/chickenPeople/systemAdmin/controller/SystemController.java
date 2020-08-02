package com.kh.chickenPeople.systemAdmin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.common.SaveFile;
import com.kh.chickenPeople.systemAdmin.model.service.SystemService;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Controller
public class SystemController {
	
	@Autowired
	SystemService sService;
	
	@RequestMapping(value="systemAdmin.do", method=RequestMethod.GET)
	public String goSystemAdminMain() {									//SYSTEM MAIN PAGE 이동
		return "systemAdmin/systemAdminMain";
	}
	
	@RequestMapping(value="systemAdminStore.do", method=RequestMethod.GET)
	public String goStoreList() {										//SYSTEM STORE PAGE 이동
		return "systemAdmin/storeManage/systemAdminStore";
	}
	
		
	@RequestMapping(value="systemAdminCoupon.do", method=RequestMethod.GET)
	public ModelAndView goCouponList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {		//SYSTEM COUPON PAGE 이동
		
		int currentPage = 1;
		if(page != null)
		{
			currentPage = page;
		}
		
		int listCount = sService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		//쿠폰 리스트 가져오기
		ArrayList<Coupon> couponList = sService.selectCouponList(pi);
		
		if(!couponList.isEmpty())
		{
			mv.addObject("couponList", couponList);
			mv.addObject("pi", pi);
			mv.setViewName("systemAdmin/systemAdminCoupon");
		}
		
		return mv;
	}
	
	@RequestMapping(value="systemAdminReport.do", method=RequestMethod.GET)
	public String goReportList(){										//SYSTEM COUPON PAGE 이동
		return "systemAdmin/systemAdminReport";
	}
	
	@RequestMapping("couponCreateView.do")
	public String couponCreateView() {									//SYSTEM COUPON CREATE PAGE 이동
		return "systemAdmin/systemAdminCouponCreate";
	}
	
	@RequestMapping(value="couponCreate.do")
	public String goCouponCreate(HttpServletRequest request, @ModelAttribute Coupon coupon,								//SYSTEM COUPON CREATE 동작
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {	// 파일이 잘 넘어온 경우
			
			System.out.println("오리진 파일 : " + file.getOriginalFilename());
			
			String renameFileName =  SaveFile.saveFile(file, request);
			
			coupon.setCoup_pic(renameFileName);
			
		}
		
		int result = sService.insertCoupon(coupon);
		
		return "redirect:/systemAdminCoupon.do";
	}
	
	@RequestMapping(value="couponDetail.do")
	public ModelAndView couponDetail(ModelAndView mv, String coup_serial)	//SYSTEM COUPON DETAIL PAGE 이동
	{
		Coupon coupon = sService.selectCoupon(coup_serial);
		
		mv.addObject("coupon", coupon);
		mv.setViewName("systemAdmin/systemAdminCouponDetail");
		return mv;
	}
	
	@RequestMapping(value="couponUpdate.do")								//SYSTEM COUPON UPDATE 동작
	public String couponUpdate(HttpServletRequest request, @ModelAttribute Coupon coupon,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {	// 파일이 잘 넘어온 경우
			
			System.out.println("오리진 파일 : " + file.getOriginalFilename());
			
			String renameFileName =  SaveFile.saveFile(file, request);
			
			coupon.setCoup_pic(renameFileName);
			
		}
		
		int result = sService.updateCoupon(coupon);
		
		
		return "redirect:/systemAdminCoupon.do";
	}
	
	
	
	

}
