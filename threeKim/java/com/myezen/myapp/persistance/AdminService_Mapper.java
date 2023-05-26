package com.myezen.myapp.persistance;

import java.util.ArrayList;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;

public interface AdminService_Mapper {
	//회원삭제
	public void deleteMember(String memberId);
	//회원리스트	
	public ArrayList<BikeJoinVo> memberList();
	//신고리스트	
	public ArrayList<BikeJoinVo> errorList(); 
}
