package com.myezen.myapp.service;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myezen.myapp.domain.BikeInfoVo;
import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.RentalshopVo;
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
	//관리자 메인페이지 이용 현황 자전거 수
		public ArrayList<BikeJoinVo>getRentalCountByDateRange();	
	//회원삭제
		public void deleteMember(String memberId);
	//회원리스트
		public ArrayList<BikeJoinVo> memberList(SearchCriteria scri);	
		public int memberListCount(SearchCriteria scri);
		public ArrayList<BikeJoinVo> memberOutList(SearchCriteria scri);	
		public int memberOutListCount(SearchCriteria scri);
	//고장 신고 내역 리스트
		public ArrayList<BikeJoinVo> searchBikeErrors(SearchCriteria scri);
		public int searchBikeErrorsCount(SearchCriteria scri);
	//고장 신고 내역 상세 페이지	
		public BikeJoinVo getErrorContent(int eidx);
	//수리센터 보내기 버튼 누르면 errorState R로 업데이트
		public void updateErrorState(int eidx);
	//수리 내역 페이지
		public ArrayList<BikeJoinVo> searchBikerepairList(SearchCriteria scri);
		public int searchBikerepairListCount(SearchCriteria scri);
	//수리완료 버튼 누르면 bikeState Y로 업데이트
		public void updateBikeStateY(int eidx);	
	//자전거리스트	
		public ArrayList<BikeJoinVo> bikeList(SearchCriteria scri);
		public int bikeListCount (SearchCriteria scri);
	//자전거 정보 리스트 가져오기
		public ArrayList<BikeInfoVo> bikeInfoList();  
	//대여소 정보 리스트 가져오기
		public ArrayList<RentalshopVo> bikeshopList();  
	//자전거 추가 등록
		public int bikeInsert(String bikeCode, String bikeType, String bikeLocation,int cnt);
	//자전거 삭제
		public void updateBikeStateD(int bkidx);
	//리뷰 리스트
		public ArrayList<BikeJoinVo> reviewList(SearchCriteria scri);
	//리뷰 총 개수
		public int reviewListCount (SearchCriteria scri);
	//자전거 코드번호 중복 체크
		public int bikeCodeCheck(String bikeCode);	
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
	//모임 리스트
		public ArrayList<GatheringJoinVo> gatheringList(SearchCriteria scri);
	//모임 리스트 총갯수
		public int gatheringListSelectAll(SearchCriteria scri);
	//모임 리스트 상세 보기
		public GatheringJoinVo gatheringDetail(int giidx);
	//모임 신고 내역 리스트
		public ArrayList<GatheringJoinVo> gatheringDeclaration(SearchCriteria scri);
	//모임 신고 내역 리스트 총갯수	
		public int gatheringDeclarationSelectAll(SearchCriteria scri);
	//모임 신고 내역 상세 보기	
		public GatheringJoinVo DeclarationDetail(int gdix);
	//모임 신고 내역으로 인해 모임 삭제
		public void deleteGathering(int giidx);
		
		
}
