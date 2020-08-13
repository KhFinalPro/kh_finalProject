package com.kh.chickenPeople.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.report.model.vo.Report;
import com.kh.chickenPeople.report.model.vo.ReportCategory;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Repository("rDao")
public class ReportDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public ArrayList<ReportCategory> selectRCategory() {
		return (ArrayList)sqlSessionTemplate.selectList("reportMapper.selectRCateogory");
	}


	public int getListCount() {
		return sqlSessionTemplate.selectOne("reportMapper.getListCount");
	}


	public int getSearchListCount(SearchStatus searchStatus) {

		return sqlSessionTemplate.selectOne("reportMapper.getsearchListcount",searchStatus);
	}


	public ArrayList<Report> selectReportList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSessionTemplate.selectList("reportMapper.selectReport",null, rowBounds);
	}


	public ArrayList<Report> selectReportSearchList(SearchStatus searchStatus, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("reportMapper.selectReportSearchList",searchStatus,rowBounds);
	}


	public int insertReport(Report p) {
		return sqlSessionTemplate.insert("reportMapper.insertReport", p);
	}


	public int changeBungStatus(int brNum) {
		return sqlSessionTemplate.update("bungMapper.updateBungStatus",brNum);
	}


	public int changeReportStatus(int rptNum) {
		return sqlSessionTemplate.update("reportMapper.updateReportStatus",rptNum);
	}


	public int changeMukStatus(int brNum) {
		return sqlSessionTemplate.update("boardMapper.updateBoardStatus",brNum);
	}

}
