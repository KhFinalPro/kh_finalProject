package com.kh.chickenPeople.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoradContoller {
	
	
	@RequestMapping("/board.do")
	public String boardListView(){
		System.out.println("boardListView 페이지 뿌리기!");
		
		return "board/boardListView";
		
	}	
}
