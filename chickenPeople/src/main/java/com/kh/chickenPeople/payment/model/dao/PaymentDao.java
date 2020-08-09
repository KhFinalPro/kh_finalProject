package com.kh.chickenPeople.payment.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.payment.model.vo.Payment;

@Repository("paymentDao")
public class PaymentDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertAll(Payment payment) {
		// TODO Auto-generated method stub
		int resultinsertAll = sqlSessionTemplate.insert("paymentMapper.insertAllKakao", payment);
		int result;
		if(resultinsertAll > 0)
		{
			result = sqlSessionTemplate.selectOne("paymentMapper.selectCurrval");
		}
		else
		{
			result = 0;
		}
		return result;
	}

	public int selectCurrval() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("paymentMapper.selectCurrval");
	}

	public int insertJumunDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("paymentMapper.insertJumunDetail", map);
	}

	public Payment selectPayment(String user_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("paymentMapper.selectPaymentInfo", user_id);
	}
}
