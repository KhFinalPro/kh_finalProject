package com.kh.chickenPeople.menu.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.menu.model.vo.Category;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

public interface MenuService {
	
	ArrayList<Brand> selectBrandList();												//관리자_ 브랜드리스트 select
	
	int getListCount();																//관리자 _ 메뉴리스트 갯수 count
	int getSearchListCount(SearchStatus menuSearch);								//관리자 _ 검색 후 메뉴 리스트 갯수 count

	ArrayList<Menu> selectMenuList(PageInfo pi);									//관리자_ 메뉴리스트 select
	ArrayList<Menu> selectMenuSearchList(SearchStatus menuSearch, PageInfo pi);		//관리자_ 메뉴 검색결과 select

	Menu selectOneMenu(int menuNum);												//관리자 _ 메뉴 디테일

	int changeMenuY(int menuNum);													//관리자 _ 메뉴 상태 변경

	int changeMenuN(int menuNum);													

	int updateMenu(Menu m);															//관리자 _ 메뉴 수정	

	ArrayList<Category> selectCategoryList();										//관리자_ 카테고리리스트 select

	int insertNewMenu(Menu m);															//관리자 _ 메뉴 insert


}
