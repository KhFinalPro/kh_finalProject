package com.kh.chickenPeople.bung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.bung.model.service.BungService;
import com.kh.chickenPeople.bung.model.vo.Bung;
import com.kh.chickenPeople.bung.model.vo.BungTag;
import com.kh.chickenPeople.tag.model.service.TagService;
import com.kh.chickenPeople.tag.model.vo.Tag;

@Controller
public class BungController {

	@Autowired
	BungService bungService;
	
	@Autowired
	TagService tagService;
	
	
	
	
	@RequestMapping("bungList.do")
	public ModelAndView bungList(ModelAndView mv) {
		
		ArrayList<Bung> list = bungService.bungList();
		
		if(list != null)
		{
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
		
		Bung b = bungService.selectBung(bung_num);
		ArrayList<Tag> t = tagService.selectTag(bung_num);
		int result = bungService.updateHit(bung_num);
		if(b != null)
		{
			mv.addObject("bung", b);
			mv.addObject("tagList", t);
			mv.setViewName("bung/bungDetail");
		}
		else
		{
			
		}
		
		return mv;
	}
	
	@RequestMapping(value="bungLike.do", method=RequestMethod.POST)
	public void bungLike(HttpServletResponse response, int bung_num) throws IOException {
		
		int result = bungService.updateBungLike(bung_num);
		int bungLike = bungService.selectBungLike(bung_num);
		int bungHit = bungService.selectBungHit(bung_num);
		
		
		JSONArray jarr = new JSONArray();
		
		JSONObject jobj = new JSONObject();
		jobj.put("bungLike", bungLike);
		jobj.put("bungHit", bungHit);
		
		jarr.add(jobj);
		
		JSONObject sendJson = new JSONObject();
		
		sendJson.put("list", jarr);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0 & bungLike != 0)
		{
			out.print(sendJson);			
			out.flush();
		}
		else
		{
			
		}
		
		out.close();
	}
	
	@RequestMapping("bungCreatePageMove.do")
	public ModelAndView bungCreatePageMove(ModelAndView mv) {
		
		//브랜드 사진과 이름 가져오기
		ArrayList<Brand> brandList = bungService.brandListSelect();
		
		mv.addObject("brandList", brandList);
		mv.setViewName("bung/bungCreate");
		
		return mv;
	}
	

	
	@RequestMapping(value="bungCreate.do", method=RequestMethod.GET)
	public String bungCreate(@ModelAttribute Bung b, int[] tag_num) {
		//브랜드 사진가져오기
		Brand brand = bungService.selectBrand(b.getBung_brd());

		//번개 등록하기
		b.setBung_img(brand.getBrand_pic());
		int insertBung = bungService.insertBung(b);
		Bung bung = bungService.selectBungNum(b.getUser_id());
		
		
		//bung_tag insert
		for(int i = 0; i<tag_num.length; i++)
		{
			BungTag bungTag = new BungTag(bung.getBung_num(), b.getUser_id(), tag_num[i]);
			
			int insertBungTag = bungService.insertBungTag(bungTag);
		}

		return "redirect:/bungList.do";
		
	}
	
	@RequestMapping("bungTagList.do")
	public ModelAndView bungTagList(ModelAndView mv, int tag_num) {
		
		ArrayList<Bung> bList = bungService.bungTagList(tag_num);
		
		Tag t = tagService.selectTagName(tag_num);
		if(!bList.isEmpty())
		{
			mv.addObject("list", bList);
			mv.addObject("tagName", t);
			mv.setViewName("bung/bungList");
		}
		else
		{
			
		}
		return mv;
	}
	
	@RequestMapping("myBung")
	public ModelAndView myBung(ModelAndView mv, String id)
	{
		System.out.println("myBung");
		ArrayList<Bung> bungList = bungService.selectMyBung(id);
		
		if(!bungList.isEmpty())
		{
			mv.addObject("bungList", bungList);
			mv.setViewName("mypage/mypageBung");
		}
		else
		{
			
		}
		return mv;
	}
	
	
	
	
	
}
