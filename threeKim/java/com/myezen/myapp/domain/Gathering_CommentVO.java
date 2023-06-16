package com.myezen.myapp.domain;

public class Gathering_CommentVO {//모임 게시판 댓글

	private int gcidx;//모임 게시판 댓글 번호
	private int gbidx;//모임 게시판 번호
	private int midx;//회원 번호
	private String gCommentContents;//모임 댓글 내용
	private String gCommentWriteDay;//모임 댓글 작성일
	private String gCommentDelDay;//모임 댓글 삭제일
	private String gCommentDelYN;//모임 댓글 삭제 여부
	private int gCommentDepth; //모임 답글 깊이
	private int regcidx; //모임 답글 위치번호
	
	
	public int getgCommentDepth() {
		return gCommentDepth;
	}
	public void setgCommentDepth(int gCommentDepth) {
		this.gCommentDepth = gCommentDepth;
	}
	public int getGcidx() {
		return gcidx;
	}
	public void setGcidx(int gcidx) {
		this.gcidx = gcidx;
	}
	public int getGbidx() {
		return gbidx;
	}
	public void setGbidx(int gbidx) {
		this.gbidx = gbidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getgCommentContents() {
		return gCommentContents;
	}
	public void setgCommentContents(String gCommentContents) {
		this.gCommentContents = gCommentContents;
	}
	public String getgCommentWriteDay() {
		return gCommentWriteDay;
	}
	public void setgCommentWriteDay(String gCommentWriteDay) {
		this.gCommentWriteDay = gCommentWriteDay;
	}
	public String getgCommentDelDay() {
		return gCommentDelDay;
	}
	public void setgCommentDelDay(String gCommentDelDay) {
		this.gCommentDelDay = gCommentDelDay;
	}
	public String getgCommentDelYN() {
		return gCommentDelYN;
	}
	public void setgCommentDelYN(String gCommentDelYN) {
		this.gCommentDelYN = gCommentDelYN;
	}
	public int getRegcidx() {
		return regcidx;
	}
	public void setRegcidx(int regcidx) {
		this.regcidx = regcidx;
	}

	
	
}
