package com.kh.chickenPeople.reply.model.service;

import com.kh.chickenPeople.reply.model.vo.Reply;

public interface ReplyService {

	int replyInsert(Reply r);

	int reReplyInsert(Reply r);

	int selectCurrval(int b_num);

}
