package com.kh.chickenPeople.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.common.DeliveryComparator;
import com.kh.chickenPeople.delivery.model.service.DeliveryService;
import com.kh.chickenPeople.delivery.model.vo.Delivery;

@Controller
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
	@RequestMapping("deliverView.do")
	public ModelAndView delivery(ModelAndView mv, String latlng, String address) {
		
		mv.addObject("latlng", latlng);
		mv.addObject("address", address);
		mv.setViewName("delivery/deliveryList");
		return mv;
	}
	
	@RequestMapping("deliveryList.do")
	public ModelAndView selectDelivery(ModelAndView mv, String latlng, String address) {
		int store_count = 0;
		
		System.out.println(latlng);
		//사용자의 좌표를 split를 활용하여 위도와 경도롤 나눔
		String lat = latlng.split(" ")[0];
		String lng = latlng.split(" ")[1];
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
			mv.addObject("latlng", latlng);
			mv.addObject("address", address);
			mv.addObject("count", store_count);
			mv.addObject("deliveryList", unRemove);
			mv.setViewName("delivery/deliveryList");
		}
		
		
		return mv;
	}
	
	//딜리버리 카테고리 ajax
	@RequestMapping(value="ajaxDeliveryList.do", method=RequestMethod.POST)
	public void ajaxDeliveryList(HttpServletResponse  response, String latlng, String address, String store_category) throws IOException
	{
		response.setContentType("application/json;charset=utf-8");
		int store_count = 0;
		System.out.println(latlng + " , " + store_category);
		String lat = latlng.split(" ")[0];
		String lng = latlng.split(" ")[1];
		double user_lat = Double.parseDouble(lat);
		double user_lng = Double.parseDouble(lng);
		
		ArrayList<Delivery> unRemove = new ArrayList<>();
		ArrayList<Delivery> tempList = new ArrayList<>();
		JSONArray jarr = new JSONArray();
		
		JSONObject sendJson = new JSONObject();
		
		PrintWriter out = response.getWriter();
		
		//거리
		if(store_category.equals("distance"))
		{
			ArrayList<Delivery> deliveryList = deliveryService.selectBestDelivery();
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
			}

			//거리순으로 다시 정렬
			DeliveryComparator comp = new DeliveryComparator();
			Collections.sort(unRemove, comp);
			for(Delivery d : unRemove)
			{
				JSONObject jobj = new JSONObject();
				jobj.put("sto_num",d.getSto_num());
				jobj.put("sto_name", d.getSto_name());
				jobj.put("brand_pic", d.getBrand_pic());
				jobj.put("rev_rate", d.getRev_rate());
				jobj.put("ord_limit", d.getOrd_limit());
				jobj.put("distance_user", d.getOrd_limit());
				jarr.add(jobj);
				
			}
			
			sendJson.put("latlng", latlng);
			sendJson.put("address", address);
			sendJson.put("count", store_count);
			sendJson.put("deliveryList", jarr);

			out.print(sendJson);
			out.flush();
			out.close();
		}
		//인기 매장 정보 별점 포함 
		else if(store_category.equals("good"))
		{
			
			ArrayList<Delivery> deliveryList = deliveryService.selectBestDelivery();
			Iterator<Delivery> iter = deliveryList.iterator();
			while (iter.hasNext()) {
				
				JSONObject jobj = new JSONObject();
				Delivery d = iter.next();
			 
				double distance = distance(user_lat, user_lng, d.getSto_lat(), d.getSto_lng());
				//사용자와 매장의 거리가 2000m 미만이면 list에 담음
				if(distance < 2000.0)
				{
					d.setDistance_user(distance);
					store_count++;
					jobj.put("sto_num",d.getSto_num());
					jobj.put("sto_name", d.getSto_name());
					jobj.put("brand_pic", d.getBrand_pic());
					jobj.put("rev_rate", d.getRev_rate());
					jobj.put("ord_limit", d.getOrd_limit());
					jarr.add(jobj);
				}
			}
			sendJson.put("latlng", latlng);
			sendJson.put("address", address);
			sendJson.put("count", store_count);
			sendJson.put("deliveryList", jarr);

			out.print(sendJson);
			out.flush();
			out.close();
		}	
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
