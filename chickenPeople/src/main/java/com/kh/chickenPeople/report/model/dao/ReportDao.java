package com.kh.chickenPeople.report.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.report.model.vo.ReportCategory;

@Repository("rDao")
public class ReportDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public ArrayList<ReportCategory> selectRCategory() {
		return (ArrayList)sqlSessionTemplate.selectList("reportMapper.selectRCateogory");
	}

}
