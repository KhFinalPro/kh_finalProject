package com.kh.chickenPeople.like.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.like.model.dao.LikeDao;
import com.kh.chickenPeople.like.model.vo.Like;
import com.kh.chickenPeople.member.model.vo.Member;

@Service("likeService")
public class LikeServiceImpl implements LikeService{

	@Autowired
	LikeDao likeDao;
	
	@Override
	public ArrayList<Like> likeStoreList(String userId)  throws Exception{
	
		return likeDao.likeStoreList(userId);
	}

	@Override
	public ArrayList<Like> likeWriteList(String userId) throws Exception {

		
		return likeDao.likeWriteList(userId);
	}

	

	@Override
	public int deleteWrite(HashMap<String, String> map) throws Exception {
		
		return likeDao.deleteWrite(map);
	}

	@Override
	public int deleteStore(HashMap<String, String> map) throws Exception {
		
		return  likeDao.deleteStore(map);
	}

	@Override
	public ArrayList<Like> likeRatelist() {
		
		return likeDao.likeRatelist();
	}



	

	

}
