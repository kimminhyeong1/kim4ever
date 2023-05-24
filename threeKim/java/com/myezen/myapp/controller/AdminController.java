package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	//관리자 메인 페이지
	@RequestMapping(value="/adminPage.do")
	public String adminPage() {
			
		return "admin/adminPage";
	}

	//관리자 회원관리 페이지
	@RequestMapping(value="/adminmemberList.do")
	public String adminmemberList() {
			
		return "admin/adminmemberList";
		}
	
	//관리자 게시판관리 페이지
		@RequestMapping(value="/adminboardList.do")
		public String adminboardList() {
				
			return "admin/adminboardList";
			}
	
	@RequestMapping(value="/adminbikeRegister.do")
	public String adminbikeRegister() {
			
			return "admin/adminbikeRegister";
		}
		
	
	
		
		
		
		
		
		/*회원 삭제	
		@RequestMapping(value="/memberList.do")
		public String memberList() {
			
			return "admin/memberList";
		}	*/
}
