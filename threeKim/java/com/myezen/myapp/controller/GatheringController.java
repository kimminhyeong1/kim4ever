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
	//모임 게시판
	@RequestMapping(value="/gBoardList.do")
	public String gBoardList() {
		
		return "gathering/gBoardList";
	}
	//모임 게시판 작성
	@RequestMapping(value="/gBoardWrite.do")
	public String gBoardWrite() {
		
		return "gathering/gBoardWrite";
	}	
	//모임 게시판 수정
	@RequestMapping(value="/gBoardModify.do")
	public String gBoardModify() {
		
		return "gathering/gBoardModify";
	}
	//모임 게시글 보기
	@RequestMapping(value="/gBoardContent.do")
	public String gBoardContent() {
		
		return "gathering/gBoardContent";
	}	
	//모임 사진첩
	@RequestMapping(value="/gPhotoAlbum.do")
	public String gPhotoAlbum() {
		
		return "gathering/gPhotoAlbum";
	}	
	//모임 수정
	@RequestMapping(value="/gModify.do")
	public String gModify() {
		
		return "gathering/gModify";
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
