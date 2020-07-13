package com.kh.chickenPeople.brand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BrandController {
	
	
	@RequestMapping("/board.do")
	public String BoardListView(){
		
		
		return "board/boardListView";
		
	}	
}
