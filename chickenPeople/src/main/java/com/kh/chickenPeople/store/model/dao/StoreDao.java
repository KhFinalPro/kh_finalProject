package com.kh.chickenPeople.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.vo.Review;
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Repository("storeDao")
public class StoreDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Store> selectStore(int sto_num) {
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.selectStore",sto_num);
	}

	public Menu selectOneMenu(int menu_num) {
		return sqlSessionTemplate.selectOne("menuMapper.selectOneMenu", menu_num);
	}

	public ArrayList<Menu> selectListSideMenu(String brand_code) {
		return (ArrayList)sqlSessionTemplate.selectList("menuMapper.selectListSideMenu",brand_code);
	}

	public ArrayList<Review> selectListReview(int sto_num) {
		return (ArrayList)sqlSessionTemplate.selectList("reviewMapper.selectListReview", sto_num);
	}

	public double selectReviewAvg(int sto_num) {
		return sqlSessionTemplate.selectOne("reviewMapper.selectReviewAvg", sto_num);
	}
	

	//
	public ArrayList<Brand> selectBrandList() {
		return (ArrayList)sqlSessionTemplate.selectList("menuMapper.selectBrand");
	}

	public int getSearchListCount(SearchStatus storeSearch) {
		return sqlSessionTemplate.selectOne("storeMapper.getSearchListCount",storeSearch);
	}

	public ArrayList<Store> selectStoreSearchList(SearchStatus storeSearch, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.getSearchStoreList",storeSearch,rowBounds);
	}

	public int getListCount() {
		return sqlSessionTemplate.selectOne("storeMapper.getListCount");
	}

	public ArrayList<Store> selectStoreList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("storeMapper.selectStoreList",null,rowBounds);
	}

	public Store selectOneStore(Integer storeNum) {
		return sqlSessionTemplate.selectOne("storeMapper.selectStoreOne",storeNum);
	}

}
