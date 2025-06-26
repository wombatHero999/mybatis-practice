package com.kh.practice.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyContent;
	private int boardNo;
	private int userNo;
	private String userName;
	private Date createDate;
	private String status;

	public Reply() {

	}

	public Reply(int replyNo, String replyContent, int boardNo, int userNo, Date createDate, String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.createDate = createDate;
		this.status = status;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", boardNo=" + boardNo + ", userNo="
				+ userNo + ", createDate=" + createDate + ", status=" + status + "]";
	}

}
