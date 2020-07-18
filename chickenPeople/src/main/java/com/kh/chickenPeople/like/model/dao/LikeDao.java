package com.kh.chickenPeople.like.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.like.model.vo.Like;

@Repository("likeDao")
public class LikeDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 찜한 매장 목록
	public ArrayList<Like> likeStoreList() {
		
		ArrayList<Like> storelist = new ArrayList<Like>();
		storelist = (ArrayList)sqlSessionTemplate.selectList("likeMapper.likeStoreList");
	
		
		if(storelist == null) {
			storelist = new ArrayList<Like>();
		}
	
		return storelist;
	}
	
	// 찜한 글 목록 
	public ArrayList<Like> likeWriteList(){
		
		ArrayList<Like> writeList = new ArrayList<Like>();
		writeList = (ArrayList)sqlSessionTemplate.selectList("likeMapper.likeWriteList");
		
		return writeList;
	}
}
