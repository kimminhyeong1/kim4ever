package com.myezen.myapp.service;

import java.util.ArrayList;

import com.myezen.myapp.domain.MemberVo;

public interface MemberService {
//회원가입메소드
	public int memberInsert(String memberId, String memberPwd, String memberName, String memberAge, String memberPhone, String memberEmail, String memberAddr);
//회원가입부분 아이디 중복체크
	public int memberIdCheck(String memberId);
//회원가입부분 이메일 중복체크
	public int memberEmailCheck(String memberEmail);
//로그인
	public MemberVo memberLogin(String memberId);
//로그인에서 아이디찾기에서 인증번호보내기 
	public int memberMailAuth(String memberEmail) throws Exception;
//로그인에서 아이디찾기
	//로그인에서 아이디찾기에서 인증번호클릭시 첫번째로 가지고있는 값이 맞는지 대조후 인증번호를보냄
	public int memberIdFindMatch(String memberName, String memberEmail);
	//로그인에서 아이디찾기에서 보내온 인증번호 가지고있는 번호랑 맞는지 확인하기
	public String memberIdFind(String memberName,String memberEmail,String mailKey);
//로그인에서 비밀번호찾기
	//1.사용자 정보가 맞는지 대조
	public int memberPwdFindAuthMatch(String memberId,String memberName, String memberEmail);
	//2.비밀번호 재설정
	public int memberPwdFindMatch(String memberId,String memberName, String memberEmail, String mailKey);
//로그인에서 비밀번호찾기에서 비밀번호 재설정
	public int memberPwdReset(String memberPwd,String memberId, String memberName, String memberEmail, String mailKey);	

		
//회원리스트
	public ArrayList<MemberVo> memberList();
	
}
