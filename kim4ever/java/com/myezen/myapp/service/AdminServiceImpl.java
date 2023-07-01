package com.myezen.myapp.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer.MvcMatchersAuthorizedUrl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myezen.myapp.domain.BikeInfoVo;
import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.RentalshopVo;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.persistance.AdminService_Mapper;
import com.myezen.myapp.persistance.MemberService_Mapper;



@Service("AdminServiceImpl")


public class AdminServiceImpl implements AdminService {

	private AdminService_Mapper asm;
	
	@Autowired
	public AdminServiceImpl(SqlSession sqlSession) {
		this.asm = sqlSession.getMapper(AdminService_Mapper.class);
	}
	
	//관리자 메인페이지 총 자전거
	@Override
	public int getTotalBkidxCount() {
		
		return asm.getTotalBkidxCount();
	}

	//관리자 메인페이지 대여중인 자전거
	@Override
	public int getTotalRidxCount() {
		
		return asm.getTotalRidxCount();
	}
	
	//관리자 메인페이지 고장난 자전거
	@Override
	public int getTotalErrorCount() {
		
		return asm.getTotalErrorCount();
	}
	
	//관리자 메인페이지 대여 가능한 자전거
	@Override
	public int getTotalRentCount() {
		
		return asm.getTotalRentCount();
	}
	
	//관리자 메인페이지 대여소 별 대여 가능 자전거 수
	@Override
	public ArrayList<BikeJoinVo> canRentBike() {
		
		ArrayList<BikeJoinVo> rblist = asm.canRentBike();
		
		return rblist;
	}
	
	//관리자 메인페이지 이용현황 자전거 수
	@Override
	public ArrayList<BikeJoinVo> getRentalCountByDateRange() {
		
		ArrayList<BikeJoinVo> rbclist = asm.getRentalCountByDateRange();
		
		return rbclist;
	}
		
	
	//회원삭제
	@Override
	public void deleteMember(String memberId) {
	System.out.println("memberId"+memberId);
	asm.deleteMember(memberId);
		
		}

	//회원리스트
	@Override
	public ArrayList<BikeJoinVo> memberList(SearchCriteria scri) {
				
	ArrayList<BikeJoinVo> alist = asm.memberList(scri);
	
	return alist;
	}
	
	@Override
	public int memberListCount(SearchCriteria scri) {
			
		return asm.memberListCount(scri);
	}

	@Override
	public ArrayList<BikeJoinVo> memberOutList(SearchCriteria scri) {
		
		ArrayList<BikeJoinVo> alist = asm.memberOutList(scri);

		return alist;
	}

	@Override
	public int memberOutListCount(SearchCriteria scri) {

		return asm.memberOutListCount(scri);
	}
	
	
	//신고 내역 리스트
	@Override
	public ArrayList<BikeJoinVo> searchBikeErrors(SearchCriteria scri) {

		return asm.searchBikeErrors(scri);
	}
	
	@Override
	public int searchBikeErrorsCount(SearchCriteria scri) {
		 return asm.searchBikeErrorsCount(scri);
	}
	
	//신고 내역 상세보기
	@Override
	public BikeJoinVo getErrorContent(int eidx) {
		
		return asm.getErrorContent(eidx);
	}
	
	//수리센터 보내기 버튼 누르면 errorState R로 업데이트
	@Override
	public void updateErrorState(int eidx) {
		asm.updateErrorState(eidx);
		
	}
	
	//수리 내역 페이지
	@Override
	public ArrayList<BikeJoinVo> searchBikerepairList(SearchCriteria scri) {

		return asm.searchBikerepairList(scri);	
	}
	
	@Override
	public int searchBikerepairListCount(SearchCriteria scri) {

		return asm.searchBikerepairListCount(scri);
	}
	
	//수리 완료 버튼 누르면 bikeState Y로 업데이트
	@Override
	public void updateBikeStateY(int eidx) {
		asm.updateBikeStateY(eidx);
		
	}
	
	//회원 상세정보
	@Override
	public BikeJoinVo getMemberByMemberId(String memberId) {

		return asm.getMemberByMemberId(memberId);
	}

	//관리자 자전거 리스트
	@Override
	public ArrayList<BikeJoinVo> bikeList(SearchCriteria scri) {
		
	ArrayList<BikeJoinVo> klist = asm.bikeList(scri);	
		return klist;
	}
	
	//관리자 자전거 카운트
	@Override
	public int bikeListCount(SearchCriteria scri) {
		
		return asm.bikeListCount(scri);
	}
	
	
	//대여소 리스트
	@Override
	public ArrayList<BikeJoinVo> rentalshopList() {
		
	ArrayList<BikeJoinVo> rlist = asm.rentalshopList();
		return rlist;
	}

	//대여소 추가
	@Override
	public int rentalshopInsert(String rentalshopName, String rentalshopLocation ,String latitude, String longitude) {

		int value = asm.rentalshopInsert(rentalshopName,rentalshopLocation,latitude,longitude);
		
		return value;
	}

	
	//대여소 이름 중복
	@Override
	public int adminrentalshopNameCheck(String rentalshopName) {
		int value = asm.adminrentalshopNameCheck(rentalshopName);
		return value;
	}

	//대여소 삭제
	@Override	
	public void deleteRentalshop(String rentalshopName) {
		System.out.println("rentalshopName"+rentalshopName);
		asm.deleteRentalshop(rentalshopName);
		
	}
	
	//모임 리스트
	@Override
	public ArrayList<GatheringJoinVo> gatheringList(SearchCriteria scri) {
		
		ArrayList<GatheringJoinVo> gjlist = asm.gatheringList(scri);
		return gjlist;
	}
	
	//모임 리스트 총갯수
	@Override
	public int gatheringListSelectAll(SearchCriteria scri) {
		return asm.gatheringListSelectAll(scri);
	}
	
	//모임 상세 보기
	@Override
	public GatheringJoinVo gatheringDetail(int giidx) {
		
		return asm.gatheringDetail(giidx);
	}
	
	
	//모임 신고 내역 리스트
	@Override
	public ArrayList<GatheringJoinVo> gatheringDeclaration(SearchCriteria scri) {
		
		ArrayList<GatheringJoinVo> gdlist = asm.gatheringDeclaration(scri);
		return gdlist;
	}
	
	//모임 신고 내역 리스트 총갯수
	@Override
	public int gatheringDeclarationSelectAll(SearchCriteria scri) {
		return asm.gatheringDeclarationSelectAll(scri);
	}

	//모임 신고 내역 상세 보기
	@Override
	public GatheringJoinVo DeclarationDetail(int gdix) {
		
	
		return asm.DeclarationDetail(gdix);
	}

	@Override
	public void deleteGathering(int giidx) {
		asm.deleteGathering(giidx);
		
	}

	//자전거 추가 등록
	@Override
	@Transactional
	public int bikeInsert(String bikeCode, String bikeType, String bikeLocation) {
		int maxbikecode =asm.maxBikeCode(bikeCode);
		maxbikecode += 1;
		String stringMaxBikeCode = String.valueOf(maxbikecode);
		int value = asm.bikeInsert(bikeCode,stringMaxBikeCode, bikeType, bikeLocation);
		return value;
	}
	
	//자전거 코드번호 중복 체크
	@Override
	public int bikeCodeCheck(String bikeCode) {
		int value = asm.bikeCodeCheck(bikeCode);
		return value;
	}
	//자전거 정보 리스트 가져오기
	@Override	
	public ArrayList<BikeInfoVo> bikeInfoList() {
		ArrayList<BikeInfoVo> blist = asm.bikeInfoList(); 
		return blist;
	}
	//대여소 정보 리스트 가져오기
	@Override
	public ArrayList<RentalshopVo> bikeshopList() {
		ArrayList<RentalshopVo> slist = asm.bikeshopList(); 
		return slist;
	}
	//자전거 삭제
	@Override
	public void deleteBikeDelete(int bkidx) {
		asm.deleteBikeDelete(bkidx);
		
	} 











	

	

	






	

	

	

	


	

	

	

	

	



	

	

	

	

	

	

	



	

	

	






}
