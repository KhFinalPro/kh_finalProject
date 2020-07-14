package com.kh.chickenPeople.message.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.message.model.dao.MessageDao;
import com.kh.chickenPeople.message.model.vo.Message;

@Service("msgService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDao msgDao;
	
	@Override
	public ArrayList<Message> selectList(){
		return msgDao.selectList();
	}
}
