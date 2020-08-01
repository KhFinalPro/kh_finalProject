package com.kh.chickenPeople.Calendar.controller;

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

import com.kh.chickenPeople.Calendar.model.service.CalendarService;
import com.kh.chickenPeople.Calendar.model.vo.Calendar;
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
		
		//나의 주문내역 
		ArrayList<Calendar> orderList = calendarService.orderList(userId);
		
		
		//내가 주문한 매장 JSONArray로 만들기
		JSONArray orderArr = new JSONArray();
		for(int i=0; i<orderList.size(); i++) {
			JSONObject order = new JSONObject();
			
			order.put("ordNum", orderList.get(i).getOrdNum());
			order.put("ordDate",orderList.get(i).getOrdDate());
			
			orderArr.add(order);
			
		}
		System.out.println("주문 날짜+주문 번호"+orderArr);
		
		//obj에 내가 쓴 목록 넣기
		obj.put("orderList",orderArr);
		
		PrintWriter out = response.getWriter();
		
		out.print(obj);
		out.flush();
		out.close();
		
		
	}
	@RequestMapping(value="showOrderDetail.do",method = {RequestMethod.GET, RequestMethod.POST})
	public void showOrderDetail(HttpServletRequest request, HttpServletResponse response, String orderNo) throws IOException  {
		
		System.out.println(orderNo);
		
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("세션 유저 정보 : " + loginUser.toString());
		String userId = loginUser.getId();
		
		HashMap<String,String> map = new HashMap<>();
		map.put("Id",userId);
		map.put("orderNo", orderNo);
		
		JSONObject obj = new JSONObject();
		
		//주문내역 디테일
		ArrayList<Calendar> orderDetailList = calendarService.orderDetailList(map);
		
		//주문번호에 대한 ARRAY만들기
		JSONArray orderDetailArr = new JSONArray();
		for(int i=0;i<orderDetailList.size();i++) {
			JSONObject orderDetail = new JSONObject();
			
			orderDetail.put("ordNum", orderDetailList.get(i).getOrdNum());
			orderDetail.put("ordStatus", orderDetailList.get(i).getOrdStatus());
			orderDetail.put("ordDate", orderDetailList.get(i).getOrdDate());
			orderDetail.put("userId", orderDetailList.get(i).getUserId());
			orderDetail.put("stoNum",orderDetailList.get(i).getStoNum());
			orderDetail.put("ordPrice", orderDetailList.get(i).getOrdPrice());
			orderDetail.put("mordNum", orderDetailList.get(i).getMordNum());
			orderDetail.put("menuName", orderDetailList.get(i).getMenuName());
			orderDetail.put("menuPrice", orderDetailList.get(i).getMenuPrice());
			orderDetail.put("brandName", orderDetailList.get(i).getBrandName());
			orderDetail.put("stoName",orderDetailList.get(i).getStoName());
			
			orderDetailArr.add(orderDetail);
			
		}
		//obj에 내가 쓴 글 넣기
		obj.put("orderDetailList",orderDetailArr);
		
		PrintWriter out = response.getWriter();
		
		out.print(obj);
		out.flush();
		out.close();
	
	}
	
}
