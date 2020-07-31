package com.kh.chickenPeople.orderStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.orderStatus.model.vo.OrderStatus;

@Repository("orderStatusDao")
public class OrderStatusDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<OrderStatus> paymentInfoSelect(String id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("orderStatusMapper.paymentInfoSelect", id);
	}

	public ArrayList<OrderStatus> menuInfoSelect(String ord_num) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("orderStatusMapper.menuInfoSelect", ord_num);
	}

}
