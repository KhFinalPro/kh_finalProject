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

	public int replyDelResult(int rep1_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("replyMapper.replyDelResult", rep1_num);
	}

	public int reReplyDelResult(int rep1_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("replyMapper.reReplyDelResult", rep1_num);
	}

	public int reReReplyDelResult(int rep2_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("replyMapper.reReReplyDelResult", rep2_num);
	}
}
