package com.kh.chickenPeople.message.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.message.model.vo.Message;

public interface MessageService {

	
	//발신메세지
	ArrayList<Message> sendMessageList(String userId) throws Exception;

	//수신메세지
	ArrayList<Message> receiveMessageList(String userId) throws Exception;;
	

}
