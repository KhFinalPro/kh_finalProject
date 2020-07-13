package com.kh.chickenPeople.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
		
	@RequestMapping("/payment.do")
	public String orderPayController(){
		
		System.out.println("orderPaymentView 페이지 뿌리기!");
		return "store/orderPaymentView";
		
		
		
		
	}
}
