package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/bikeRent")
public class bikeRentController {
MemberService ms; //업캐스팅 부모만 지정
	
	@RequestMapping(value="/bikeRent.do")
	public String bikeRent() {
		
		return "bikeRent/bikeRent";
	}
	
	@RequestMapping(value="/bikeRentDetail.do")
	public String bikeRentDetail() {
		
		return "bikeRent/bikeRentDetail";
	}
	
	@RequestMapping(value="/bikeRentWrite.do")
	public String bikeRentWrite() {
		
		return "bikeRent/bikeRentWrite";
	}
	
	
	
	
	@RequestMapping(value="/bikeRentLocation.do")
	public String bikeRentLocation() {
		
		return "bikeRent/bikeRentLocation";
	}
	@RequestMapping(value="/bikeRentHistory.do")
	public String bikeRentHistory() {
		
		return "bikeRent/bikeRentHistory";
	}

	
	@RequestMapping(value="/bikeRentFault.do")
	public String bikeRentFault() {
		
		return "bikeRent/bikeRentFault";
	}
	
	@RequestMapping(value="/bikeRentFaultList.do")
	public String bikeRentFaultList() {
		
		return "bikeRent/bikeRentFaultList";
	}
	
	@RequestMapping(value="/bikeRentInfo.do")
	public String bikeRentInfo() {
		
		return "bikeRent/bikeRentInfo";
	}
	
	

	
}

