package com.myezen.myapp.service;

import java.util.ArrayList;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;



public interface AdminService {
	
	//관리자 메인페이지 자전거 총 갯수
		public int getTotalBkidxCount();
	//관리자 메인페이지 대여 중인 자전거
		public int getTotalRidxCount();
	//관리자 메인페이지 고장난 자전거
		public int getTotalErrorCount();	
	//회원삭제
		public void deleteMember(String memberId);
	//회원리스트
		public ArrayList<BikeJoinVo> memberList();	
	//고장 신고내역 리스트
		public ArrayList<BikeJoinVo> errorList();
	//자전거리스트	
		public ArrayList<BikeJoinVo> bikeList();
	//대여소 리스트
		public ArrayList<BikeJoinVo> rentalshopList();	
	//대여소 등록
		public int rentalshopInsert(String rentalshopName, String rentalshopLocation);			
	//대여소 등록 이름 중복체크
		public int adminrentalshopNameCheck(String rentalshopName);		
	//회원 상세정보
		public BikeJoinVo getMemberByMemberId(String memberId);	
}
