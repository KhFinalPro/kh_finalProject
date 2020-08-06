package com.kh.chickenPeople.storeAdmin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("storeAdminDao")
public class StoreAdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	

}
