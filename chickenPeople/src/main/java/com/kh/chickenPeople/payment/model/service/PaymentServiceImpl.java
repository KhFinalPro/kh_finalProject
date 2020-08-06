package com.kh.chickenPeople.payment.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.payment.model.dao.PaymentDao;
import com.kh.chickenPeople.payment.model.vo.Payment;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentDao paymentDao;

	@Override
	public int insertAll(Payment payment) {
		// TODO Auto-generated method stub
		return paymentDao.insertAll(payment);
	}

	@Override
	public int selectCurrval() {
		// TODO Auto-generated method stub
		return paymentDao.selectCurrval();
	}

	@Override
	public int insertJumunDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentDao.insertJumunDetail(map);
	}

	@Override
	public Payment selectPayment(String user_id) {
		// TODO Auto-generated method stub
		return paymentDao.selectPayment(user_id);
	}
}
