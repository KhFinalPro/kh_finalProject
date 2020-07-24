package com.kh.chickenPeople.delivery.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.delivery.model.service.DeliveryService;
import com.kh.chickenPeople.delivery.model.vo.Delivery;

@Controller
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
	
	@RequestMapping("deliveryList.do")
	public ModelAndView selectDelivery(ModelAndView mv, String address) {
		System.out.println("address : " + address);
		//매장 정보 별점 포함
		ArrayList<Delivery> deliveryList = deliveryService.selectDelivery();
		
		if(!deliveryList.isEmpty())
		{
			mv.addObject("deliveryList", deliveryList);
			mv.setViewName("delivery/deliveryList");
		}
		
		
		return mv;
	}
}
