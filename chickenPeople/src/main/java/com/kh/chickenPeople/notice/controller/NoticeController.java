package com.kh.chickenPeople.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NoticeController {
	
	@RequestMapping("/nlist.do")
	public String noticeListView() {
		
		System.out.println("?");
		
		return "notice/noticeListView";
		
		
	} 
}
