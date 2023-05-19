package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/gathering")
public class GatheringController {
	
	@RequestMapping(value="/gatheringList.do")
	public String gatheringList() {
		
		return "gathering/gatheringList";
	}
	
	@RequestMapping(value="/gatheringCreate.do")
	public String gatheringCreate() {
		
		return "gathering/gatheringCreate";
	}
	
	@RequestMapping(value="/gatheringContent.do")
	public String gatheringContent() {
		
		return "gathering/gatheringContent";
	}
}
