
package com.kh.chickenPeople.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
//				System.out.println("zzz"+member.getId());
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
			SessionStatus session, 
			@RequestParam("pwd") String pwd,
			@RequestParam("orgPropic") String orgPropic,
			@RequestParam(value="propic", required=false) MultipartFile propic) throws IOException  {
		response.setContentType("text/html; charset=UTF-8");
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		System.out.println(m);
		System.out.println("프로픽은?" + propic.getOriginalFilename());
		int result = 0;
		
		
		m.setPwd(encPwd);
		
		if(!propic.getOriginalFilename().equals("")) {	// 파일 변경시
			
			System.out.println("오리진 파일 : " + propic.getOriginalFilename());
			
			String renameFileName =  SaveFile.saveFile3(propic, request);
			
			System.out.println(renameFileName);
			
			m.setPic(renameFileName);
			
		}else {	// 파일 변경 안할시
			m.setPic(orgPropic);
			
		}
		
		if(pwd.isEmpty()) {
			System.out.println("M"+ m);
			
			result = mService.noPwd(m);
			System.out.println("RESULT" + result);
			if(result > 0) {
				PrintWriter out;
				out = response.getWriter();
				out.println("<script>alert('정보수정 완료. 다시 로그인해주세요.'); location.href='home.do';</script>");
				out.flush();
				session.setComplete();
			}else {
				
			}
			
		}else {
			System.out.println("M"+ m);
			
			result = mService.mypageUpdate(m);
			
			System.out.println("RESULT" + result);
			if(result > 0) {
				PrintWriter out;
				out = response.getWriter();
				out.println("<script>alert('정보수정 완료. 다시 로그인해주세요.'); location.href='home.do';</script>");
				out.flush();
				session.setComplete();
			}else {
				
			}
			
			
		}
		return "redirect:/home.do";
		
	}
	
	
	
	@RequestMapping(value="findPwd.do", method=RequestMethod.GET)
	public void findPwd(ModelAndView mv, Member m, Member member, HttpServletResponse response,
			@RequestParam(value="id")String id,
			@RequestParam(value="email")String email) throws AddressException, MessagingException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		String host = "smtp.naver.com";
		final String userName = "kim0124_bb";
		final String password = "97ygmik!";
		int port = 465;
		
//		System.out.println(id);
//		System.out.println(email);
		
		m = mService.findPwd(id);
		System.out.println(m);
		if(m!=null && m.getEmail().equals(member.getEmail())) {
			
			String originPwd = randomPassword(7);
			String encPwd = bcryptPasswordEncoder.encode(originPwd);
			System.out.println(originPwd);
			System.out.println(encPwd);
			member.setId(id);
			member.setPwd(encPwd);
			
			
			int deletePwd = mService.deletePwd(member);
			
			if(deletePwd>0) {
			
			String recipient = email;
			String subject = "안녕하세요, 치킨의 민족입니다.";
			
			String body = "안녕하세요 "+m.getName()+"님 치킨의 민족입니다.\n"
					+ "임시 비밀번호를 보내드립니다.\n"
					+ "--------------------------------------------------------\n"
					+ "비밀번호:"+originPwd+"\n"
					+ "--------------------------------------------------------\n"
					+ "로그인하여 변경하셔 주십시오.\n";
			
			
			Properties props = System.getProperties();
			
			//SMTP 정보 설정
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
			
			//Session 생성
			Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
				String un = userName;
				String pw = password;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
					return new javax.mail.PasswordAuthentication(un,pw);
				}
			});
			session.setDebug(true);
			/**/
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("kim0124_bb@naver.com"));
			mimeMessage.setContent("<h1>hello</h1>","text/html");
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			Transport.send(mimeMessage);
			
			PrintWriter out;
			
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 이메일주소로 임시 비밀번호 발송 완료.'); location.href='home.do';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			}
		}else {
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('아이디와 이메일을 확인해주세요.'); location.href='findPwdView.do';</script>");
			out.flush();
		}
		
	}
	
	@RequestMapping(value="findId.do", method=RequestMethod.GET)
	public void findid(ModelAndView mv, Member m, HttpServletResponse response,
			@RequestParam(value="name")String name,
			@RequestParam(value="email")String email) throws AddressException, MessagingException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		String host = "smtp.naver.com";
		final String userName = "kim0124_bb";
		final String password = "97ygmik!";
		int port = 465;
		
		ArrayList<Member> member = mService.findId(m);
		
		System.out.println(member);
		
		if(!member.isEmpty()) {
			String recipient = email;
			String subject = "안녕하세요, 치킨의 민족입니다.";
			
			String body = "안녕하세요 "+member.get(0).getName()+"님 치킨의 민족입니다.\n"
					+ "요청하신 아이디는\n"
					+ "--------------------------------------------------------\n";
			for(int i = 0; i< member.size(); i++) {
				body+="아이디:"+member.get(i).getId()+"\n";
			}
					
			body+= "--------------------------------------------------------\n"
				+ "입니다.\n";
			
			
			
			
			Properties props = System.getProperties();
			
			//SMTP 정보 설정
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
			
			//Session 생성
			Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
				String un = userName;
				String pw = password;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
					return new javax.mail.PasswordAuthentication(un,pw);
				}
			});
			session.setDebug(true);
			/**/
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("kim0124_bb@naver.com"));
			mimeMessage.setContent("<h1>hello</h1>","text/html");
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			Transport.send(mimeMessage);
			
			PrintWriter out;
			
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 이메일주소로 아이디 발송 완료.'); location.href='home.do';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else {
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('이름과 이메일을 다시 확인해주세요.'); location.href='findIdView.do';</script>");
			out.flush();
		}
	}
	
	public String randomPassword(int length) {
		int index = 0; 
		char[] charset = new char[] {
			'1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f','g','h','i',
			'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
		
		StringBuffer sb = new StringBuffer();
		for(int i = 0 ;i<length;i++) {
			index = (int)(charset.length * Math.random());
			sb.append(charset[index]);
		}
		return sb.toString();
	}
	
	
	
	@RequestMapping("mypageAddress.do")
	public ModelAndView mypageAddress(ModelAndView mv, String id) {
		ArrayList<Address> myAddress = mService.myAdddress(id);
		
		mv.addObject("myAddress",myAddress);
		mv.setViewName("mypage/mypageAddress");
		
		return mv;
	}
	
	
	
	@RequestMapping("addAddress.do")
	public String addAddress(Member m, Model model,
							HttpSession session,
							@RequestParam("post") String post,
							@RequestParam("addr1") String address1,
							@RequestParam("addr2") String address2,
							@RequestParam("lat") String lat,
							@RequestParam("lng") String lng) {
		
		m.setId((String)session.getAttribute("loginUserId"));
		m.setPost_code(post);
		m.setAddress(address1+" "+address2);
		m.setLat(Double.parseDouble(lat));
		m.setLng(Double.parseDouble(lng));
		System.out.println("m은??????"+ m);
		int result = mService.addAddress(m);
		
		System.out.println("리저트는?"+result);
		if(result>0) {
			return "redirect:/mypageAddress.do?id="+(String)session.getAttribute("loginUserId");
		}else {
			return "redirect:/mypageAddress.do?id="+(String)session.getAttribute("loginUserId");
		}
	}
	
	
	@RequestMapping("deleteAddress.do")		// 컨트롤러에서 split 사용
	public String deleteAddress(String addr_num,
								HttpSession session) {
//		System.out.println(addr_num[0]);
//		System.out.println(addr_num[1]);
		
		String [] addr_array = addr_num.split(",");
		
		for(int i = 0 ;  i < addr_array.length;  i++) {
			int aa = Integer.parseInt(addr_array[i]);
			int result = mService.deleteAddress(aa);
		
		}
		
		return "redirect:/mypageAddress.do?id="+(String)session.getAttribute("loginUserId");
	}
	
	
	
	
	
	
	
	
}

