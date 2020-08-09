package com.kh.chickenPeople.coupon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.payment.model.vo.Payment;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;



@Repository("couponDao")
public class CouponDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Coupon> selectCouponList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("couponMapper.selectCouponList");
	}

	public int insertMemberCoupon(Coupon c) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("couponMapper.insertMemberCoupon", c);
	}

	public Coupon selectCouponSerial(Coupon c) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("couponMapper.selectCouponSerial", c);
	}

	public ArrayList<Coupon> myCoupon(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("couponMapper.myCouponList", id);
	}

	public ArrayList<Coupon> pastCoup(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("couponMapper.pastCouponList", id);
	}

	public int updateMyCoupon(Payment payment) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("couponMapper.updateMyCoupon", payment);
	}

}
