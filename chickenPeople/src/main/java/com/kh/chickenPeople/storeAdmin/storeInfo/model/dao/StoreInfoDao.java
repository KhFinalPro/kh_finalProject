package com.kh.chickenPeople.storeAdmin.storeInfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.storeAdmin.dashboard.model.vo.Dashboard;
import com.kh.chickenPeople.storeAdmin.storeInfo.model.vo.StoreInfo;

@Repository("storeInfoDao")
public class StoreInfoDao {

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<StoreInfo> storeInfoList(String userId) {
		
		ArrayList<StoreInfo> storeInfoList = new ArrayList<StoreInfo>();
		
		storeInfoList = (ArrayList)sqlSessionTemplate.selectList("storeInfoMapper.storeInfoList",userId);
		System.out.println(storeInfoList);
		
		return storeInfoList;
	}

	/*
	 * public int modifyInfo(HashMap<String, String> map) {
	 * 
	 * return sqlSessionTemplate.update("storeInfoMapper.modifyInfo",map); }
	 */

	public int modifyInfo(StoreInfo newInfo) {
	
		return sqlSessionTemplate.update("storeInfoMapper.modifyInfo",newInfo);
	}

	public int updateOpenStatus(String userId) {
		
		return sqlSessionTemplate.update("storeInfoMapper.updateOpenStatus",userId);
	}

	public int updateOpenStatusYes(String userId) {
		
		return sqlSessionTemplate.update("storeInfoMapper.updateOpenStatusYes",userId);
	}

	public int modifyPwd(StoreInfo newInfo) {
	
		return sqlSessionTemplate.update("storeInfoMapper.modifyPwd",newInfo);
	}

}
