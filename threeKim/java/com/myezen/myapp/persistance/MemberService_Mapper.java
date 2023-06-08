package com.myezen.myapp.persistance;

import java.util.ArrayList;

import com.myezen.myapp.domain.MemberVo;

public interface MemberService_Mapper {
//회원가입
	public int memberInsert(MemberVo mv);
//회원가입부분 아이디 중복체크
	public int memberIdCheck(String memberId);
//회원가입부분 이메일 중복체크
	public int memberEmailCheck(String memberEmail);
//로그인	
	public MemberVo memberLogin(String memberId);
//로그인에서 아이디찾기에서 인증번호보내기
	//1.인증번호 DB에 담기,이메일이랑 같이
	public int memberMailAuthSave(String mailKey,String memberEmail);//인증번호 생성해서 나온 인증키
	public String memberIdFind(String memberName,String memberEmail);
//로그인에서 아이디찾기
	//로그인에서 아이디찾기에서 인증번호클릭시 첫번째로 가지고있는 값이 맞는지 대조후 인증번호를보냄
	public int memberIdFindMatch(String memberName, String memberEmail);
	//2.DB에 담긴 인증번호 들어오는 인증번호랑 대조하기
	public int memberMailAuthMatch(String mailKey,String memberEmail);
	//3.대조가 끝나서 아이디받고 DB에 담긴 인증키 삭제하기
	public int memberMailAuthKeyDel(String mailKey,String memberEmail);
//로그인에서 비밀번호찾기 맞는지 대조
	public int memberPwdFindAuthMatch(String memberId,String memberName, String memberEmail);
	public int memberPwdFindMatch(String memberId,String memberName, String memberEmail);
//로그인에서 비밀번호찾기에서 비밀번호 재설정
	public int memberPwdReset(String memberPwd,String memberId, String memberName, String memberEmail);
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
	
//소셜로그인

	//구글로그인
	public int socialMemberInsert(String memberId,String memberPwd,String memberName);
	//구글 아이디있는지 확인
	public int socialMemberCheck(String memberId);
	
	
	
}
