package com.kh.chickenPeople.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	public int deleteMessage(HashMap<String, String> map) {
		
		return sqlSessionTemplate.delete("messageMapper.deleteMessage",map);
	}

	public int deleteRcvMessage(HashMap<String, String> map) {
		
		return sqlSessionTemplate.delete("messageMapper.deleteRcvMessage",map);
	}

	public ArrayList<Message> receiveMessageDetail(HashMap<String, String> map) {
		
		
		ArrayList<Message> receiveMessageDetail = new ArrayList<Message>();
		receiveMessageDetail = (ArrayList)sqlSessionTemplate.selectList("messageMapper.receiveMessageDetail",map);
		
		
		return receiveMessageDetail;
	}

	public int insertMessageDetail(HashMap<String, String> map) {
		
		return sqlSessionTemplate.insert("messageMapper.insertMessageDetail",map);
	}
	
	
	
}
