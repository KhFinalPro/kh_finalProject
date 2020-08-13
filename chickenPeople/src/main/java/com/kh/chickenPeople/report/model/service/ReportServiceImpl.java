package com.kh.chickenPeople.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.report.model.dao.ReportDao;
import com.kh.chickenPeople.report.model.vo.Report;
import com.kh.chickenPeople.report.model.vo.ReportCategory;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Service("rService")
public class ReportServiceImpl implements ReportService{

	@Autowired
	ReportDao rDao;
	
	@Override
	public ArrayList<ReportCategory> selectRCategory() {
		return rDao.selectRCategory();
	}

	@Override
	public int getListCount() {
		return rDao.getListCount();
	}

	@Override
	public int getSearchListCount(SearchStatus searchStatus) {
		return rDao.getSearchListCount(searchStatus);
	}

	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return rDao.selectReportList(pi);
	}

	@Override
	public ArrayList<Report> selectReportSearchList(SearchStatus searchStatus, PageInfo pi) {
		return rDao.selectReportSearchList(searchStatus,pi);
	}

	@Override
	public int insertReport(Report p) {
		return rDao.insertReport(p);
	}

	@Override
	public int changeBungStatus(int brNum) {
		return rDao.changeBungStatus(brNum);
	}

	@Override
	public int changeReportStatus(int rptNum) {
		return rDao.changeReportStatus(rptNum);
	}

	@Override
	public int changeMukStatus(int brNum) {
		return rDao.changeMukStatus(brNum);
	}

}
