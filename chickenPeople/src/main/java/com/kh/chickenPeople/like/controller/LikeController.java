package com.kh.chickenPeople.like.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LikeController {
	
	
	 @RequestMapping("mypageLikes.do") 
	 public String mypageLikes() {
		 return "mypage/mypageLikes"; }
	 
}