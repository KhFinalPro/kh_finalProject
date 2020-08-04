package com.kh.chickenPeople.report.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.report.model.vo.ReportCategory;

public interface ReportService {

	ArrayList<ReportCategory> selectRCategory();		//관리자 _ 검색조건에 불러올 신고 카테고리
	

}
