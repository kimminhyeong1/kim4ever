package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myezen.myapp.service.CourseService;
import com.myezen.myapp.service.RentService;

@Controller
@RequestMapping(value="/rent")
public class rentController {
RentService rs;
	
	@RequestMapping(value="/rentLocation.do")
	public String rentLocation() {
		
		return "rent/rentLocation";
	}
	
	@RequestMapping(value="/rentHistory.do")
	public String rentHistory() {
		
		return "rent/rentHistory";
	}
	
	@RequestMapping(value="/rentFault.do")
	public String rentFault() {
		
		return "rent/rentFault";
	}
}
