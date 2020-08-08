package com.kh.chickenPeople.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.chat.model.dao.ChatDao;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao chatDao;
	@Override
	public ChattingRoom selectRoom_data(String loginUserName) {
		return chatDao.selectRoom_data(loginUserName);
	}

}
