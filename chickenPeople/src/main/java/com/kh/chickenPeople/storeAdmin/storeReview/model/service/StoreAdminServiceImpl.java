package com.kh.chickenPeople.storeAdmin.storeReview.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeAdmin.storeReview.model.dao.StoreAdminDao;
import com.kh.chickenPeople.storeAdmin.storeReview.model.vo.StoreReview;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

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

	@Override
	public int getListCount(String userId) {
	
		return storeAdminDao.getListCount(userId);
	}

	
}
