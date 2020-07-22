package com.kh.chickenPeople.systemAdmin.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.systemAdmin.model.dao.SystemDao;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Service("sService")
public class SystemServiceImpl implements SystemService{

	@Autowired
	SystemDao sDao;
	


}
