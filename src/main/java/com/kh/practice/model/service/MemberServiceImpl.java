package com.kh.practice.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.practice.common.SqlSessionTemplate;
import com.kh.practice.model.dao.MemberDao;
import com.kh.practice.model.dao.MemberDaoImpl;
import com.kh.practice.model.vo.Member;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao dao = new MemberDaoImpl();
	
	@Override
	public List<Member> selectAllMember() {
		SqlSession session = SqlSessionTemplate.getSession();
		List<Member> list = dao.selectAllMember(session);
		session.close();
		return list;
	}

	@Override
	public Member selectMemberById(String userId) {
		SqlSession session = SqlSessionTemplate.getSession();
		Member m = dao.selectMemberById(session, userId);
		session.close();
		return m;
	}

	@Override
	public int inserMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> selectMemberByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
