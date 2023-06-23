package com.myezen.myapp.domain;

public class ReturnVo {
	private int rtidx; //반납번호
	private String returnDay; //반납요일
	private String returnPlace; //반납장소
	private int ridx; //대여번호
	
	public int getRtidx() {
		return rtidx;
	}
	public void setRtidx(int rtidx) {
		this.rtidx = rtidx;
	}
	public String getReturnDay() {
		return returnDay;
	}
	public void setReturnDay(String returnDay) {
		this.returnDay = returnDay;
	}
	public String getReturnPlace() {
		return returnPlace;
	}
	public void setReturnPlace(String returnPlace) {
		this.returnPlace = returnPlace;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	

}
