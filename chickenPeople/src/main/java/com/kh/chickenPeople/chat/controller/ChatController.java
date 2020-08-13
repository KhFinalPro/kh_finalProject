package com.kh.chickenPeople.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.chat.model.service.ChatService;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@RequestMapping(value="systemAdminChat.do", method=RequestMethod.GET)
	public ModelAndView systemAdminChat(ModelAndView mv, 
										SearchStatus chatSearch,
										HttpSession session,
										@RequestParam(value="userId",required=false)String userId,
										@RequestParam(value="chat_status",required=false)String chat_status,
										@RequestParam(value="page",required=false)Integer page) {
		
		int currentPage = 1;
		int listCount = 0;
		if(page!=null) {
			currentPage = page;
		}
		
		if(userId.contentEquals("no")) {
			userId=null;
			chatSearch.setSearchName(userId);
		}else {
			chatSearch.setSearchName(userId);
		}
		chatSearch.setSearchStatus(chat_status);
		
		listCount = chatService.getListCount(chatSearch);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<ChattingRoom> totalRoomData = chatService.selectAllRoom_data(chatSearch, pi);
		ArrayList<Member> totalMemberData = chatService.selectAllMember_data();
		
		
		if(totalRoomData!=null) {
			mv.addObject("totalRoomData",totalRoomData);
			mv.addObject("totalMemberData",totalMemberData);
			mv.addObject("pi",pi);
			mv.setViewName("chat/systemChatRoomList");
		}
		
		return mv;	
	}
	@RequestMapping(value="goChattingAdmin", method=RequestMethod.GET)
	public ModelAndView goChattingAdmin(ModelAndView mv, HttpSession session, 
										@RequestParam(value="room_no", required=false)String room_no, String loginUserName) {
		session.setAttribute("room_no",room_no);
		session.setAttribute("client_id", loginUserName);

		mv.setViewName("chat/chatInquiry");
		return mv;
	}
	@RequestMapping(value="chatting.do",method=RequestMethod.GET)
	public ModelAndView goChatting(ModelAndView mv,HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getId();
		String userName = loginUser.getName();
		System.out.println("이름출력"+userName);
		ArrayList<ChattingRoom> room_data = chatService.selectRoom_data(userId);
		System.out.println("룸 데이터"+room_data);
		
		String ChattingRoom_No =null;
		String Client_Name = null;
		String Client_Id = null;
		
		for(ChattingRoom chat : room_data) {
			if(room_data==null||chat.getChat_status().equals("Y")) {
				int result = chatService.createRoom_no(userId);
				if(result>0) {
					ArrayList<ChattingRoom> new_room_data = chatService.selectRoom_data(userId);
					System.out.println(new_room_data);
//					for(ChattingRoom newChat : new_room_data) {
//				
//						newChat.setClient_id(userId);
//						newChat.setClient_name(userName);
//						System.out.println(new_room_data);
//						ChattingRoom_No = newChat.getChattingRoom_no();
//						Client_Id = newChat.getClient_id();
//						Client_Name = newChat.getClient_name();
//						
//						System.out.println(ChattingRoom_No+"/"+Client_Id+"/"+Client_Name);
//						session.setAttribute("room_no", ChattingRoom_No);
//						session.setAttribute("client_Name", Client_Name);
//						session.setAttribute("client_id", Client_Id);
//						
//						mv.setViewName("chat/chatInquiry");
//						
//					}
				}
			}
//			else {
//				room_data.setClient_id(userId);
//				room_data.setClient_name(userName);
//				
//				ChattingRoom_No = room_data.getChattingRoom_no();
//				Client_Id = room_data.getClient_id();
//				Client_Name = room_data.getClient_name();
//				
//				session.setAttribute("room_no", ChattingRoom_No);
//				session.setAttribute("client_Name", Client_Name);
//				session.setAttribute("client_id", Client_Id);
//	
//				mv.setViewName("chat/chatInquiry");
//			}
			
		}
		return mv;
	}
	
}
