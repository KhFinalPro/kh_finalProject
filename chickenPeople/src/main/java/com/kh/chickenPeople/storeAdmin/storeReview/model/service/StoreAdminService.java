package com.kh.chickenPeople.storeAdmin.storeReview.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.storeAdmin.storeReview.model.vo.StoreReview;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

public interface StoreAdminService {

	ArrayList<StoreReview> reviewList(String userId);

	ArrayList<StoreReview> menuList(String userId);

	int updateReviewRe(HashMap<String, String> map);

	int deleteStoreReview(HashMap<String, String> map);

	int deleteReview(HashMap<String, String> map);

	int getListCount(String userId);



}
