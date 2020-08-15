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

}
