package com.kh.chickenPeople.board.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.board.model.vo.Board;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;


public interface BoardService {

	int getListCount();

	ArrayList<Board> selectTotalBoardList(PageInfo pi);

	

}
