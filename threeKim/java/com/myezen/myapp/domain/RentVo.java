package com.myezen.myapp.domain;

public class RentVo {
	private int ridx; //대여번호
	private String rentDay; //대여요일
	private String rentPlace; //대여장소
	private int bkidx; //자전거번호
	private int rsdix; //대여소번호
	private int midx; //회원번호
	
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getRentDay() {
		return rentDay;
	}
	public void setRentDay(String rentDay) {
		this.rentDay = rentDay;
	}
	public String getRentPlace() {
		return rentPlace;
	}
	public void setRentPlace(String rentPlace) {
		this.rentPlace = rentPlace;
	}
	public int getBkidx() {
		return bkidx;
	}
	public void setBkidx(int bkidx) {
		this.bkidx = bkidx;
	}
	public int getRsdix() {
		return rsdix;
	}
	public void setRsdix(int rsdix) {
		this.rsdix = rsdix;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}

}
