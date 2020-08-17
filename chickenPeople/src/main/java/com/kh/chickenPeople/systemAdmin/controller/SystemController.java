package com.kh.chickenPeople.systemAdmin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.systemAdmin.model.service.SystemService;
import com.kh.chickenPeople.systemAdmin.model.vo.BrandTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;
import com.kh.chickenPeople.systemAdmin.model.vo.SiteTotal;

@Controller
public class SystemController {
	
	@Autowired
	SystemService sService;
	

	@RequestMapping(value="systemAdminMap.do",method=RequestMethod.GET)
	public ModelAndView goStoreMapList(ModelAndView mv,SearchStatus searchStatus, HttpServletRequest request,
									   @RequestParam(value="storeSearch",required=false) String storeSearchName) {
		int getListCount = sService.selectMapStoreList(storeSearchName);
		ArrayList<Store> searchStoreList = sService.searchStoreList(storeSearchName);
		
//		String []storeNameList = new String[getListCount];
//		for(int i = 0 ; i<searchStoreList.size();i++) {
//			storeNameList[i]=searchStoreList.get(i).getSto_name();
//			System.out.println(storeNameList[i]);
//		}
		mv.addObject("searchStoreList", searchStoreList);
		
		mv.addObject("searchStatus",searchStatus);
		mv.setViewName("systemAdmin/systemAdminMap");
		return mv;
	}
	
	@RequestMapping(value="systemAdminCoupon.do", method=RequestMethod.GET)
	public ModelAndView goCouponList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		
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
	
	
	@RequestMapping("couponCreateView.do")
	public String couponCreateView() {
		return "systemAdmin/systemAdminCouponCreate";
	}
	
	@RequestMapping(value="couponCreate.do")
	public String goCouponCreate(HttpServletRequest request, @ModelAttribute Coupon coupon,
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
	public ModelAndView couponDetail(ModelAndView mv, String coup_serial)
	{
		Coupon coupon = sService.selectCoupon(coup_serial);
		
		mv.addObject("coupon", coupon);
		mv.setViewName("systemAdmin/systemAdminCouponDetail");
		return mv;
	}
	
	@RequestMapping(value="couponUpdate.do")
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
	//-------------------------------------------------------------------------------------------------------------------
	//계연 System Admin Main 그래프(1)
	@RequestMapping(value="brandTotalGraph.do")
	public ModelAndView brandTotalGraph(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<BrandTotal> selectBrandTotal = sService.selectBrandTotal();
		ArrayList<SiteTotal> selectSiteTotal = sService.selectSiteTotal();
		int totalMemberCount = sService.selectMemberCount();
		int reportCount = sService.selectReportCount();
		int chattingCount = sService.selectChattingCount();
		int storeMemCount = sService.selectStoreMemCount();
		request.setAttribute("printTotalList",selectBrandTotal);
		request.setAttribute("printSiteTotalList", selectSiteTotal);
		
		mv.addObject("storeMemCount",storeMemCount);
		mv.addObject("chattingCount",chattingCount);
		mv.addObject("reportCount",reportCount);
		mv.addObject("totalMemberCount",totalMemberCount);
		mv.addObject("citeTotalList",selectSiteTotal);
		mv.setViewName("systemAdmin/systemAdminMain");
		return mv;
		
	}
	
	
	
	

}
