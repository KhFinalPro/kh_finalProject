package com.kh.chickenPeople.menu.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

public interface MenuService {
	
	ArrayList<Brand> selectBrandList();					//관리자_ 브랜드리스트 select
	
	int getListCount();									//관리자 _ 메뉴리스트 갯수 count

	ArrayList<Menu> selectMenuList(PageInfo pi);		//관리자_ 메뉴리스트 select

	ArrayList<Menu> selectMenuSearchList(SearchStatus menuSearch);		//관리자_ 메뉴 검색결과 select (no paging)


}
