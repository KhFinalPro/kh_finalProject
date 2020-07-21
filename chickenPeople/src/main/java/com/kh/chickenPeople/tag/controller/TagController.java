package com.kh.chickenPeople.tag.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.chickenPeople.tag.model.service.TagService;
import com.kh.chickenPeople.tag.model.vo.Tag;


@Controller
public class TagController {

	
	@Autowired
	TagService tagService;
	
	
	@RequestMapping(value="tag.do", method=RequestMethod.POST)
	public void tag(HttpServletResponse response, String tag_name) {
		System.out.println(tag_name);
		
		Tag t = tagService.selectTagNum(tag_name.trim());
		
		if(t != null) {
			
		}
		else {
			
		}
	}
}
