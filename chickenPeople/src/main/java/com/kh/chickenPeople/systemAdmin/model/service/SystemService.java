package com.kh.chickenPeople.systemAdmin.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.systemAdmin.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

public interface SystemService {

	int getListCount();						//관리자 _ 메뉴리스트 갯수 count

	ArrayList<Menu> selectMenuList(PageInfo pi);		//관리자_ 메뉴리스트 select

	

}
