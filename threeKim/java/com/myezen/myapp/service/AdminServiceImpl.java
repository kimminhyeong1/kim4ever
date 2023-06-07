package com.myezen.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer.MvcMatchersAuthorizedUrl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;
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
	
	//관리자 메인페이지 송천 일반 자전거 대여 가능 수
	@Override
	public int getSNorCount() {
				
		return asm.getSNorCount();
	}
	
	//관리자 메인페이지 송천 전기 자전거 대여 가능 수
	@Override
	public int getSEleCount() {
		
		return asm.getSEleCount();
	}
		
	//관리자 메인페이지 효자 일반 자전거 대여 가능 수
	@Override
	public int getHNorCount() {
		
		return asm.getHNorCount();
	}

	//관리자 메인페이지 효자 전기 자전거 대여 가능 수
	@Override
	public int getHEleCount() {
		
		return asm.getHEleCount();
	}
		
	//관리자 메인페이지 덕진 일반 자전거 대여 가능 수
	@Override
	public int getDNorCount() {
		
		return asm.getDNorCount();
	}
	
	//관리자 메인페이지 덕진 전기 자전거 대여 가능 수
	@Override
	public int getDEleCount() {
		
		return asm.getDEleCount();
	}
	
	//관리자 메인페이지 평화 일반 자전거 대여 가능 수
	@Override
	public int getPNorCount() {
		
		return asm.getPNorCount();
	}
	
	//관리자 메인페이지 평화 전기 자전거 대여 가능 수
	@Override
	public int getPEleCount() {
		
		return asm.getPEleCount();
	}
	
	//관리자 메인페이지 오목 일반 자전거 대여 가능 수
	@Override
	public int getONorCount() {
		
		return asm.getONorCount();
	}
	
	//관리자 메인페이지 오목 전기 자전거 대여 가능 수
	@Override
	public int getOEleCount() {
		
		return asm.getOEleCount();
	}
	
	
	//회원삭제
	@Override
	public void deleteMember(String memberId) {
	System.out.println("memberId"+memberId);
	asm.deleteMember(memberId);
		
		}

	//회원리스트
	@Override
	public ArrayList<BikeJoinVo> memberList() {
				
	ArrayList<BikeJoinVo> alist = asm.memberList();
	
	return alist;
	}

	//신고 내역 리스트
	@Override
	public ArrayList<BikeJoinVo> errorList() {

	ArrayList<BikeJoinVo> elist = asm.errorList();
		return elist;
	}
	
	//신고 내역 상세보기
	@Override
	public BikeJoinVo getErrorContent(int eidx) {
		
		return asm.getErrorContent(eidx);
	}
	
	//errorState D에서 R로 업데이트
	@Override
	public void updateBikeState(int eidx) {
	asm.updateBikeState(eidx);
		
	}
	
	//수리 내역 페이지
	@Override
	public ArrayList<BikeJoinVo> repairList() {
	
	ArrayList<BikeJoinVo> elist = asm.repairList();	
		return elist;
	}
	
	//회원 상세정보
	@Override
	public BikeJoinVo getMemberByMemberId(String memberId) {

		return asm.getMemberByMemberId(memberId);
	}

	//관리자 자전거 리스트
	@Override
	public ArrayList<BikeJoinVo> bikeList() {
		
	ArrayList<BikeJoinVo> klist = asm.bikeList();	
		return klist;
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





	

	

	

	

	

	

	

	

	

	

	



	

	

	

	

	

	

	



	

	

	






}
