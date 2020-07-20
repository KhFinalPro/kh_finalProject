package com.kh.chickenPeople.systemAdmin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.systemAdmin.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Repository("sDao")
public class SystemDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getListCount() {
		return sqlSessionTemplate.selectOne("systemMapper.getListCount");
	}
	
	public ArrayList<Menu> selectMenuList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("offset:"+rowBounds);
		return (ArrayList)sqlSessionTemplate.selectList("systemMapper.selectMenu", null, rowBounds);
	}


}
