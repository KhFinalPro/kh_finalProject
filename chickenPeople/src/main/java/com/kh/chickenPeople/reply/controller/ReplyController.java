package com.kh.chickenPeople.reply.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.chickenPeople.reply.model.service.ReplyService;
import com.kh.chickenPeople.reply.model.vo.ReReply;
import com.kh.chickenPeople.reply.model.vo.Reply;

@Controller
public class ReplyController {

	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value="replyInsert.do", method=RequestMethod.POST)
	public void replyInsert(HttpServletResponse response, @ModelAttribute Reply r) throws IOException
	{
		response.setContentType("application/json;charset=utf-8");
		int result = 0;
		System.out.println("r : " + r);
		if(!r.getUser_id().isEmpty()) {
			result = replyService.replyInsert(r);
		}
		else {
			r.setUser_id("비회원");
			result = replyService.replyInsert(r);
		}
		
		JSONObject sendJson = new JSONObject();
		if(result > 0) {
			int currval = replyService.selectCurrval(r.getB_num());
			sendJson.put("currval", currval);
			sendJson.put("id", r.getUser_id());
		}
		else {
			sendJson.put("msg", "실패");
		}
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="reReplyInsert.do", method=RequestMethod.POST)
	public void reReplyInsert(HttpServletResponse response, @ModelAttribute ReReply r) throws IOException
	{
		response.setContentType("application/json;charset=utf-8");
		int result = 0;
		System.out.println(r);
		
		if(!r.getUser_id().isEmpty()) {
			result = replyService.reReplyInsert(r);
		}
		else {
			r.setUser_id("비회원");
			result = replyService.reReplyInsert(r);
		}
		
		JSONObject sendJson = new JSONObject();
		if(result > 0) {
//			int currval = replyService.selectReCurrval(r.getB_num());
			sendJson.put("msg", "성공");
			sendJson.put("id", r.getUser_id());
		}
		else {
			sendJson.put("msg", "실패");
		}
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="replyDel.do", method=RequestMethod.POST)
	public void replyDel(HttpServletResponse response, int rep1_num) throws IOException {
		System.out.println("댓글 삭제");
		int reReplyDelResult = replyService.reReplyDelResult(rep1_num);
		int replyDelResult = replyService.replyDelResult(rep1_num);
		
		PrintWriter out = response.getWriter();
		JSONObject sendJson = new JSONObject();
		
		sendJson.put("msg", "성공");
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="reReplyDel.do", method=RequestMethod.POST)
	public void reReplyDel(HttpServletResponse response, int rep2_num) throws IOException {
		System.out.println("댓글 삭제");
		int reReplyDelResult = replyService.reReReplyDelResult(rep2_num);
//		int replyDelResult = replyService.replyDelResult(rep1_num);
		
		PrintWriter out = response.getWriter();
		JSONObject sendJson = new JSONObject();
		
		sendJson.put("msg", "성공");
		out.print(sendJson);
		out.flush();
		out.close();
	}
}
