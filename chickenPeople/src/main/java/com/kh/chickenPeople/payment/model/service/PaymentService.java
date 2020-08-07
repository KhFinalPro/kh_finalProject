package com.kh.chickenPeople.payment.model.service;

import java.util.Map;

import com.kh.chickenPeople.payment.model.vo.Payment;

public interface PaymentService {

	int insertAll(Payment payment);

	int selectCurrval();

	int insertJumunDetail(Map<String, Object> map);

	Payment selectPayment(String user_id);

}
