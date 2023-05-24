package com.myezen.myapp.domain;

public class RentalshopVo {
	private int RSIDX; //대여소번호
	private String RETALSHOPNAME; //대여소이름
	private String RETALSHOPLOCATION; //대여소위치
	
	public int getRSIDX() {
		return RSIDX;
	}
	public void setRSIDX(int rSIDX) {
		RSIDX = rSIDX;
	}
	public String getRETALSHOPNAME() {
		return RETALSHOPNAME;
	}
	public void setRETALSHOPNAME(String rETALSHOPNAME) {
		RETALSHOPNAME = rETALSHOPNAME;
	}
	public String getRETALSHOPLOCATION() {
		return RETALSHOPLOCATION;
	}
	public void setRETALSHOPLOCATION(String rETALSHOPLOCATION) {
		RETALSHOPLOCATION = rETALSHOPLOCATION;
	}
}
