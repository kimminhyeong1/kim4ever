package com.myezen.myapp.domain;

public class Gathering_InfoVo {//모임정보
	
	private int giidx;//모임 정보 번호
	private String gInfoName;//모임 이름
	private String gInfoArea;//모임 지역
	private String gInfoBriefIntroduction;//모임 간단소개글
	private String gInfoAreaIntroduction;//모임 소개글
	private int gInfoCapacity;//모임 정원 수
	private int gInfoParticipating;//모임 참여멤버 수
	private String gInfoCreationDay;//모임 생성일
	private String gInfoDelDay;//모임 삭제일
	private String gInfoDelYN;//모임 삭제 여부
	private String gInfoJoinType;//모임 승인타입
	/*모임 승인 타입

	모임 승인제 : '승인가입'
	[기본값]모임 자유제: '자유가입'
	*/
	public int getGiidx() {
		return giidx;
	}
	public void setGiidx(int giidx) {
		this.giidx = giidx;
	}
	public String getgInfoName() {
		return gInfoName;
	}
	public void setgInfoName(String gInfoName) {
		this.gInfoName = gInfoName;
	}
	public String getgInfoArea() {
		return gInfoArea;
	}
	public void setgInfoArea(String gInfoArea) {
		this.gInfoArea = gInfoArea;
	}
	public String getgInfoBriefIntroduction() {
		return gInfoBriefIntroduction;
	}
	public void setgInfoBriefIntroduction(String gInfoBriefIntroduction) {
		this.gInfoBriefIntroduction = gInfoBriefIntroduction;
	}
	public String getgInfoAreaIntroduction() {
		return gInfoAreaIntroduction;
	}
	public void setgInfoAreaIntroduction(String gInfoAreaIntroduction) {
		this.gInfoAreaIntroduction = gInfoAreaIntroduction;
	}
	public int getgInfoCapacity() {
		return gInfoCapacity;
	}
	public void setgInfoCapacity(int gInfoCapacity) {
		this.gInfoCapacity = gInfoCapacity;
	}
	public int getgInfoParticipating() {
		return gInfoParticipating;
	}
	public void setgInfoParticipating(int gInfoParticipating) {
		this.gInfoParticipating = gInfoParticipating;
	}
	public String getgInfoCreationDay() {
		return gInfoCreationDay;
	}
	public void setgInfoCreationDay(String gInfoCreationDay) {
		this.gInfoCreationDay = gInfoCreationDay;
	}
	public String getgInfoDelDay() {
		return gInfoDelDay;
	}
	public void setgInfoDelDay(String gInfoDelDay) {
		this.gInfoDelDay = gInfoDelDay;
	}
	public String getgInfoDelYN() {
		return gInfoDelYN;
	}
	public void setgInfoDelYN(String gInfoDelYN) {
		this.gInfoDelYN = gInfoDelYN;
	}
	public String getgInfoJoinType() {
		return gInfoJoinType;
	}
	public void setgInfoJoinType(String gInfoJoinType) {
		this.gInfoJoinType = gInfoJoinType;
	}
	

	
	
	
}
