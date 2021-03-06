package com.kh.chickenPeople.member.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.member.model.vo.Address;
import com.kh.chickenPeople.member.model.vo.Member;


public interface MemberService {
	Member loginMember(Member m);

	void insertMember(Member m);

	int idChk(Member m);

	ArrayList<Address> selectAddress(Member member);

	int memberJoin(Member m);

	int insertStoreMember(Member stoMem);

	int mypageUpdate(Member m);

	Member findPwd(String id);

	int deletePwd(Member member);

	ArrayList<Member> findId(Member m);

	int noPwd(Member m);

	int addAddress(Member m);

	ArrayList<Address> myAdddress(String id);

	int deleteAddress(int aa);

}
