package com.kh.chickenPeople.Calendar.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.Calendar.model.dao.CalendarDao;
import com.kh.chickenPeople.Calendar.model.vo.Calendar;

@Service("calenderService")
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao calenderDao;

	
	@Override
	public ArrayList<Calendar> orderList(String userId) {
		
		return calenderDao.orderList(userId);
	}

	@Override
	public ArrayList<Calendar> orderDetailList(HashMap<String, String> map) {
		
		return calenderDao.orderDetailList(map);
	}

	
	//주문 리뷰

	 @Override public int insertOrderReview(HashMap<String, String> map) {
	  
		 return calenderDao.insertOrderReview(map);	
	 }
	 
	
	
	//스토어리뷰
	@Override
	public int insertStoreReview(HashMap<String, String> map2) {
		
		return calenderDao.insertStoreReview(map2);
	}

	
	
}
