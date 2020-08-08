package com.kh.chickenPeople.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.chat.model.vo.ChattingRoom;

@Repository("chatDao")
public class ChatDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ChattingRoom selectRoom_data(String loginUserName) {
		return null;
//		return sqlSessionTemplate.selectOne("chatMapper.");
	}

}
