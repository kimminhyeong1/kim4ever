package com.myezen.myapp.domain;

public class RentalshopVo {
	private int rsidx; //대여소번호
	private String rentalshopName; //대여소이름
	private String rentalshopLocation; //대여소위치
	
	public int getRsidx() {
		return rsidx;
	}
	public void setRsidx(int rsidx) {
		this.rsidx = rsidx;
	}
	public String getRentalshopName() {
		return rentalshopName;
	}
	public void setRentalshopName(String rentalshopName) {
		this.rentalshopName = rentalshopName;
	}
	public String getRentalshopLocation() {
		return rentalshopLocation;
	}
	public void setRentalshopLocation(String rentalshopLocation) {
		this.rentalshopLocation = rentalshopLocation;
	}
	
	
}
