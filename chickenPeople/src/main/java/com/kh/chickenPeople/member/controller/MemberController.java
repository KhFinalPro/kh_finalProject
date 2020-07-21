package com.kh.chickenPeople.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.member.model.service.MemberService;
import com.kh.chickenPeople.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController { 
	
//	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
//	
//	@Inject
//	BCryptPasswordEncoder pwdEncoder;
	
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
			
			return "redirect:/home.do";
		}
		
		return null;
	}
	
	
	
	@RequestMapping("logout.do")	// 로그아웃
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("memberJoin.do")	// 회원가입
	public ModelAndView memberJoin(ModelAndView mv) {
//		System.out.println("memberJoin.do");
		mv.setViewName("member/insertMember");
		
		return mv;
	}
	
	@RequestMapping("findId.do")	// 아이디찾기
	public ModelAndView findId(ModelAndView mv) {
//		System.out.println("findId.do");
		mv.setViewName("member/findId");
		
		return mv;
	}
	
	@RequestMapping("findPwd.do")	// 비번찾기
	public ModelAndView findPwd(ModelAndView mv) {
//		System.out.println("findPwd.do");
		mv.setViewName("member/findPwd");
		
		return mv;
	}
	// 회원가입post
//	@RequestMapping(value = "/register", method= RequestMethod.POST)
//	public String postRegister(Member m) throws Exception{
//		Logger.info("post register");
//		int result = mService.idChk(m);
//		try {
//			if(result ==1 ) {
//				return "/member/insertMember";
//			}else if(result==0) {
//				String inputPass = m.getUserPass();
//				String pwd = pwdEncoder.encode(inputPass);
//				m.setUserPass(pwd);
//				
//				mService.insertMember(m);
//			}
//				
//		}
//		
//	}
	

}

