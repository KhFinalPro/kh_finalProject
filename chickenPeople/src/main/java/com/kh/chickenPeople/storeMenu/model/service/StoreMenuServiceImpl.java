package com.kh.chickenPeople.storeMenu.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeMenu.model.dao.StoreMenuDao;
import com.kh.chickenPeople.storeMenu.model.vo.StoreMenu;

@Service("storeMenuService")
public class StoreMenuServiceImpl implements StoreMenuService {

	@Autowired
	StoreMenuDao storeMenuDao;

	@Override
	public ArrayList<StoreMenu> menuList(String userId) {
		
		
		return storeMenuDao.menuList(userId);
	}
	
}
