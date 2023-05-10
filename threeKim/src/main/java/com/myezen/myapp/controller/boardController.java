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
	public String memberJoin() {
		
		return "board/boardList";
	}
}