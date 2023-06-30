package com.myezen.myapp.domain;

public class BikeInfoVo {
	private String bikeType;
	private String bikeContent;
	private int rentPrice;
	private String bikeCode;	
	private String uploadFile;
	
	
	public String getBikeType() {
		return bikeType;
	}
	public void setBikeType(String bikeType) {
		this.bikeType = bikeType;
	}
	public String getBikeContent() {
		return bikeContent;
	}
	public void setBikeContent(String bikeContent) {
		this.bikeContent = bikeContent;
	}
	public int getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
	}
	public String getBikeCode() {
		return bikeCode;
	}
	public void setBikeCode(String bikeCode) {
		this.bikeCode = bikeCode;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
}
