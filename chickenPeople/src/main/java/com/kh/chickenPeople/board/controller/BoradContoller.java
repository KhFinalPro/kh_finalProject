package com.kh.chickenPeople.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.board.model.service.BoardService;
import com.kh.chickenPeople.board.model.vo.Board;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.notice.model.exception.NoticeException;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Controller
public class BoradContoller {
	
	@Autowired 
	BoardService boardService;
	
	@RequestMapping("boardList.do")
	public ModelAndView boardList(ModelAndView mv,
						@RequestParam(value="page",required=false)Integer page) { 
		
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		int listCount = boardService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Board> selectTotalBoardList=boardService.selectTotalBoardList(pi);
		
		System.out.println("selectTotalBoardList"+selectTotalBoardList);
		
		if(selectTotalBoardList!=null) {
			mv.addObject("boardList",selectTotalBoardList);
			mv.addObject("pi",pi);
			mv.setViewName("board/boardListView");
			System.out.println(mv);
		}else {
			throw new NoticeException("게시판 목록보기 실패");
		}
		
		return mv;
	}

}
