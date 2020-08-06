package com.kh.chickenPeople.storeAdmin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.storeAdmin.model.vo.StoreReview;

@Repository("storeAdminDao")
public class StoreAdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<StoreReview> reviewList(String userId) {

		ArrayList<StoreReview> reviewList = new ArrayList<StoreReview>();
		reviewList = (ArrayList)sqlSessionTemplate.selectList("storeReviewMapper.reviewList",userId);
		
		return reviewList;
	}

	public ArrayList<StoreReview> menuList(String userId) {
		
		ArrayList<StoreReview> menuList = new ArrayList<StoreReview>();
		menuList = (ArrayList)sqlSessionTemplate.selectList("storeReviewMapper.menuList",userId);
		
		return menuList;
	}

	public int updateReviewRe(HashMap<String, String> map) {
	
		return sqlSessionTemplate.update("storeReviewMapper.updateReviewRe",map);
	}

	public int deleteStoreReview(HashMap<String, String> map) {
		
		return sqlSessionTemplate.delete("storeReviewMapper.deleteStoreReview",map);
	}

	public int deleteReview(HashMap<String, String> map) {
		
		return sqlSessionTemplate.delete("storeReviewMapper.deleteReview",map);
	}

	
	

}
