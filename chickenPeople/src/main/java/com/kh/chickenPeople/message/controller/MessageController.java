package com.kh.chickenPeople.message.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.message.model.service.MessageService;
import com.kh.chickenPeople.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	MessageService msgService;
	

	
	@RequestMapping(value="msgList.do",method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView msgList(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) throws Exception {
		
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("세션 유저 정보 : " + loginUser.toString());
		// 유저 아이디
		String userId = loginUser.getId();
		
		
		//발신 메세지 목록
		ArrayList<Message> sendMessageList = msgService.sendMessageList(userId);
		
		//수신 메세지 목록
		ArrayList<Message> receiveMessageList = msgService.receiveMessageList(userId);
		
		mv.addObject("sendMessageList",sendMessageList);
		mv.addObject("recieveMessageList",receiveMessageList);
		mv.setViewName("mypage/mypageMessage");
		
		return mv;
		
	}
	
	
	@RequestMapping(value="selectMessageList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public void selectMessageList(HttpServletRequest request, HttpServletResponse response, String type) throws Exception{
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("세션 유저 정보 : " + loginUser.toString());
		
		
		// 유저 아이디
		String userId = loginUser.getId();
		
		JSONObject obj = new JSONObject();
		
		/*******발신 메세지 *********/
		ArrayList<Message> sendMessageList = msgService.sendMessageList(userId);
		
		// 내 발신 메세지 JSONArray 만들기
		JSONArray sendMessageArr = new JSONArray();
		for(int i=0; i<sendMessageList.size(); i++) {
			JSONObject sendMessage = new JSONObject();
			
			sendMessage.put("msgNo",sendMessageList.get(i).getMsgNo());
			sendMessage.put("rcvId", sendMessageList.get(i).getRcvId());
			sendMessage.put("msgTitle", sendMessageList.get(i).getMsgTitle());
			sendMessage.put("msgContents",sendMessageList.get(i).getMsgContents());
			sendMessage.put("sendDate", sendMessageList.get(i).getSendDate());
			sendMessage.put("msgStatus", sendMessageList.get(i).getMsgStatus());
			
			sendMessageArr.add(sendMessage);
			
		}
		//오브젝트에 발신메세지 JSONArray 넣기
		obj.put("sendMessageList",sendMessageArr );
		
		
		
		/*********수신 메세지 **********/
		ArrayList<Message> receiveMessageList = msgService.receiveMessageList(userId);
		
		//내 수신 메세지 JSONArray만들기
		JSONArray receiveMessageArr = new JSONArray();
		for(int i=0; i<receiveMessageList.size(); i++) {
			JSONObject receiveMessage= new JSONObject();
			
			receiveMessage.put("msgNo",receiveMessageList.get(i).getMsgNo());
			receiveMessage.put("sendId", receiveMessageList.get(i).getSendId());
			receiveMessage.put("msgTitle",receiveMessageList.get(i).getMsgTitle());
			receiveMessage.put("msgContents", receiveMessageList.get(i).getMsgContents());
			receiveMessage.put("sendDate", receiveMessageList.get(i).getSendDate());
			receiveMessage.put("msgStatus",receiveMessageList.get(i).getMsgStatus());
			
			receiveMessageArr.add(receiveMessage);
			
		}
		//오브젝트에 수신메시지 JSONArray 넣기
		obj.put("receiveMessageList",receiveMessageArr);
		
		PrintWriter out = response.getWriter();

		out.print(obj);
		out.flush();
		out.close();
			
	}
	
	
	
	@RequestMapping(value="deleteMessage.do",method =  RequestMethod.POST)
	public void deleteMessage( HttpServletResponse response,
								String[] noArr) {
		response.setContentType("application/json;charset=utf-8");
		
		//System.out.println(noArr[0]);
		
		for(String msgNo : noArr) {
			System.out.println(msgNo);
			
		}
	}
}


