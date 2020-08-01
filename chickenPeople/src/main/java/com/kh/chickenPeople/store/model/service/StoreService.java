package com.kh.chickenPeople.store.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.store.model.vo.Store;

public interface StoreService {

	ArrayList<Store> selectStore(int sto_num);

}
