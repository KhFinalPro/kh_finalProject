package com.kh.chickenPeople.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.service.StoreService;
import com.kh.chickenPeople.store.model.vo.Store;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	//상원 매장 상세페이진
	@RequestMapping("storeDetail.do")
	public ModelAndView storeOrderMain(ModelAndView mv, int sto_num) {
		
		System.out.println("storeOrderMain 페이지 뿌리기! : " + sto_num);
		//매장에 대한 정보 가져오기
		ArrayList<Store> storeList = storeService.selectStore(sto_num);
		
		mv.addObject("storeList", storeList);
		mv.setViewName("store/storeOrderMain");
		return mv;
		
		
	} 
	
	//상원 매장 상세 페이지 모달에 필요한 ajax
	@RequestMapping(value="menuDetail.do", method=RequestMethod.POST)
	public void selectMenuDetail(HttpServletResponse response, int menu_num, String brand_code) throws IOException
	{
		System.out.println(brand_code);
		response.setContentType("application/json;charset=utf-8");
		//메뉴가져오기
		Menu mainMenu = storeService.selectOneMenu(menu_num);
		//추가메뉴 가져오기
		ArrayList<Menu> sideMenu = storeService.selectListSideMenu(brand_code);
		
		JSONArray jarr = new JSONArray();
		for(Menu menu : sideMenu)
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("menu_num", menu.getMenu_Num());
			jobj.put("menu_name", menu.getMenu_Name());
			jobj.put("menu_price", menu.getMenu_Price());
			
			jarr.add(jobj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("menu_num", mainMenu.getMenu_Num());
		sendJson.put("menu_name", mainMenu.getMenu_Name());
		sendJson.put("menu_pic", mainMenu.getMenu_Pic());
		sendJson.put("menu_price", mainMenu.getMenu_Price());
		sendJson.put("sideMenu", jarr);
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
	}
	

	@RequestMapping("/order.do")
	public String orderPayController(){
		
		System.out.println("orderPaymentView 페이지 뿌리기!");
		return "store/orderPaymentView";
		
		
		
		
	}
}