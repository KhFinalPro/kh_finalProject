package com.kh.chickenPeople.storeAdmin.storeMenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.storeAdmin.storeMenu.model.service.StoreMenuService;
import com.kh.chickenPeople.storeAdmin.storeMenu.model.vo.StoreMenu;

@Controller
public class StoreMenuController {
	
	@Autowired 
	StoreMenuService storeMenuService;
	
	
	@RequestMapping(value="selectMenuList",method=RequestMethod.GET)
	public void selectMenuList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		  response.setContentType("application/json;charset=utf-8");

	        HttpSession session = request.getSession();

	        Member loginUser = (Member) session.getAttribute("loginUser");

	        System.out.println("세션 유저 정보 : " + loginUser.toString());
	        
	        // 유저 아이디
	        String userId = loginUser.getId();
	        
	        JSONObject obj = new JSONObject();
		
	        ArrayList<StoreMenu> menuList= storeMenuService.menuList(userId);
	        
	        //메뉴목록 JSONArray만들기
	        JSONArray menuArr = new JSONArray();
	        for(int i=0; i<menuList.size(); i++) {
	        	JSONObject menu = new JSONObject();
	        	
	        	String formatMenuPrice = String.format("%,d", menuList.get(i).getMenuPrice());
	        	
	        	menu.put("brandName", menuList.get(i).getBrandName());
	        	menu.put("menuPic",menuList.get(i).getMenuPic());
	        	menu.put("catName",menuList.get(i).getCatName());
	        	menu.put("menuName", menuList.get(i).getMenuName());
	        	menu.put("menuPrice", formatMenuPrice);
	        	menu.put("menuExp",menuList.get(i).getMenuExp());
	        	
	        	
	        	menuArr.add(menu);
	        		
	        }
	        System.out.println("컨트롤러 메뉴"+menuArr);
	        //오브젝트에 메뉴목록 jsonArray 넣기
	        obj.put("menuList", menuArr);
	        
	        PrintWriter out = response.getWriter();
	        
			out.print(obj);
			out.flush();
			out.close();
	        
	}
	
	@RequestMapping(value="selectSearchCate",method=RequestMethod.POST)
	public void selectMenuList(HttpServletRequest request, HttpServletResponse response, String category) throws IOException {
		
		  response.setContentType("application/json;charset=utf-8");

	        HttpSession session = request.getSession();

	        Member loginUser = (Member) session.getAttribute("loginUser");

	        System.out.println("세션 유저 정보 : " + loginUser.toString());
	        
	        // 유저 아이디
	        String userId = loginUser.getId();
	        
	        JSONObject obj = new JSONObject();
	        
	 
	        
	        

			HashMap<String, String> map = new HashMap<>();
			map.put("Id", userId);
			map.put("category", category);
	
			
	        
	        ArrayList<StoreMenu> cateList= storeMenuService.cateList(map);
	        
	        System.out.println("메뉴조회 카테리스트 잘 받았니?"+cateList);
	        
	      //메뉴목록 JSONArray만들기
	        JSONArray cateArr = new JSONArray();
	        for(int i=0; i<cateList.size(); i++) {
	        	JSONObject menu = new JSONObject();
	        	
	        	String formatMenuPrice = String.format("%,d", cateList.get(i).getMenuPrice());
	        	
	        	menu.put("brandName", cateList.get(i).getBrandName());
	        	menu.put("menuPic",cateList.get(i).getMenuPic());
	        	menu.put("catName",cateList.get(i).getCatName());
	        	menu.put("menuName", cateList.get(i).getMenuName());
	        	menu.put("menuPrice", formatMenuPrice);
	        	menu.put("menuExp",cateList.get(i).getMenuExp());
	        	
	        	
	        	cateArr.add(menu);
	        		
	        }
	        System.out.println("컨트롤러 카테고리 조회 메뉴"+cateArr);
	        //오브젝트에 메뉴목록 jsonArray 넣기
	        obj.put("cateList", cateArr);
	        
	        PrintWriter out = response.getWriter();
	        
			out.print(obj);
			out.flush();
			out.close();
	        
		
	}
	

	@RequestMapping(value="selectNameList",method=RequestMethod.POST)
	public void selectNameList(HttpServletRequest request, HttpServletResponse response, String menuName) throws IOException {
		
		response.setContentType("application/json;charset=utf-8");

        HttpSession session = request.getSession();

        Member loginUser = (Member) session.getAttribute("loginUser");

        System.out.println("세션 유저 정보 : " + loginUser.toString());
        
        // 유저 아이디
        String userId = loginUser.getId();
        
        //System.out.println("에이작스 잘받았니?"+menuName);
        
        JSONObject obj = new JSONObject();
        
 
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", userId);
		map.put("menuName", menuName);
		
		ArrayList<StoreMenu> nameList= storeMenuService.nameList(map);

		//메뉴목록 JSONArray만들기
        JSONArray nameArr = new JSONArray();
        for(int i=0; i<nameList.size(); i++) {
        	JSONObject menu = new JSONObject();
        	
        	String formatMenuPrice = String.format("%,d", nameList.get(i).getMenuPrice());
        	
        	menu.put("brandName", nameList.get(i).getBrandName());
        	menu.put("menuPic",nameList.get(i).getMenuPic());
        	menu.put("catName",nameList.get(i).getCatName());
        	menu.put("menuName", nameList.get(i).getMenuName());
        	menu.put("menuPrice", formatMenuPrice);
        	menu.put("menuExp",nameList.get(i).getMenuExp());
        	
        	
        	nameArr.add(menu);
        		
        }
        System.out.println("컨트롤러 이름 조회 메뉴"+nameArr);
        //오브젝트에 메뉴목록 jsonArray 넣기
        obj.put("nameList", nameArr);
        
        PrintWriter out = response.getWriter();
        
		out.print(obj);
		out.flush();
		out.close();
        
		
	}

}
