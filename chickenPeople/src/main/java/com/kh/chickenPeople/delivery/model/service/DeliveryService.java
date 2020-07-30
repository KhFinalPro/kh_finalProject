package com.kh.chickenPeople.delivery.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.delivery.model.vo.Delivery;

@Service
public interface DeliveryService {

	ArrayList<Delivery> selectDelivery();

	ArrayList<Delivery> selectBestDelivery();


}
