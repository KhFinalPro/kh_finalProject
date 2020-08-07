package com.kh.chickenPeople.storeAdmin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeAdmin.model.dao.StoreAdminDao;
import com.kh.chickenPeople.storeAdmin.model.vo.StoreReview;

@Service("storeAdminService")
public class StoreAdminServiceImpl implements StoreAdminService {

	@Autowired
	StoreAdminDao storeAdminDao;

	@Override
	public ArrayList<StoreReview> reviewList(String userId) {
		
		return storeAdminDao.reviewList(userId);
	}

	@Override
	public ArrayList<StoreReview> menuList(String userId) {
		
		return storeAdminDao.menuList(userId);
	}

	@Override
	public int updateReviewRe(HashMap<String, String> map) {
		
		return storeAdminDao.updateReviewRe(map);
	}

	@Override
	public int deleteStoreReview(HashMap<String, String> map) {
	
		return storeAdminDao.deleteStoreReview(map);
	}

	@Override
	public int deleteReview(HashMap<String, String> map) {
		
		return storeAdminDao.deleteReview(map);
	}

	
}
