package com.kh.chickenPeople.notice.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.notice.model.vo.Notice;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

public interface NoticeService {

	public int getListCount();
	public ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	public Notice selectOne(int nNum);

	public int insertNotice(Notice n);

	public int addReadCount(int nNum);

	public int updateNotice(Notice n);

	public int deleteNotice(int nNum);




	
	
}