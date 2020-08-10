package com.kh.chickenPeople.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.chat.model.dao.ChatDao;
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

}
