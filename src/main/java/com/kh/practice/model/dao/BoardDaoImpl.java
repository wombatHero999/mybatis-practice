package com.kh.practice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.practice.model.vo.Board;

public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectAllBoard(SqlSession session) {
		return session.selectList("board.selectAllBoard");
	}

	@Override
	public Board selectBoardByNo(SqlSession session, int boardNo) {
		return null;
	}

}




