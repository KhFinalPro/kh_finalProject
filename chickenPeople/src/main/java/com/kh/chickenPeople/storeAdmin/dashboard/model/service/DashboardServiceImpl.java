package com.kh.chickenPeople.storeAdmin.dashboard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.storeAdmin.dashboard.model.dao.DashboardDao;
import com.kh.chickenPeople.storeAdmin.dashboard.model.vo.Dashboard;

@Service("dashboardService")
public class DashboardServiceImpl implements DashboardService {
	

	@Autowired
	DashboardDao dashboardDao;

	@Override
	public Dashboard selectTotalncome(String userId) {
	
		return dashboardDao.selectTotalncome(userId);
	}

	@Override
	public Dashboard selectTotalOrder(String userId) {
		
		return dashboardDao.selectTotalOrder(userId);
	}

	@Override
	public Dashboard selectaverageReview(String userId) {
		
		return dashboardDao.selectaverageReview(userId);
	}

	@Override
	public Dashboard selectStoreLike(String userId) {
	
		return dashboardDao.selectStoreLike(userId);
	}

	@Override
	public Dashboard selectTotalChicken(String userId) {
		
		return dashboardDao.selectTotalChicken(userId);
	}

	@Override
	public ArrayList<Dashboard> selectTopMenuList(String userId) {
	
		return dashboardDao.selectTopMenuList(userId);
	}

	@Override
	public ArrayList<Dashboard> monthlyTotalIncomeList(String userId) {

		return dashboardDao.monthlyTotalIncomeList(userId);
	}

	@Override
	public ArrayList<Dashboard> selectTopSideList(String userId) {
	
		return dashboardDao.selectTopSideList(userId);
	}

	@Override
	public ArrayList<Dashboard> vipCustoemrList(String userId) {
		
		return dashboardDao.vipCustoemrList(userId);
	}
	
}
