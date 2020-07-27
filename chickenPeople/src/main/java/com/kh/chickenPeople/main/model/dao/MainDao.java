package com.kh.chickenPeople.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.main.model.vo.BestMenu;
import com.kh.chickenPeople.main.model.vo.Search;
import com.kh.chickenPeople.store.model.vo.Store;

@Repository("mainDao")
public class MainDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Store> search(Search s) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.searchList", s);
	}

	public ArrayList<Store> bestListSelect() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.bestList");
	}

	public ArrayList<BestMenu> selectBestMenu() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("mainMapper.selectBestMenu");
	}

	public ArrayList<Store> searchStore(String brand_code) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.searchStore", brand_code);
	}

}
