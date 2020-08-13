package com.kh.chickenPeople.storeAdmin.storeMenu.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeAdmin.storeMenu.model.dao.StoreMenuDao;
import com.kh.chickenPeople.storeAdmin.storeMenu.model.vo.StoreMenu;

@Service("storeMenuService")
public class StoreMenuServiceImpl implements StoreMenuService {

	@Autowired
	StoreMenuDao storeMenuDao;

	@Override
	public ArrayList<StoreMenu> menuList(String userId) {
		
		return storeMenuDao.menuList(userId);
	}

	@Override
	public ArrayList<StoreMenu> cateList(HashMap<String, String> map) {
		

		return storeMenuDao.cateList(map);
	}

	@Override
	public ArrayList<StoreMenu> nameList(HashMap<String, String> map) {
	
		return storeMenuDao.nameList(map);
	}
	
	
}
