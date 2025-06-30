package com.kh.practice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.practice.model.vo.Member;

public interface MemberDao {
	List<Member> selectAllMember(SqlSession session);
	Member selectMemberById(SqlSession session , String userId);
	int inserMember(SqlSession session ,Member m);
	List<Member> selectMemberByName(SqlSession session ,String name);
}
