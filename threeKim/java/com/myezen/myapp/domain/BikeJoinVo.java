package com.myezen.myapp.domain;


public class BikeJoinVo {
	
	//BikeInfoVo
	private String bikeType;
	private String bikeContent;
	private int rentPrice;
	
	//BikeVo
	private int bkidx; //자전거번호
	private String bikeCode; //고유코드
	private String bikeLocation; //자전거위치
	
	
	private String bikeState; //자전거상태
	
	//ErrorVo
	private int eidx; //고장번호
	private String errorContent; //고장 글 내용
	private String errorDay; //신고 시간
	
	//MemberVo

	private String memberId; //회원 아이디
	private String memberPwd; //회원 비밀번호
	private String memberName; //회원 이름
	private String memberAge; //회원 나이
	private String memberPhone; //회원 핸드폰번호
	private String memberEmail; //회원 이메일
	private String memberAddr; //회원 주소
	private String memberType;
	private String writeDay;
	

	//RentalshopVo
	private int rsidx; //대여소번호
	private String rentalshopName; //대여소이름
	private String rentalshopLocation; //대여소위치
	
	//RentVo

	private String rentDay;//대여요일

	private String rentPlace; //대여장소
	
	private int rsdix; //대여소번호
	private int midx; //회원번호
	
	//ReturnVo
	private int rtidx; //반납번호
	private String returnDay; //반납요일
	private String returnPlace; //반납장소
	private int ridx; //대여번호
	
	
	

	
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
	

	
}
