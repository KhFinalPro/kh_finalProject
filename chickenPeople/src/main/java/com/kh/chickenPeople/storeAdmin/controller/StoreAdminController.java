package com.kh.chickenPeople.storeAdmin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.storeAdmin.model.service.StoreAdminService;
import com.kh.chickenPeople.storeAdmin.model.vo.StoreReview;

@Controller
public class StoreAdminController {
	
	
	  @Autowired
	  StoreAdminService storeAdminService;


	  @RequestMapping("storeOrder.do")
	   public String storeOrder() {
	      return "storeAdmin/storeOrder";
	   }
	  
	  @RequestMapping("storeReview.do")
	   public String storeReview() {
	      return "storeAdmin/storeReview";
	   }
	  
	  @RequestMapping("storeMenu.do")
	   public String storeMenu() {
	      return "storeAdmin/storeMenu";
	   }
	  
	  @RequestMapping("storeProgress.do")
	  public String storeProgress() {
		  return "storeAdmin/storeProgress";
	  }
	  
	  
	  
	  @RequestMapping(value="selectReviewList",method=RequestMethod.GET)
	  public void selectReviewList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  
		  response.setContentType("application/json;charset=utf-8");

		  HttpSession session = request.getSession();

		  Member loginUser = (Member) session.getAttribute("loginUser");

		  System.out.println("세션 유저 정보 : " + loginUser.toString());
		  
		  // 유저 아이디
		  String userId = loginUser.getId();
		  
		  JSONObject obj = new JSONObject();
		  
		  /****리뷰리스트(메뉴없음)****/
		  ArrayList<StoreReview> reviewList = storeAdminService.reviewList(userId);
		  System.out.println("리뷰리스트"+reviewList);
		  
		  
		  /*******메뉴리스트********/
		  ArrayList<StoreReview> menuList = storeAdminService.menuList(userId);
		  System.out.println("메뉴리스트"+menuList);
		 
		  
		  JSONArray reviewMenuArr = new JSONArray();
		  for(int i=0; i<reviewList.size(); i++) {
			  //System.out.println("리뷰오더넘버"+reviewList.get(i).getOrdNum());
			  //JSONObject review = new JSONObject();
			  for(int j=0; j<menuList.size(); j++) {
				 // System.out.println("메뉴오더넘버"+menuList.get(j).getOrdNum());
				 // JSONObject menu = new JSONObject();
				  if(reviewList.get(i).getOrdNum().equals(menuList.get(j).getOrdNum())) {
					 System.out.println("같니?"+"리뷰오더넘버"+reviewList.get(i).getOrdNum()+"메뉴오더넘버"+menuList.get(j).getOrdNum());
					  
					  for(int r=0; r<reviewList.size(); r++) {
						  JSONObject reviewMenu = new JSONObject();
						  reviewMenu.put("ordNum",reviewList.get(r).getOrdNum());
						  reviewMenu.put("menuName",menuList.get(r).getRealMenu());
						  reviewMenu.put("ordPrice",reviewList.get(r).getOrdPrice());
						  reviewMenu.put("ordDate",reviewList.get(r).getOrdDate());
						  reviewMenu.put("revDate",reviewList.get(r).getRevDate());
						  reviewMenu.put("revRate",reviewList.get(r).getRevRate());
						  reviewMenu.put("revCont",reviewList.get(r).getRevCont()); 
						  reviewMenu.put("revNum",reviewList.get(r).getRevNum());						  
						  reviewMenuArr.add(reviewMenu);
						  
					  }
					  obj.put("reviewMenu", reviewMenuArr);
					  System.out.println("찐 리얼 메뉴리스트"+reviewMenuArr);
						
						PrintWriter out = response.getWriter();
						
						out.print(obj);
						out.flush();
						out.close();
					  
				  }
				    
			  }
		  } 
		
	  
	  
	  }
	  
	  @RequestMapping(value="updateReviewRe",method=RequestMethod.POST)
	  public void updateReviewRe(HttpServletRequest request, HttpServletResponse response,String revNum, String revReCont) throws IOException {
		  System.out.println("리뷰넘버 : "+revNum+"답장 :"+revReCont);
		  
		  response.setContentType("application/json;charset=utf-8");

		  HttpSession session = request.getSession();

		  Member loginUser = (Member) session.getAttribute("loginUser");

		  System.out.println("세션 유저 정보 : " + loginUser.toString());
		  
		  // 유저 아이디
		  String userId = loginUser.getId();
		  
		  HashMap<String,String> map = new HashMap<>();
		  map.put("revNum",revNum);
		  map.put("revReCont",revReCont);
		  
		  
		  
		  int updateReviewRe =  storeAdminService.updateReviewRe(map);
		  
		  JSONObject resultObj = new JSONObject();
			resultObj.put("gg", "서엉공");
			
			PrintWriter out = response.getWriter();
			
			out.print(resultObj);
			out.flush();
			out.close();
		
		  
		  
	  }
	  
	  @RequestMapping(value="deleteReview",method=RequestMethod.POST)
	  public void deleteReview(HttpServletRequest request, HttpServletResponse response, String[] noArr) throws IOException {
		  response.setContentType("application/json;charset=utf-8");
			
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getId();
			
			System.out.println("잘 받았니?"+noArr[0]);
			//배열로 받은 에이작스 for문 돌려서 각 값 저장하기
			String deleteReviewNo = null;
			if(noArr!=null) {
				for(String reviewNo : noArr) {
					System.out.println(reviewNo);
					deleteReviewNo =reviewNo;
					
					HashMap<String,String> map = new HashMap<>();
					map.put("Id",userId);
					map.put("deleteReviewNo", deleteReviewNo);
					
					//리뷰 삭제하기
					int result = storeAdminService.deleteStoreReview(map);
					int result2 = storeAdminService.deleteReview(map);
					
					deleteReviewNo="";
				}
			}
			
			JSONObject resultObj = new JSONObject();
			resultObj.put("gg", "서엉공");
			
			PrintWriter out = response.getWriter();
			
			out.print(resultObj);
			out.flush();
			out.close();
			
			
			
			
	  }
		  
}
