package com.kh.chickenPeople.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.main.model.dao.MainDao;
import com.kh.chickenPeople.main.model.vo.BestMenu;
import com.kh.chickenPeople.store.model.vo.Store;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	MainDao mainDao;

	@Override
	public ArrayList<Store> search(String search_input) {
		// TODO Auto-generated method stub
		return mainDao.search(search_input);
	}

	@Override
	public ArrayList<Store> bestListSelect() {
		// TODO Auto-generated method stub
		return mainDao.bestListSelect();
	}

	@Override
	public ArrayList<BestMenu> selectBestMenu() {
		// TODO Auto-generated method stub
		return mainDao.selectBestMenu();
	}

	@Override
	public ArrayList<Store> searchStore(String brand_code) {
		// TODO Auto-generated method stub
		return mainDao.searchStore(brand_code);
	}
}
