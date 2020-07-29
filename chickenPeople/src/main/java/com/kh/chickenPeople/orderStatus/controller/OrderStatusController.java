package com.kh.chickenPeople.orderStatus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.orderStatus.model.service.OrderStatusService;

@Controller
public class OrderStatusController {

	@Autowired
	OrderStatusService orderStatusService;
	
	@RequestMapping("orderStatus.do")
	public String orderStatus() {
		
		return "mypage/mypageOrderStatus";
	}
}
