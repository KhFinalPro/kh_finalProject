package com.kh.chickenPeople.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.member.model.service.MemberService;
import com.kh.chickenPeople.member.model.vo.Member;

@Controller
public class MemberController { 
	
	@Autowired
	MemberService mService;
	
	@RequestMapping("login.do")
	public ModelAndView loginMember(ModelAndView mv) {
		System.out.println("login.do");
		mv.setViewName("member/memberLogin");
		
		
		return mv;
	}
	
	@RequestMapping("doLogin.do")
	public String doLoginMember(Member m, HttpSession session) {
		System.out.println("doLogin.do");
		Member member = mService.loginMember(m);
		System.out.println(""+member);
		session.setAttribute("loginUser", member);
		
		return "home";
	}

}

