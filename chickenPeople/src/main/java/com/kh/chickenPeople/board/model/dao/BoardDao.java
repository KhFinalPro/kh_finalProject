package com.kh.chickenPeople.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.board.model.vo.Board;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Repository("bDao")
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	

	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());	
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectBoardList",null,rowBounds);
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("boardMapper.getListCount");
	}

	
	
}
