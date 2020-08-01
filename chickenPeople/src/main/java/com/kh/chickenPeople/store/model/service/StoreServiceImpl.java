package com.kh.chickenPeople.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.store.model.dao.StoreDao;
import com.kh.chickenPeople.store.model.vo.Store;


@Service("storeService")
public class StoreServiceImpl implements StoreService{

	@Autowired
	StoreDao storeDao;

	@Override
	public ArrayList<Store> selectStore(int sto_num) {
		// TODO Auto-generated method stub
		return storeDao.selectStore(sto_num);
	}
}
