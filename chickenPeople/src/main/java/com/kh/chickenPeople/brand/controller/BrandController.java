package com.kh.chickenPeople.brand.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.brand.model.service.BrandService;
import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller
public class BrandController {

	@Autowired
	BrandService brandService;
	
	@RequestMapping(value="systemAdminBrand.do", method=RequestMethod.GET)
	public ModelAndView goBrandList(ModelAndView mv, SearchStatus brandSearch,
									@RequestParam(value="page",required=false) Integer page,
									@RequestParam(value="brandName",required=false) String brandName,
									@RequestParam(value="brandStatus",required=false)String brandStatus) {
		int currentPage=1;
		int listCount = 0;
		PageInfo pi = null;
		ArrayList<Brand> selectTotalBrandList = null;
		
		if(page!=null) {
			currentPage=page;
		}
		
		if(brandName.equals("no")) {
			brandName=null;
			brandSearch.setSearchName(brandName);
		}else {
			brandSearch.setSearchName(brandName);
		}
		brandSearch.setSearchStatus(brandStatus);

		
		listCount = brandService.getListCount(brandSearch);
		pi = Pagination.getPageInfo(currentPage, listCount,5);
		
		selectTotalBrandList = brandService.selectBrandList(brandSearch,pi);
		
		if(selectTotalBrandList!=null) {
			mv.addObject("brandList",selectTotalBrandList);
			mv.addObject("pi",pi);
			mv.addObject("searchStatus",brandSearch);
			mv.addObject("listCount",listCount);
			mv.setViewName("systemAdmin/brand/systemAdminBrand");
		}
		return mv;
	}}
