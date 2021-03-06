package com.kh.chickenPeople.board.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.board.model.vo.Board;
import com.kh.chickenPeople.board.model.vo.Picture;
import com.kh.chickenPeople.reply.model.vo.Reply;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;


public interface BoardService {

	int getListCount();

	ArrayList<Board> selectTotalBoardList(PageInfo pi);

	int addReadCount(int bNum);

	Board selectOne(int bNum);

	int insertBoard(Board b);

	int selectCurrval();

	int insertPicture(ArrayList<Picture> pList);

	ArrayList<Picture> selectPicture(int bNum);

	int updateThumbnail(Board b);

	Board selectBoardLike(Board b);

	int insertBoardLike(Board b);

	int selectBoardLikeCount(Board b);

	int updateBoardHit(Board b);

	int deleteBoardLike(Board b);

	int downBoardHit(Board b);

	int boardDelete(int bNum);

	ArrayList<Board> selectMyBoard(String bWriter);

	int boardBackup(int bNum);


	

}
