package com.kh.chickenPeople.like.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.like.model.vo.Like;

@Repository("likeDao")
public class LikeDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Like> selectList() {
		
		ArrayList list = new ArrayList();
		
		list = (ArrayList)sqlSessionTemplate.selectList("likeMapper.selectList");
		
		return list;
	}
}
