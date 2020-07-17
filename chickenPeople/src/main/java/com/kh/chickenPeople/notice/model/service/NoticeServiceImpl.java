package com.kh.chickenPeople.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.notice.model.dao.NoticeDao;
import com.kh.chickenPeople.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {

	
	@Autowired
	NoticeDao nDao; 
	
	@Override
	public ArrayList<Notice> selectList() {

		return nDao.selectList();
	}



	@Override
	public Notice selectOne(int nNum) {
		// TODO Auto-generated method stub
		return  nDao.selectOne(nNum);
	}

}
