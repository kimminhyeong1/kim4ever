package com.myezen.myapp.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value="/memberJoinAction.do")
	public String memberJoinAction(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPwd") String memberPwd,
			@RequestParam("memberName") String memberName,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberGender") String memberGender,
			@RequestParam("memberAddr") String memberAddr,
			@RequestParam("memberBirth") String memberBirth
			) {
		
String memberPwd2 = bcryptPasswordEncoder.encode(memberPwd);
		
		int value = ms.memberInsert(memberId, memberPwd2, memberName, memberPhone, memberEmail, memberGender, memberAddr, memberBirth);
					
		return "redirect:/";
	}
	
	

	
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin() {
	
		return "member/memberLogin";
		
	}
	
	@RequestMapping(value="/memberLoginAction.do")
	public String memberLoginAction(
			@RequestParam("memberId")String memberId,
			@RequestParam("memberPwd")String memerPwd,
			HttpSession session,
			RedirectAttributes rttr //담는 용도
			) {
		
		MemberVo mv = ms.memberLogin(memberId);
		String path="";
		
		if(mv!=null && bcryptPasswordEncoder.matches(memerPwd, mv.getMemberpwd()) ) {
			//loginInterceptor에서 set에 담고있기 때문에 set-->rttr로 바꿔줌
			rttr.addAttribute("midx",mv.getMidx());
			rttr.addAttribute("memberName",mv.getMembername());
			
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
	
	@RequestMapping(value="/memberList.do")
	public String memberList() {
	
		return "member/memberList";
		
	}
	
	@RequestMapping(value="/memberMypage.do")
	public String memberMypage() {
	
		return "member/memberMypage";
		
	}
	
	
	
	
}
