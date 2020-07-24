package com.kh.chickenPeople.like.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.like.model.vo.Like;
import com.kh.chickenPeople.member.model.vo.Member;

@Repository("likeDao")
public class LikeDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 찜한 매장 목록
	public ArrayList<Like> likeStoreList(String userId) {
		
		ArrayList<Like> storelist = new ArrayList<Like>();
		storelist = (ArrayList)sqlSessionTemplate.selectList("likeMapper.likeStoreList",userId);
	
		return storelist;
	}
	
	// 찜한 글 목록 
	public ArrayList<Like> likeWriteList(String userId){
		
		ArrayList<Like> writeList = new ArrayList<Like>();
		writeList = (ArrayList)sqlSessionTemplate.selectList("likeMapper.likeWriteList",userId);
		
		return writeList;
	}

	
	// 찜한 글 삭제하기
	public int deleteWrite(HashMap<String, String> map) {
		
		return sqlSessionTemplate.delete("likeMapper.deleteWrite",map);
	}

	
	//찜한 매장삭제
	public int deleteStore(HashMap<String, String> map) {
		
		return sqlSessionTemplate.delete("likeMapper.deleteStore",map);
	}

	
}
	
	
