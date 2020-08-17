package com.kh.chickenPeople.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.kh.chickenPeople.common.SaveFile;
import com.kh.chickenPeople.common.SessionConfig;
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
	public String doLoginMember(Member m, Model model, HttpServletRequest request, HttpSession session, 
							    RedirectAttributes rttr) {
		
		
		Member member = mService.loginMember(m);
		ArrayList<Address> addrList = mService.selectAddress(member);
		System.out.println(m);
		

		if(member==null) {
			model.addAttribute("msg", "아이디가 틀렸습니다.");

			return "redirect:/loginView.do";
		}else {
			if(bcryptPasswordEncoder.matches(m.getPwd(), member.getPwd())) {
				session.setAttribute("loginUser", member);
				session.setAttribute("address", addrList);
				session.setAttribute("loginUserId",member.getId());
//				System.out.println("dddd"+session.getAttribute("loginUserId"));
//				System.out.println("zzz"+member.getId());
				String userId = SessionConfig.getSessionidCheck("loginUserId", member.getId());
//				System.out.println("튕겨나온거 : " + userId);
				
				return "redirect:/home.do";
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
							HttpServletRequest request,
							HttpServletResponse response,
							@RequestParam("post") String post,
							@RequestParam("addr1") String address1,
							@RequestParam("addr2") String address2,
							@RequestParam("lat") String lat,
							@RequestParam("lng") String lng,
							@RequestParam(value="propic", required=false) MultipartFile propic) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		System.out.println(m);
		System.out.println(propic);
		System.out.println(post);
		System.out.println(address1);
		System.out.println(address2);
		
		
		
		m.setPwd(encPwd);
		m.setPost_code(post);
		m.setAddress(address1+" "+address2);
		m.setLat(Double.parseDouble(lat));
		m.setLng(Double.parseDouble(lng));
		
		
		if(!propic.getOriginalFilename().equals("")) {	// 파일이 잘 넘어온 경우
			
			System.out.println("오리진 파일 : " + propic.getOriginalFilename());
			
			String renameFileName =  SaveFile.saveFile3(propic, request);
			
			System.out.println(renameFileName);
			
			m.setPic(renameFileName);
			
		}
		
		int result = mService.memberJoin(m);
		System.out.println(m);
		
		
		if(result > 0) {
			return "redirect:/home.do";
		}else {
			
		}
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("agreement.do")	// 이용약관 상세
	public ModelAndView agreement(ModelAndView mv) {
//		System.out.println("memberJoin.do");
		mv.setViewName("member/agreement");
		
		return mv;
	}
	
	@RequestMapping("agreement2.do")	// 이용약관 상세
	public ModelAndView agreement2(ModelAndView mv) {
//		System.out.println("memberJoin.do");
		mv.setViewName("member/agreement2");
		
		return mv;
	}
	
	@RequestMapping("mypageInfo.do")
	public ModelAndView mypageInfo(ModelAndView mv) {
		mv.setViewName("mypage/mypageInfo");
		
		return mv;
	}
	
	@RequestMapping("mypageUpdate.do")
	public String mypageUpdate(Member m, Model model,
								HttpServletRequest request,
								HttpServletResponse response,
								@RequestParam(value="propic", required=false) MultipartFile propic)  {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		System.out.println(m);
		System.out.println(propic);
		
		
		
		m.setPwd(encPwd);
		
		
		if(!propic.getOriginalFilename().equals("")) {	// 파일이 잘 넘어온 경우
			
			System.out.println("오리진 파일 : " + propic.getOriginalFilename());
			
			String renameFileName =  SaveFile.saveFile3(propic, request);
			
			System.out.println(renameFileName);
			
			m.setPic(renameFileName);
			
		}
		
		
		int result = mService.mypageUpdate(m);

		
		if(result > 0) {
			return "redirect:/home.do";
		}else {
			
		}
		
		return "redirect:/home.do";
		
	}
	
	
		
	
	

}


