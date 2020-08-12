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

	public int updateOrderStatus(HashMap<String, String> map) {
	
		return sqlSessionTemplate.update("storeOrderMapper.updateOrderStatus",map);
	}

	public int updateOrderStatusAgain(HashMap<String, String> map) {
		
		return sqlSessionTemplate.update("storeOrderMapper.updateOrderStatusAgain",map);
	}

	//주문 접수중 모달
	public ArrayList<StoreOrder> selectWaitingList(String userId) {
	
		ArrayList<StoreOrder> selectWaitingList = new ArrayList<StoreOrder>();
		
		selectWaitingList = (ArrayList)sqlSessionTemplate.selectList("storeOrderMapper.selectWaitingList",userId);
		return selectWaitingList;
	}

	//주문 접수 모달 - 확인
	public int updateOrderStatusAccept(String ordNum) {
		
		return sqlSessionTemplate.update("storeOrderMapper.updateOrderStatusAccept",ordNum);
	}

	public int updateOrderStatusCancel(String ordNum) {
	
		return sqlSessionTemplate.update("storeOrderMapper.updateOrderStatusCancel",ordNum);
	
	}
}
