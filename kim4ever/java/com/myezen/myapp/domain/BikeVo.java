package com.myezen.myapp.domain;

public class BikeVo {
	private int bkidx; //자전거번호
	private String bikeCode; //고유코드
	private String bikeType; //자전거종류
	private String bikeLocation; //자전거위치
	private String bikeState; //자전거상태 디폴트값 = 'Y' <대여가능 Y , 대여중  N , 고장 E>
	private String QRbike; //QR코드
	private String ebkidx; //bkidx암호화
 	
	
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
	public String getQRbike() {
		return QRbike;
	}
	public void setQRbike(String qRbike) {
		QRbike = qRbike;
	}
	public String getEbkidx() {
		return ebkidx;
	}
	public void setEbkidx(String ebkidx) {
		this.ebkidx = ebkidx;
	}
 
	
}
