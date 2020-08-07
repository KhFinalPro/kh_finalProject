package com.kh.chickenPeople.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class EchoHandler extends TextWebSocketHandler{
		
	//List 사용
	private List<Map<String,Object>> sessionList = new ArrayList<Map<String,Object>>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		   Map<String,Object> sessionMap = session.getAttributes();
		   System.out.println((String)sessionMap.get("room_no"));
		   
		   String ChattingRoom_no = (String)sessionMap.get("room_no");

		   Map<String,Object> map = new HashMap<String,Object>();
		   
		   map.put("room_no", ChattingRoom_no);
		   map.put("session",session);
		   
		   sessionList.add(map);
		  
		
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
				   
				   String jsonStr = ChattingRoom_no + "|"+ session.getAttributes().get("name") +"|"+mapReceive.get("msg");
				   System.out.println(jsonStr);
				   sess.sendMessage(new TextMessage(jsonStr));
				   
			   }
	        }
	   }
	
	 
	 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		
		System.out.println("채팅방 퇴장자: " + session.getPrincipal().getName());
		sessionList.remove(session);
	}
	
	@RequestMapping(value="chattingDB.do")
	public void goChattingDB(){
		
	}
	
}
