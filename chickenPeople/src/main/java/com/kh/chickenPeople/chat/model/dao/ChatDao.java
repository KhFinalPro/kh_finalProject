package com.kh.chickenPeople.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.chat.model.vo.ChattingMsg;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;

@Repository("chatDao")
public class ChatDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ChattingRoom selectRoom_data(String userId) {
		return sqlSessionTemplate.selectOne("chatMapper.selectRoom_data",userId);
	}

	public int createRoom_no(String userId) {
		return sqlSessionTemplate.insert("chatMapper.insertRoom_no",userId);
	}

	public ArrayList<ChattingRoom> selectAllRoom_data() {
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectAllRoom_data");
	}

	public int saveMessage(ChattingMsg cr) {
		return sqlSessionTemplate.insert("chatMapper.insertMessage",cr);
	}

	public ArrayList<ChattingMsg> selectAllMsgData(String chattingRoom_no) {
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectAllMsg_data",chattingRoom_no);
	}

}
