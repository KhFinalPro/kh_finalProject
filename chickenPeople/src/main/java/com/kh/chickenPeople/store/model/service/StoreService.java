package com.kh.chickenPeople.store.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.vo.Review;
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.store.model.vo.StoreLike;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

public interface StoreService {

	ArrayList<Store> selectStore(int sto_num);

	Menu selectOneMenu(int menu_num);

	ArrayList<Menu> selectListSideMenu(String brand_code);

	ArrayList<Review> selectListReview(int sto_num);

	double selectReviewAvg(int sto_num);
	
	StoreLike selectStoreLike(StoreLike sl);

	int insertStoreLike(StoreLike sl);
	
	Menu selectMenu(int menu_num);

	//------------------------------------------------------------------------------
	ArrayList<Brand> selectBrandList();							//관리자 _ brand list

	int getSearchListCount(SearchStatus storeSearch);			//검색 결과 storeList 갯수

	ArrayList<Store> selectStoreSearchList(SearchStatus storeSearch, PageInfo pi);	//검색결과 storeList

	int getListCount();											//전체 storeList 갯수

	ArrayList<Store> selectStoreList(PageInfo pi);				//검색결과 storeList

	

	

}
