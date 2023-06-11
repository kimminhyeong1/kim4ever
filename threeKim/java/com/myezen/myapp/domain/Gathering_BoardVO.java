package com.myezen.myapp.domain;

public class Gathering_BoardVO {//모임게시판
	
	private int gbidx;//모임 게시판 번호
	private int giidx;//모임 정보 번호
	private int midx;//회원 번호
	private String gBoardTitle;//모임 게시글 제목
	private String gBoardCategory;//모임 게시글 카테고리
	private String gBoardContents;//모임 게시글 내용
	private int gBoardLikeCNT;//모임 게시글 좋아요 수
	private String gBoardWriteDay;//모임 게시글 작성일
	private String gBoardDelDay;//모임 게시글 삭제일
	private String gBoardDelYN;//모임 게시글 삭제 여부
	public int getGbidx() {
		return gbidx;
	}
	public void setGbidx(int gbidx) {
		this.gbidx = gbidx;
	}
	public int getGiidx() {
		return giidx;
	}
	public void setGiidx(int giidx) {
		this.giidx = giidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getgBoardTitle() {
		return gBoardTitle;
	}
	public void setgBoardTitle(String gBoardTitle) {
		this.gBoardTitle = gBoardTitle;
	}
	public String getgBoardCategory() {
		return gBoardCategory;
	}
	public void setgBoardCategory(String gBoardCategory) {
		this.gBoardCategory = gBoardCategory;
	}
	public String getgBoardContents() {
		return gBoardContents;
	}
	public void setgBoardContents(String gBoardContents) {
		this.gBoardContents = gBoardContents;
	}
	public int getgBoardLikeCNT() {
		return gBoardLikeCNT;
	}
	public void setgBoardLikeCNT(int gBoardLikeCNT) {
		this.gBoardLikeCNT = gBoardLikeCNT;
	}
	public String getgBoardWriteDay() {
		return gBoardWriteDay;
	}
	public void setgBoardWriteDay(String gBoardWriteDay) {
		this.gBoardWriteDay = gBoardWriteDay;
	}
	public String getgBoardDelDay() {
		return gBoardDelDay;
	}
	public void setgBoardDelDay(String gBoardDelDay) {
		this.gBoardDelDay = gBoardDelDay;
	}
	public String getgBoardDelYN() {
		return gBoardDelYN;
	}
	public void setgBoardDelYN(String gBoardDelYN) {
		this.gBoardDelYN = gBoardDelYN;
	}
	
	
	
}
