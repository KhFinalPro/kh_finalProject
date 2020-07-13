package com.kh.chickenPeople.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	@RequestMapping("/orderMain.do")
	
public String storeOrderMain() {
		
		System.out.println("storeOrderMain 페이지 뿌리기!");
		
		return "store/storeOrderMain";
		
		
	} 
}