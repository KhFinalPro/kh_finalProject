package com.kh.chickenPeople.main.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.main.model.vo.BestMenu;
import com.kh.chickenPeople.main.model.vo.Search;
import com.kh.chickenPeople.store.model.vo.Store;

@Service
public interface MainService {

	ArrayList<Store> search(Search s);

	ArrayList<Store> bestListSelect();

	ArrayList<BestMenu> selectBestMenu();

	ArrayList<Store> searchStore(String brand_code);

	ArrayList<Store> likeStoreList(String id);

}
