package com.kh.chickenPeople.tag.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	public void tag(HttpServletResponse response, String tag_name) throws IOException {
		
		response.setContentType("application/json;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		Tag t = tagService.selectTagNum(tag_name.trim());
		
	
		JSONObject jobj = new JSONObject();
		
		
		if(t != null) {
			jobj.put("tag_num", t.getTag_num());
			jobj.put("tag_name", t.getTag_name());
			out.print(jobj);
			out.flush();
			out.close();
		}
		else {
			//tag 등록
			int result = tagService.insertTag(tag_name.trim());
			Tag t1 = tagService.selectTagNum(tag_name.trim());
			jobj.put("tag_num", t1.getTag_num());
			jobj.put("tag_name", t1.getTag_name());
			out.print(jobj);
			out.flush();
			out.close();
		}
		
	}
}
