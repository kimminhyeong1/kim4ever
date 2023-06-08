package com.myezen.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer.MvcMatchersAuthorizedUrl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.persistance.MemberService_Mapper;
import com.myezen.myapp.util.MailHandler;
import com.myezen.myapp.util.TempKey;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	
	private MemberService_Mapper msm;
	//SqlSession : PreparedStatement와 표현 방법이 다를뿐 같은 기능을 한다.
	//Autowired : 메모리에 올려둔 주소들이 자동으로 연결 됨

	@Autowired
	public MemberServiceImpl(SqlSession sqlSession) {
		this.msm = sqlSession.getMapper(MemberService_Mapper.class);
	}

	@Autowired
	JavaMailSender mailSender;//email-context.xml 이메일객체

    //회원가입
	@Override
	public int memberInsert(String memberId, String memberPwd, String memberName,  String memberAge, String memberPhone,
			String memberEmail, String memberAddr) {
		
		MemberVo mv = new MemberVo();
		mv.setMemberId(memberId);
		mv.setMemberPwd(memberPwd);
		mv.setMemberName(memberName);
		mv.setMemberAge(memberAge);
		mv.setMemberPhone(memberPhone);
		mv.setMemberEmail(memberEmail);
		mv.setMemberAddr(memberAddr);
	
		
		int value = msm.memberInsert(mv);
		
		return value;
	}
	//아이디중복체크
	@Override
	public int memberIdCheck(String memberId) {
		int value= msm.memberIdCheck(memberId);
		return value;
	}
	//이메일중복체크
	@Override
	public int memberEmailCheck(String memberEmail) {
		int value= msm.memberEmailCheck(memberEmail);
		return value;
	}
	//이메일보내기
	@Override
	public int memberMailAuth(String memberEmail) throws Exception {
		TempKey tk = new TempKey();//난수생성
		String mailKey = tk.getKey(5, true);
		int value = msm.memberMailAuthSave(mailKey,memberEmail);//인증번호 DB에 담기
		//이메일 보내기
		
		 MailHandler mh = new MailHandler(mailSender);
		 mh.setSubject("[타바 인증메일 입니다.]"); //메일제목 
		 mh.setText("<h1>타바 메일인증</h1><br>인증번호:"+mailKey); 
		 mh.setFrom("taba1234TA@gmail.com","타바"); 
		 mh.setTo(memberEmail); 
		 mh.send();
		 
		return value;
	}
	//아이디찾기 1.대조
	@Override
	public int memberIdFindMatch(String memberName, String memberEmail) {//아이디찾기에서 이 사람이 맞는지 확인 
		int value = msm.memberIdFindMatch(memberName, memberEmail);//아이디찾기에서 이 사람이 맞는지 확인 
		return value;
	}
	//아이디찾기 2.찾기
	@Override
	@Transactional
	public String memberIdFind(String memberName, String memberEmail, String mailKey) {
		
		int value1 = msm.memberMailAuthMatch(mailKey,memberEmail);//인증키 대조

		String mId = msm.memberIdFind(memberName,memberEmail);//아이디 뽑아오기
		
		int value2 = msm.memberMailAuthKeyDel(mailKey,memberEmail);//인증키 삭제
		
		return mId;
	}
	//비밀번호찾기 1.대조
	@Override
	public int memberPwdFindAuthMatch(String memberId, String memberName, String memberEmail) {
		int value = msm.memberPwdFindAuthMatch(memberId, memberName, memberEmail);//맞는지 대조
		return value;
	}
	//비밀번호찾기 2.찾기
	@Override
	@Transactional
	public int memberPwdFindMatch(String memberId, String memberName, String memberEmail, String mailKey) {
		int value1 = msm.memberMailAuthMatch(mailKey,memberEmail);//인증키 대조

		int value2 = msm.memberPwdFindMatch(memberId, memberName, memberEmail);//맞는지 대조
		
		return value2;
	}
	//비밀번호찾기 3.재설정
	@Override
	@Transactional
	public int memberPwdReset(String memberPwd, String memberId, String memberName, String memberEmail, String mailKey) {
		int value1 = msm.memberMailAuthMatch(mailKey,memberEmail);//인증키 대조

		int value2 = msm.memberPwdReset(memberPwd,memberId,memberName,memberEmail);//비밀번호 재설정
		
		int value3 = msm.memberMailAuthKeyDel(mailKey,memberEmail);//인증키 삭제
		return value2;
	}

	//로그인
	@Override
	public MemberVo memberLogin(String memberId) {
		MemberVo mv = msm.memberLogin(memberId);
		return mv;
	}

	//회원리스트
		@Override
	public ArrayList<MemberVo> memberList() {
			
		ArrayList<MemberVo> alist = msm.memberList();
			
		return alist;
	}
		
	//회원삭제
	@Override
	public void deleteMember(String memberId) {
		System.out.println("memberId"+memberId);
		msm.deleteMember(memberId);
		
	}
	
	//마이페이지
	@Override
	public MemberVo getMemberInfo(int midx) {
	  
	    MemberVo mv = msm.getMemberInfo(midx); // 데이터베이스에서 회원 정보 조회
	   
	    return mv;
	}


	//회원정보수정
	@Override
	public void updateMember(MemberVo mv) {
		
		msm.updateMember(mv);
		
	}
	@Override
	public MemberVo getMemberByMemberId(String memberId) {
		
		
		return msm.getMemberByMemberId(memberId);
	}
	//소셜 회원가입
	@Override
	public int socialMemberInsert(String memberId, String memberPwd, String memberName) {
		int value = msm.socialMemberInsert(memberId,memberPwd,memberName);
		return value;
	}
	//소셜 멤버 확인
	@Override
	public int socialMemberCheck(String memberId) {
		int value = msm.socialMemberCheck(memberId);
		return value;
	}

}
