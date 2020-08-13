package com.kh.chickenPeople.reply.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.reply.model.vo.ReReply;
import com.kh.chickenPeople.reply.model.vo.Reply;

@Repository("replyDao")
public class ReplyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int replyInsert(Reply r) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("replyMapper.replyInsert", r);
	}

	public int reReplyInsert(ReReply r) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("replyMapper.reReplyInsert", r);
	}

	public int selectCurrval(int b_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("replyMapper.selectCurrval", b_num);
	}

	public ArrayList<Reply> selectReply(int bNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("replyMapper.selectReply", bNum);
	}

	public ArrayList<ReReply> selectReReply(int bNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("replyMapper.selectReReply", bNum);
	}

}
