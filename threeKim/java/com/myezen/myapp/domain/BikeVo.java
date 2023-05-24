package com.myezen.myapp.domain;

public class BikeVo {
	private int bkidx; //자전거번호
	private String bikeCode; //고유코드
	private String bikeType; //자전거종류
	private String bikeLocation; //자전거위치
	private String bikeState; //자전거상태
	
	public int getBkidx() {
		return bkidx;
	}
	public void setBkidx(int bkidx) {
		this.bkidx = bkidx;
	}
	public String getBikeCode() {
		return bikeCode;
	}
	public void setBikeCode(String bikeCode) {
		this.bikeCode = bikeCode;
	}
	public String getBikeType() {
		return bikeType;
	}
	public void setBikeType(String bikeType) {
		this.bikeType = bikeType;
	}
	public String getBikeLocation() {
		return bikeLocation;
	}
	public void setBikeLocation(String bikeLocation) {
		this.bikeLocation = bikeLocation;
	}
	public String getBikeState() {
		return bikeState;
	}
	public void setBikeState(String bikeState) {
		this.bikeState = bikeState;
	}
 
	
}
