package com.kh.chickenPeople.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.member.model.dao.MemberDao;
import com.kh.chickenPeople.member.model.vo.Member;

@Service("mService")
public class MemberSerivceImpl implements MemberService {
	
	@Autowired
	MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		
		return mDao.loginMember(m);
	}

	@Override
	public void insertMember(Member m) {
		
	}

	@Override
	public int idChk(Member m) {
		
		return mDao.idChk(m);
	}

}
