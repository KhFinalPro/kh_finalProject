package com.kh.chickenPeople.delivery.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.delivery.model.vo.Delivery;

@Repository("deliveryDao")
public class DeliveryDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Delivery> selectDelivery() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("deliveryMapper.selectList");
	}

}
