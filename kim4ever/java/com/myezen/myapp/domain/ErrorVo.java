package com.myezen.myapp.domain;

public class ErrorVo {
	private int eidx; //고장번호
	private int ridx; //대여번호
	private int bkidx; //자전거번호
	private String errorContent; 	//고장 글 내용
	private String errorDay; 		//신고 시간	
	private String errorState; 		//고장 상태
	private String errorLatitude;  	//고장 위도
	private String errorLongitude; 	//고장 경도
	private String errorLocation; 	//고장 위치
	private String errorImage; 	//고장 이미지
	
	
	public int getEidx() {
		return eidx;
	}
	public void setEidx(int eidx) {
		this.eidx = eidx;
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
	public String getErrorState() {
		return errorState;
	}
	public void setErrorState(String errorState) {
		this.errorState = errorState;
	}
	public String getErrorLatitude() {
		return errorLatitude;
	}
	public void setErrorLatitude(String errorLatitude) {
		this.errorLatitude = errorLatitude;
	}
	public String getErrorLongitude() {
		return errorLongitude;
	}
	public void setErrorLongitude(String errorLongitude) {
		this.errorLongitude = errorLongitude;
	}
	public String getErrorLocation() {
		return errorLocation;
	}
	public void setErrorLocation(String errorLocation) {
		this.errorLocation = errorLocation;
	}
	public String getErrorImage() {
		return errorImage;
	}
	public void setErrorImage(String errorImage) {
		this.errorImage = errorImage;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getBkidx() {
		return bkidx;
	}
	public void setBkidx(int bkidx) {
		this.bkidx = bkidx;
	}
	



}
