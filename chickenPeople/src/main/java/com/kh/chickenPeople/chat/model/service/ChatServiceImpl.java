package com.kh.chickenPeople.chat.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.chat.model.dao.ChatDao;
import com.kh.chickenPeople.chat.model.vo.ChattingMsg;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;
import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

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
	public ArrayList<ChattingRoom> selectAllRoom_data(SearchStatus chatSearch,PageInfo pi) {
		return chatDao.selectAllRoom_data(chatSearch, pi);
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
	@Override
	public int getListCount(SearchStatus chatSearch) {
		return chatDao.getListCount(chatSearch);
	}
	@Override
	public ArrayList<Member> selectAllMember_data() {
		return chatDao.selectAllMember_data();
	}
	@Override
	public int updateChatStatus(int room_no) {
		return chatDao.updateChatStatus(room_no);
	}
	@Override
	public String selectPic(String userId) {
		return chatDao.selectPic(userId);
	}
	@Override
	public int updateReadStatus(Map<String, Object> readMsg) {
		return chatDao.udpateReadStatus(readMsg);
	}

}
