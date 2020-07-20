package com.kh.chickenPeople.notice.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.notice.model.vo.Notice;

public interface NoticeService {

	public ArrayList<Notice> selectList();

	public Notice selectOne(int nNum);
}