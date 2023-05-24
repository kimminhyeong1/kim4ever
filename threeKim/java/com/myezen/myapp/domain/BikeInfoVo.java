package com.myezen.myapp.domain;

public class BikeInfoVo {
	private String BIKETYPE;
	
	public String getBIKETYPE() {
		return BIKETYPE;
	}
	public void setBIKETYPE(String bIKETYPE) {
		BIKETYPE = bIKETYPE;
	}
	public String getBIKECONTENT() {
		return BIKECONTENT;
	}
	public void setBIKECONTENT(String bIKECONTENT) {
		BIKECONTENT = bIKECONTENT;
	}
	public int getRENTPRICE() {
		return RENTPRICE;
	}
	public void setRENTPRICE(int rENTPRICE) {
		RENTPRICE = rENTPRICE;
	}
	private String BIKECONTENT;
	private int RENTPRICE;
}
