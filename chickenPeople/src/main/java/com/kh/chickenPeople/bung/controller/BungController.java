package com.kh.chickenPeople.bung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.bung.model.service.BungService;
import com.kh.chickenPeople.bung.model.vo.Bung;

@Controller
public class BungController {

	@Autowired
	BungService bungService;
	
	@RequestMapping("bungList.do")
	public ModelAndView bungList(ModelAndView mv) {
		System.out.println("bungList.do");
		
		ArrayList<Bung> list = bungService.bungList();
		
		if(list != null)
		{
			for(Bung  b : list)
			{
				System.out.println(b);
			}
			mv.addObject("list", list);
			mv.setViewName("bung/bungList");
		}
		else
		{
			
		}
		return mv;
	}
	
	@RequestMapping("bungDetail.do")
	public ModelAndView bungDetail(ModelAndView mv, @RequestParam(value="bung_num", required=false) Integer bung_num) {
//		System.out.println("bungDetail.do");
//		System.out.println("bung_num : " + bung_num);
		
		Bung b = bungService.selectBung(bung_num);
		int result = bungService.updateHit(bung_num);
		if(b != null)
		{
			mv.addObject("bung", b);
			mv.setViewName("bung/bungDetail");
		}
		else
		{
			
		}
		
		return mv;
	}
	
	@RequestMapping(value="bungLike.do", method=RequestMethod.POST)
	public void bungLike(HttpServletResponse response, int bung_num ) throws IOException {
//		System.out.println("bung_num : " + bung_num);
		
		int result = bungService.updateBungLike(bung_num);
		
		int bungLike = bungService.selectBungLike(bung_num);
		
		System.out.println("result : " + result + "bungLike : " + bungLike);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0 & bungLike != 0)
		{
			out.print(bungLike);
			out.flush();
		}
		else
		{
			
		}
		
		out.close();
	}
	
}
