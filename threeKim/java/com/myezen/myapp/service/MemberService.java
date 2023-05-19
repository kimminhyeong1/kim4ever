package com.myezen.myapp.service;

import java.util.ArrayList;

import com.myezen.myapp.domain.MemberVo;

public interface MemberService {

	public int memberInsert(String memberId, String memberPwd, String memberName, String memberAge, String memberPhone, String memberEmail, String memberAddr);
	
	public ArrayList<MemberVo> memberList();
	
	public int memberIdCheck(String memberId);
	
	public MemberVo memberLogin(String memberId);

	public void deleteMember(String memberId);
	
	public MemberVo getMemberInfo(int midx);

	
	
	
}
