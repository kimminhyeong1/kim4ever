package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/bike")
public class bikeController {
MemberService ms; //업캐스팅 부모만 지정
	
	@RequestMapping(value="/bikeRent.do")
	public String bikeRent() {
		
		return "bike/bikeRent";
	}
	
	@RequestMapping(value="/bikeRentDetail.do")
	public String bikeRentDetail() {
		
		return "bike/bikeRentDetail";
	}
	
	@RequestMapping(value="/bikeRentWrite.do")
	public String bikeRentWrite() {
		
		return "bike/bikeRentWrite";
	}
	


	
}

