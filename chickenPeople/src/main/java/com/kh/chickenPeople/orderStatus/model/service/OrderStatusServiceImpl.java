package com.kh.chickenPeople.orderStatus.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.orderStatus.model.dao.OrderStatusDao;
import com.kh.chickenPeople.orderStatus.model.vo.OrderStatus;

@Service("orderStatusService")
public class OrderStatusServiceImpl implements OrderStatusService {
	
	@Autowired
	OrderStatusDao orderStatusDao;
	
	@Override
	public ArrayList<OrderStatus> paymentInfoSelect(String id) {
		// TODO Auto-generated method stub
		return orderStatusDao.paymentInfoSelect(id);
	}

	@Override
	public ArrayList<OrderStatus> menuInfoSelect(String ord_num) {
		// TODO Auto-generated method stub
		return orderStatusDao.menuInfoSelect(ord_num);
	}


}
