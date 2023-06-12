package com.myezen.myapp.domain;

public class GatheringJoinVo {//모임조인
	
	//이미지업로드테이블
	private int imidx;//이미지 번호
	private String imageName;//이미지 이름
	private String imageWriter;//이미지 작성자
	private String imageUpload;//이미지 업로드
	private int midx;//회원 번호
	private int giidx;//모임 정보 번호
	private int gbidx;//모임 게시판 번호
	private int gpaidx;//모임 사진첩 번호
	private String ImgType;//이미지 구분
	/*
	이미지 구분
	노말 이미지 : N

	모임

	모임 멤버 대표 이미지: GMT
	모임 대표 이미지: GT
	모임 이미지 : G
	모임 사진첩 대표 이미지:GAT
	모임 사진첩 이미지:GA
	모임 게시글 이미지:GB
	*/
	
	//모임 테이블
	private int gidx;//모임 번호
	//private int giidx;//모임 정보 번호
	//private int midx;//회원 번호
	private String gatheringApprovalType;//모임 승인 여부   모임 대기 : W 모임 승인 : Y 모임 추방 : K 모임 기본값: N
	private String gatheringMemberType;//모임 멤버 구분   모임장 : TL [부]모임장 : TLD  [기본값]모임원 : TM
	private String gatheringJoiningDay;//모임 가입일
	private String gatheringLeavingDay;//모임 탈퇴일
	private String gatheringMemberDelYN;//모임 회원 탈퇴 여부 기본값 : N
	
	//모임정보 테이블
	//private int giidx;//모임 정보 번호
	private String gInfoName;//모임 이름
	private String gInfoArea;//모임 지역
	private String gInfoBriefIntroduction;//모임 간단소개글
	private String gInfoAreaIntroduction;//모임 소개글
	private String gInfoCapacity;//모임 정원 수
	private String gInfoParticipating;//모임 참여멤버 수
	private String gInfoCreationDay;//모임 생성일
	private String gInfoDelDay;//모임 삭제일
	private String gInfoDelYN;//모임 삭제 여부
	private String gInfoJoinType;//모임 승인타입
	/*모임 승인 타입

	모임 승인제 : '승인가입'
	[기본값]모임 자유제: '자유가입'
	*/

	//모임게시판
	//private int gbidx;//모임 게시판 번호
	//private int giidx;//모임 정보 번호
	//private int midx;//회원 번호
	private String gBoardTitle;//모임 게시글 제목
	private String gBoardCategory;//모임 게시글 카테고리
	private String gBoardContents;//모임 게시글 내용
	private int gBoardLikeCNT;//모임 게시글 좋아요 수
	private String gBoardWriteDay;//모임 게시글 작성일
	private String gBoardDelDay;//모임 게시글 삭제일
	private String gBoardDelYN;//모임 게시글 삭제 여부
	
	//모임 게시판 댓글
	private int gcidx;//모임 게시판 댓글 번호
	//private int gbidx;//모임 게시판 번호
	//private int midx;//회원 번호
	private String gCommentContents;//모임 댓글 내용
	private String gCommentWriteDay;//모임 댓글 작성일
	private String gCommentDelDay;//모임 댓글 삭제일
	private String gCommentDelYN;//모임 댓글 삭제 여부
	
	//모임사진첩
	//private int gpaidx;//모임 사진첩 번호
	//private int giidx;//모임 정보 번호
	//private int midx;//회원 번호
	private String gPhotoAlbumDate;//모임 사진첩 날짜
	private String gPhotoAlbumTitle;//모임 사진첩 제목
	private int gPhotoAlbumLikeCNT;//모임 사진첩 좋아요
	private String gPhotoAlbumContents;//모임 사진첩 내용
	private String gPhotoAlbumWriteDay;//모임 사진첩 작성일
	private String gPhotoAlbumDelDay;//모임 사진첩 삭제일
	private String gPhotoAlbumDelYN;//모임 사진첩 삭제 여부
	
	//모임일정
	private int gsidx;//모임 일정 번호
	//private int giidx;//모임 정보 번호
	//private int midx;//회원 번호
	private String gScheduleTitle;//모임 일정 제목
	private String gScheduleStartDay;//모임 일정 시작일
	private String gScheduleEndDay;//모임 일정 끝일
	private String gScheduleLocation;//모임 일정 위치
	private String gScheduleLatitude;//모임 일정 위도
	private String gScheduleLongitude;//모임 일정 경도
	private String gScheduleArrangements;//모임 일정 준비물
	private String gScheduleCapacity;//모임 일정 정원
	private String gScheduleFee;//모임 일정 모임비
	private String gScheduleWriteDay;//모임 일정 작성일
	private String gScheduleDelDay;//모임 일정 삭제일
	private String gScheduleDelYN;//모임 댓글 삭제 여부
	
	//모임 일정 참여
	private int gsjidx;//모임 일정 참여 번호
	//private int gsidx;//모임 일정 번호
	//private int midx;//회원 번호
	
	//회원 정보
	//private int midx; //회원번호
	private String memberId; //회원 아이디
	private String memberPwd; //회원 비밀번호
	private String memberName; //회원 이름
	private String memberAge; //회원 나이
	private String memberPhone; //회원 핸드폰번호
	private String memberEmail; //회원 이메일
	private String memberAddr; //회원 주소
	private String memberType;
	private String writeDay;
	
	

	public int getImidx() {
		return imidx;
	}

	public void setImidx(int imidx) {
		this.imidx = imidx;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageWriter() {
		return imageWriter;
	}

	public void setImageWriter(String imageWriter) {
		this.imageWriter = imageWriter;
	}

	public String getImageUpload() {
		return imageUpload;
	}

	public void setImageUpload(String imageUpload) {
		this.imageUpload = imageUpload;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getGiidx() {
		return giidx;
	}

	public void setGiidx(int giidx) {
		this.giidx = giidx;
	}

	public int getGbidx() {
		return gbidx;
	}

	public void setGbidx(int gbidx) {
		this.gbidx = gbidx;
	}

	public int getGpaidx() {
		return gpaidx;
	}

	public void setGpaidx(int gpaidx) {
		this.gpaidx = gpaidx;
	}

	public String getImgType() {
		return ImgType;
	}

	public void setImgType(String imgType) {
		ImgType = imgType;
	}

	public int getGidx() {
		return gidx;
	}

	public void setGidx(int gidx) {
		this.gidx = gidx;
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

	public String getgInfoCapacity() {
		return gInfoCapacity;
	}

	public void setgInfoCapacity(String gInfoCapacity) {
		this.gInfoCapacity = gInfoCapacity;
	}

	public String getgInfoParticipating() {
		return gInfoParticipating;
	}

	public void setgInfoParticipating(String gInfoParticipating) {
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

	public String getgBoardTitle() {
		return gBoardTitle;
	}

	public void setgBoardTitle(String gBoardTitle) {
		this.gBoardTitle = gBoardTitle;
	}

	public String getgBoardCategory() {
		return gBoardCategory;
	}

	public void setgBoardCategory(String gBoardCategory) {
		this.gBoardCategory = gBoardCategory;
	}

	public String getgBoardContents() {
		return gBoardContents;
	}

	public void setgBoardContents(String gBoardContents) {
		this.gBoardContents = gBoardContents;
	}

	public int getgBoardLikeCNT() {
		return gBoardLikeCNT;
	}

	public void setgBoardLikeCNT(int gBoardLikeCNT) {
		this.gBoardLikeCNT = gBoardLikeCNT;
	}

	public String getgBoardWriteDay() {
		return gBoardWriteDay;
	}

	public void setgBoardWriteDay(String gBoardWriteDay) {
		this.gBoardWriteDay = gBoardWriteDay;
	}

	public String getgBoardDelDay() {
		return gBoardDelDay;
	}

	public void setgBoardDelDay(String gBoardDelDay) {
		this.gBoardDelDay = gBoardDelDay;
	}

	public String getgBoardDelYN() {
		return gBoardDelYN;
	}

	public void setgBoardDelYN(String gBoardDelYN) {
		this.gBoardDelYN = gBoardDelYN;
	}

	public int getGcidx() {
		return gcidx;
	}

	public void setGcidx(int gcidx) {
		this.gcidx = gcidx;
	}

	public String getgCommentContents() {
		return gCommentContents;
	}

	public void setgCommentContents(String gCommentContents) {
		this.gCommentContents = gCommentContents;
	}

	public String getgCommentWriteDay() {
		return gCommentWriteDay;
	}

	public void setgCommentWriteDay(String gCommentWriteDay) {
		this.gCommentWriteDay = gCommentWriteDay;
	}

	public String getgCommentDelDay() {
		return gCommentDelDay;
	}

	public void setgCommentDelDay(String gCommentDelDay) {
		this.gCommentDelDay = gCommentDelDay;
	}

	public String getgCommentDelYN() {
		return gCommentDelYN;
	}

	public void setgCommentDelYN(String gCommentDelYN) {
		this.gCommentDelYN = gCommentDelYN;
	}

	public String getgPhotoAlbumDate() {
		return gPhotoAlbumDate;
	}

	public void setgPhotoAlbumDate(String gPhotoAlbumDate) {
		this.gPhotoAlbumDate = gPhotoAlbumDate;
	}

	public String getgPhotoAlbumTitle() {
		return gPhotoAlbumTitle;
	}

	public void setgPhotoAlbumTitle(String gPhotoAlbumTitle) {
		this.gPhotoAlbumTitle = gPhotoAlbumTitle;
	}

	public int getgPhotoAlbumLikeCNT() {
		return gPhotoAlbumLikeCNT;
	}

	public void setgPhotoAlbumLikeCNT(int gPhotoAlbumLikeCNT) {
		this.gPhotoAlbumLikeCNT = gPhotoAlbumLikeCNT;
	}

	public String getgPhotoAlbumContents() {
		return gPhotoAlbumContents;
	}

	public void setgPhotoAlbumContents(String gPhotoAlbumContents) {
		this.gPhotoAlbumContents = gPhotoAlbumContents;
	}

	public String getgPhotoAlbumWriteDay() {
		return gPhotoAlbumWriteDay;
	}

	public void setgPhotoAlbumWriteDay(String gPhotoAlbumWriteDay) {
		this.gPhotoAlbumWriteDay = gPhotoAlbumWriteDay;
	}

	public String getgPhotoAlbumDelDay() {
		return gPhotoAlbumDelDay;
	}

	public void setgPhotoAlbumDelDay(String gPhotoAlbumDelDay) {
		this.gPhotoAlbumDelDay = gPhotoAlbumDelDay;
	}

	public String getgPhotoAlbumDelYN() {
		return gPhotoAlbumDelYN;
	}

	public void setgPhotoAlbumDelYN(String gPhotoAlbumDelYN) {
		this.gPhotoAlbumDelYN = gPhotoAlbumDelYN;
	}

	public int getGsidx() {
		return gsidx;
	}

	public void setGsidx(int gsidx) {
		this.gsidx = gsidx;
	}

	public String getgScheduleTitle() {
		return gScheduleTitle;
	}

	public void setgScheduleTitle(String gScheduleTitle) {
		this.gScheduleTitle = gScheduleTitle;
	}

	public String getgScheduleStartDay() {
		return gScheduleStartDay;
	}

	public void setgScheduleStartDay(String gScheduleStartDay) {
		this.gScheduleStartDay = gScheduleStartDay;
	}

	public String getgScheduleEndDay() {
		return gScheduleEndDay;
	}

	public void setgScheduleEndDay(String gScheduleEndDay) {
		this.gScheduleEndDay = gScheduleEndDay;
	}

	public String getgScheduleLocation() {
		return gScheduleLocation;
	}

	public void setgScheduleLocation(String gScheduleLocation) {
		this.gScheduleLocation = gScheduleLocation;
	}

	public String getgScheduleLatitude() {
		return gScheduleLatitude;
	}

	public void setgScheduleLatitude(String gScheduleLatitude) {
		this.gScheduleLatitude = gScheduleLatitude;
	}

	public String getgScheduleLongitude() {
		return gScheduleLongitude;
	}

	public void setgScheduleLongitude(String gScheduleLongitude) {
		this.gScheduleLongitude = gScheduleLongitude;
	}

	public String getgScheduleArrangements() {
		return gScheduleArrangements;
	}

	public void setgScheduleArrangements(String gScheduleArrangements) {
		this.gScheduleArrangements = gScheduleArrangements;
	}

	public String getgScheduleCapacity() {
		return gScheduleCapacity;
	}

	public void setgScheduleCapacity(String gScheduleCapacity) {
		this.gScheduleCapacity = gScheduleCapacity;
	}

	public String getgScheduleFee() {
		return gScheduleFee;
	}

	public void setgScheduleFee(String gScheduleFee) {
		this.gScheduleFee = gScheduleFee;
	}

	public String getgScheduleWriteDay() {
		return gScheduleWriteDay;
	}

	public void setgScheduleWriteDay(String gScheduleWriteDay) {
		this.gScheduleWriteDay = gScheduleWriteDay;
	}

	public String getgScheduleDelDay() {
		return gScheduleDelDay;
	}

	public void setgScheduleDelDay(String gScheduleDelDay) {
		this.gScheduleDelDay = gScheduleDelDay;
	}

	public String getgScheduleDelYN() {
		return gScheduleDelYN;
	}

	public void setgScheduleDelYN(String gScheduleDelYN) {
		this.gScheduleDelYN = gScheduleDelYN;
	}

	public int getGsjidx() {
		return gsjidx;
	}

	public void setGsjidx(int gsjidx) {
		this.gsjidx = gsjidx;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(String memberAge) {
		this.memberAge = memberAge;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}

	public String getgInfoJoinType() {
		return gInfoJoinType;
	}

	public void setgInfoJoinType(String gInfoJoinType) {
		this.gInfoJoinType = gInfoJoinType;
	}
	
	
	
	
	
	
}
