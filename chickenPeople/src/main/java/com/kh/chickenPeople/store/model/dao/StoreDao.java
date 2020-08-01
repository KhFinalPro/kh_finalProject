package com.kh.chickenPeople.store.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.vo.Store;

@Repository("storeDao")
public class StoreDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Store> selectStore(int sto_num) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.selectStore",sto_num);
	}

	public Menu selectOneMenu(int menu_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("menuMapper.selectOneMenu", menu_num);
	}

	public ArrayList<Menu> selectListSideMenu(String brand_code) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("menuMapper.selectListSideMenu",brand_code);
	}

}
