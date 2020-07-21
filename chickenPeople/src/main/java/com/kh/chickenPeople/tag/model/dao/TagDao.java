package com.kh.chickenPeople.tag.model.dao;

import java.util.ArrayList;

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

	public ArrayList<Tag>  selectTag(Integer bung_num) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("tagMapper.selectTag", bung_num);
	}

	public Tag selectTagName(int tag_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("tagMapper.selectTagName", tag_num);
	}

}
