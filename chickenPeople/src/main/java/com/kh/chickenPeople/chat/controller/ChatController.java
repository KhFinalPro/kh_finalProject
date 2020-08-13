package com.kh.chickenPeople.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
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
		ChattingRoom room_data = chatService.selectRoom_data(userId);
		
		String ChattingRoom_No =null;
		String Client_Name = null;
		String Client_Id = null;
		
			if(room_data==null) {
				int result = chatService.createRoom_no(userId);
				if(result>0) {
					ChattingRoom new_room_data = chatService.selectRoom_data(userId);
					new_room_data.setClient_id(userId);
					new_room_data.setClient_name(userName);
					
					ChattingRoom_No = new_room_data.getChattingRoom_no();
					Client_Id = new_room_data.getClient_id();
					Client_Name = new_room_data.getClient_name();
					System.out.println(ChattingRoom_No+"/"+Client_Id+"/"+Client_Name);
							
						
						
					session.setAttribute("room_no", ChattingRoom_No);
					session.setAttribute("client_Name", Client_Name);
					session.setAttribute("client_id", Client_Id);
					
					mv.setViewName("chat/chatInquiry");
						
					}
				}
		
			else {
				room_data.setClient_id(userId);
				room_data.setClient_name(userName);
				
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
	
	@RequestMapping(value="changeChatStatus.do", method=RequestMethod.GET)
	public String chageChatStatus (ModelAndView mv, HttpServletResponse response,		
										 @RequestParam(value="room_no", required=false) int room_no,
										 @RequestParam(value="userId", required=false)String userId,
										 @RequestParam(value="searchstatus", required=false)String searchStatus) {
		
		response.setContentType("text/html; charset=UTF-8");

		int updateResult = chatService.updateChatStatus(room_no);
		PrintWriter out;

		if(updateResult>0) {
			try {
				out = response.getWriter();
				out.println("<script>alert('답변이 마감되었습니다.'); location.href='systemAdminChat.do?userId=no&chat_status=N';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return null;
	}
	
}
