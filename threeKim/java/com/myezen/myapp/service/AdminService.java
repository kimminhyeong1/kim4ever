package com.myezen.myapp.service;

import java.util.ArrayList;

import com.myezen.myapp.domain.JoinVo;

public interface AdminService {
	//회원삭제
		public void deleteMember(String memberId);
	//회원리스트
		public ArrayList<JoinVo> memberList();	
		
}
