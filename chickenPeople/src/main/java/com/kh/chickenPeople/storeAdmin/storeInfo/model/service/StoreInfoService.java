package com.kh.chickenPeople.storeAdmin.storeInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.storeAdmin.storeInfo.model.vo.StoreInfo;

public interface StoreInfoService {

	ArrayList<StoreInfo> storeInfoList(String userId);

	//int modifyInfo(HashMap<String, String> map);

	int modifyInfo(StoreInfo newInfo);

}
