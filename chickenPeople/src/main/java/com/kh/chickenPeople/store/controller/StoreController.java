package com.kh.chickenPeople.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreController {
	
@RequestMapping("/orderMain.do")
public String storeOrderMain() {
		
		System.out.println("storeOrderMain 페이지 뿌리기!");
		
		return "store/storeOrderMain";
		
		
	} 
	

@RequestMapping("/order.do")
	public String orderPayController(){
			
			System.out.println("orderPaymentView 페이지 뿌리기!");
			return "store/orderPaymentView";
			
			
			
			
		}
@RequestMapping("/storeJoinForm.do")
	public ModelAndView storeJoin(ModelAndView mv) {
	System.out.println("storeJoinForm.do");
	mv.setViewName("store/storeJoin");
	
	return mv;
	
}

}