package com.kh.chickenPeople.storeAdmin.storeOrder.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.storeAdmin.storeOrder.model.vo.StoreOrder;

@Repository("storeOrderDao")
public class StoreOrderDao {

	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<StoreOrder> orderList(String userId) {
	
		ArrayList<StoreOrder> orderList = new ArrayList<StoreOrder>();
		
		orderList = (ArrayList)sqlSessionTemplate.selectList("storeOrderMapper.orderList",userId);
		
		return orderList;
	}

	public ArrayList<StoreOrder> menuList(String userId) {
		
		ArrayList<StoreOrder> menuList = new ArrayList<StoreOrder>();
		
		menuList = (ArrayList)sqlSessionTemplate.selectList("storeOrderMapper.menuList",userId);
		
		return menuList;
	}

	public ArrayList<StoreOrder> chooseOrderList(HashMap<String, String> map) {
	

		ArrayList<StoreOrder> chooseOrderList = new ArrayList<StoreOrder>();
		
		chooseOrderList = (ArrayList)sqlSessionTemplate.selectList("storeOrderMapper.chooseOrderList",map);
		
		return chooseOrderList;
	}
}
