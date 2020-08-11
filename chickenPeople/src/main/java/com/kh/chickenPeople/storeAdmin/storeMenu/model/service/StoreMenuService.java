package com.kh.chickenPeople.storeAdmin.storeMenu.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.storeAdmin.storeMenu.model.vo.StoreMenu;

public interface StoreMenuService {

	ArrayList<StoreMenu> menuList(String userId);

	ArrayList<StoreMenu> cateList(HashMap<String, String> map);

	ArrayList<StoreMenu> nameList(HashMap<String, String> map);
	

}
