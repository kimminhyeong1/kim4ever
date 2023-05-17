package com.myezen.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.persistance.MemberService_Mapper;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

	
	private MemberService_Mapper msm;
	
	//SqlSession sqlSession mybatis 객체 참조 변수
	@Autowired
	public MemberServiceImpl(SqlSession sqlSession) {
		this.msm = sqlSession.getMapper(MemberService_Mapper.class);
	}
	
	@Override
	public int memberInsert(String memberId, String memberPwd, String memberName,  String memberAge, String memberPhone,
			String memberEmail, String memberAddr) {
		
		MemberVo mv = new MemberVo();
		mv.setMemberid(memberId);
		mv.setMemberpwd(memberPwd);
		mv.setMembername(memberName);
		mv.setMemberage(memberAge);
		mv.setMemberphone(memberPhone);
		mv.setMemberemail(memberEmail);
		mv.setMemberaddr(memberAddr);
	
		
		int value = msm.memberInsert(mv);
		
		return value;
	}
	
	
	@Override
	public ArrayList<MemberVo> memberList() {
		
		ArrayList<MemberVo> alist = msm.memberList();
				
		return alist;
	}
	
	@Override
	public int memberIdCheck(String memberId) {
		
		int value = msm.memberIdCheck(memberId);
		
		return value;
	}

	@Override
	public MemberVo memberLogin(String memberId) {
		MemberVo mv = msm.memberLogin(memberId);
		return mv;
	}
	


}
