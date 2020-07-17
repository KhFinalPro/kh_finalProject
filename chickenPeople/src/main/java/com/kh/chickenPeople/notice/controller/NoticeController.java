package com.kh.chickenPeople.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String noticeDetail(Model model,int nNum, Notice n){
		
	System.out.println("게시판번호: "+nNum);
	n = nService.selectOne(nNum); //디비로부터 값을 가져온 것
	
	
	System.out.println("서블릿에서 n출력"+n);
	// DB로부터 조회해 온 n을 뷰로 보내주는 작업이 필요함
	model.addAttribute("notice",n); // 디비에서 가져온 값은 View에 뿌려주는것, 디비로 붙여온 객체에 이름을 달아주고 
	
	return "notice/noticeDetailView";

}

//공지사항 글쓰기 
/**/
	
	
}
