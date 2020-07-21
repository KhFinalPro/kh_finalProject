package com.kh.chickenPeople.menu.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Repository("menuDao")
public class MenuDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public ArrayList<Brand> selectBrandList() {
		return (ArrayList)sqlSessionTemplate.selectList("menuMapper.selectBrand");
	}
	public int getListCount() {
		return sqlSessionTemplate.selectOne("menuMapper.getListCount");
	}
	
	public ArrayList<Menu> selectMenuList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("menuMapper.selectMenu", null, rowBounds);
	}

	public ArrayList<Menu> selectMenuSearchList(SearchStatus menuSearch) {
		System.out.println("dao"+menuSearch);
		return (ArrayList)sqlSessionTemplate.selectList("menuMapper.selectSearchMenu",menuSearch);
	}


}
