package com.kh.chickenPeople.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chickenPeople.chat.model.service.ChatService;
import com.kh.chickenPeople.chat.model.vo.ChattingMsg;

@Controller
public class EchoHandler extends TextWebSocketHandler{
		
	//List 사용
	private List<Map<String,Object>> sessionList = new ArrayList<Map<String,Object>>();
	
	@Autowired
	ChatService chatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws IOException {
		   Map<String,Object> sessionMap = session.getAttributes();
		   
		   String ChattingRoom_no = (String)sessionMap.get("room_no");
		   Map<String,Object> map = new HashMap<String,Object>();
		   
		   map.put("room_no", ChattingRoom_no);
		   map.put("session",session);
		   
		   sessionList.add(map);
		   
		   for(int i = 0; i<sessionList.size(); i++) {
			   Map<String,Object> temp = sessionList.get(i);
			   WebSocketSession sess = (WebSocketSession)temp.get("session");
			   
			   String userId = "member"+"|"+session.getAttributes().get("loginUserId");
			   ArrayList<ChattingMsg> beforeDate = chatService.selectAllMsgData(ChattingRoom_no);
			   
			   sess.sendMessage(new TextMessage(userId));
			   for(int j = 0 ; j < beforeDate.size(); j++) {
				   if(ChattingRoom_no.equals(beforeDate.get(j).getChattingRoom_no())) {
					   String beforeMsg = "msg"+"|"+beforeDate.get(j).getChattingRoom_no()+"|"+beforeDate.get(j).getTalker()+"|"+beforeDate.get(j).getChat_msg();
					   sess.sendMessage(new TextMessage(beforeMsg));					   
				   }
			   }
			   
		   }
		
	}
	
	 @Override
	 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		  ObjectMapper objectMapper = new ObjectMapper();
		  Map<String,String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

		  Map<String,Object> map = new HashMap<String, Object>();
		  
		  map.put("room_no",mapReceive.get("room_no"));
		  map.put("session",session);
		 
		   for(Map<String,Object> content : sessionList){
			   
			   String ChattingRoom_no = (String)content.get("room_no");
			   WebSocketSession sess = (WebSocketSession)content.get("session");
			   
			   if(ChattingRoom_no.equals(mapReceive.get("room_no"))) {
				   
				   String jsonStr = "msg"+"|"+ChattingRoom_no + "|"+ session.getAttributes().get("loginUserId") +"|"+mapReceive.get("msg");
				   
				   sess.sendMessage(new TextMessage(jsonStr));
				   
				   int result = chatService.saveMessage(jsonStr);
				   if (result>0) {
					   System.out.println("저장완료다 이녀석들아");
				   }
				   
			   }
	        }
	   }
	
	 
	 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		sessionList.remove(session);
		System.out.println("채팅방 퇴장");
	}
	

	
}
