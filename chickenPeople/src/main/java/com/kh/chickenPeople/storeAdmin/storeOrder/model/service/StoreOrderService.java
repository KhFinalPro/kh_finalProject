package com.kh.chickenPeople.storeAdmin.storeOrder.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.storeAdmin.storeOrder.model.vo.StoreOrder;

public interface StoreOrderService {

	ArrayList<StoreOrder> orderList(String userId);

	ArrayList<StoreOrder> menuList(String userId);

	ArrayList<StoreOrder> chooseOrderList(HashMap<String, String> map);

}
