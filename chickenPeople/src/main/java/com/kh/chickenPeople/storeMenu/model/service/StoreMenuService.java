package com.kh.chickenPeople.storeMenu.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.storeMenu.model.vo.StoreMenu;

public interface StoreMenuService {

	ArrayList<StoreMenu> menuList(String userId);

}
