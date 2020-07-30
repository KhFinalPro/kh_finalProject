package com.kh.chickenPeople.orderStatus.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.orderStatus.model.vo.OrderStatus;

public interface OrderStatusService {

	ArrayList<OrderStatus> paymentInfoSelect(String id);

	ArrayList<OrderStatus> menuInfoSelect(String ord_num);

	

}
