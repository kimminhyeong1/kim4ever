package com.myezen.myapp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.service.AdminService;
import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired	
	AdminService as;
	@Autowired
	MemberService ms;
	
	//관리자 메인 페이지
	@RequestMapping(value="/adminPage.do")
	public String adminPage() {
			
		return "admin/adminPage";
	}
	
	//관리자 회원관리 페이지	  
	@RequestMapping(value="/adminmemberList.do") 
	public String memberList(Model model) {
  
		ArrayList<BikeJoinVo> alist = as.memberList();
  
		model.addAttribute("alist",alist); //(model=requestsetattribute)에 담아서 가지고 간다
  
		return "admin/adminmemberList"; }

	//회원 삭제	
	@RequestMapping(value="/adminmemberDelete.do")
	public String deleteMember(@RequestParam("memberId") String memberId) {
		//System.out.println("test1");
		as.deleteMember(memberId);
		//System.out.println("test2");
		return "redirect:/admin/adminmemberList.do"; 
	}	
		
	//관리자 게시판관리 페이지
	@RequestMapping(value="/adminboardList.do")
	public String adminboardList() {
				
	return "admin/adminboardList";
	}
	
	//관리자 자전거 추가 페이지
	@RequestMapping(value="/adminbikeRegister.do")
	public String adminbikeRegister() {
			
			return "admin/adminbikeRegister";
		}

	//관리자 자전거 관리 페이지
	@RequestMapping(value="/adminbikeList.do")
	public String adminbikeList(Model model) {
		
		ArrayList<BikeJoinVo> klist = as.bikeList();
		
		model.addAttribute("klist",klist);
		
		return "admin/adminbikeList";
	}
	
	

	//관리사 신고 내역 페이지
	@RequestMapping(value="/adminbikeError.do")
	public String errorList(Model model) {
		
		ArrayList<BikeJoinVo> elist = as.errorList();
		
		model.addAttribute("elist",elist);
		
		return "admin/adminbikeError";
	}

			

}
