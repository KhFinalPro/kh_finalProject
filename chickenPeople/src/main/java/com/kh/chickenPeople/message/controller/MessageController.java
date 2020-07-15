package com.kh.chickenPeople.message.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.message.model.exception.MessageException;
import com.kh.chickenPeople.message.model.service.MessageService;
import com.kh.chickenPeople.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	MessageService msgService;
	

	
	@RequestMapping("msgList.do")
	public ModelAndView msgList(ModelAndView mv) {
		
		ArrayList<Message> list = msgService.selectList();
		//System.out.println("�޼��� ����Ʈ :"+list);
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.setViewName("mypage/mypageMessage");
		}else {
			throw new MessageException("�޼��� �ҷ����� ����!");
		}
		
		return mv;
		
	}

}
