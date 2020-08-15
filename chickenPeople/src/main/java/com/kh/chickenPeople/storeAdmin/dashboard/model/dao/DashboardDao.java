package com.kh.chickenPeople.storeAdmin.dashboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.storeAdmin.dashboard.model.vo.Dashboard;
import com.kh.chickenPeople.storeAdmin.storeOrder.model.vo.StoreOrder;

@Repository("dashboardDao")
public class DashboardDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public Dashboard selectTotalncome(String userId) {
		
		
		
		return sqlSessionTemplate.selectOne("dashboardMapper.selectTotalncome",userId);
		
	}

	public Dashboard selectTotalOrder(String userId) {
	
		return sqlSessionTemplate.selectOne("dashboardMapper.selectTotalOrder",userId);
	}

	public Dashboard selectaverageReview(String userId) {
		
		return sqlSessionTemplate.selectOne("dashboardMapper.selectaverageReview",userId);
	}

	public Dashboard selectStoreLike(String userId) {
	
		return sqlSessionTemplate.selectOne("dashboardMapper.selectStoreLike",userId);
	}

	public Dashboard selectTotalChicken(String userId) {
	
		return sqlSessionTemplate.selectOne("dashboardMapper.selectTotalChicken",userId);
	}

	public ArrayList<Dashboard> selectTopMenuList(String userId) {
		
		
		ArrayList<Dashboard> selectTopMenuList = new ArrayList<Dashboard>();
		
		selectTopMenuList = (ArrayList)sqlSessionTemplate.selectList("dashboardMapper.selectTopMenuList",userId);
		
		return selectTopMenuList;
	}

	public ArrayList<Dashboard> monthlyTotalIncomeList(String userId) {
		ArrayList<Dashboard> monthlyTotalIncomeList = new ArrayList<Dashboard>();
		
		monthlyTotalIncomeList = (ArrayList)sqlSessionTemplate.selectList("dashboardMapper.monthlyTotalIncomeList",userId);
		return monthlyTotalIncomeList;
	}

	public ArrayList<Dashboard> selectTopSideList(String userId) {
		ArrayList<Dashboard> selectTopSideList = new ArrayList<Dashboard>();
		
		selectTopSideList = (ArrayList)sqlSessionTemplate.selectList("dashboardMapper.selectTopSideList",userId);
		
		return selectTopSideList;
	}

	public ArrayList<Dashboard> vipCustoemrList(String userId) {
		ArrayList<Dashboard> vipCustoemrList = new ArrayList<Dashboard>();
		
		vipCustoemrList = (ArrayList)sqlSessionTemplate.selectList("dashboardMapper.vipCustoemrList",userId);
		
		return vipCustoemrList;
	}

}
