package com.myezen.myapp.domain;

import java.security.Timestamp;

public class BikeJoinVo {
	
	//BikeInfoVo
	private String bikeType;
	private String bikeContent;
	private int rentPrice;
	private String uploadFile;
	
	//BikeVo
	private int bkidx; //자전거번호
	private String bikeCode; //고유코드
	private String bikeLocation; //자전거위치
	
	
	private String bikeState; //자전거상태
	
	//ErrorVo
	private int eidx; //고장번호
	private String errorContent; 	//고장 글 내용
	private String errorDay; 		//신고 시간	
	private String errorState; 		//고장 상태
	private String errorLatitude;  	//고장 위도
	private String errorLongitude; 	//고장 경도
	private String errorLocation; 	//고장 위치
	private String errorImage; 	//고장 이미지
	
	
	
	
	//MemberVo
	private String memberId; //회원 아이디
	private String memberPwd; //회원 비밀번호
	private String memberName; //회원 이름
	private String memberAge; //회원 나이
	private String memberPhone; //회원 핸드폰번호
	private String memberEmail; //회원 이메일
	private String memberAddr; //회원 주소
	private String memberType; //등급
	private String writeDay; // 가입한 시간
	private String memberOutDay; //탈퇴한 시간


	//RentalshopVo
	private int rsidx; //대여소번호
	private String rentalshopName; //대여소이름
	private String rentalshopLocation; //대여소위치
	private String rentalshopLatitude; //대여소위도
	private String rentalshopLongitude; //대여소경도
	private String rentalshopCnt; //대여소 남은 갯수 //가상컬럼
	private String bikeNorCnt; //일반자전거 남은 갯수 //가상컬럼
	private String bikeEleCnt; //전기자전거 남은 갯수 //가상컬럼

	
	
	//RentVo

	
	
	private String rentDay;//대여요일

	private String rentPlace; //대여장소
	
	private int rsdix; //대여소번호
	private int midx; //회원번호
	
	private String dayago; //관리자 메인 페이지 이용 현황 날짜  //가상컬럼
	private String rentNorCount; //관리자 메인 페이지 이용 현황 일반 자전거 개수 //가상컬럼
	private String rentEleCount; //관리자 메인 페이지 이용 현황 전기 자전거 개수 //가상컬럼

	
	//ReturnVo
	private int rtidx; //반납번호
	private String returnDay; //반납요일
	private String returnPlace; //반납장소
	private int ridx; //대여번호
	
	private int id;
    private String phoneNumber;
    private String verificationCode;
    private char verificationStatus;
    
    
    //BoardVo
	private int bidx;	
	private int rebidx;
	private String boardType;
	
	private String writer;
	private String bwriteday;
	private String subject;
	private String content;
	private String boardView;
	private String boarddelyn;
	private String filename;
	private int depth;
	private int level_;
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public int getRebidx() {
		return rebidx;
	}
	public void setRebidx(int rebidx) {
		this.rebidx = rebidx;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBwriteday() {
		return bwriteday;
	}
	public void setBwriteday(String bwriteday) {
		this.bwriteday = bwriteday;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBoardView() {
		return boardView;
	}
	public void setBoardView(String boardView) {
		this.boardView = boardView;
	}
	public String getBoarddelyn() {
		return boarddelyn;
	}
	public void setBoarddelyn(String boarddelyn) {
		this.boarddelyn = boarddelyn;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getLevel_() {
		return level_;
	}
	public void setLevel_(int level_) {
		this.level_ = level_;
	}
	public int getSortN() {
		return sortN;
	}
	public void setSortN(int sortN) {
		this.sortN = sortN;
	}
	public int getTest() {
		return test;
	}
	public void setTest(int test) {
		this.test = test;
	}
	private int sortN; //가상번호
	private int test; //임시번호
	
	public String getMemberOutDay() {
		return memberOutDay;
	}
	public void setMemberOutDay(String memberOutDay) {
		this.memberOutDay = memberOutDay;
	}
	
    public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getVerificationCode() {
        return verificationCode;
    }
    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }
    public char getVerificationStatus() {
        return verificationStatus;
    }
    public void setVerificationStatus(char verificationStatus) {
        this.verificationStatus = verificationStatus;
    }
	

	
	public String getRentDay() {
		return rentDay;
	}
	public void setRentDay(String rentDay) {
		this.rentDay = rentDay;
	}
	public String getBikeType() {
		return bikeType;
	}
	public void setBikeType(String bikeType) {
		this.bikeType = bikeType;
	}
	public String getBikeContent() {
		return bikeContent;
	}
	public void setBikeContent(String bikeContent) {
		this.bikeContent = bikeContent;
	}
	public int getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
	}
	

	public String getBikeCode() {
		return bikeCode;
	}
	public void setBikeCode(String bikeCode) {
		this.bikeCode = bikeCode;
	}
	
	public String getBikeLocation() {
		return bikeLocation;
	}
	public void setBikeLocation(String bikeLocation) {
		this.bikeLocation = bikeLocation;
	}
	public String getBikeState() {
		return bikeState;
	}
	public void setBikeState(String bikeState) {
		this.bikeState = bikeState;
	}
	

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


	public int getRsidx() {
		return rsidx;
	}
	public void setRsidx(int rsidx) {
		this.rsidx = rsidx;
	}
	public String getRentalshopName() {
		return rentalshopName;
	}
	public void setRentalshopName(String rentalshopName) {
		this.rentalshopName = rentalshopName;
	}
	public String getRentalshopLocation() {
		return rentalshopLocation;
	}
	public void setRentalshopLocation(String rentalshopLocation) {
		this.rentalshopLocation = rentalshopLocation;
	}
	

	
	public String getRentPlace() {
		return rentPlace;
	}
	public void setRentPlace(String rentPlace) {
		this.rentPlace = rentPlace;
	}
	public int getBkidx() {
		return bkidx;
	}
	public void setBkidx(int bkidx) {
		this.bkidx = bkidx;
	}
	public int getRsdix() {
		return rsdix;
	}
	public void setRsdix(int rsdix) {
		this.rsdix = rsdix;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}


	public int getRtidx() {
		return rtidx;
	}
	public void setRtidx(int rtidx) {
		this.rtidx = rtidx;
	}
	public String getReturnDay() {
		return returnDay;
	}
	public void setReturnDay(String returnDay) {
		this.returnDay = returnDay;
	}
	public String getReturnPlace() {
		return returnPlace;
	}
	public void setReturnPlace(String returnPlace) {
		this.returnPlace = returnPlace;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getRentalshopLatitude() {
		return rentalshopLatitude;
	}
	public void setRentalshopLatitude(String rentalshopLatitude) {
		this.rentalshopLatitude = rentalshopLatitude;
	}
	public String getRentalshopLongitude() {
		return rentalshopLongitude;
	}
	public void setRentalshopLongitude(String rentalshopLongitude) {
		this.rentalshopLongitude = rentalshopLongitude;
	}
	public String getRentalshopCnt() {
		return rentalshopCnt;
	}
	public void setRentalshopCnt(String rentalshopCnt) {
		this.rentalshopCnt = rentalshopCnt;
	}
	public String getErrorImage() {
		return errorImage;
	}
	public void setErrorImage(String errorImage) {
		this.errorImage = errorImage;
	}
	
	public String getBikeNorCnt() {
		return bikeNorCnt;
	}
	public void setBikeNorCnt(String bikeNorCnt) {
		this.bikeNorCnt = bikeNorCnt;
	}
	public String getBikeEleCnt() {
		return bikeEleCnt;
	}
	public void setBikeEleCnt(String bikeEleCnt) {
		this.bikeEleCnt = bikeEleCnt;
	}
	
	public String getRentNorCount() {
		return rentNorCount;
	}
	public void setRentNorCount(String rentNorCount) {
		this.rentNorCount = rentNorCount;
	}
	public String getRentEleCount() {
		return rentEleCount;
	}
	public void setRentEleCount(String rentEleCount) {
		this.rentEleCount = rentEleCount;
	}
	public String getDayago() {
		return dayago;
	}
	public void setDayago(String dayago) {
		this.dayago = dayago;
	}
	
	
}
