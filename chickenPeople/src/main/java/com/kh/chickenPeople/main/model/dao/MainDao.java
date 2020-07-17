package com.kh.chickenPeople.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.store.model.vo.Store;

@Repository("mainDao")
public class MainDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Store> search(String search_input) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.searchList", search_input);
	}

	public ArrayList<Store> bestListSelect() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.bestList");
	}

}
