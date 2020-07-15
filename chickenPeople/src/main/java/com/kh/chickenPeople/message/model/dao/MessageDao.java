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

	public ArrayList<Message> selectList() {
		
		ArrayList list = new ArrayList();
		
		list = (ArrayList)sqlSessionTemplate.selectList("messageMapper.selectList");
		
		
		return list;
	}
	
	
}
