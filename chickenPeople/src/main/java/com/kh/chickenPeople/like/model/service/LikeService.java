package com.kh.chickenPeople.like.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.chickenPeople.like.model.vo.Like;
import com.kh.chickenPeople.member.model.vo.Member;

public interface LikeService {

	//찜한 매장 리스트
	ArrayList<Like> likeStoreList(String userId) throws Exception;
	
	//찜한 글 리스트
	ArrayList<Like> likeWriteList(String userId) throws Exception;

	//찜한 매장 삭제
	//int deleteStore(int storeNo, String userId) throws Exception;

	//찜한 글 삭제
	int deleteWrite(HashMap<String, String> map) throws Exception;

	//찜한 매장 삭제
	int deleteStore(HashMap<String, String> map) throws Exception;



	
}
