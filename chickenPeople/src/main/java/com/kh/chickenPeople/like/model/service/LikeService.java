package com.kh.chickenPeople.like.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.like.model.vo.Like;

public interface LikeService {

	ArrayList<Like> likeStoreList() throws Exception;
	
	
	ArrayList<Like> likeWriteList() throws Exception;
	
}
