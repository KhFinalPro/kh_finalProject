package com.kh.chickenPeople.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.chat.model.service.ChatService;

@Controller
public class ChatController {
//
//	@Autowired
//	ChatService chatService;
	
	@RequestMapping(value="chatting.do",method=RequestMethod.GET)
	public ModelAndView goChatting(ModelAndView mv,HttpSession session, String loginUserName) {
		System.out.println("ㅎㅇ");
		
//		ChattingRoom room_data = chatService.selectRoom_data(loginUserName);
//		System.out.println(room_data);
		String ChattingRoom_No =null;
		String Client_Name = null;
//		
//		if(room_data==null) {
//			int result = chatService.createRoom_no(loginUserName);			
//			if(result>0) {
//				ChattingRoom new_room_data = chatService.selectRoom_data(loginUserName);
				ChattingRoom_No = "1";
				Client_Name = "최상원";
//				
				session.setAttribute("room_no", ChattingRoom_No);
				session.setAttribute("client_Name", Client_Name);
//
				mv.setViewName("chattingPage");
//			}
//		}
//		else {
//			ChattingRoom_No = room_data.getChattingRoom_no();
//			Client_Name = room_data.getClient_name();
//			
//			session.setAttribute("room_no", ChattingRoom_No);
//			session.setAttribute("client_Name", Client_Name);
//			
//			mv.setViewName("chattingPage");
//		}
		return mv;
	}
	
}
