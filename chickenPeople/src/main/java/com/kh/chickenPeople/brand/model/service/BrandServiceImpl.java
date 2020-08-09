package com.kh.chickenPeople.brand.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.brand.model.dao.BrandDao;
import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Service("brandService")
public class BrandServiceImpl implements BrandService{

	@Autowired
	BrandDao brandDao;
	
	@Override
	public int getListCount(SearchStatus brandSearch) {
		return brandDao.getListCount(brandSearch);
	}

	@Override
	public ArrayList<Brand> selectBrandList(SearchStatus brandSearch, PageInfo pi) {

		return brandDao.selectBrandList(brandSearch, pi);
	}


}
