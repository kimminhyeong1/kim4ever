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



@Service("AdminImpl")


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

	//자전거 리스트
	@Override
	public ArrayList<BikeJoinVo> bikeList() {
		
	ArrayList<BikeJoinVo> klist = asm.bikeList();
	
	return klist;
	}
	
	//신고내역 리스트
	@Override
	public ArrayList<BikeJoinVo> errorList() {

	ArrayList<BikeJoinVo> elist = asm.errorList();
		return elist;
	}


	//회원 상세정보
	@Override
	public BikeJoinVo getMemberByMemberId(String memberId) {

		return asm.getMemberByMemberId(memberId);
	}


	//대여소 리스트
	@Override
	public ArrayList<BikeJoinVo> rentalshopList() {
		
	ArrayList<BikeJoinVo> rlist = asm.rentalshopList();
		return rlist;
	}

	//대여소 추가
	@Override
	public int rentalshopInsert(String rentalshopName, String rentalshopLocation) {
		
		BikeJoinVo rv = new BikeJoinVo();
		rv.setRentalshopName(rentalshopName);
		rv.setRentalshopLocation(rentalshopLocation);
		
		int value = asm.rentalshopInsert(rv);
		return value;
	}

	//대여소 추가 대여소 이름 중복
	@Override
	public int adminrentalshopNameCheck(String rentalshopName) {
		int value = asm.adminrentalshopNameCheck(rentalshopName);
		return value;
	}

	








	

	




}
