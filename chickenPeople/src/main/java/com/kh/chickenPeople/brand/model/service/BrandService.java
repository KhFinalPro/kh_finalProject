package com.kh.chickenPeople.brand.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

public interface BrandService {

	int getListCount(SearchStatus brandSearch);	
	ArrayList<Brand> selectBrandList(SearchStatus brandSearch, PageInfo pi);


}
