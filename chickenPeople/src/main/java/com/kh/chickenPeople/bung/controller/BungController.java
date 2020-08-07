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
import com.kh.chickenPeople.message.model.vo.Message;
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
//		//기간 지난 번개 종료
//		int result = bungService.updateCloseBung(list);
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
	public ModelAndView bungDetail(ModelAndView mv, @RequestParam(value="bung_num", required=false) Integer bung_num, String myPageStatus) {
		System.out.println("myPageStatus : " + myPageStatus);
		ArrayList<Tag> t = tagService.selectTag(bung_num);
		int result = bungService.updateHit(bung_num);
		Bung b = bungService.selectBung(bung_num);
		if(b != null && myPageStatus == null)
		{
			mv.addObject("myPageStatus", "n");
			mv.addObject("bung", b);
			mv.addObject("tagList", t);
			mv.setViewName("bung/bungDetail");
		}
		else if(b != null && myPageStatus.equals("y"))
		{
			mv.addObject("myPageStatus", "y");
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
	
	//번개 리스트에서 만들기로 이동하기위한 컨트롤러
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
		}
		else
		{
			mv.addObject("msg", "텅!");
		}
		mv.setViewName("mypage/mypageBung");
		return mv;
	}
	
	//업데이트하기위해 필요한 정보를 가지고 업데이트 jsp로 이동
	@RequestMapping("bungUpdateView.do")
	public ModelAndView bungUpdateView(ModelAndView mv, int bung_num) {
		System.out.println("bung_num : " + bung_num);
		Bung b = bungService.selectBung(bung_num);
		ArrayList<Brand> brandList = bungService.brandListSelect();
		
		//해당 게시물에 해당하는 테그 delete
		int deleteTag = tagService.deleteTag(bung_num);
		
		if(b != null)
		{
			mv.addObject("brandList", brandList);
			mv.addObject("bung", b);
			mv.setViewName("mypage/mypageBungUpdate");
		}
		else
		{
			
		}
		return mv;
	}
	
	//번개 정보 수정
	@RequestMapping("bungUpdate.do")
	public String bungUpdate(@ModelAttribute Bung b, int[] tag_num) {
		//브랜드 사진가져오기
		Brand brand = bungService.selectBrand(b.getBung_brd());

		//번개 등록하기
		b.setBung_img(brand.getBrand_pic());

		int insertBung = bungService.updateBung(b);
		
		//bung_tag insert
		for(int i = 0; i<tag_num.length; i++)
		{
			BungTag bungTag = new BungTag(b.getBung_num(), b.getUser_id(), tag_num[i]);
			
			int insertBungTag = bungService.insertBungTag(bungTag);
		}

		return "redirect:/myBung.do?id="+b.getUser_id();	//myPageBungList controller로 이동
		
	}
	
	@RequestMapping(value="bungMessage.do", method=RequestMethod.POST)
	public void bungMassage(HttpServletResponse  response, String rev_id, String send_id, String msg_contents, String msg_title) throws IOException {
		Message m = new Message(0, send_id, rev_id, "", msg_title, msg_contents, "");
		System.out.println(m);
		int result = bungService.insertMessage(m);
		if(result > 0)
		{
			System.out.println("성공?");
			JSONObject obj = new JSONObject();
			PrintWriter out = response.getWriter();
			
			obj.put("success", "y");
			out.print(obj);
			out.flush();
			out.close();
		}
			
	}
	
	@RequestMapping(value="bungSearch.do")
	public ModelAndView bungSearch(ModelAndView mv, String month) throws IOException
	{
		
		ArrayList<Bung> list = bungService.searchBung(month);

		
		if(!list.isEmpty())
		{
			mv.addObject("list", list);

		}
		else
		{
			mv.addObject("msg", "텅");
		}
		mv.setViewName("bung/bungList");
		return mv;
	
	}
	
	
	
	
}
