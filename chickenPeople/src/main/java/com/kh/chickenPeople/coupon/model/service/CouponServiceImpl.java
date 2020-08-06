package com.kh.chickenPeople.coupon.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.coupon.model.dao.CouponDao;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;


@Service("couponService")
public class CouponServiceImpl implements CouponService{

	@Autowired
	CouponDao couponDao;

	@Override
	public ArrayList<Coupon> selectCouponList() {
		// TODO Auto-generated method stub
		return couponDao.selectCouponList();
	}

	@Override
	public int insertMemberCoupon(Coupon c) {
		// TODO Auto-generated method stub
		return couponDao.insertMemberCoupon(c);
	}


	@Override
	public Coupon selectCouponSerial(Coupon c) {
		// TODO Auto-generated method stub
		return couponDao.selectCouponSerial(c);
	}

	@Override
	public ArrayList<Coupon> myCoupon(String id) {
		return couponDao.myCoupon(id);
	}

	@Override
	public ArrayList<Coupon> pastCoup(String id) {
		// TODO Auto-generated method stub
		return couponDao.pastCoup(id);
	}
}
