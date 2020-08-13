package com.kh.chickenPeople.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.dao.StoreDao;
import com.kh.chickenPeople.store.model.vo.MordNumCheck;
import com.kh.chickenPeople.store.model.vo.Review;
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.store.model.vo.StoreLike;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;


@Service("storeService")
public class StoreServiceImpl implements StoreService{

	@Autowired
	StoreDao storeDao;

	@Override
	public ArrayList<Store> selectStore(int sto_num) {
		return storeDao.selectStore(sto_num);
	}

	@Override
	public Menu selectOneMenu(int menu_num) {
		return storeDao.selectOneMenu(menu_num);
	}

	@Override
	public ArrayList<Menu> selectListSideMenu(String brand_code) {
		return storeDao.selectListSideMenu(brand_code);
	}

	@Override
	public ArrayList<Review> selectListReview(int sto_num) {
		return storeDao.selectListReview(sto_num);
	}

	@Override
	public double selectReviewAvg(int sto_num) {
		return storeDao.selectReviewAvg(sto_num);
	}
	
	@Override
	public StoreLike selectStoreLike(StoreLike sl) {
		// TODO Auto-generated method stub
		return storeDao.selectStoreLike(sl);
	}

	@Override
	public int insertStoreLike(StoreLike sl) {
		// TODO Auto-generated method stub
		return storeDao.insertStoreLike(sl);
	}
	
	@Override
	public Menu selectMenu(int menu_num) {
		// TODO Auto-generated method stub
		return storeDao.selectMenu(menu_num);
	}

	
	@Override
	public int selectReivewCount(int sto_num) {
		// TODO Auto-generated method stub
		return storeDao.selectReviewCount(sto_num);
	}
	
	@Override
	public int insertMordNumCount(MordNumCheck muc) {
		// TODO Auto-generated method stub
		return storeDao.insertMordNumCount(muc);
	}

	@Override
	public ArrayList<MordNumCheck> selectMordNumCount() {
		// TODO Auto-generated method stub
		return storeDao.selectMordNumCount();
	}
	
	@Override
	public int deleteMordNumCount() {
		// TODO Auto-generated method stub
		return storeDao.deleteMordNumCount();
	}
	
//----------------------------------------------------------------------------관리자 매장관리
	@Override
	public ArrayList<Brand> selectBrandList() {
		return storeDao.selectBrandList();
	}

	@Override
	public int getSearchListCount(SearchStatus storeSearch) {
		return storeDao.getSearchListCount(storeSearch);
	}

	@Override
	public ArrayList<Store> selectStoreSearchList(SearchStatus storeSearch, PageInfo pi) {
		return storeDao.selectStoreSearchList(storeSearch,pi);
	}

	@Override
	public int getListCount() {
		return storeDao.getListCount();
	}

	@Override
	public ArrayList<Store> selectStoreList(PageInfo pi) {
		return storeDao.selectStoreList(pi);
	}

	@Override
	public Store selectOneStore(Integer storeNum) {
		return storeDao.selectOneStore(storeNum);
	}

	@Override
	public Store updateStore(int storeNum) {
		return storeDao.updateStore(storeNum);
	}

	@Override
	public String checkStatus(int storeNum) {
		return storeDao.checkStatus(storeNum);
	}

	@Override
	public int updateStatus(int storeNum) {
		return storeDao.updateStatus(storeNum);
	}

	@Override
	public int storeJoin(Store s) {
		return storeDao.storeJoin(s);
	}

	

	

	

}
