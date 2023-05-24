package com.myezen.myapp.domain;

public class ErrorVo {
	private int eidx; //고장번호
	private int ridx; //대여번호
	private String errorContent; //고장 글 내용
	
	public int getEidx() {
		return eidx;
	}
	public void setEidx(int eidx) {
		this.eidx = eidx;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getErrorContent() {
		return errorContent;
	}
	public void setErrorContent(String errorContent) {
		this.errorContent = errorContent;
	}
	public String getErrorDay() {
		return errorDay;
	}
	public void setErrorDay(String errorDay) {
		this.errorDay = errorDay;
	}
	private String errorDay; //신고 시간

}
