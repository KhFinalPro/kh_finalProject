package com.kh.chickenPeople.message.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.message.model.vo.Message;

@Repository("msgDao")
public class MessageDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	

	public ArrayList<Message> sendMessageList(String userId) {
	
		ArrayList<Message> sendMessageList = new ArrayList<Message>();
		sendMessageList = (ArrayList)sqlSessionTemplate.selectList("messageMapper.sendMessageList",userId);
		
		
		return sendMessageList;
	}

	public ArrayList<Message> receiveMessageList(String userId) {
		
		ArrayList<Message> receiveMessageList = new ArrayList<Message>();
		receiveMessageList = (ArrayList)sqlSessionTemplate.selectList("messageMapper.receiveMessageList",userId);
		
		return receiveMessageList;
	}
	
	
}
