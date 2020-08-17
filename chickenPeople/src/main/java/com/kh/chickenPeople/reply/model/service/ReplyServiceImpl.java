package com.kh.chickenPeople.reply.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.reply.model.dao.ReplyDao;
import com.kh.chickenPeople.reply.model.vo.ReReply;
import com.kh.chickenPeople.reply.model.vo.Reply;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao replyDao;

	@Override
	public int replyInsert(Reply r) {
		// TODO Auto-generated method stub
		return replyDao.replyInsert(r);
	}

	@Override
	public int reReplyInsert(ReReply r) {
		// TODO Auto-generated method stub
		return replyDao.reReplyInsert(r);
	}

	@Override
	public int selectCurrval(int b_num) {
		// TODO Auto-generated method stub
		return replyDao.selectCurrval(b_num);
	}

	@Override
	public ArrayList<Reply> selectReply(int bNum) {
		// TODO Auto-generated method stub
		return replyDao.selectReply(bNum);
	}

	@Override
	public ArrayList<ReReply> selectReReply(int bNum) {
		// TODO Auto-generated method stub
		return replyDao.selectReReply(bNum);
	}

	@Override
	public int replyDelResult(int rep1_num) {
		// TODO Auto-generated method stub
		return replyDao.replyDelResult(rep1_num);
	}
	
	@Override
	public int reReplyDelResult(int rep1_num) {
		// TODO Auto-generated method stub
		return replyDao.reReplyDelResult(rep1_num);
	}

	@Override
	public int reReReplyDelResult(int rep2_num) {
		// TODO Auto-generated method stub
		return replyDao.reReReplyDelResult(rep2_num);
	}
}
