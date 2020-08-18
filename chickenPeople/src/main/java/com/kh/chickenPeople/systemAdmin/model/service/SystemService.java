package com.kh.chickenPeople.systemAdmin.model.service;


import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.systemAdmin.model.vo.BrandTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;

import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;
import com.kh.chickenPeople.systemAdmin.model.vo.SiteTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.StoreTotal;

public interface SystemService {

	ArrayList<Coupon> selectCouponList(PageInfo pi);

	Coupon selectCoupon(String coup_serial);

	int selectListCount();

	int insertCoupon(Coupon coupon);

	int updateCoupon(Coupon coupon);

	ArrayList<BrandTotal> selectBrandTotal();				//계연 관리자 _ 브랜드 별 통계

	ArrayList<SiteTotal> selectSiteTotal();

	ArrayList<Store> searchStoreList(String storeSearchName);

	int selectMemberCount();

	int selectReportCount();

	int selectChattingCount();

	int selectStoreMemCount();

	int selectMapStoreList(String storeSearchName);

	ArrayList<StoreTotal> selectStoreTotal();

	int selectStoreMemberCount();


	

}
