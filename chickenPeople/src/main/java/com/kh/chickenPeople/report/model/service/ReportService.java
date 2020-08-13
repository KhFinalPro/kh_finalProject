package com.kh.chickenPeople.report.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.report.model.vo.Report;
import com.kh.chickenPeople.report.model.vo.ReportCategory;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

public interface ReportService {

	ArrayList<ReportCategory> selectRCategory();		//관리자 _ 검색조건에 불러올 신고 카테고리

	int getListCount();

	int getSearchListCount(SearchStatus searchStatus);

	ArrayList<Report> selectReportList(PageInfo pi);

	ArrayList<Report> selectReportSearchList(SearchStatus searchStatus, PageInfo pi);

	int insertReport(Report p);

	int changeBungStatus(int brNum);

	int changeReportStatus(int rptNum);

	int changeMukStatus(int brNum);
	

}
