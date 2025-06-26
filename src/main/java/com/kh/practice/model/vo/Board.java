package com.kh.practice.model.vo;

import java.sql.Date;
import java.util.List;

public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int userNo;

	private String userName;
	private Date createDate;
	private String status;

	private List<Reply> replyList;

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public Board() {

	}

	public Board(int boardNo, String boardTitle, String boardContent, int userNo, Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userNo = userNo;
		this.createDate = createDate;
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", userNo=" + userNo + ", createDate=" + createDate + ", status=" + status + "]";
	}

}
