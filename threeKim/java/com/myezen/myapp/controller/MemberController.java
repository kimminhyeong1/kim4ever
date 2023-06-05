package com.myezen.myapp.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.service.MemberService;



@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired //IoC 컨테이너 안에 존재하는 Bean을 자동으로 주입해준다
	MemberService ms; //업캐스팅 부모만 지정해두면 된다
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	

	private final SqlSession sqlSession;

	public MemberController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
//!회원가입페이지
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	//!아이디체크
	@ResponseBody
	@RequestMapping(value = "/memberJoinIdCheck.do")
	public HashMap<String, Object> memberJoinIdCheck(@RequestParam("memberId") String memberId) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("아이디체크");
		int value = ms.memberIdCheck(memberId);
		System.out.println(value);
		hm.put("value",value);//0은 거짓 1은 참
		return hm; 
	}
	//!이메일체크
	@ResponseBody
	@RequestMapping(value = "/memberJoinEmailCheck.do")
	public HashMap<String, Object> memberJoinEmailCheck(@RequestParam("memberEmail") String memberEmail) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("이메일체크");
		int value = ms.memberEmailCheck(memberEmail);
		System.out.println(value); 
		hm.put("value",value); //0은 거짓 1은 참
		return hm; 
	}
	//!회원가입페이지에서 기본회원가입 가입하기 버튼 클릭
	@RequestMapping(value="/memberJoinAction.do", method = RequestMethod.POST)
	public String memberJoinAction(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPwd") String memberPwd,
			@RequestParam("memberName") String memberName,
			@RequestParam("memberAge") String memberAge,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberAddr") String memberAddr
			
			) {
		
		String memberPwd2 = bcryptPasswordEncoder.encode(memberPwd);
		
	
		
		int value = ms.memberInsert(memberId, memberPwd2, memberName, memberAge, memberPhone, memberEmail, memberAddr);
						
		return "redirect:/";
	}
//!아이디찾기페이지
	@RequestMapping(value = "/memberIdFind.do")
	public String memberIdFind() {
		
		return "member/memberIdFind"; 
	}
	//!아이디찾기페이지에서 인증번호 보내기
	@ResponseBody
	@RequestMapping(value = "/memberIdMailAuth.do")
	public HashMap<String, Object> memberIdMailAuth(@RequestParam("memberName") String memberName,@RequestParam("memberEmail") String memberEmail) throws Exception {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		int value1 = ms.memberIdFindMatch(memberName,memberEmail);//회원이 맞는지 확인
		if (value1 == 0) {
			hm.put("value",value1); //0은 거짓 1은 참
			return hm; 
		}
		int value2 = ms.memberMailAuth(memberEmail);//인증번호 보내기 
		
		hm.put("value",value2); //0은 거짓 1은 참 
		return hm; 
	}
	//!아이디찾음페이지
	@RequestMapping(value = "/memberIdFound.do")
	public String memberIdFound(
			@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("mailKey") String mailKey,//인증코드
			Model model,
			HttpServletRequest request//이전 페이지로 리다이렉트 시키기
			) {
		
		String memberId = ms.memberIdFind(memberName,memberEmail,mailKey);
		model.addAttribute("memberId", memberId);//값전달
		if (memberId == null) {
		    String referer = request.getHeader("Referer");//이전 페이지로 리다이렉트 시키기
		    return "redirect:"+ referer;
		}
		return "member/memberIdFound"; 
	}
//!비밀번호찾기페이지
	@RequestMapping(value = "/memberPwdFind.do")
	public String memberPwdFind() {
		
		return "member/memberPwdFind"; 
	}
	//!비밀번호찾기페이지에서 인증번호 보내기
	@ResponseBody
	@RequestMapping(value = "/memberPwdMailAuth.do")
	public HashMap<String, Object> memberPwdMailAuth(
			@RequestParam("memberId") String memberId, 
			@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberEmail
			) throws Exception {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		int value1 = ms.memberPwdFindAuthMatch(memberId,memberName,memberEmail);//회원이 맞는지 확인
		if (value1 == 0) {
			hm.put("value",value1); //0은 거짓 1은 참
			return hm; 
		}
		
		int value = ms.memberMailAuth(memberEmail);//인증번호 보내기 
		
		hm.put("value",value); //0은 거짓 1은 참
		return hm; 
	}
	//!비밀번호찾음페이지
	@RequestMapping(value = "/memberPwdFound.do") 
	public String memberPwdFound(
			@RequestParam("memberId") String memberId, 
			@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("mailKey") String mailKey,//인증코드
			HttpSession session,
			HttpServletRequest request//이전 페이지로 리다이렉트 시키기
			) {
		//전단계에서 보낸값들을 대조해서 맞는지 틀리는지 판단
		int value = ms.memberPwdFindMatch(memberId,memberName,memberEmail,mailKey);
		if (value == 0) {
		    String referer = request.getHeader("Referer");//이전 페이지로 리다이렉트 시키기
		    return "redirect:"+ referer;
		}
		session.setAttribute("memberId", memberId);
		session.setAttribute("memberName", memberName);
		session.setAttribute("memberEmail", memberEmail);
		session.setAttribute("mailKey", mailKey);
		
		return "member/memberPwdFound"; 
	}
	//!비빌번호찾음페이지에서 비밀번호 재설정버튼 클릭
	@RequestMapping(value = "/memberPwdFoundAction.do")
	public String memberPwdFoundAction(
			@RequestParam("memberPwd") String memberPwd,
			HttpSession session//http세션 가지고오기
			) {
		String memberPwdEncode = bcryptPasswordEncoder.encode(memberPwd);//비밀번호 암호화
		String memberId = (String) session.getAttribute("memberId");
		String memberName = (String) session.getAttribute("memberName");
		String memberEmail = (String) session.getAttribute("memberEmail");
		String mailKey = (String) session.getAttribute("mailKey");
		//세션값 받아오기
		
		//메소드 실행
		int value = ms.memberPwdReset(memberPwdEncode,memberId,memberName,memberEmail,mailKey);
		
		//세션지우기
		session.removeAttribute("memberId");
		session.removeAttribute("memberName");
		session.removeAttribute("memberEmail");
		session.removeAttribute("mailKey");
		return "redirect:/"; 
	}
	
//!로그인페이지	
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin() {
	
		return "member/memberLogin";
		
	}
	//!로그인페이지에서 로그인하기 버튼 클릭
	@RequestMapping(value="/memberLoginAction.do")
	public String memberLoginAction(
			@RequestParam("memberId")String memberId,
			@RequestParam("memberPwd")String memerPwd,
			HttpSession session,
			RedirectAttributes rttr, //담는 용도
			Model model
			) {
		
		MemberVo mv = ms.memberLogin(memberId);
		String path="";
		
		if(mv!=null && bcryptPasswordEncoder.matches(memerPwd, mv.getMemberPwd()) ) {
			//rttr은 페이지를 벗어나면 사라짐, session으로 담아줘야 유지 됨
			session.setAttribute("midx", mv.getMidx());
			session.setAttribute("memberId", mv.getMemberId());
			session.setAttribute("memberPwd", mv.getMemberPwd());
			session.setAttribute("memberName", mv.getMemberName());
			session.setAttribute("memberAge", mv.getMemberAge());
			session.setAttribute("memberPhone", mv.getMemberPhone());
			session.setAttribute("memberEmail", mv.getMemberEmail());
			session.setAttribute("membertype", mv.getMemberType());
			
			//비밀번호 지우기 //2023-05-26
			session.removeAttribute("memberPwd"); 
			
			if(session.getAttribute("dest") == null) {
				path = "redirect:/";	
			}else {
				String dest = (String)session.getAttribute("dest");
				
				path = "redirect:"+dest;
			}
			
			
			
		}else {
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 확인 해 주세요.");//일회성 메세지
			path = "redirect:/member/memberLogin.do";
			
		}
		
		return path;	
	}
//!로그아웃 클릭
	@RequestMapping(value="/memberLogOut.do")
	public String memberLogout(HttpSession session) {
		
		session.removeAttribute("midx");
		session.removeAttribute("memberName");
		session.invalidate(); //세션을 없애고 세션에 속해있는 값들을 모두 없앤다
		
		return "redirect:/";
	}
	@RequestMapping(value="/memberList.do")
	//value에 안쓰면 둘다 받겠다 get + foward 
	public String memberList(Model model) {
		
		ArrayList<MemberVo> alist = ms.memberList();
		
		model.addAttribute("alist",alist); //(model=requestsetattribute)에 담아서 가지고 간다
		
		return "member/memberList";
	}
	
	//회원삭제
	@RequestMapping("/memberDelete.do")
	public String deleteMember(@RequestParam("memberId") String memberId) {
		//System.out.println("test1");
		ms.deleteMember(memberId);
		//System.out.println("test2");
		return "redirect:/member/memberList.do"; 
	
	}
	//마이페이지
	@RequestMapping("/memberMypage.do")
	public String memberMypage(Model model, HttpSession session) {
	    int midx = (Integer) session.getAttribute("midx");
	    
	    
	    MemberVo mv = ms.getMemberInfo(midx);
	    session.setAttribute("mv", mv);
	    session.setAttribute("memberName", mv.getMemberName());
	    session.setAttribute("memberAge", mv.getMemberAge());
	    session.setAttribute("memberPhone", mv.getMemberPhone());
	    session.setAttribute("memberEmail", mv.getMemberEmail());
	    model.addAttribute("mv", mv);
	    
	    
	    return "member/memberMypage";
	}
	
	//회원정보수정페이지
	@RequestMapping("/memberUpdate.do")
	public String memberUdpate(Model model, HttpSession session) {
		int midx =(Integer) session.getAttribute("midx");
		MemberVo mv = ms.getMemberInfo(midx);
		model.addAttribute("mv", mv);
		return "member/memberUpdate";
	}
	
	//회원정보수정
	@PostMapping("/memberUpdateAction.do")
	public String memberUpdateAction( 
	        @RequestParam("memberPwd") String memberPwd,
	        @RequestParam("memberName") String memberName,
	        @RequestParam("memberAge") String memberAge,
	        @RequestParam("memberPhone") String memberPhone,
	        @RequestParam("memberEmail") String memberEmail,
	        Model model,
	        HttpSession session) {

	    // 비밀번호 암호화
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    String encryptedPassword = passwordEncoder.encode(memberPwd);

	    MemberVo mv = (MemberVo) session.getAttribute("mv");

	    
	    // 비밀번호 변경 여부 확인 후 업데이트
	    if (!memberPwd.isEmpty()) {
	        mv.setMemberPwd(encryptedPassword);
	    }
	    
	    // 이름과 나이 변경 여부 확인
	    if (!memberName.isEmpty()) {
	        mv.setMemberName(memberName);
	    }
	    if (!memberAge.isEmpty()) {
	        mv.setMemberAge(memberAge);
	    }

	    // 휴대폰번호와 이메일 변경 여부 확인 후 업데이트
	    if (!memberPhone.isEmpty()) {
	        mv.setMemberPhone(memberPhone);
	    }
	    if (!memberEmail.isEmpty()) {
	        mv.setMemberEmail(memberEmail);
	    }

	    //mv.setMemberpwd(encryptedPassword);
	    //mv.setMembername(membername);
	    //mv.setMemberage(memberage);
	    //mv.setMemberphone(memberphone);
	    //mv.setMemberemail(memberemail);
	   
	    // 회원 정보 업데이트
	    ms.updateMember(mv);

	    // 세션에 업데이트된 mv 저장
	    session.setAttribute("mv", mv);
	    session.setAttribute("memberName", mv.getMemberName());
	    session.setAttribute("memberAge", mv.getMemberAge());
	    session.setAttribute("memberPhone", mv.getMemberPhone());
	    session.setAttribute("memberEmail", mv.getMemberEmail());

	    model.addAttribute("mv", mv);

	    return "redirect:/member/memberMypage.do";
	}
	
	//회원리스트에서 회원정보보기
	@RequestMapping("/memberListProfile.do")
	public String memberListProfile(@RequestParam("memberId") String memberId, Model model) {
	    MemberVo mv = ms.getMemberByMemberId(memberId);
	    model.addAttribute("mv", mv);
	    return "member/memberListProfile";
	}
	
}
