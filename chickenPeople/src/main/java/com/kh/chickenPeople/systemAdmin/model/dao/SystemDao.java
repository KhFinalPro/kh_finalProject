package com.kh.chickenPeople.systemAdmin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Repository("sDao")
public class SystemDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Coupon> selectCouponList(PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("couponMapper.selectCouponList", null, rowBounds);
	}

	public Coupon selectCoupon(String coup_serial) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("couponMapper.selectCoupon", coup_serial);
	}

	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("couponMapper.selectListCount");
	}

	public int insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("couponMapper.insertCoupon", coupon);
	}

	public int updateCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("couponMapper.updateCoupon", coupon);
	}



}
