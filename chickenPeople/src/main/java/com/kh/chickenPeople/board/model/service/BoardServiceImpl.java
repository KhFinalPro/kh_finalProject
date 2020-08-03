package com.kh.chickenPeople.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.board.model.dao.BoardDao;
import com.kh.chickenPeople.board.model.vo.Board;
import com.kh.chickenPeople.reply.model.vo.Reply;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	BoardDao bDao; 
	
	@Override
	public int getListCount() {
		
		return  bDao.getListCount();
	}

	@Override
	public ArrayList<Board> selectTotalBoardList(PageInfo pi) {
	
		return bDao.selectNoticeList(pi);
	}

	@Override
	public int addReadCount(int bNum) {
		// TODO Auto-generated method stub
		return bDao.addReadCount(bNum);
	}

	@Override
	public Board selectOne(int bNum) {
		// TODO Auto-generated method stub
		return bDao.selectOne(bNum);
	}

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return bDao.insertBoard(b);
	}

	


}
