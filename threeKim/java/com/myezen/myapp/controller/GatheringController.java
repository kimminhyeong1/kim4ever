package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/gathering")
public class GatheringController {
//모임메인페이지
	@RequestMapping(value="/gList.do")
	public String gList() {
		
		return "gathering/gList";
	}
//모임만들기페이지	
	@RequestMapping(value="/gCreate.do")
	public String gCreate() {
		
		return "gathering/gCreate";
	}
//모임상세보기페이지
	@RequestMapping(value="/gContent.do")
	public String gContent() {
		
		return "gathering/gContent";
	}
//내 모임 정보
	@RequestMapping(value="/gMyPage.do")
	public String gMyPage() {
		
		return "gathering/gMyPage";
	}
//찜한 모임 정보
	@RequestMapping(value="/gMyWish.do")
	public String gMyWish() {
		
		return "gathering/gMyWish";
	}
//모임 검색
	@RequestMapping(value="/gSearch.do")
	public String gSearch() {
		
		return "gathering/gSearch";
	}
//모임 검색 결과
	@RequestMapping(value="/gSearchResult.do")
	public String gSearchResult() {
		
		return "gathering/gSearchResult";
	}
}
