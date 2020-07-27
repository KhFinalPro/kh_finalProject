package com.kh.chickenPeople.systemAdmin.model.service;


import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;

import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

public interface SystemService {

	ArrayList<Coupon> selectCouponList(PageInfo pi);

	Coupon selectCoupon(String coup_serial);

	int selectListCount();

	int insertCoupon(Coupon coupon);

	int updateCoupon(Coupon coupon);


	

}
