package com.kh.chickenPeople.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public void deleteMessage(HttpServletRequest request, HttpServletResponse response,
								String[] noArr) throws Exception {
		response.setContentType("application/json;charset=utf-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		
		//배열로 받은 에이작스 for문 돌려서 각 값 저장하기
		String deleteMsgNo = null;
		if(noArr!=null) {
			for(String msgNo : noArr) {
				System.out.println(msgNo);
				deleteMsgNo = msgNo;
				
				HashMap<String,String> map = new HashMap<>();
				map.put("Id", userId);
				map.put("deleteMsgNo", deleteMsgNo);
				
				
				//메세지 삭제하기
				int result = msgService.deleteMessage(map);
				deleteMsgNo="";
			}
		}
		
		JSONObject resultObj = new JSONObject();
		resultObj.put("gg", "서엉공");
		
		PrintWriter out = response.getWriter();
		
		out.print(resultObj);
		out.flush();
		out.close();
		
	}
	
	
	
		
	@RequestMapping(value="deleteRcvMessage.do",method =  RequestMethod.POST)
	public void deleteRcvMessage(HttpServletRequest request, HttpServletResponse response,
								String[] noArr) throws Exception {
		response.setContentType("application/json;charset=utf-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		
		
		System.out.println("잘 받은거니?"+noArr[0]);
		//배열로 받은 에이작스 for문 돌려서 각 값 저장하기
		String deleteMsgNo = null;
		if(noArr!=null) {
			for(String msgNo : noArr) {
				System.out.println(msgNo);
				deleteMsgNo = msgNo;
				
				HashMap<String,String> map = new HashMap<>();
				map.put("Id", userId);
				map.put("deleteMsgNo", deleteMsgNo);
				
				
				//메세지 삭제하기
				int result = msgService.deleteRcvMessage(map);
				deleteMsgNo="";
			}
		}
		
		JSONObject resultObj = new JSONObject();
		resultObj.put("gg", "서엉공");
		
		PrintWriter out = response.getWriter();
		
		out.print(resultObj);
		out.flush();
		out.close();
		
	}
	
	
	@RequestMapping(value="receiveMessageDetail.do",method=RequestMethod.POST)
	public void messageDetail(HttpServletRequest request, HttpServletResponse response, int msgNo) throws Exception  {
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getId();
		JSONObject obj = new JSONObject();
		
		//System.out.println("에이작스 받았니?"+msgNo);
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", userId);
		map.put("msgNo", String.valueOf(msgNo));
		
		ArrayList<Message> receiveMessageDetail = msgService.receiveMessageDetail(map);
		
		//System.out.println("모달 수신ㅁㅔ세지 쯀르륵"+receiveMessageDetail);
		
		JSONArray rDetailArr = new JSONArray();
		for(int i=0; i<receiveMessageDetail.size(); i++) {
			JSONObject rDetail = new JSONObject();
			rDetail.put("sendId", receiveMessageDetail.get(i).getSendId());
			rDetail.put("msgTitle", receiveMessageDetail.get(i).getMsgTitle());
			rDetail.put("msgContents",receiveMessageDetail.get(i).getMsgContents());
			rDetail.put("sendDate", receiveMessageDetail.get(i).getSendDate());
			rDetail.put("msgStatus",receiveMessageDetail.get(i).getMsgStatus());
		
			rDetailArr.add(rDetail);
		}
		obj.put("receiveMessageDetail", rDetailArr);
		
		PrintWriter out = response.getWriter();
		
		out.print(obj);
		out.flush();
		out.close();
		
	}
	
	@RequestMapping(value="insertMessageDetail.do",method=RequestMethod.POST)
	public void insertMessageDetail(HttpServletRequest request, HttpServletResponse response, String modal_reply_sendId,String modal_reply_title,String modal_reply_content) throws IOException {
		
		
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getId();
		JSONObject obj = new JSONObject();
		
		
		//System.out.println("답장 에이작스 받았니?"+modal_reply_sendId+modal_reply_title+modal_reply_content);
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", userId);
		map.put("modal_reply_sendId", modal_reply_sendId );
		map.put("modal_reply_title", modal_reply_title);
		map.put("modal_reply_content",modal_reply_content);
		
		
		
		//모달 수신메세지 답장하기(인서트)
		int insertMessageDetail = msgService.insertMessageDetail(map);
		
		
		JSONObject resultObj = new JSONObject();
		resultObj.put("gg", "서엉공");
		
		PrintWriter out = response.getWriter();
		
		out.print(resultObj);
		out.flush();
		out.close();
		
	}
	
	
}


