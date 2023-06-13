package com.myezen.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.myezen.myapp.domain.BikeJoinVo;
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
//회원삭제
	public void deleteMember(String memberId);
//마이페이지
	public MemberVo getMemberInfo(int midx);
//회원정보수정
	public void updateMember(MemberVo mv);
//회원리스트에서 회원들정보보기
	public MemberVo getMemberByMemberId(String memberId);
	
	public MemberVo getMemberByMemberPwd(String memberPwd);
//회원탈퇴
	public void withdrawMember(String memberId);
//소셜로그인
	
	//구글로그인
	public int googleMemberInsert(String memberId,String memberPwd,String memberName);
	//카카오로그인
	public int kakaoMemberInsert(String memberId,String memberPwd,String memberName);
	//소셜 아이디있는지 확인
	public int socialMemberCheck(String memberId);
	
	//카카오로그인
	public String getAccessToken(String authorize_code) throws Throwable;
	//카카오유저정보
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	//내가 쓴 게시글
	public ArrayList<BikeJoinVo> getMyPosts(String memberName);

	public void memberUpdateIntro(MemberVo mv);

	
}
