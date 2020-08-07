package com.kh.chickenPeople.storeMenu.model.dao;

import java.util.ArrayList;

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
	
}
