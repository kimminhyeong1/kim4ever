package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myezen.myapp.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class boardController {
BoardService bs; //업캐스팅 부모만 지정
	
	@RequestMapping(value="/boardList.do")
	public String boardList() {
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardNoticeContent.do")
	public String boardNoticeContent() {
		
		return "board/boardNoticeContent";
	}
	
	@RequestMapping(value="/boardQnaContent.do")
	public String boardQnaContent() {
		
		return "board/boardQnaContent";
	}
	
	@RequestMapping(value="/boardFaqContent.do")
	public String boardFaqContent() {
		
		return "board/boardFaqContent";
	}
	
	@RequestMapping(value="/boardModify.do")
	public String boardModify() {
		
		return "board/boardModify";
	}
	
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete() {
		
		return "board/boardDelete";
	}
	
	@RequestMapping(value="/boardReply.do")
	public String boardReply() {
		
		return "board/boardReply";
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
