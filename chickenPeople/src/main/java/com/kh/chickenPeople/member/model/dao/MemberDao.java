package com.kh.chickenPeople.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.chickenPeople.member.model.vo.Address;
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

	public ArrayList<Address> selectAddress(Member member) {
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectAddress", member);
	}

	public int memberJoin(Member m) {
		
		return sqlSessionTemplate.insert("memberMapper.memberJoin", m);
	}

	public int insertStoreMember(Member stoMem) {
		return sqlSessionTemplate.insert("memberMapper.insertStoreMember",stoMem);
	}

	public int mypageUpdate(Member m) {
		
		return sqlSessionTemplate.update("memberMapper.mypageUpdate", m);
	}

	public Member findPwd(String id) {
		
		return sqlSessionTemplate.selectOne("memberMapper.findPwd", id);
	}

	public int deletePwd(Member member) {
		
		return sqlSessionTemplate.update("memberMapper.deletePwd", member);
	}

	public Member findId(Member m) {
		
		return sqlSessionTemplate.selectOne("memberMapper.findId", m);
	}

	
	
//	@Transactional
//	public int updatePwd(Member m) throws Exception{
//		return sqlSessionTemplate.update("member.updatePwd", m);
//	}
	
}
