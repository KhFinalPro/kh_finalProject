package com.kh.chickenPeople.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.member.model.service.MemberService;
import com.kh.chickenPeople.member.model.vo.Address;
import com.kh.chickenPeople.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController { 
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	MemberService mService;
	
	@RequestMapping("loginView.do")
	public ModelAndView loginMember(ModelAndView mv) {
		System.out.println("login.do");
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	
	@RequestMapping("doLogin.do")
	public String doLoginMember(HttpServletRequest request, Member m, ModelAndView mv, HttpSession session) {
		System.out.println("doLogin.do");
		Member member = mService.loginMember(m);
		//로그인한 회원의 주소
		ArrayList<Address> addrList = mService.selectAddress(member);
		session = request.getSession();
		if(member != null)
		{
			System.out.println("로그인 성공!!");
			System.out.println(member.getId());
			session.setAttribute("loginUser",member);
			session.setAttribute("address", addrList);			
			
			return "redirect:/home.do";
		}
		
		return null;
	}
	
	
	
	@RequestMapping("logoutView.do")	// 로그아웃
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("memberJoinView.do")	// 회원가입 화면
	public ModelAndView memberJoin(ModelAndView mv) {
//		System.out.println("memberJoin.do");
		mv.setViewName("member/insertMember");
		
		return mv;
	}
	
	@RequestMapping("findIdView.do")	// 아이디찾기
	public ModelAndView findId(ModelAndView mv) {
//		System.out.println("findId.do");
		mv.setViewName("member/findId");
		
		return mv;
	}
	
	@RequestMapping("findPwdView.do")	// 비번찾기
	public ModelAndView findPwd(ModelAndView mv) {
//		System.out.println("findPwd.do");
		mv.setViewName("member/findPwd");
		
		return mv;
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="idChk.do", method=RequestMethod.POST)
	public int idChk(Member m) throws Exception{
		int result = mService.idChk(m);
		
		return result;
	}
	
	@RequestMapping("memberJoin.do")
	public String memberJoin(Member m, Model model,
							@RequestParam("post") String post,
							@RequestParam("addr1") String address1,
							@RequestParam("addr2") String address2) {
		
		Address addr = new Address(m.getId(), post, address1 + " " +address2);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		System.out.println(encPwd);
		
		
		
		m.setPwd(encPwd);
		
		int result = mService.memberJoin(m);
		
		if(result > 0) {
			return "redirect:/home.do";
		}else {
			
		}
		
		
		return "redirect:/home.do";
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

