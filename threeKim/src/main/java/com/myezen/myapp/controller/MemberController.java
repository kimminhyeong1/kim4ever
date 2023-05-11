package com.myezen.myapp.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	MemberService ms; //업캐스팅 부모만 지정
	
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin() {
	
		return "member/memberLogin";
		
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
