package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myezen.myapp.service.BoardService;
import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/board")
public class boardController {
BoardService bs; //업캐스팅 부모만 지정
	
	@RequestMapping(value="/boardList.do")
	public String boardList() {
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardNoticeWrite.do")
	public String boardNoticeWrite() {
		
		return "board/boardNoticeWrite";
	}
	
	@RequestMapping(value="/boardQnaWrite.do")
	public String boardQnaWrite() {
		
		return "board/boardQnaWrite";
	}
	
	@RequestMapping(value="/boardFaqWrite.do")
	public String boardFaqWrite() {
		
		return "board/boardFaqWrite";
	}
}