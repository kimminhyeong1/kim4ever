package com.myezen.myapp.domain;

public class ReturnVo {
	private int RTIDX; //반납번호
	private String RETURNDAY; //반납요일
	private String RETURNPLACE; //반납장소
	private int RIDX; //대여번호
	
	public int getRTIDX() {
		return RTIDX;
	}
	public void setRTIDX(int rTIDX) {
		RTIDX = rTIDX;
	}
	public String getRETURNDAY() {
		return RETURNDAY;
	}
	public void setRETURNDAY(String rETURNDAY) {
		RETURNDAY = rETURNDAY;
	}
	public String getRETURNPLACE() {
		return RETURNPLACE;
	}
	public void setRETURNPLACE(String rETURNPLACE) {
		RETURNPLACE = rETURNPLACE;
	}
	public int getRIDX() {
		return RIDX;
	}
	public void setRIDX(int rIDX) {
		RIDX = rIDX;
	}
}
