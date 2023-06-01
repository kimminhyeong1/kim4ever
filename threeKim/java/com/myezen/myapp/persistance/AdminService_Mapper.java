package com.myezen.myapp.persistance;

import java.util.ArrayList;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;

public interface AdminService_Mapper {

	//관리자 메인페이지 자전거 총 갯수
	public int getTotalBkidxCount();
	//관리자 메인페이지 대여 중인 자전거
	public int getTotalRidxCount();
	//관리자 메인페이지 고장난 자전거
	public int getTotalErrorCount();
	//회원 삭제
	public void deleteMember(String memberId);
	//회원 리스트	
	public ArrayList<BikeJoinVo> memberList();
	//신고 리스트	
	public ArrayList<BikeJoinVo> errorList(); 
	//자전거 리스트
	public ArrayList<BikeJoinVo> bikeList();
	//대여소 리스트
	public ArrayList<BikeJoinVo> rentalshopList();
	//대여소 등록
	public int rentalshopInsert(BikeJoinVo rv);
	//대여소 등록 이름 중복체크
	public int adminrentalshopNameCheck(String rentalshopName);
	//회원 상세정보
	public BikeJoinVo getMemberByMemberId(String memberId);

}
