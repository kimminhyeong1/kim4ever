package com.myezen.myapp.service;

import java.util.ArrayList;



public interface AdminService {
<<<<<<< HEAD
	/*
	 * //회원삭제 public void deleteMember(String memberId); //회원리스트 public
	 * ArrayList<JoinVo> memberList();
	 */
=======
	//회원삭제
		public void deleteMember(String memberId);
	//회원리스트
		public ArrayList<BikeJoinVo> memberList();	
	//고장 신고내역 리스트
		public ArrayList<BikeJoinVo> errorList();
		
>>>>>>> kmh
}
