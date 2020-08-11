
package com.kh.chickenPeople.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.notice.model.exception.NoticeException;
import com.kh.chickenPeople.notice.model.service.NoticeService;
import com.kh.chickenPeople.notice.model.vo.Notice;
import com.kh.chickenPeople.reply.model.vo.Reply;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;


@Controller
public class NoticeController {
	
	@Autowired 
	NoticeService noticeService;
	 
	
//공지사항 목록 
	@RequestMapping("nList.do") 
	public ModelAndView noticeList(ModelAndView mv,
					@RequestParam(value="page",required=false) Integer page){
		
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		int listCount = noticeService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,5);
		ArrayList<Notice> selectTotalNoticeList = noticeService.selectNoticeList(pi);
		
		System.out.println("selectTotalNoticeList"+selectTotalNoticeList);
		
		if(selectTotalNoticeList!=null) 
		{
			mv.addObject("noticeList",selectTotalNoticeList);
			mv.addObject("pi",pi);
			mv.setViewName("notice/noticeListView");
		}
		else 
		{
			throw new NoticeException("공지사항 목록 보기 실패!");
		}
		return mv;		
	}

	
	
	//공지사항 상세
	@RequestMapping(value="ndetail.do", method=RequestMethod.GET)
	
	public ModelAndView boardDetail(ModelAndView mv, int nNum) {
	
		
		int result =noticeService.addReadCount(nNum);
		
		if(result >0) {
			Notice notice =noticeService.selectOne(nNum);
			System.out.println("조회수"+notice);
			
			if(notice !=null) {
				mv.addObject("notice",notice);
				
				mv.setViewName("notice/noticeDetailView");
			}else {
				throw new NoticeException("공지사항 조회 실패");
			}
		}else {
			throw new NoticeException("공지사항 조회수 증가 실패!");
		}
		
		return mv;
		
		
	}


	
	
	//-------------admin
	@RequestMapping("adminNoticeList.do")
	public ModelAndView adminNoticeList(ModelAndView mv, String msg,
			@RequestParam(value="page",required=false) Integer page) {
		
		
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		int listCount = noticeService.getAdminNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,7);
		ArrayList<Notice> selectTotalNoticeList = noticeService.selectAdminNoticeList(pi);
		
		if(!selectTotalNoticeList.isEmpty()) 
		{
			mv.addObject("noticeList",selectTotalNoticeList);
			mv.addObject("pi",pi);
			mv.setViewName("systemAdmin/systemAdminNotice");
		}
		
		return mv;
	}

	@RequestMapping("ndelete.do")
	public String noticeDelete(Model model, int nNum) {
		Notice n = noticeService.selectOne(nNum);
		
		int result =noticeService.deleteNotice(nNum);
		
		if(result>0) {
			
			model.addAttribute("msg", "성공");
			return "redirect:adminNoticeList.do"; 
		}else {
			return "systemAdmin/systemAdminNotice";
		}

	}
	
	//공지사항 글쓰기 
	@RequestMapping(value="nInsertView.do",method=RequestMethod.GET)
	public String nInsertView() { 
		
		
		return "systemAdmin/systemAdminNoticeCreate";
	}

	@RequestMapping(value="ninsert.do",method=RequestMethod.POST)
	public String noticeInsert(Notice n, HttpServletRequest request) {
	
		int result = noticeService.insertNotice(n);
		
		if(result >0) {
			return "redirect:adminNoticeList.do";
		}else {
			throw new NoticeException("공지사항 등록 실패");
		}
	}
	
//	//공지사항 수정 확인
//	@RequestMapping("nupView.do")
//	public String noticeUpdate(Model model,int nNum) { //이걸 보내려면 	location.href="nupView.do?nNum=${notice.nNum}";
//		model.addAttribute("notice",noticeService.selectOne(nNum));
//		
//		return "notice/noticeUpdateView";
//	}

	@RequestMapping("nupdate.do")
	public String noticeUpdate(HttpServletRequest request,Notice n) {
		System.out.println("업데이트"+n);
		
		int result = noticeService.updateNotice(n);
	
		if(result>0) {
			return "redirect:adminNoticeList.do";
		}else {
			throw new NoticeException("공지사항 수정 실패");
			
		}
	}
	
	//관리자 공지사항 상세
	@RequestMapping(value="adminNoticeDetail.do", method=RequestMethod.POST)
	public void adminNoticeDetail(HttpServletResponse response, int nNum) throws IOException {
		
		response.setContentType("application/json;charset=utf-8");
		
		JSONObject sendJson = new JSONObject();
		
		Notice notice =noticeService.selectOne(nNum);
		
		if(notice !=null) 
		{
			System.out.println(notice);
			sendJson.put("nNum", notice.getnNum());
			sendJson.put("title", notice.getnTitle());
			sendJson.put("date", notice.getnDate());
			sendJson.put("count", notice.getnCount());
			sendJson.put("content", notice.getnCont());
		}
		else 
		{
			throw new NoticeException("공지사항 조회 실패");
		}
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
}
