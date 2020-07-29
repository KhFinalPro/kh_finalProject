package com.kh.chickenPeople.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.message.model.dao.MessageDao;
import com.kh.chickenPeople.message.model.vo.Message;

@Service("msgService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDao msgDao;
	
	

	@Override
	public ArrayList<Message> sendMessageList(String userId) throws Exception{
		
		return msgDao.sendMessageList(userId);
	}

	@Override
	public ArrayList<Message> receiveMessageList(String userId) throws Exception {
		
		return msgDao.receiveMessageList(userId);
	}

	@Override
	public int deleteMessage(HashMap<String, String> map) throws Exception {
		
		return msgDao.deleteMessage(map);
	}

	@Override
	public int deleteRcvMessage(HashMap<String, String> map) throws Exception {
		
		return msgDao.deleteRcvMessage(map);
	}

	@Override
	public ArrayList<Message> receiveMessageDetail(HashMap<String, String> map) {
		
		return msgDao.receiveMessageDetail(map);
	}

	@Override
	public int insertMessageDetail(HashMap<String, String> map) {
	
		return msgDao.insertMessageDetail(map);
	}
	
	
	
}
