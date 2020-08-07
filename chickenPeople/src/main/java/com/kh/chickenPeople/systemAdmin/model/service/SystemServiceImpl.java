package com.kh.chickenPeople.systemAdmin.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.systemAdmin.model.dao.SystemDao;
import com.kh.chickenPeople.systemAdmin.model.vo.BrandTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SiteTotal;

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
	


}
