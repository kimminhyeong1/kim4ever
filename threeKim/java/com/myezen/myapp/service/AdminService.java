package com.myezen.myapp.service;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.SearchCriteria;



public interface AdminService {
	
	//관리자 메인페이지 자전거 총 갯수
		public int getTotalBkidxCount();
	//관리자 메인페이지 대여 중인 자전거
		public int getTotalRidxCount();
	//관리자 메인페이지 고장난 자전거
		public int getTotalErrorCount();
	//관리자 메인페이지 대여 가능한 자전거
		public int getTotalRentCount();
	//관리자 메인페이지 자전거 대여 가능 수
		 public ArrayList<BikeJoinVo>canRentBike();	
	//관리자 메인페이지 이용 현황 어제 요일 표시
		public String yesterday();
	//회원삭제
		public void deleteMember(String memberId);
	//회원리스트
		public ArrayList<BikeJoinVo> memberList(SearchCriteria scri);	
		public int memberListCount(SearchCriteria scri);
		public ArrayList<BikeJoinVo> memberOutList(SearchCriteria scri);	
		public int memberOutListCount(SearchCriteria scri);
	//고장 신고내역 리스트
		public ArrayList<BikeJoinVo> searchBikeErrors(SearchCriteria scri);
		public int searchBikeErrorsCount(SearchCriteria scri);
	//고장 신고 상세 페이지	
		public BikeJoinVo getErrorContent(int eidx);
	//bikeState E로 업데이트
		public void updateBikeState(int eidx);
	//수리 내역 페이지
		public ArrayList<BikeJoinVo> searchBikerepairList(SearchCriteria scri);
		public int searchBikerepairListCount(SearchCriteria scri);
	//자전거리스트	
		public ArrayList<BikeJoinVo> bikeList();
	//대여소 리스트
		public ArrayList<BikeJoinVo> rentalshopList();	
	//대여소 등록
		public int rentalshopInsert(String rentalshopName, String rentalshopLocation,String latitude ,String longitude);			
	//대여소 등록 이름 중복체크
		public int adminrentalshopNameCheck(String rentalshopName);
	//대여소 삭제	
		public void deleteRentalshop(String rentalshopName);
	//회원 상세정보
		public BikeJoinVo getMemberByMemberId(String memberId);
		
}
