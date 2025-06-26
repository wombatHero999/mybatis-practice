package com.kh.practice.model.service;

import java.util.List;

import com.kh.practice.model.vo.Member;

public interface MemberService {
	List<Member> selectAllMember();
	Member selectMemberById(String userId);
	int inserMember(Member m);
	List<Member> selectMemberByName(String name);
}
