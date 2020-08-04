package com.kh.chickenPeople.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.report.model.dao.ReportDao;
import com.kh.chickenPeople.report.model.vo.ReportCategory;

@Service("rService")
public class ReportServiceImpl implements ReportService{

	@Autowired
	ReportDao rDao;
	
	@Override
	public ArrayList<ReportCategory> selectRCategory() {
		return rDao.selectRCategory();
	}

}
