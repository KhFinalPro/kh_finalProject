package com.kh.chickenPeople.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.chat.model.vo.ChattingMsg;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;
import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

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

	public ArrayList<ChattingRoom> selectAllRoom_data(SearchStatus chatSearch, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectAllRoom_data",chatSearch,rowBounds);
	}

	public int saveMessage(ChattingMsg cr) {
		return sqlSessionTemplate.insert("chatMapper.insertMessage",cr);
	}

	public ArrayList<ChattingMsg> selectAllMsgData(String chattingRoom_no) {
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectAllMsg_data",chattingRoom_no);
	}

	public int getListCount(SearchStatus chatSearch) {
		return sqlSessionTemplate.selectOne("chatMapper.getListCount",chatSearch);
	}

	public ArrayList<Member> selectAllMember_data() {
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectAllMemberList");
	}

	public int updateChatStatus(int room_no) {
		return sqlSessionTemplate.update("chatMapper.updateChatStatus",room_no);
	}

}
