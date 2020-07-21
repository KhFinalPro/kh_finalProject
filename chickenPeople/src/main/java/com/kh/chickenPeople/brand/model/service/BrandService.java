package com.kh.chickenPeople.brand.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

public interface BrandService {

	int getListCount();	
	ArrayList<Brand> selectBrandList(PageInfo pi);


}
