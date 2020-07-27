package com.kh.chickenPeople.delivery.controller;

import java.util.ArrayList;
import java.util.Iterator;

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
		int store_count = 0;
		//사용자의 좌표를 split를 활용하여 위도와 경도롤 나눔
		String lat = address.split(" ")[0];
		String lng = address.split(" ")[1];
		double user_lat = Double.parseDouble(lat);
		double user_lng = Double.parseDouble(lng);
		//매장 정보 별점 포함 
		ArrayList<Delivery> deliveryList = deliveryService.selectDelivery();
		
		//2000m 미만인 매장을 담을 리스트
		ArrayList<Delivery> unRemove = new ArrayList<>();
		
		Iterator<Delivery> iter = deliveryList.iterator();
		while (iter.hasNext()) {
			Delivery d = iter.next();
		 
			double distance = distance(user_lat, user_lng, d.getSto_lat(), d.getSto_lng());
			//사용자와 매장의 거리가 2000m 미만이면 list에 담음
			if(distance < 2000.0)
			{
				d.setDistance_user(distance);
				unRemove.add(d);	
				store_count++;
			}
			
			
			//사용자와 거리 정렬을 위해 사용자와 매장의 거리를 계산한 결과를 Delivery객체 저장
		}
		
		//거리에 대해서 정렬
		//거리에 따라 확인
		if(!deliveryList.isEmpty())
		{
			mv.addObject("address", address);
			mv.addObject("count", store_count);
			mv.addObject("deliveryList", unRemove);
			mv.setViewName("delivery/deliveryList");
		}
		
		
		return mv;
	}
	
	private static double distance(double user_lat, double user_lng, double sto_lat, double sto_lng) {
		
		double theta = user_lng - sto_lng;
        double dist = Math.sin(deg2rad(user_lat)) * Math.sin(deg2rad(sto_lat)) + Math.cos(deg2rad(user_lat)) * Math.cos(deg2rad(sto_lat)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        
        dist = dist * 1609.344; 
 
        return (dist);
		
	}
	
	private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
}
