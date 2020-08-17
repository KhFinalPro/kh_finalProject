package com.kh.chickenPeople.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.store.model.vo.MordNumCheck;
import com.kh.chickenPeople.store.model.vo.Review;
import com.kh.chickenPeople.store.model.vo.Store;
import com.kh.chickenPeople.store.model.vo.StoreLabel;
import com.kh.chickenPeople.store.model.vo.StoreLike;
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
	
	public StoreLike selectStoreLike(StoreLike sl) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("storeMapper.selectStoreLiek", sl);
	}

	public int insertStoreLike(StoreLike sl) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("storeMapper.insertStoreLike", sl);
	}
	
	public Menu selectMenu(int menu_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("menuMapper.selectOneMenu", menu_num);
	}
	
	public int selectReviewCount(int sto_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("reviewMapper.selectReviewCount", sto_num);
	}
	
	public int insertMordNumCount(MordNumCheck muc) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("mordNumCheckMapper.insertMordNumCount", muc);
	}

	public ArrayList<MordNumCheck> selectMordNumCount() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("mordNumCheckMapper.selectMordNumCount");
	}
	
	public int deleteMordNumCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("mordNumCheckMapper.deleteMordNumCount");
	}
	
	//-----------------------------------------------------------------------------
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

	public Store updateStore(int storeNum) {
		return null;
	}

	public String checkStatus(int storeNum) {
		return sqlSessionTemplate.selectOne("storeMapper.checkStatus",storeNum);
	}

	public int updateStatus(int storeNum) {
		return sqlSessionTemplate.update("storeMapper.updateStatus",storeNum);
	}

	public int storeJoin(Store s) {
		
		return sqlSessionTemplate.insert("storeMapper.storeJoin", s);
	}

	public StoreLabel selectStoreLabel(String brand_code) {
		return sqlSessionTemplate.selectOne("storeMapper.selectStoreLabel",brand_code);
	}

	public int enterStatusUpdate(Store newbie) {
		return sqlSessionTemplate.update("storeMapper.enterStatusUpdate",newbie);
	}

	public String selectProfile(String brand_code) {
		return sqlSessionTemplate.selectOne("brandMapper.selectProfile",brand_code);
	}

	

	

	

	
	

	

	

}
