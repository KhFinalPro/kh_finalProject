package com.kh.chickenPeople.storeMenu.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.storeAdmin.model.vo.StoreReview;
import com.kh.chickenPeople.storeMenu.model.vo.StoreMenu;

@Repository("storeMenuDao")
public class StoreMenuDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<StoreMenu> menuList(String userId) {
		
		ArrayList<StoreMenu> menuList = new ArrayList<StoreMenu>();
		
		menuList = (ArrayList)sqlSessionTemplate.selectList("storeMenuMapper.menuList",userId);
		
		return menuList;
	}

	public ArrayList<StoreMenu> cateList(HashMap<String, String> map) {
		
		
		
		ArrayList<StoreMenu> cateList = new ArrayList<StoreMenu>();
		cateList = (ArrayList)sqlSessionTemplate.selectList("storeMenuMapper.cateList",map);
		
		return cateList;
	}

	public ArrayList<StoreMenu> nameList(HashMap<String, String> map) {
		
		ArrayList<StoreMenu> nameList = new ArrayList<StoreMenu>();
		nameList = (ArrayList)sqlSessionTemplate.selectList("storeMenuMapper.nameList",map);
		return nameList;
	}
	
}
