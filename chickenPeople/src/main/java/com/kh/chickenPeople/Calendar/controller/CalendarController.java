package com.kh.chickenPeople.Calendar.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.chickenPeople.Calendar.model.service.CalendarService;
import com.kh.chickenPeople.Calendar.model.vo.Calendar;
import com.kh.chickenPeople.common.SaveFile;
import com.kh.chickenPeople.member.model.vo.Member;

@Controller
public class CalendarController {

	@Autowired
	CalendarService calendarService;

	@RequestMapping("calender.do")
	public String calender() {

		return "mypage/mypageCalender";

	}

	@RequestMapping("selectOrderList.do")
	public void selectOrderList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println("세션 유저 정보 : " + loginUser.toString());
		// 유저 아이디
		String userId = loginUser.getId();

		JSONObject obj = new JSONObject();

		// 나의 주문내역
		ArrayList<Calendar> orderList = calendarService.orderList(userId);

		// 내가 주문한 매장 JSONArray로 만들기
		JSONArray orderArr = new JSONArray();
		for (int i = 0; i < orderList.size(); i++) {
			JSONObject order = new JSONObject();

			order.put("ordNum", orderList.get(i).getOrdNum());
			order.put("ordDate", orderList.get(i).getOrdDate());

			orderArr.add(order);

		}
		System.out.println("주문 날짜+주문 번호" + orderArr);

		// obj에 내가 쓴 목록 넣기
		obj.put("orderList", orderArr);

		PrintWriter out = response.getWriter();

		out.print(obj);
		out.flush();
		out.close();

	}

	@RequestMapping(value = "showOrderDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void showOrderDetail(HttpServletRequest request, HttpServletResponse response, String orderNo)
			throws IOException {

		System.out.println(orderNo);

		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("세션 유저 정보 : " + loginUser.toString());
		String userId = loginUser.getId();

		HashMap<String, String> map = new HashMap<>();
		map.put("Id", userId);
		map.put("orderNo", orderNo);
		
		JSONObject obj = new JSONObject();
		
		
		// 주문내역 디테일
		ArrayList<Calendar> orderDetailList = calendarService.orderDetailList(map);
		
		

		// 주문번호에 대한 ARRAY만들기
		JSONArray orderDetailArr = new JSONArray();
		for (int i = 0; i < orderDetailList.size(); i++) {
			JSONObject orderDetail = new JSONObject();
			
		

			String formatOrdPrice = String.format("%,d", Integer.parseInt(orderDetailList.get(i).getOrdPrice()));
			String formatMenuPrice = String.format("%,d", Integer.parseInt(orderDetailList.get(i).getMenuPrice()));

			orderDetail.put("ordNum", orderDetailList.get(i).getOrdNum());
			orderDetail.put("ordStatus", orderDetailList.get(i).getOrdStatus());
			orderDetail.put("ordDate", orderDetailList.get(i).getOrdDate());
			orderDetail.put("userId", orderDetailList.get(i).getUserId());
			orderDetail.put("stoNum", orderDetailList.get(i).getStoNum());
			orderDetail.put("ordPrice", formatOrdPrice);
			orderDetail.put("mordNum", orderDetailList.get(i).getMordNum());
			orderDetail.put("menuName", orderDetailList.get(i).getMenuName());
			orderDetail.put("menuPrice", formatMenuPrice);
			orderDetail.put("brandName", orderDetailList.get(i).getBrandName());
			orderDetail.put("stoName", orderDetailList.get(i).getStoName());

			orderDetailArr.add(orderDetail);

		}
		
		
		
		
		//리뷰테이블 조회하기
		ArrayList<Calendar> reviewList = calendarService.reviewList(map);
	
		obj.put("REV_CHECK", reviewList.size());
		
		
		
		// obj에 내가 쓴 글 넣기
		obj.put("orderDetailList", orderDetailArr);

		PrintWriter out = response.getWriter();

		out.print(obj);
		out.flush();
		out.close();

	}

	// 리뷰쓰기
	@RequestMapping(value = "review_done.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void review_done(HttpServletRequest request, HttpServletResponse response, String order_num, String sto_num,
			String rate, String textarea_review_content, MultipartFile files) throws IOException {

		response.setContentType("application/json;charset=utf-8");
		HttpSession session = request.getSession();
		
		
		System.out.println("-----------------------------");
		System.out.println("------------파일 체크 ----------");
		System.out.println(files);
		System.out.println("------------파일 체크 끝---------");
		System.out.println("-----------------------------");
		
		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("세션 유저 정보 : " + loginUser.toString());

		// 유저아이디
		String userId = loginUser.getId();

		System.out.println("주문번호" + order_num);
		System.out.println("매장번호" + sto_num);
		System.out.println("별점" + rate);
		System.out.println("리뷰내용" + textarea_review_content);
		System.out.println("이미지" + files);


		String renameFileName = "";
		if(files != null) {
			renameFileName = SaveFile.saveFile2(files, request);
		}
		
		// calendar.setRevPic(renameFileName);

		
		HashMap<String,String> map = new HashMap<>(); 
		map.put("Id", userId);
		map.put("order_num", order_num); 
		map.put("textarea_review_content",textarea_review_content); 
		map.put("renameFileName", renameFileName);
		map.put("rate", rate); map.put("sto_num", sto_num);
		
		 //주문내역 리뷰하기 (인서트) 
		int insertOrderReview = calendarService.insertOrderReview(map); 
		System.out.println("주문내역"+map);
	

		/*
		 * // 리뷰번호(최대값 조회하기) String searchRevNum = calendarService.searchRevNum();
		 * System.out.println("리뷰번호최대값"+searchRevNum);
		 */
		
		
		HashMap<String, String> map2 = new HashMap<>();
		map2.put("sto_num", sto_num);
		map2.put("rate", rate);
		//map2.put("searchRevNum", searchRevNum);
		System.out.println("-----ㅡMAP2---------");
		System.out.println(sto_num);
		System.out.println(rate);
		//System.out.println(searchRevNum);
		System.out.println(map2);

		
		// 스토어 리뷰하기(인서트)
		int insertStoreReview = calendarService.insertStoreReview(map2);
		System.out.println("스토어 " + map2);

		JSONObject resultObj = new JSONObject();
		resultObj.put("gg", "서엉공");

		PrintWriter out = response.getWriter();

		out.print(resultObj);
		out.flush();
		out.close();

	}

	

}
