package com.myezen.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer.MvcMatchersAuthorizedUrl;
import org.springframework.stereotype.Service;

import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.persistance.MemberService_Mapper;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	
	private MemberService_Mapper msm;
	//SqlSession : PreparedStatement와 표현 방법이 다를뿐 같은 기능을 한다.
	//Autowired : 메모리에 올려둔 주소들이 자동으로 연결 됨

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


	@Override
	public void deleteMember(String memberId) {
		System.out.println("memberId"+memberId);
		msm.deleteMember(memberId);
		
	}


	@Override
	public MemberVo getMemberInfo(int midx) {
	  
	    MemberVo mv = new MemberVo();
	   

	    return mv;
	}



	

	



	
	
	

	

	



	


}
