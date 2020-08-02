package com.kh.chickenPeople.coupon.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;



@Service
public interface CouponService {

	ArrayList<Coupon> selectCouponList();

	int insertMemberCoupon(Coupon c);

	Coupon selectCouponSerial(Coupon c);

}
