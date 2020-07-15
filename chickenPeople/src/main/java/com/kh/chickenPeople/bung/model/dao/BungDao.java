package com.kh.chickenPeople.bung.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bungDao")
public class BungDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

}
