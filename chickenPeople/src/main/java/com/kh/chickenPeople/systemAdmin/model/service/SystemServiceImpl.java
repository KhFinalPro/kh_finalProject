package com.kh.chickenPeople.systemAdmin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.systemAdmin.model.dao.SystemDao;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;
//import com.kh.chickenPeople.systemAdmin.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Service("sService")
public class SystemServiceImpl implements SystemService{

	@Autowired
	SystemDao sDao;

	@Override
	public ArrayList<Coupon> selectCouponList(PageInfo pi) {
		// TODO Auto-generated method stub
		return sDao.selectCouponList(pi);
	}

	@Override
	public Coupon selectCoupon(String coup_serial) {
		// TODO Auto-generated method stub
		return sDao.selectCoupon(coup_serial);
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return sDao.selectListCount();
	}

	@Override
	public int insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return sDao.insertCoupon(coupon);
	}

	@Override
	public int updateCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return sDao.updateCoupon(coupon);
	}
	


}
