package com.kh.chickenPeople.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.chat.model.dao.ChatDao;
import com.kh.chickenPeople.chat.model.vo.ChattingMsg;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao chatDao;
	@Override
	public ChattingRoom selectRoom_data(String userId) {
		return chatDao.selectRoom_data(userId);
	}
	@Override
	public int createRoom_no(String userId) {
		return chatDao.createRoom_no(userId);
	}
	@Override
	public ArrayList<ChattingRoom> selectAllRoom_data() {
		return chatDao.selectAllRoom_data();
	}
	@Override
	public int saveMessage(String jsonStr) {

		System.out.println(jsonStr);
		String[] arr = jsonStr.split("\\|");
		
		String room_no = arr[1];
		String talker = arr[2];
		String message = arr[3];
		
		ChattingMsg cr = new ChattingMsg();
		cr.setChattingRoom_no(room_no);
		cr.setTalker(talker);
		cr.setChat_msg(message);
		
		return chatDao.saveMessage(cr);
	}
	@Override
	public ArrayList<ChattingMsg> selectAllMsgData(String chattingRoom_no) {
		return chatDao.selectAllMsgData(chattingRoom_no);
	}

}
