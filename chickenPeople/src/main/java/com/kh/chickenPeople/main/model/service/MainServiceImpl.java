package com.kh.chickenPeople.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.main.model.dao.MainDao;
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
}
