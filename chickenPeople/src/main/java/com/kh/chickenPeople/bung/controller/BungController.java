package com.kh.chickenPeople.bung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BungController {

	@RequestMapping("bungList.do")
	public String bungList() {
		System.out.println("bungList.do");
		return "bung/bungList";
	}
}
