package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/gathering")
public class GatheringController {
	
	@RequestMapping(value="/gList.do")
	public String gatheringList() {
		
		return "gathering/gList";
	}
	
	@RequestMapping(value="/gCreate.do")
	public String gatheringCreate() {
		
		return "gathering/gCreate";
	}
	
	@RequestMapping(value="/gContent.do")
	public String gatheringContent() {
		
		return "gathering/gContent";
	}
}
