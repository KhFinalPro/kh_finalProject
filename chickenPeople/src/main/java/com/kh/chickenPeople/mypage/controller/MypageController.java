package com.kh.chickenPeople.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("mypageMain.do")
	 public String mypageMain() {
	     return "mypage/mypageMain";
	  }
}
