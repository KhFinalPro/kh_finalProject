package com.kh.chickenPeople.systemAdmin.model.service;


import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.BrandTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;

import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SiteTotal;

public interface SystemService {

	ArrayList<Coupon> selectCouponList(PageInfo pi);

	Coupon selectCoupon(String coup_serial);

	int selectListCount();

	int insertCoupon(Coupon coupon);

	int updateCoupon(Coupon coupon);

	ArrayList<BrandTotal> selectBrandTotal();				//계연 관리자 _ 브랜드 별 통계

	ArrayList<SiteTotal> selectSiteTotal();


	

}
