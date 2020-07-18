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
		public ModelAndView storeLikeList(ModelAndView mv) throws Exception {
			
			// 내가 찜한 매장
			ArrayList<Like> storelist = likeService.likeStoreList();
			// 내가 찜한 글
			ArrayList<Like> writeList = likeService.likeWriteList();
			
			mv.addObject("storelist",storelist);
			mv.addObject("writeList", writeList);
			
			mv.setViewName("mypage/mypageLikes");
			
			return mv;
		}
	 
}