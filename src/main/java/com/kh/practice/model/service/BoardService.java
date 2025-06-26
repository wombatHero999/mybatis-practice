package com.kh.practice.model.service;

import java.util.List;

import com.kh.practice.model.vo.Board;

public interface BoardService {
	List<Board> selectAllBoard();
	Board selectBoardByNo(int boardNo);
}
