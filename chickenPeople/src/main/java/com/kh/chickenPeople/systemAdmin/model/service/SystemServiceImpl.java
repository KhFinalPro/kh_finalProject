package com.kh.chickenPeople.systemAdmin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.systemAdmin.model.dao.SystemDao;
import com.kh.chickenPeople.systemAdmin.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Service("sService")
public class SystemServiceImpl implements SystemService{

	@Autowired
	SystemDao sDao;
	
	@Override
	public ArrayList<Menu> selectMenuList(PageInfo pi) {
		return sDao.selectMenuList(pi);
	}

	@Override
	public int getListCount() {
		return sDao.getListCount();
	}

}
