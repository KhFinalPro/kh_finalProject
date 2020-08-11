package com.kh.chickenPeople.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.board.model.vo.Board;
import com.kh.chickenPeople.board.model.vo.Picture;
import com.kh.chickenPeople.reply.model.vo.Reply;
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

	public int getListCount() { //페이지
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("boardMapper.getListCount");
	}


	public Board selectOne(int bNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("boardMapper.selectOne",bNum);
	}

	public int addReadCount(int bNum) { //조회수 증가
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("boardMapper.updateCount",bNum);
	}

	public int insertBoard(Board b) {
		return sqlSessionTemplate.insert("boardMapper.insertBoard",b);
	}

	public int selectCurrval() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("boardMapper.selectCurrval");
	}

	public int insertPicture(ArrayList<Picture> pList) {
		int result = 0;
		for(Picture p : pList) {
			result += sqlSessionTemplate.insert("boardMapper.insertPicture",p);
		}
		if(result == pList.size()) {
			return 1;
		}else {
			sqlSessionTemplate.rollback();
			return 0;
		}
	}

	public ArrayList<Picture> selectPicture(int bNum) {
	
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectPicture",bNum);
	}

	public int updateThumbnail(Board b) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("boardMapper.updateThumbnail",b);
	}

	
	
	
}
