package com.kh.chickenPeople.Calendar.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.Calendar.model.vo.Calendar;

@Repository("calendarDao")
public class CalendarDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	//주문내역
	public ArrayList<Calendar> orderList(String userId){
		
		ArrayList<Calendar> orderList = new ArrayList<Calendar>();
		orderList = (ArrayList)sqlSessionTemplate.selectList("calendarMapper.orderList",userId);
		
		return orderList;
	}


	public ArrayList<Calendar> orderDetailList(HashMap<String, String> map) {
		
		ArrayList<Calendar> orderDetailList = new ArrayList<Calendar>();
		orderDetailList = (ArrayList)sqlSessionTemplate.selectList("calendarMapper.orderDetailList",map);
		
		return orderDetailList;
	}
	
	
	
	

}
