package com.kh.chickenPeople.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.coupon.model.service.CouponService;
import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.service.StoreService;
import com.kh.chickenPeople.store.model.vo.MordNumCheck;
import com.kh.chickenPeople.store.model.vo.Review;
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.store.model.vo.StoreLike;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	CouponService couponService;
	
	//상원 매장 상세페이진
	@RequestMapping("storeDetail.do")
	public ModelAndView storeOrderMain(ModelAndView mv, int sto_num, String latlng, String address) {
		
		System.out.println("storeDetail : " + address);
		System.out.println("storeDetail : " + latlng);
		System.out.println("storeOrderMain 페이지 뿌리기! : " + sto_num);
		//매장에 대한 정보 가져오기
		ArrayList<Store> storeList = storeService.selectStore(sto_num);
		
		//리뷰 가져오기
		ArrayList<Review> reviewList = storeService.selectListReview(sto_num);
				
		
		try
		{
			//리뷰 평균
			double avg_review_rate = storeService.selectReviewAvg(sto_num);

			int reviewCount = storeService.selectReivewCount(sto_num);			
			
			mv.addObject("reviewCount", reviewCount);
			
			mv.addObject("address", address);
			mv.addObject("latlng", latlng);
			mv.addObject("avg_review_rate", avg_review_rate);
			mv.addObject("storeList", storeList);
			mv.addObject("reviewList", reviewList);
			mv.setViewName("store/storeOrderMain");
			return mv;
		}
		catch(NullPointerException e)
		{
			mv.addObject("reviewCount", 0);
			mv.addObject("address", address);
			mv.addObject("latlng", latlng);
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

	@RequestMapping("/storeJoinForm.do")
	public ModelAndView storeJoin(ModelAndView mv) {
	System.out.println("storeJoinForm.do");
	mv.setViewName("store/storeJoin");
	
	return mv;
		
	}
	
	@RequestMapping("/storeJoin.do")
	public String storeJoin(Store s, Model model,
							@RequestParam("addr1") String address1,
							@RequestParam("addr2") String address2,
							@RequestParam("sto_lat") String sto_lat,
							@RequestParam("sto_lng") String sto_lng) {
		System.out.println(s);
		s.setSto_addr(address1+" "+address2);
		s.setSto_lat(Double.parseDouble(sto_lat));
		s.setSto_lng(Double.parseDouble(sto_lng));
		
		
		int result = storeService.storeJoin(s);
		
		if(result>0) {
			return "redirect:/home.do";
		}else {
			
		}
		
		return "redirect:/home.do";
	}
		
	@RequestMapping("/order.do")
	public String orderPayController(){
		
		System.out.println("orderPaymentView 페이지 뿌리기!");
		return "store/orderPaymentView";
		
		
		
		
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

	//주문버튼 클릭시
	@RequestMapping(value="paymentView.do", method=RequestMethod.GET)
	public ModelAndView paymentView(ModelAndView mv, HttpServletRequest request, @RequestParam(value="menu_num") int[] menu_num_arr,
			@RequestParam(value="price") int[] price_arr, @RequestParam(value="menu_name") String[] menu_name_arr, int total_price, int sto_num, String address, String latlng, String brand_code)
	{
		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");
		int result = 0;
		for(int i = 0; i<menu_num_arr.length; i++)
		{
			
			MordNumCheck muc = new MordNumCheck(menu_num_arr[i], price_arr[i], menu_name_arr[i]);
			
			//임의의 테이블에 insert하기
			result = storeService.insertMordNumCount(muc);
			
		}
		ArrayList<MordNumCheck> mordNumCheckList = new ArrayList<>();
		if(result > 0)
		{
			//select한 값을 넣는다.
			mordNumCheckList = storeService.selectMordNumCount();			
		}
		
		//테이블의 데이터 지우기
		int deleteResult = storeService.deleteMordNumCount();

		//회원이 가지고있는 쿠폰
		ArrayList<Coupon> myCouponList = couponService.myCoupon(loginUser.getId());
		
		if(!mordNumCheckList.isEmpty() && !myCouponList.isEmpty())
		{
			mv.addObject("brand_code", brand_code);
			mv.addObject("latlng", latlng);
			mv.addObject("myCouponList", myCouponList);
			mv.addObject("address", address);
			mv.addObject("menuList", mordNumCheckList);
			mv.addObject("total_price", total_price);
			mv.addObject("sto_num", sto_num);
		}
		else if(!mordNumCheckList.isEmpty() && myCouponList.isEmpty())
		{
			mv.addObject("brand_code", brand_code);
			mv.addObject("latlng", latlng);
			mv.addObject("address", address);
			mv.addObject("menuList", mordNumCheckList);
			mv.addObject("total_price", total_price);
			mv.addObject("sto_num", sto_num);
		}
		else if(mordNumCheckList.isEmpty() && myCouponList.isEmpty())
		{
			System.out.println("구매할 메뉴가 없음!!");
		}
		
		mv.setViewName("store/orderPaymentView");
		return mv;
	}
	
	@RequestMapping("paymentSuccess.do")
	public String paymentSuccess()
	{
		
		return "payment/paymentSuccess";
	}
	
	
	//(계연)관리자 _ 매장 관리-----------------------------------------------------------------------------
	@RequestMapping(value="systemAdminStore.do", method=RequestMethod.GET)
	public ModelAndView storeSearch(ModelAndView mv, 
									@RequestParam(value="page", required=false) Integer page,
									@RequestParam(value="storeSearch", required=false) String storeName,
									@RequestParam(value="brandCategory", required=false) String storeCategory,
									@RequestParam(value="status_s",required=false) String status,
									SearchStatus storeSearch){
		
//		System.out.println("storeName:"+storeName);
//		System.out.println("storeCategory:"+storeCategory);
//		System.out.println("status:"+status);
		
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
	
	@RequestMapping(value="systemAdminStoreDetail.do", method=RequestMethod.GET)
	public ModelAndView storeDetail(ModelAndView mv, SearchStatus searchStatus,
									@RequestParam(value="storeNum", required=false)int storeNum,
									@RequestParam(value="page", required=false)Integer page,
									@RequestParam(value="storeSearch", required=false)String storeName,
									@RequestParam(value="brandCategory", required=false)String storeCategory,
									@RequestParam(value="status_s",required=false)String status) {

		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		searchStatus.setSearchCategory(storeCategory);
		searchStatus.setSearchName(storeName);
		searchStatus.setSearchStatus(status);
		
		ArrayList<Brand> selectBrandList = storeService.selectBrandList();
		Store s = storeService.selectOneStore(storeNum);
		System.out.println(s);
		
		if(s!=null) {
			mv.addObject("brandList",selectBrandList);
			mv.addObject("store",s);
			mv.addObject("page",currentPage);
			mv.addObject("searchStatus",searchStatus);
			mv.setViewName("systemAdmin/storeManage/systemAdminStoreDetail");
		}
		return mv;
	}

	@RequestMapping(value="storeUpdatePage.do", method=RequestMethod.GET)
	public ModelAndView goUpdatePage(ModelAndView mv, SearchStatus searchStatus,HttpServletResponse response,	
									@RequestParam(value="page", required=false)Integer page,
									@RequestParam(value="storeNum", required=false)int storeNum,
									@RequestParam(value="storeSearch", required=false)String storeName,
									@RequestParam(value="brandCategory", required=false)String storeCategory,
									@RequestParam(value="status_s",required=false)String status) {

		ArrayList<Brand> selectBrandList = storeService.selectBrandList();
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}else {
			page=1;
		}
		searchStatus.setSearchCategory(storeCategory);
		searchStatus.setSearchName(storeName);
		searchStatus.setSearchStatus(status);
		
		Store s = storeService.selectOneStore(storeNum);
		System.out.println(s);
		
		if(s!=null) {
			mv.addObject("brandList",selectBrandList);
			mv.addObject("store",s);
			mv.addObject("page",currentPage);
			mv.addObject("searchStatus",searchStatus);
			mv.setViewName("systemAdmin/storeManage/systemAdminStoreUpdate");
		}
		return mv;
	}
	@RequestMapping(value="storeUpdate.do", method=RequestMethod.GET)
	public ModelAndView storeUpdate(ModelAndView mv, SearchStatus searchStatus, Store s,
									@RequestParam(value="storeSearch", required=false)String storeName,
									@RequestParam(value="brandCategory", required=false)String storeCategory,
									@RequestParam(value="status_s",required=false)String status)  {
		System.out.println(storeName);
		System.out.println(storeCategory);
		System.out.println(status);
		System.out.println(s);
		
		ArrayList<Brand> selectBrandList = storeService.selectBrandList();
//		Store updateStore = storeService.updateStore(storeNum);
		
		mv.addObject("brandList",selectBrandList);
//		mv.addObject("store",updateStore);
		mv.addObject("searchStatus",searchStatus);
		
		return mv;
	}

	@RequestMapping(value="storeStatusUpdate.do", method=RequestMethod.GET)
	public void storeStatusUpdate(HttpServletResponse response, ModelAndView mv, SearchStatus searchStatus,	
									@RequestParam(value="page", required=false)Integer page,
									@RequestParam(value="storeNum", required=false)int storeNum,
									@RequestParam(value="storeSearch", required=false)String storeName,
									@RequestParam(value="brandCategory", required=false)String storeCategory,
									@RequestParam(value="status_s",required=false)String status) {
		response.setContentType("text/html; charset=UTF-8");

		String checkStatus = storeService.checkStatus(storeNum);
		PrintWriter out;

		if(checkStatus.equals("Y")) {
			
		}else if(checkStatus.equals("N")) {
			//모달창을 띄운다
			int updateStatus = storeService.updateStatus(storeNum);

		}
		
		
		
	}


}