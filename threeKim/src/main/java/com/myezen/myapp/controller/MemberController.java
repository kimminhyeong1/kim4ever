package com.myezen.myapp.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value="/memberJoinAction.do")
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
	
	
	@RequestMapping(value="/memberList.do")
	//value에 안쓰면 둘다 받겠다 get + foward 
	public String memberList(Model model) {
		
		ArrayList<MemberVo> alist = ms.memberList();
		
		model.addAttribute("alist",alist); //(model=requestsetattribute)에 담아서 가지고 간다
		
		return "member/memberList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/memberIdCheck.do")
	public String memberIdCheck(@RequestParam("memberId") String memberId) {
		String str = null;
		int value = 0;
		
		value = ms.memberIdCheck(memberId);
		
		str = "{\"value\":\""+value+"\"}"; //json객체 형태
		return str; //문자열 말고 json타입의 객체형으로 보내기 위해 str로 넘김 
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
	
	@RequestMapping(value="/memberLogout.do")
	public String memberLogout(HttpSession session) {
		
		session.removeAttribute("midx");
		session.removeAttribute("memberName");
		session.invalidate(); //세션을 없애고 세션에 속해있는 값들을 모두 없앤다
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberMypage.do")
	public String memberMypage() {
	
		return "member/memberMypage";
		
	}
	
	
	
	
}
