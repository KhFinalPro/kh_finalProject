package com.kh.chickenPeople.brand.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;
@Repository("brandDao")
public class BrandDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getListCount(SearchStatus brandSearch) {
		return sqlSessionTemplate.selectOne("brandMapper.getListCount", brandSearch);
	}

	public ArrayList<Brand> selectBrandList(SearchStatus brandSearch, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());

		return (ArrayList)sqlSessionTemplate.selectList("brandMapper.selectBrand", brandSearch, rowBounds);
	}


}
