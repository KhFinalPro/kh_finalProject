package com.kh.chickenPeople.like.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.like.model.dao.LikeDao;
import com.kh.chickenPeople.like.model.vo.Like;

@Service("likeService")
public class LikeServiceImpl implements LikeService{

	@Autowired
	LikeDao likeDao;
	
	@Override
	public ArrayList<Like> likeStoreList(){
	
		return likeDao.likeStoreList();
	}

	@Override
	public ArrayList<Like> likeWriteList() throws Exception {

		//ArrayList<Like> writeList = likeDao.likeWriteList();
		
		return likeDao.likeWriteList();
	}
}
