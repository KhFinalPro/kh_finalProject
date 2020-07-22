package com.kh.chickenPeople.menu.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.dao.MenuDao;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Service("menuService")
public class MenuServiceImpl implements MenuService{

	@Autowired
	MenuDao menuDao;
	
	@Override
	public ArrayList<Brand> selectBrandList() {
		return menuDao.selectBrandList();
	}
	@Override
	public ArrayList<Menu> selectMenuList(PageInfo pi) {
		return menuDao.selectMenuList(pi);
	}

	@Override
	public int getListCount() {
		return menuDao.getListCount();
	}

	@Override
	public ArrayList<Menu> selectMenuSearchList(SearchStatus menuSearch,PageInfo pi) {
		return menuDao.selectMenuSearchList(menuSearch, pi);
	}
	@Override
	public int getSearchListCount(SearchStatus menuSearch) {
		return menuDao.getSearchListCount(menuSearch);
	}


}
