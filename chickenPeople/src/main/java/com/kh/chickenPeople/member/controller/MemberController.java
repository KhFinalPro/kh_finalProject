package com.kh.chickenPeople.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.chickenPeople.member.model.service.MemberService;

@Controller
public class MemberController { // member bin 객체에 연결이 되는구나~
	
//	@Autowired 
	private MemberService mService; 
	
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request) {
		
		String id = request.getParameter("Id");
		String pwd =request.getParameter("pwd");
		
		System.out.println("ID"+id);
		System.out.println("PWD"+pwd);
		
		
		return "home";
		
	}
	
}
