package com.kh.chickenPeople.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.board.model.exception.BoardException;
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
			
		}else {
			throw new NoticeException("게시판 목록보기 실패");
		}
		
		return mv;
	}
	
	

//	@RequestMapping(value="bdetail.do",method=RequestMethod.GET)
//	public ModelAndView boardDetail(ModelAndView mv, int bNum) {
//		
//		
//		//조회수
//		int result= boardService.addReadCount(bNum);
//		
//		if(result>0) {
//			Board board = boardService.selectOne(bNum);
//			System.out.println("b조회수"+board);
//			if(board !=null) {
//				mv.addObject("board",board);
//				mv.setViewName("board/boardDetailView");
//			}else {
//				throw new BoardException("게시판 조회 실패");
//			}
//		}else {
//			throw new BoardException(" 공지사항 조회수 증가 실패");
//		}
//		
//		return mv;
//		
//	}
//	
//	@RequestMapping("bInsertView.do")
//	public String boardInsertView () {
//		
//		return "board/boardInsertForm";
//	}
//
//	@RequestMapping(value="ninsert.do",method=RequestMethod.POST)
//	public String boardInsert(Board b, HttpServletRequest request) {
//		
//		int result = boardService.insertBoard(b);
//		
//		if(result>0) {
//			return "redirect:boardList.do";
//		}else {
//			throw new BoardException("게시판 등록 실패");
//		}
//	}
}
