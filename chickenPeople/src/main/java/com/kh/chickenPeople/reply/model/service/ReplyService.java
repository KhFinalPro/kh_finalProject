package com.kh.chickenPeople.reply.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.reply.model.vo.ReReply;
import com.kh.chickenPeople.reply.model.vo.Reply;

public interface ReplyService {

	int replyInsert(Reply r);

	int reReplyInsert(ReReply r);

	int selectCurrval(int b_num);

	ArrayList<Reply> selectReply(int bNum);

	ArrayList<ReReply> selectReReply(int bNum);

	int replyDelResult(int rep1_num);

	int reReplyDelResult(int rep1_num);

	int reReReplyDelResult(int rep2_num);

	int replyDelete(int bNum);

	int reReplyDelete(int bNum);

}
