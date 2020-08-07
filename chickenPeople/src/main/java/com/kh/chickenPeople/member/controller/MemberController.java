package com.kh.chickenPeople.member.controller;

import java.io.IOException;
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

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
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
	public ModelAndView loginMember(ModelAndView mv, String msg) {
		System.out.println("login.do");
		mv.setViewName("member/memberLogin");
		
		if(msg == null){
			return mv;
		}else {
			mv.addObject("msg", msg);
			System.out.println(msg);
			return mv;
		}
		
	}
	
	
	@RequestMapping(value="doLoginView.do", method=RequestMethod.POST)
	public String doLoginMember(Member m, Model model, HttpServletRequest request, HttpSession session) {
		
		//아이디를 잘못 입력후 로그인시 nullpointerException발생 해결해야함/
		Member member = mService.loginMember(m);
		ArrayList<Address> addrList = mService.selectAddress(member);
		
		if(member==null) {
			model.addAttribute("msg", "아이디가 틀렸습니다.");
			return "redirect:/loginView.do";
		}else {
			if(bcryptPasswordEncoder.matches(m.getPwd(), member.getPwd())) {
			session.setAttribute("loginUser", member);
			session.setAttribute("address", addrList);
			return "redirect:/loginHome.do?id="+member.getId();
			}else {
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/loginView.do";
			}
		} 
		
		
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
	public int idChk(Member m) throws Exception {
		int result = mService.idChk(m);
		
		return result;
	}
	
	@RequestMapping("memberJoin.do")
	public String memberJoin(Member m, Model model,
							@RequestParam("post") String post,
							@RequestParam("addr1") String address1,
							@RequestParam("addr2") String address2,
							@RequestParam("lat") String lat,
							@RequestParam("lng") String lng) {
		
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		System.out.println(post);
		System.out.println(address1);
		System.out.println(address2);
		
		
		
		m.setPwd(encPwd);
		m.setPost_code(post);
		m.setAddress(address1+" "+address2);
		m.setLat(Double.parseDouble(lat));
		m.setLng(Double.parseDouble(lng));
		int result = mService.memberJoin(m);

		
		if(result > 0) {
			return "redirect:/home.do";
		}else {
			
		}
		
		return "redirect:/home.do";
	}
	
	
	
	

}


