package com.kh.chickenPeople.storeAdmin.storeInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeAdmin.storeInfo.model.dao.StoreInfoDao;
import com.kh.chickenPeople.storeAdmin.storeInfo.model.vo.StoreInfo;

@Service("storeInfoService")
public class StoreInfoServiceImpl implements StoreInfoService {
	
	@Autowired
	StoreInfoDao storeInfoDao;

	@Override
	public ArrayList<StoreInfo> storeInfoList(String userId) {
		
		return storeInfoDao.storeInfoList(userId);
	}

	@Override
	public int modifyInfo(StoreInfo newInfo) {
		
		return storeInfoDao.modifyInfo(newInfo);
	}

	@Override
	public int updateOpenStatus(String userId) {
	
		return storeInfoDao.updateOpenStatus(userId);
	}

	@Override
	public int updateOpenStatusYes(String userId) {
	
		return storeInfoDao.updateOpenStatusYes(userId);
	}

	@Override
	public int modifyPwd(StoreInfo newInfo) {
		
		return storeInfoDao.modifyPwd(newInfo);
	}

	/*
	 * @Override public int modifyInfo(HashMap<String, String> map) {
	 * 
	 * return storeInfoDao.modifyInfo(map); }
	 */

	
}
