package com.kh.chickenPeople.orderStatus.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.orderStatus.model.service.OrderStatusService;
import com.kh.chickenPeople.orderStatus.model.vo.OrderStatus;

@Controller
public class OrderStatusController {

	@Autowired
	OrderStatusService orderStatusService;
	
	@RequestMapping("orderStatus.do")
	public ModelAndView orderStatus(ModelAndView mv, String id) {
		//최신 주문번호랑 주소 합계금액 처리상태 주문날짜
		ArrayList<OrderStatus> paymentList = orderStatusService.paymentInfoSelect(id);
		System.out.println("paymentList : " + paymentList);
		
		System.out.println("-------------------------------------------");
		//주문번호를 활용해서 메뉴 목록을 가져온다.
		ArrayList<OrderStatus> menuList = new ArrayList<>();
		if(!paymentList.isEmpty())
		{
			menuList = orderStatusService.menuInfoSelect(paymentList.get(0).getOrd_num());			
		}
		System.out.println("menuList : " + menuList);
		
		
		if(!paymentList.isEmpty())
		{
			mv.addObject("paymentList", paymentList.get(0));
			mv.addObject("menuList", menuList);
		}
		else
		{
			mv.addObject("msg", "텅!");
		}
		mv.setViewName("mypage/mypageOrderStatus");
		return mv;
	}
}
