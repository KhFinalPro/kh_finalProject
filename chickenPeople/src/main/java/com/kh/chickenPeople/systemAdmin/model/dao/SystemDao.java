package com.kh.chickenPeople.systemAdmin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.systemAdmin.model.vo.BrandTotal;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;

import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SiteTotal;

@Repository("sDao")
public class SystemDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Coupon> selectCouponList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("couponMapper.selectCouponList", null, rowBounds);
	}

	public Coupon selectCoupon(String coup_serial) {
		return sqlSessionTemplate.selectOne("couponMapper.selectCoupon", coup_serial);
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("couponMapper.selectListCount");
	}

	public int insertCoupon(Coupon coupon) {
		return sqlSessionTemplate.insert("couponMapper.insertCoupon", coupon);
	}

	public int updateCoupon(Coupon coupon) {
		return sqlSessionTemplate.update("couponMapper.updateCoupon", coupon);
	}

	public ArrayList<BrandTotal> selectBrandTotal() {
		return (ArrayList)sqlSessionTemplate.selectList("brandMapper.selectBrandTotal");
	}

	public ArrayList<SiteTotal> selectSiteTotal() {
		return (ArrayList)sqlSessionTemplate.selectList("systemMapper.selectSiteTotal");
	}



}
