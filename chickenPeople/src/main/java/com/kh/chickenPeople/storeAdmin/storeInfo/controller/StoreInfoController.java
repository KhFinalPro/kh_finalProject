package com.kh.chickenPeople.storeAdmin.storeInfo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	
	
	@RequestMapping(value="modifyInfo.do")
	public ModelAndView modifyInfo(HttpServletResponse response,												
			 						HttpServletRequest request,
			 						ModelAndView mv, StoreInfo newInfo,
			 						@RequestParam(value="tel1")String tel1,
			 						@RequestParam(value="tel2")String tel2,
			 						@RequestParam(value="tel3")String tel3,
			 						@RequestParam(value="stoOpen")String stoOpen,
			 						@RequestParam(value="stoClose")String stoClose,
			 						@RequestParam(value="stoIntro")String stoIntro) {
		
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();

        Member loginUser = (Member) session.getAttribute("loginUser");  
        // 유저 아이디
        String userId = loginUser.getId();
        
		System.out.println("뭐받았늬"+tel1+"="+tel2+"="+tel3+"="+stoOpen+stoClose+stoIntro);
		
		String finalTel = tel1+"-"+tel2+"-"+tel3;
		//System.out.println(finalTel);
		
		newInfo.setUserId(userId);
		newInfo.setStoTel(finalTel);
		newInfo.setStoOpen(stoOpen);
		newInfo.setStoClose(stoClose);
		newInfo.setStoIntro(stoIntro);
		System.out.println("객체"+newInfo);
		
		int modifyInfo = storeInfoService.modifyInfo(newInfo);
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
		
		
		mv.addObject("userId",userId);
		mv.addObject("phone1",phone1);
		mv.addObject("phone2",phone2);
		mv.addObject("phone3",phone3);
		mv.addObject("storeInfoList",storeInfoList);
		mv.addObject("message", "성공적으로 수정되었습니다!");

	
		
		mv.setViewName("storeAdmin/storeInfo");
		
		return mv;
	
	
	}
	
	
}
