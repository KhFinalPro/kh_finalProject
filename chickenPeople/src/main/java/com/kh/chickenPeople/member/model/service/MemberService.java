package com.kh.chickenPeople.member.model.service;

import com.kh.chickenPeople.member.model.vo.Member;


public interface MemberService {
	Member loginMember(Member m);

	void insertMember(Member m);
}
