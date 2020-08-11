package com.kh.chickenPeople.storeAdmin.storeOrder.controller;

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
import com.kh.chickenPeople.storeAdmin.storeOrder.model.service.StoreOrderService;
import com.kh.chickenPeople.storeAdmin.storeOrder.model.vo.StoreOrder;

@Controller
public class StoreOrderController {

	
	@Autowired
	StoreOrderService storeOrderService;
	
	
	@RequestMapping(value="getOrderList",method=RequestMethod.GET)
	public void selectOrderList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		 response.setContentType("application/json;charset=utf-8");

	        HttpSession session = request.getSession();

	        Member loginUser = (Member) session.getAttribute("loginUser");
	        System.out.println("이거 찍어봐");

	        System.out.println("세션 유저 정보22222222 : " + loginUser.toString());
	        
	        // 유저 아이디
	        String userId = loginUser.getId();
	        
	        
	        JSONObject obj = new JSONObject();
	        
	        
	        /**주문리스트**/
	        ArrayList<StoreOrder> orderList = storeOrderService.orderList(userId);
	        
	        
	        /**메뉴리스트**/
	        ArrayList<StoreOrder> menuList = storeOrderService.menuList(userId);
	        
	        
	        //주문목록  JSONArray만들기
	        JSONArray orderArr = new JSONArray();
	        for(int i=0; i<orderList.size(); i++) {
	        	
	        	for(int j=0; j<menuList.size(); j++) {
	        		if(orderList.get(i).getOrdNum().equals(menuList.get(j).getOrdNum())) {
	        			
	        			JSONObject order = new JSONObject();
	        			order.put("ordNum",orderList.get(i).getOrdNum());
	        			order.put("menuName",menuList.get(j).getRealMenu());
	        			order.put("payDate",orderList.get(i).getPayDate());
	        			order.put("userId",orderList.get(i).getUserId());
	        			order.put("payToal",orderList.get(i).getPayToal());
	        			order.put("ordStatus",orderList.get(i).getOrdStatus());
	        			order.put("payMethod",orderList.get(i).getPayMethod());
	        			order.put("payMsg",orderList.get(i).getPayMsg());
	        			
	        			orderArr.add(order);
	        		}
	        	}
	        	
	        }
	        //System.out.println("컨트롤러 오더조회"+orderArr);
	        //오브젝트에 메뉴목록 jsonArray 넣기
	        obj.put("orderList", orderArr);
	        
	        PrintWriter out = response.getWriter();
	        
			out.print(obj);
			out.flush();
			out.close();
	        
	        
	        
	  
	        
		
	}
	
	@RequestMapping(value="selectChooseOrder.do", method=RequestMethod.POST)
	public void selectChooseOrder(HttpServletRequest request, HttpServletResponse response, String start,String end) throws IOException {
		 response.setContentType("application/json;charset=utf-8");

	        HttpSession session = request.getSession();

	        Member loginUser = (Member) session.getAttribute("loginUser");
	        System.out.println("이거 찍어봐");

	        System.out.println("세션 유저 정보22222222 : " + loginUser.toString());
	        
	        // 유저 아이디
	        String userId = loginUser.getId();
	        System.out.println("에이작스 start"+start);
	        System.out.println("에이작스 end"+end);
	        
	        HashMap<String,String> map = new HashMap<>();
	        map.put("userId",userId);
	        map.put("start",start);
	        map.put("end",end);
	        
	        
	        

	        JSONObject obj = new JSONObject();
	        
	        /**주문리스트**/
	        ArrayList<StoreOrder> chooseOrderList = storeOrderService.chooseOrderList(map);
	        System.out.println("날짜선택 주문리스트"+chooseOrderList);
	        
	        
	        /**메뉴리스트**/
	        ArrayList<StoreOrder> menuList = storeOrderService.menuList(userId);
	        System.out.println("menu"+menuList);
	        
	        
	        //날짜선택 주문목록 list array 만들기
	        JSONArray chooseOrderArr = new JSONArray();
	        
	        for(int i=0; i<chooseOrderList.size(); i++) {
	        	for(int j=0; j<menuList.size(); j++) {
	        		if(chooseOrderList.get(i).getOrdNum().equals(menuList.get(j).getOrdNum())) {
	        			
	        			JSONObject listObj = new JSONObject();
	        			
	        			listObj.put("ordNum",chooseOrderList.get(i).getOrdNum());
	        			listObj.put("menuName",menuList.get(j).getRealMenu());
	        			listObj.put("payDate",chooseOrderList.get(i).getPayDate());
	        			listObj.put("userId",chooseOrderList.get(i).getUserId());
	        			listObj.put("payToal",chooseOrderList.get(i).getPayToal());
	        			listObj.put("ordStatus",chooseOrderList.get(i).getOrdStatus());
	        			listObj.put("payMethod",chooseOrderList.get(i).getPayMethod());
	        			listObj.put("payMsg",chooseOrderList.get(i).getPayMsg());
	        			
	        			chooseOrderArr.add(listObj);
	        			
	        			
	        			
	        		}
	        	}
	        }
	        
	        obj.put("chooseOrder", chooseOrderArr);
	        PrintWriter out = response.getWriter();
            
            out.print(obj);
            out.flush();
            out.close();
	        
	        
	}
	
}
