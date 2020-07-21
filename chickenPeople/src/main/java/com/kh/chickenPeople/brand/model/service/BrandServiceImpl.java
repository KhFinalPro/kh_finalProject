package com.kh.chickenPeople.brand.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.brand.model.dao.BrandDao;
import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Service("brandService")
public class BrandServiceImpl implements BrandService{

	@Autowired
	BrandDao brandDao;
	
	@Override
	public int getListCount() {
		return brandDao.getListCount();
	}

	@Override
	public ArrayList<Brand> selectBrandList(PageInfo pi) {
		return brandDao.selectBrandList(pi);
	}


}
