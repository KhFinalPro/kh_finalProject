package com.kh.chickenPeople.store.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.vo.Review;
import com.kh.chickenPeople.store.model.vo.Store;

public interface StoreService {

	ArrayList<Store> selectStore(int sto_num);

	Menu selectOneMenu(int menu_num);

	ArrayList<Menu> selectListSideMenu(String brand_code);

	ArrayList<Review> selectListReview(int sto_num);

	double selectReviewAvg(int sto_num);

}
