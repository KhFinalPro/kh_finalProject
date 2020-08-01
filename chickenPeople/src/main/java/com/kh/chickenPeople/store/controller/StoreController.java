package com.kh.chickenPeople.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.store.model.service.StoreService;
import com.kh.chickenPeople.store.model.vo.Store;

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
		
		mv.addObject("storeList", storeList);
		mv.setViewName("store/storeOrderMain");
		return mv;
		
		
	} 
	

@RequestMapping("/order.do")
	public String orderPayController(){
			
			System.out.println("orderPaymentView 페이지 뿌리기!");
			return "store/orderPaymentView";
			
			
			
			
		}
}