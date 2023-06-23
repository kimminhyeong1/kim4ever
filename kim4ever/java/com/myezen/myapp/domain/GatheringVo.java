package com.myezen.myapp.domain;

public class GatheringVo {//모임
	
	private int gidx;//모임 번호
	private int giidx;//모임 정보 번호
	private int midx;//회원 번호
	private String gatheringApprovalType;//모임 승인 여부   모임 대기 : W 모임 승인 : Y 모임 추방 : K 모임 기본값: N
	private String gatheringMemberType;//모임 멤버 구분   모임장 : TL [부]모임장 : TLD  [기본값]모임원 : TM
	private String gatheringJoiningDay;//모임 가입일
	private String gatheringLeavingDay;//모임 탈퇴일
	private String gatheringMemberDelYN;//모임 회원 탈퇴 여부 기본값 : N
	public int getGidx() {
		return gidx;
	}
	public void setGidx(int gidx) {
		this.gidx = gidx;
	}
	public int getGiidx() {
		return giidx;
	}
	public void setGiidx(int giidx) {
		this.giidx = giidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getGatheringApprovalType() {
		return gatheringApprovalType;
	}
	public void setGatheringApprovalType(String gatheringApprovalType) {
		this.gatheringApprovalType = gatheringApprovalType;
	}
	public String getGatheringMemberType() {
		return gatheringMemberType;
	}
	public void setGatheringMemberType(String gatheringMemberType) {
		this.gatheringMemberType = gatheringMemberType;
	}
	public String getGatheringJoiningDay() {
		return gatheringJoiningDay;
	}
	public void setGatheringJoiningDay(String gatheringJoiningDay) {
		this.gatheringJoiningDay = gatheringJoiningDay;
	}
	public String getGatheringLeavingDay() {
		return gatheringLeavingDay;
	}
	public void setGatheringLeavingDay(String gatheringLeavingDay) {
		this.gatheringLeavingDay = gatheringLeavingDay;
	}
	public String getGatheringMemberDelYN() {
		return gatheringMemberDelYN;
	}
	public void setGatheringMemberDelYN(String gatheringMemberDelYN) {
		this.gatheringMemberDelYN = gatheringMemberDelYN;
	}
	
	

	
	
	
}
