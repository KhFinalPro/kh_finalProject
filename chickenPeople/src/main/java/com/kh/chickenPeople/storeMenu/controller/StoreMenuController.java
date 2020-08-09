package com.kh.chickenPeople.storeMenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
import com.kh.chickenPeople.storeMenu.model.service.StoreMenuService;
import com.kh.chickenPeople.storeMenu.model.vo.StoreMenu;

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
	        	
	        	menu.put("brandName", menuList.get(i).getBrandName());
	        	menu.put("menuPic",menuList.get(i).getMenuPic());
	        	menu.put("catName",menuList.get(i).getCatName());
	        	menu.put("menuName", menuList.get(i).getMenuName());
	        	menu.put("menuPrice", menuList.get(i).getMenuPrice());
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

}
