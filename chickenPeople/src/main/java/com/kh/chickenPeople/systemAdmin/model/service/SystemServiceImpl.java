package com.kh.chickenPeople.systemAdmin.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.systemAdmin.model.dao.SystemDao;
import com.kh.chickenPeople.systemAdmin.model.vo.BrandTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;
import com.kh.chickenPeople.systemAdmin.model.vo.SiteTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.StoreTotal;

@Service("sService")
public class SystemServiceImpl implements SystemService{

	@Autowired
	SystemDao sDao;

	@Override
	public ArrayList<Coupon> selectCouponList(PageInfo pi) {
		return sDao.selectCouponList(pi);
	}

	@Override
	public Coupon selectCoupon(String coup_serial) {
		return sDao.selectCoupon(coup_serial);
	}

	@Override
	public int selectListCount() {
		return sDao.selectListCount();
	}

	@Override
	public int insertCoupon(Coupon coupon) {
		return sDao.insertCoupon(coupon);
	}

	@Override
	public int updateCoupon(Coupon coupon) {
		return sDao.updateCoupon(coupon);
	}

	@Override
	public ArrayList<BrandTotal> selectBrandTotal() {
		return sDao.selectBrandTotal();
	}

	@Override
	public ArrayList<SiteTotal> selectSiteTotal() {
		return sDao.selectSiteTotal();
	}

	@Override
	public ArrayList<Store> searchStoreList(String storeSearchName) {
		return sDao.searchStoreList(storeSearchName);
	}

	@Override
	public int selectMemberCount() {
		return sDao.selectMemberCount();
	}

	@Override
	public int selectReportCount() {
		return sDao.selectReportCount();
	}

	@Override
	public int selectChattingCount() {
		return sDao.selectChattingCount();
	}

	@Override
	public int selectStoreMemCount() {
		return sDao.selectStoreMemCount();
	}

	@Override
	public int selectMapStoreList(String storeSearchName) {
		return sDao.selectMapStoreList(storeSearchName);
	}

	@Override
	public ArrayList<StoreTotal> selectStoreTotal() {
		return sDao.selectStoreTotal();
	}
	


}
