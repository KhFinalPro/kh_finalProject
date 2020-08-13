package com.kh.chickenPeople.storeAdmin.storeOrder.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.storeAdmin.storeOrder.model.vo.StoreOrder;

public interface StoreOrderService {

	ArrayList<StoreOrder> orderList(String userId);

	ArrayList<StoreOrder> menuList(String userId);

	ArrayList<StoreOrder> chooseOrderList(HashMap<String, String> map);

	int updateOrderStatus(HashMap<String, String> map);

	int updateOrderStatusAgain(HashMap<String, String> map);

	//주문접수중 모달
	ArrayList<StoreOrder> selectWaitingList(String userId);

	int updateOrderStatusAccept(String ordNum);

	int updateOrderStatusCancel(String ordNum);

	//날짜선택 매출전표
	ArrayList<StoreOrder> chooseDateTotalReciept(HashMap<String, String> map);

	//매장이름
	//int stoName(String userId);


}
