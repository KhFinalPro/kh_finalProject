package com.kh.chickenPeople.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.chickenPeople.member.model.service.MemberService;
import com.kh.chickenPeople.member.model.vo.Member;

@Controller
public class MemberController { 
	@Autowired
	MemberService mService;
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(HttpSession session) {
		Member m = new Member("wj", "우정");
		
		session.setAttribute("loginUser", m);
		
//		application
//		session
//		request 
//		page
		
		return "home";
	}
}

