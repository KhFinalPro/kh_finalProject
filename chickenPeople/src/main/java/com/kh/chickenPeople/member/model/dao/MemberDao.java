package com.kh.chickenPeople.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.member.model.vo.Member;

@Repository("mDao")
public  class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Member loginMember(Member m) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectOne", m);
	}

	public int idChk(Member m) {
		
		return sqlSessionTemplate.selectOne("memberMapper.idChk", m);
	}
	
}
