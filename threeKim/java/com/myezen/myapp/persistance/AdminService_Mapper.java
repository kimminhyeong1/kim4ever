package com.myezen.myapp.persistance;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.RentalshopVo;

public interface AdminService_Mapper {

	//관리자 메인페이지 자전거 총 갯수
	public int getTotalBkidxCount();
	//관리자 메인페이지 대여 중인 자전거
	public int getTotalRidxCount();
	//관리자 메인페이지 고장난 자전거
	public int getTotalErrorCount();
	//관리자 메인페이지 대여 가능한 자전거
	public int getTotalRentCount();
	//관리자 메인페이지 송천 일반 자전거 대여 가능 수
	public int getSNorCount();
	//관리자 메인페이지 송천 전기 자전거 대여 가능 수
	public int getSEleCount();	
	//관리자 메인페이지 효자 일반 자전거 대여 가능 수
	public int getHNorCount();	
	//관리자 메인페이지 효자 전기 자전거 대여 가능 수
	public int getHEleCount();	
	//관리자 메인페이지 덕진 일반 자전거 대여 가능 수
	public int getDNorCount();
	//관리자 메인페이지 덕진 전기 자전거 대여 가능 수
	public int getDEleCount();	
	//관리자 메인페이지 평화 일반 자전거 대여 가능 수
	public int getPNorCount();
	//관리자 메인페이지 평화 전기 자전거 대여 가능 수
	public int getPEleCount();	
	//관리자 메인페이지 오목 일반 자전거 대여 가능 수
	public int getONorCount();
	//관리자 메인페이지 오목 전기 자전거 대여 가능 수
	public int getOEleCount();
	//회원 삭제
	public void deleteMember(String memberId);
	//회원 리스트	
	public ArrayList<BikeJoinVo> memberList();
	//고장 내역 리스트	
	public ArrayList<BikeJoinVo> errorList();
	//고장  내역 상세 페이지	
	public BikeJoinVo getErrorContent(int eidx);
	//bikeState E로 업데이트
	public void updateBikeState(int eidx);
	//수리 내역 페이지
	public ArrayList<BikeJoinVo> repairList();
	//자전거 리스트
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
