package com.kh.chickenPeople.main.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.main.model.vo.BestMenu;
import com.kh.chickenPeople.store.model.vo.Store;

@Service
public interface MainService {

	ArrayList<Store> search(String search_input);

	ArrayList<Store> bestListSelect();

	ArrayList<BestMenu> selectBestMenu();

	ArrayList<Store> searchStore(String brand_code);

}
