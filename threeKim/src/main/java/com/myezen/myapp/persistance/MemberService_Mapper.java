package com.myezen.myapp.persistance;

import java.util.ArrayList;

import com.myezen.myapp.domain.MemberVo;

public interface MemberService_Mapper {

	public int memberInsert(MemberVo mv);
	
	public ArrayList<MemberVo> memberList();
	
	public int memberIdCheck(String memberId);
	
	public MemberVo memberLogin(String memberId);
}
