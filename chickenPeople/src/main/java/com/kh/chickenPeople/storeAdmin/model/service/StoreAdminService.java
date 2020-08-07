package com.kh.chickenPeople.storeAdmin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.storeAdmin.model.vo.StoreReview;

public interface StoreAdminService {

	ArrayList<StoreReview> reviewList(String userId);

	ArrayList<StoreReview> menuList(String userId);

	int updateReviewRe(HashMap<String, String> map);

	int deleteStoreReview(HashMap<String, String> map);

	int deleteReview(HashMap<String, String> map);



}
