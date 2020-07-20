package com.kh.chickenPeople.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.notice.model.exception.NoticeException;
import com.kh.chickenPeople.notice.model.service.NoticeService;
import com.kh.chickenPeople.notice.model.vo.Notice;


@Controller
public class NoticeController {
	
	  @Autowired NoticeService nService;
	 
	
//공지사항 목록 
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
	
//공지사항 상세
@RequestMapping(value="ndetail.do", method=RequestMethod.GET)

public ModelAndView boardDetail(ModelAndView mv, int nNum) {

	
	int result =nService.addReadCount(nNum);
	
	if(result >0) {
		Notice notice =nService.selectOne(nNum);
		System.out.println("조회수"+notice);
		
		if(notice !=null) {
			mv.addObject("notice",notice)
			.setViewName("notice/noticeDetailView");
		}else {
			throw new NoticeException("게시글 조회 실패");
		}
	}else {
		throw new NoticeException("게시글 조회수 증가 실패!");
	}
	
	return mv;
	
	
}


//공지사항 글쓰기 
@RequestMapping(value="nInsertView.do",method=RequestMethod.GET)
public String nInsertView() { 
	
	
	return "notice/noticeInsertForm";
}

@RequestMapping(value="ninsert.do",method=RequestMethod.POST)
public String noticeInsert(Notice n, HttpServletRequest request) {

	int result = nService.insertNotice(n);
	
	if(result >0) {
		return "redirect:nlist.do";
	}else {
		throw new NoticeException("공지사항 등록 실패");
	}
}

/**/
	
	
}
