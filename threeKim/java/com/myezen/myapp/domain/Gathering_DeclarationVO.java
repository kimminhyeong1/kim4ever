package com.myezen.myapp.domain;

public class Gathering_DeclarationVO {
	private int gdix; //모임 신고 번호
	private int gidx;//모임 번호
	private String gatheringReportContent; //신고 내용
	private String gatheringDeclarationDay; //신고 날짜
	
	public int getGdix() {
		return gdix;
	}
	public void setGdix(int gdix) {
		this.gdix = gdix;
	}
	public int getGidx() {
		return gidx;
	}
	public void setGidx(int gidx) {
		this.gidx = gidx;
	}
	public String getGatheringReportContent() {
		return gatheringReportContent;
	}
	public void setGatheringReportContent(String gatheringReportContent) {
		this.gatheringReportContent = gatheringReportContent;
	}
	public String getGatheringDeclarationDay() {
		return gatheringDeclarationDay;
	}
	public void setGatheringDeclarationDay(String gatheringDeclarationDay) {
		this.gatheringDeclarationDay = gatheringDeclarationDay;
	}
	
}
