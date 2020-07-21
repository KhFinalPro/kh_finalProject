package com.kh.chickenPeople.systemAdmin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Repository("sDao")
public class SystemDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;



}
