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

@Controller
public class BrandController {

	@Autowired
	BrandService brandService;
	
	@RequestMapping(value="systemAdminBrand.do", method=RequestMethod.GET)
	public ModelAndView goBrandList(ModelAndView mv,
									@RequestParam(value="page",required=false) Integer page) {
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		int listCount = brandService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,5);
		ArrayList<Brand> selectTotalBrandList = brandService.selectBrandList(pi);
		
		System.out.println(selectTotalBrandList);
		if(selectTotalBrandList!=null) {
			mv.addObject("brandList",selectTotalBrandList);
			mv.addObject("pi",pi);
			mv.setViewName("systemAdmin/systemAdminBrand");
		}
		return mv;
	}}
