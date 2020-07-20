package com.kh.chickenPeople.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.member.model.service.MemberService;
import com.kh.chickenPeople.member.model.vo.Member;

@SessionAttributes("loginUser")

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
	public String doLoginMember(HttpServletRequest request, Member m, ModelAndView mv, HttpSession session) {
		System.out.println("doLogin.do");
		Member member = mService.loginMember(m);
		session = request.getSession();
		if(member != null)
		{
			System.out.println("로그인 성공!!");
			System.out.println(member.getId());
			session.setAttribute("loginUser",member);
			
		}
		
		return "redirect:/home.do";
	}
	
	
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "redirect:/home.do";
	}

}

