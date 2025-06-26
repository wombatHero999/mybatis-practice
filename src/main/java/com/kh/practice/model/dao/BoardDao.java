package com.kh.practice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.practice.model.vo.Board;

public interface BoardDao {
	List<Board> selectAllBoard(SqlSession session);
	Board selectBoardByNo(SqlSession session, int boardNo);
}
