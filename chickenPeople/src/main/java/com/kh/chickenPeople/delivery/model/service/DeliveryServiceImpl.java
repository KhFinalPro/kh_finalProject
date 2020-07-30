package com.kh.chickenPeople.delivery.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.delivery.model.dao.DeliveryDao;
import com.kh.chickenPeople.delivery.model.vo.Delivery;

@Service("deliveryService")
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	DeliveryDao deliveryDao;
	
	@Override
	public ArrayList<Delivery> selectDelivery() {
		// TODO Auto-generated method stub
		return deliveryDao.selectDelivery();
	}

	@Override
	public ArrayList<Delivery> selectBestDelivery() {
		// TODO Auto-generated method stub
		return deliveryDao.selectBestDelivery();
	}

	

}
