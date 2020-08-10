package com.kh.chickenPeople.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.chat.model.service.ChatService;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;
import com.kh.chickenPeople.member.model.vo.Member;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@RequestMapping(value="systemAdminChat.do", method=RequestMethod.GET)
	public ModelAndView systemAdminChat(ModelAndView mv, HttpSession session) {
		ArrayList<ChattingRoom> totalRoomData = chatService.selectAllRoom_data();
		
		System.out.println(totalRoomData);
		if(totalRoomData!=null) {
			mv.addObject("totalRoomData",totalRoomData);
			mv.setViewName("chat/systemChatInquiry");
		}
		
		return mv;	
	}
	@RequestMapping(value="chatting.do",method=RequestMethod.GET)
	public ModelAndView goChatting(ModelAndView mv,HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		ChattingRoom room_data = chatService.selectRoom_data(userId);
		
		System.out.println("체크"+room_data);
		String ChattingRoom_No =null;
		String Client_Name = null;
		String Client_Id = null;
		
		if(room_data==null) {
			int result = chatService.createRoom_no(userId);
			
			if(result>0) {
				ChattingRoom new_room_data = chatService.selectRoom_data(userId);
				ChattingRoom_No = new_room_data.getChattingRoom_no();
				Client_Id = new_room_data.getClient_id();
				Client_Name = new_room_data.getClient_name();
				
				session.setAttribute("room_no", ChattingRoom_No);
				session.setAttribute("client_Name", Client_Name);
				session.setAttribute("client_id", Client_Id);

				mv.setViewName("chat/chatInquiry");
			}
		}
		else {
			ChattingRoom_No = room_data.getChattingRoom_no();
			Client_Id = room_data.getClient_id();
			Client_Name = room_data.getClient_name();
			
			session.setAttribute("room_no", ChattingRoom_No);
			session.setAttribute("client_Name", Client_Name);
			session.setAttribute("client_id", Client_Id);

			mv.setViewName("chat/chatInquiry");
		}
		return mv;
	}
	
}
