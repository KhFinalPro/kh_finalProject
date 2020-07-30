package com.kh.chickenPeople.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.message.model.vo.Message;

public interface MessageService {

	
	//발신메세지
	ArrayList<Message> sendMessageList(String userId) throws Exception;

	//수신메세지
	ArrayList<Message> receiveMessageList(String userId) throws Exception;

	//메세지 지우기
	int deleteMessage(HashMap<String, String> map) throws Exception;

	int deleteRcvMessage(HashMap<String, String> map) throws Exception;

	
	//모달 수신 메세지
	ArrayList<Message> receiveMessageDetail(HashMap<String, String> map);

	//모달 수신 메세지 답장하기
	int insertMessageDetail(HashMap<String, String> map);
	

}
