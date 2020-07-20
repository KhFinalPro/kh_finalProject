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

	public int insertNotice(Notice n) {
		
		System.out.println("insert DAO 출력:"+n);
		
		return sqlSessionTemplate.insert("noticeMapper.insertNotice",n);
	}

	public int addReadCount(int nNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("noticeMapper.updateCount",nNum);
	}


}
