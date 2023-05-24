package com.myezen.myapp.domain;

public class RentVo {
	private int RIDX; //대여번호
	private String RENTDAY; //대여요일
	private String RENTPLACE; //대여장소
	private int BKIDX; //자전거번호
	
	public int getRIDX() {
		return RIDX;
	}
	public void setRIDX(int rIDX) {
		RIDX = rIDX;
	}
	public String getRENTDAY() {
		return RENTDAY;
	}
	public void setRENTDAY(String rENTDAY) {
		RENTDAY = rENTDAY;
	}
	public String getRENTPLACE() {
		return RENTPLACE;
	}
	public void setRENTPLACE(String rENTPLACE) {
		RENTPLACE = rENTPLACE;
	}
	public int getBKIDX() {
		return BKIDX;
	}
	public void setBKIDX(int bKIDX) {
		BKIDX = bKIDX;
	}
	public int getRSIDX() {
		return RSIDX;
	}
	public void setRSIDX(int rSIDX) {
		RSIDX = rSIDX;
	}
	public int getMIDX() {
		return MIDX;
	}
	public void setMIDX(int mIDX) {
		MIDX = mIDX;
	}
	private int RSIDX; //대여소번호
	private int MIDX; //회원번호
}
