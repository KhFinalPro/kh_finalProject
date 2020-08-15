package com.kh.chickenPeople.storeAdmin.dashboard.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.storeAdmin.dashboard.model.vo.Dashboard;

public interface DashboardService {

	Dashboard selectTotalncome(String userId);

	Dashboard selectTotalOrder(String userId);

	Dashboard selectaverageReview(String userId);

	Dashboard selectStoreLike(String userId);

	Dashboard selectTotalChicken(String userId);

	ArrayList<Dashboard> selectTopMenuList(String userId);

	ArrayList<Dashboard> monthlyTotalIncomeList(String userId);

	ArrayList<Dashboard> selectTopSideList(String userId);

	ArrayList<Dashboard> vipCustoemrList(String userId);

}
