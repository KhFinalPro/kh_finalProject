package com.kh.chickenPeople.brand.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
@Repository("brandDao")
public class BrandDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getListCount() {
		return sqlSessionTemplate.selectOne("brandMapper.getListCount");
	}

	public ArrayList<Brand> selectBrandList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("brandMapper.selectBrand", null, rowBounds);
	}


}
