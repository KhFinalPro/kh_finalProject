package com.kh.chickenPeople.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.member.model.dao.MemberDao;
import com.kh.chickenPeople.member.model.vo.Address;
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

	@Override
	public ArrayList<Address> selectAddress(Member member) {
		// TODO Auto-generated method stub
		return mDao.selectAddress(member);
	}

	@Override
	public int memberJoin(Member m) {
	
		return mDao.memberJoin(m);
	}

	@Override
	public int insertStoreMember(Member stoMem) {
		return mDao.insertStoreMember(stoMem);
	}

	@Override
	public int mypageUpdate(Member m) {
		
		return mDao.mypageUpdate(m);
	}

	@Override
	public Member findPwd(String id) {
		
		return mDao.findPwd(id);
	}

	@Override
	public int deletePwd(Member member) {
		
		return mDao.deletePwd(member);
	}

	@Override
	public ArrayList<Member> findId(Member m) {
		
		return mDao.findId(m);
	}

	@Override
	public int noPwd(Member m) {
		return mDao.noPwd(m);
	}

	@Override
	public int addAddress(Member m) {
		return mDao.addAddress(m);
	}

	@Override
	public ArrayList<Address> myAdddress(String id) {
		
		return mDao.myAddress(id);
	}

	@Override
	public int deleteAddress(int aa) {
		return mDao.deleteAddress(aa);
	}



}
