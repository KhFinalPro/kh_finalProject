package com.kh.chickenPeople.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.notice.model.dao.NoticeDao;
import com.kh.chickenPeople.notice.model.vo.Notice;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {

	
	@Autowired
	NoticeDao nDao; 
	
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi){

		return nDao.selectNoticeList(pi);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return nDao.getListCount();
	}


	@Override
	public Notice selectOne(int nNum) {
		// TODO Auto-generated method stub
		return  nDao.selectOne(nNum);
	}



	@Override
	public int insertNotice(Notice n) {
		System.out.println("insertService :" +n);
		return nDao.insertNotice(n);
	}



	@Override
	public int addReadCount(int nNum) {
		// TODO Auto-generated method stub
		return nDao.addReadCount(nNum);
	}



	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return nDao.updateNotice(n);
	}



	@Override
	public int deleteNotice(int nNum) {
		// TODO Auto-generated method stub
		return nDao.deleteNotice(nNum);
	}





}
