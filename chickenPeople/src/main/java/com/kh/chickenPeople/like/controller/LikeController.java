package com.kh.chickenPeople.like.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.like.model.exception.LikeException;
import com.kh.chickenPeople.like.model.service.LikeService;
import com.kh.chickenPeople.like.model.vo.Like;



@Controller
public class LikeController {
	
	@Autowired
	LikeService likeService;
	
	 
		@RequestMapping("storeLikeList.do")
		public ModelAndView storeLikeList(ModelAndView mv) {
			
			ArrayList<Like> list = likeService.selectList();
			System.out.println("���� ���� ����Ʈ :"+list);
			
			if(!list.isEmpty()) {
				mv.addObject("list",list);
				mv.setViewName("mypage/mypageLikes");
			}else {
				throw new LikeException("�޼��� �ҷ����� ����!");
			}
			
			return mv;
			
		}
	 
}