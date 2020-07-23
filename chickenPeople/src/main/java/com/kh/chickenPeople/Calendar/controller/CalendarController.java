package com.kh.chickenPeople.Calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CalendarController {

	
	@RequestMapping("calender.do")
	public String calender() {
		
		return "mypage/mypageCalender";
		
	}
	
	
}
