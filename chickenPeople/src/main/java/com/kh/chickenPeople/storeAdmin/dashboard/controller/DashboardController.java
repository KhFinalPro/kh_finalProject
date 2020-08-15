package com.kh.chickenPeople.storeAdmin.dashboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.storeAdmin.dashboard.model.service.DashboardService;
import com.kh.chickenPeople.storeAdmin.dashboard.model.vo.Dashboard;

@Controller
public class DashboardController {

	@Autowired
	DashboardService dashboardService;
	
	

	/*
	 * @RequestMapping("storeAdminMain.do") public String storeAdminMain() { return
	 * "storeAdmin/storeAdminMain"; }
	 */
	  
	  
	  
	  @RequestMapping(value="storeAdminMain.do", method=RequestMethod.GET)
	  public ModelAndView totalIncome(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		  
		  response.setContentType("application/json;charset=utf-8");

	        HttpSession session = request.getSession();

	        Member loginUser = (Member) session.getAttribute("loginUser");
	       
	       // System.out.println("세션 유저 정보22222222 : " + loginUser.toString());
	        
	        // 유저 아이디
	        String userId = loginUser.getId();
			
	        
	        System.out.println("----------어디야? 들어왔늬?ㅎ");
	        System.out.println("유저아이디"+userId);
			
	        //전체 매출
		    Dashboard dahsBoard = dashboardService.selectTotalncome(userId);
		    int totalIncome =dahsBoard.getTotalIncome();
		    
		    
		    //총 주문수
		    dahsBoard = dashboardService.selectTotalOrder(userId);
		    int totalOrder = dahsBoard.getTotalOrder();
		    
		    
		    //리뷰평균
		    dahsBoard = dashboardService.selectaverageReview(userId);
		    Double ageRate = dahsBoard.getAgeRate();
		
			
			//매장 좋아요 카운트
		    dahsBoard = dashboardService.selectStoreLike(userId);
		    int stoLikes = dahsBoard.getStoLikes();
		    
		    
		    //누적치킨 판매량
		    dahsBoard = dashboardService.selectTotalChicken(userId);
		    int totalChicken = dahsBoard.getTotalChicken();
		    
		    
		    
		    //TOP3메인메뉴
		    ArrayList<Dashboard> topMenuList = dashboardService.selectTopMenuList(userId);
		    
		    
		    //TOP3사이드메뉴
		    ArrayList<Dashboard> topSideList = dashboardService.selectTopSideList(userId);
	
		    
		    //월별 매출추이 + 주문건수
		    ArrayList<Dashboard> monthlyTotalIncomeList = dashboardService.monthlyTotalIncomeList(userId);
		    
		    
		    //단골 고객리스트
		    ArrayList<Dashboard> vipCustoemrList = dashboardService.vipCustoemrList(userId);
		    System.out.println("단골"+vipCustoemrList);
		    
		    
		    
		    request.setAttribute("topMenuList", topMenuList);
		    request.setAttribute("topSideList", topSideList);
		    request.setAttribute("monthlyTotalIncomeList", monthlyTotalIncomeList);
		    request.setAttribute("vipCustoemrList", vipCustoemrList);
		    
			mv.addObject("totalIncome",totalIncome);
			mv.addObject("totalOrder",totalOrder);
			mv.addObject("ageRate",ageRate);
			mv.addObject("stoLikes",stoLikes);
			mv.addObject("totalChicken",totalChicken);
			
			mv.setViewName("storeAdmin/storeAdminMain");
			
			
			return mv;
		}
	  
	  

	  
	  
	  
}
