package com.kh.chickenPeople.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.notice.model.exception.NoticeException;
import com.kh.chickenPeople.notice.model.service.NoticeService;
import com.kh.chickenPeople.notice.model.vo.Notice;


@Controller
public class NoticeController {
	@Autowired
	NoticeService nService;
	
	

	@RequestMapping("nlist.do")
	public ModelAndView noticeList(ModelAndView mv){
		
		ArrayList<Notice> list = nService.selectList();
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.setViewName("notice/noticeListView");
			System.out.println(mv);
		}else {
			throw new NoticeException("공지사항 목록 보기 실패!");
		}
		return mv;		
	}
	
	
}
