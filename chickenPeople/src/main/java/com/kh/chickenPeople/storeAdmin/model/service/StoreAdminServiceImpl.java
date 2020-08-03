package com.kh.chickenPeople.storeAdmin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeAdmin.model.dao.StoreAdminDao;

@Service("storeAdminService")
public class StoreAdminServiceImpl implements StoreAdminService {

	@Autowired
	StoreAdminDao storeAdminDao;
	
	
}
