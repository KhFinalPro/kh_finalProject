package com.kh.chickenPeople.bung.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.chickenPeople.bung.model.service.BungService;

@Controller
public class BungController {

	@Autowired
	BungService bungService;
	
	@RequestMapping("bungList.do")
	public String bungList() {
		System.out.println("bungList.do");
		
		return "bung/bungList";
	}
	
	@RequestMapping("bungDetail.do")
	public String bungDetail() {
		System.out.println("bungDetail.do");
		
		return "bung/bungDetail";
	}
	
}
