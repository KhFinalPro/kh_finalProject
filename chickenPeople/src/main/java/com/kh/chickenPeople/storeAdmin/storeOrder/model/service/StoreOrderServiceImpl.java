package com.kh.chickenPeople.storeAdmin.storeOrder.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeAdmin.storeMenu.model.vo.StoreMenu;
import com.kh.chickenPeople.storeAdmin.storeOrder.model.dao.StoreOrderDao;
import com.kh.chickenPeople.storeAdmin.storeOrder.model.vo.StoreOrder;

@Service("storeOrderService")
public class StoreOrderServiceImpl implements StoreOrderService {

	@Autowired
	StoreOrderDao storeOrderDao;

	@Override
	public ArrayList<StoreOrder> orderList(String userId) {
		
		return storeOrderDao.orderList(userId);
	}

	@Override
	public ArrayList<StoreOrder> menuList(String userId) {
		
		return storeOrderDao.menuList(userId);
	}

	@Override
	public ArrayList<StoreOrder> chooseOrderList(HashMap<String, String> map) {
		
		return storeOrderDao.chooseOrderList(map);
	}

	@Override
	public int updateOrderStatus(HashMap<String, String> map) {
		
		return storeOrderDao.updateOrderStatus(map); 
	}

	@Override
	public int updateOrderStatusAgain(HashMap<String, String> map) {
	
		return storeOrderDao.updateOrderStatusAgain(map); 
	}

	@Override
	public ArrayList<StoreOrder> selectWaitingList(String userId) {
		
		return storeOrderDao.selectWaitingList(userId); 
	}

	@Override
	public int updateOrderStatusAccept(String ordNum) {
		
		return storeOrderDao.updateOrderStatusAccept(ordNum); 
	}

	@Override
	public int updateOrderStatusCancel(String ordNum) {
	
		return storeOrderDao.updateOrderStatusCancel(ordNum); 
	}

	@Override
	public ArrayList<StoreOrder> chooseDateTotalReciept(HashMap<String, String> map) {
		
		return  storeOrderDao.chooseDateTotalReciept(map); 
	}

	/*
	 * @Override public int stoName(String userId) {
	 * 
	 * return storeOrderDao.stoName(userId); }
	 */

	
	
	
}
