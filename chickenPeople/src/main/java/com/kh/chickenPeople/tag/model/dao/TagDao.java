package com.kh.chickenPeople.tag.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.tag.model.vo.Tag;

@Repository("tagDao")
public class TagDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public Tag selectTagNum(String tag) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("tagMapper.selectOneTag", tag);
	}

	public int insertTag(String tag) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("tagMapper.insertTag", tag);
	}

}
