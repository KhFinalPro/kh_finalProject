package com.kh.chickenPeople.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.service.StoreService;
import com.kh.chickenPeople.store.model.vo.Review;
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.store.model.vo.StoreLike;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	//상원 매장 상세페이진
	@RequestMapping("storeDetail.do")
	public ModelAndView storeOrderMain(ModelAndView mv, int sto_num) {
		
		
		System.out.println("storeOrderMain 페이지 뿌리기! : " + sto_num);
		//매장에 대한 정보 가져오기
		ArrayList<Store> storeList = storeService.selectStore(sto_num);
		
		//리뷰 가져오기
		ArrayList<Review> reviewList = storeService.selectListReview(sto_num);
				
		//리뷰 평균
		
		try
		{
			double avg_review_rate = storeService.selectReviewAvg(sto_num);
			mv.addObject("avg_review_rate", avg_review_rate);
			mv.addObject("storeList", storeList);
			mv.addObject("reviewList", reviewList);
			mv.setViewName("store/storeOrderMain");
			return mv;
		}
		catch(NullPointerException e)
		{
			mv.addObject("avg_review_rate", 0.0);
			mv.addObject("storeList", storeList);
			mv.addObject("reviewList", reviewList);
			mv.setViewName("store/storeOrderMain");
			return mv;
		}
		
		
	} 
	
	//상원 매장 상세 페이지 모달에 필요한 ajax
	@RequestMapping(value="menuDetail.do", method=RequestMethod.POST)
	public void selectMenuDetail(HttpServletResponse response, int menu_num, String brand_code) throws IOException
	{
		System.out.println(brand_code);
		response.setContentType("application/json;charset=utf-8");
		//메뉴가져오기
		Menu mainMenu = storeService.selectOneMenu(menu_num);
		//추가메뉴 가져오기
		ArrayList<Menu> sideMenu = storeService.selectListSideMenu(brand_code);
		
		
		if(mainMenu != null && !sideMenu.isEmpty())
		{
			JSONArray jarr = new JSONArray();
			for(Menu menu : sideMenu)
			{
				JSONObject jobj = new JSONObject();
				
				jobj.put("menu_num", menu.getMenu_Num());
				jobj.put("menu_name", menu.getMenu_Name());
				jobj.put("menu_price", menu.getMenu_Price());
				
				jarr.add(jobj);
			}
			
			JSONObject sendJson = new JSONObject();
			sendJson.put("menu_num", mainMenu.getMenu_Num());
			sendJson.put("menu_name", mainMenu.getMenu_Name());
			sendJson.put("menu_pic", mainMenu.getMenu_Pic());
			sendJson.put("menu_price", mainMenu.getMenu_Price());
			sendJson.put("sideMenu", jarr);
			
			PrintWriter out = response.getWriter();
			
			out.print(sendJson);
			out.flush();
			out.close();
		}
		
	}
	

	@RequestMapping("/order.do")
	public String orderPayController(){
		
		System.out.println("orderPaymentView 페이지 뿌리기!");
		return "store/orderPaymentView";
		
		
		
		
	}

	//(계연)관리자 _ 매장 관리-----------------------------------------------------------------------------
	@RequestMapping(value="systemAdminStore.do", method=RequestMethod.GET)
	public ModelAndView storeSearch(ModelAndView mv, 
									@RequestParam(value="page", required=false) Integer page,
									@RequestParam(value="storeSearch", required=false) String storeName,
									@RequestParam(value="brandCategory", required=false) String storeCategory,
									@RequestParam(value="status_s",required=false) String status,
									SearchStatus storeSearch){
		
		System.out.println("storeName:"+storeName);
		System.out.println("storeCategory:"+storeCategory);
		System.out.println("status:"+status);
		
		int currentPage=1;
		int listCount=0;
		PageInfo pi = null;
		ArrayList<Store> resultStoreList = null;
		ArrayList<Brand> selectBrandList = storeService.selectBrandList();
		System.out.println(selectBrandList);
		
		if(page!=null) {
			currentPage = page;
		}
		if(storeCategory!=null) {
			if(storeName.equals("")) {
				storeName=null;
				storeSearch.setSearchName(storeName);
			}else {
				storeSearch.setSearchName(storeName);
			}
			
			storeSearch.setSearchCategory(storeCategory);
			storeSearch.setSearchStatus(status);
			
			listCount = storeService.getSearchListCount(storeSearch);		//검색 결과 갯수 count
			pi = Pagination.getPageInfo(currentPage, listCount, 8);
			resultStoreList = storeService.selectStoreSearchList(storeSearch,pi);
			System.out.println("검색:"+resultStoreList);
			
			mv.addObject("searchStatus",storeSearch);
			mv.addObject("listCount",listCount);
			mv.addObject("storeList",resultStoreList);
		}else {
			listCount = storeService.getListCount();
			pi = Pagination.getPageInfo(currentPage, listCount, 8);
			resultStoreList = storeService.selectStoreList(pi);
			System.out.println("전체:"+resultStoreList);
			
			mv.addObject("searchStatus",storeSearch);
			mv.addObject("listCount",listCount);
			mv.addObject("storeList",resultStoreList);
		}
		mv.addObject("brandList",selectBrandList);
		mv.addObject("pi",pi);
		
		mv.setViewName("systemAdmin/storeManage/systemAdminStore");
		return mv;
	}
	
	//상원 매장 상세 찜하기 ajax
	@RequestMapping(value="storeLike.do", method=RequestMethod.POST)
	public void storeLike(HttpServletResponse response, StoreLike sl) throws IOException
	{
		response.setContentType("application/json;charset=utf-8");
		
		StoreLike storeLike = storeService.selectStoreLike(sl);
		
		JSONObject sendJson = new JSONObject();
		if(storeLike == null)	//찜 안한 매장
		{
			int result = storeService.insertStoreLike(sl);
			sendJson.put("msg", "등록되었습니다.");
		}
		else
		{
			sendJson.put("msg", "이미 등록된 매장입니다.");
		}
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
}