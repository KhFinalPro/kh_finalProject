package com.kh.chickenPeople.storeAdmin.storeInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.storeAdmin.storeInfo.model.service.StoreInfoService;
import com.kh.chickenPeople.storeAdmin.storeInfo.model.vo.StoreInfo;

@Controller
public class StoreInfoController {

	@Autowired
	StoreInfoService storeInfoService;
	
	/*
	 * @RequestMapping("storeInfo.do") public String storeInfo() { return
	 * "storeAdmin/storeInfo"; }
	 */
	
	@RequestMapping(value="storeInfo.do", method=RequestMethod.GET)
	public  ModelAndView storeInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		 response.setContentType("application/json;charset=utf-8");

	        HttpSession session = request.getSession();

	        Member loginUser = (Member) session.getAttribute("loginUser");
	       
	       // System.out.println("세션 유저 정보22222222 : " + loginUser.toString());
	        
	        // 유저 아이디
	        String userId = loginUser.getId();
	        
		    //TOP3메인메뉴
		    ArrayList<StoreInfo> storeInfoList = storeInfoService.storeInfoList(userId);
		    String tel = storeInfoList.get(0).getStoTel();
		    
		    String[] telArray = tel.split("-");
		    
		    String phone1="";
		    String phone2="";
		    String phone3="";
		    
		    for(int i=0; i<telArray.length;i++) {
		    	phone1 = telArray[0];
		    	phone2 = telArray[1];
		    	phone3 = telArray[2];
		    	
		    }
		    
		  
		request.setAttribute("storeInfoList", storeInfoList);
		
		
		mv.addObject("userId",userId);
		mv.addObject("phone1",phone1);
		mv.addObject("phone2",phone2);
		mv.addObject("phone3",phone3);
		
		
		mv.setViewName("storeAdmin/storeInfo");
		
		
		return mv;
	}
	
	
	@RequestMapping(value="modifyInfo.do",method=RequestMethod.POST)
	public void modifyInfo(HttpServletRequest request, HttpServletResponse response, String stoInfoNotice) throws IOException {
		 response.setContentType("application/json;charset=utf-8");

	        HttpSession session = request.getSession();

	        Member loginUser = (Member) session.getAttribute("loginUser");
	       
	       // System.out.println("세션 유저 정보22222222 : " + loginUser.toString());
	        System.out.println("에이작스 잘받았늬?"+stoInfoNotice);
	        // 유저 아이디
	        String userId = loginUser.getId();
	        
	        HashMap<String,String> map = new HashMap<>();
	        map.put("userId",userId);
	        map.put("stoInfoNotice",stoInfoNotice);
	        
	        int modifyInfo = storeInfoService.modifyInfo(map);
	        
	        JSONObject resultObj = new JSONObject();
			resultObj.put("gg", "서엉공");
			
			PrintWriter out = response.getWriter();
			
			out.print(resultObj);
			out.flush();
			out.close();
		
	        
	}
}
