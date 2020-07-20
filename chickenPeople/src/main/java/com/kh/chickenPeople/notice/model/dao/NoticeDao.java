package com.kh.chickenPeople.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.notice.model.vo.Notice;

@Repository("nDao")
public class NoticeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Notice> selectList() {
		
		ArrayList list = new ArrayList();
		list =(ArrayList)sqlSessionTemplate.selectList("noticeMapper.selectList");
		
		return list;
	}

	public Notice selectOne(int nNum) {
		
		
		return sqlSessionTemplate.selectOne("noticeMapper.selectOne",nNum);
	}


}
