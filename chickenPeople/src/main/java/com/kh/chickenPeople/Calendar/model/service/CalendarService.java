package com.kh.chickenPeople.Calendar.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.Calendar.model.vo.Calendar;

public interface CalendarService {

	ArrayList<Calendar> orderList(String userId);

	ArrayList<Calendar> orderDetailList(HashMap<String, String> map);

}
