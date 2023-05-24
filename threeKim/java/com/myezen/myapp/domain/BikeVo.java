package com.myezen.myapp.domain;

public class BikeVo {
	private int BKIDX; //자전거번호
	private String BIKECODE; //고유코드
	private String BIKETYPE; //자전거종류
	private String BIKELOCATION; //자전거위치
	private String BIKESTATE; //자전거상태
	
	public int getBKIDX() {
		return BKIDX;
	}
	public void setBKIDX(int bKIDX) {
		BKIDX = bKIDX;
	}
	public String getBIKECODE() {
		return BIKECODE;
	}
	public void setBIKECODE(String bIKECODE) {
		BIKECODE = bIKECODE;
	}
	public String getBIKETYPE() {
		return BIKETYPE;
	}
	public void setBIKETYPE(String bIKETYPE) {
		BIKETYPE = bIKETYPE;
	}
	public String getBIKELOCATION() {
		return BIKELOCATION;
	}
	public void setBIKELOCATION(String bIKELOCATION) {
		BIKELOCATION = bIKELOCATION;
	}
	public String getBIKESTATE() {
		return BIKESTATE;
	}
	public void setBIKESTATE(String bIKESTATE) {
		BIKESTATE = bIKESTATE;
	}
}
