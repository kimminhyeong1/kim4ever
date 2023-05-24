package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	//관리자 메인페이지
		@RequestMapping(value="/adminPage.do")
		public String adminPage() {
			
			return "admin/adminPage";
		}
	
		@RequestMapping(value="/adminbikeRentWrite.do")
		public String adminbikeRentWrite() {
			
			return "admin/adminbikeRentWrite";
		}
		
		
		
		
		
		
		/*회원 삭제	
		@RequestMapping(value="/memberList.do")
		public String memberList() {
			
			return "admin/memberList";
		}	*/
}
