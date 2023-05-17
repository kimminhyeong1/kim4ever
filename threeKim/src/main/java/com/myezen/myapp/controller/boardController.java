package com.myezen.myapp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class boardController {
	
	@Autowired
	BoardService bs;
	
	@Autowired(required=false)
	PageMaker pm;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(SearchCriteria scri, Model model) {
		
		int totalCount = bs.boardTotal(scri);
		pm.setScri(scri);
		pm.setTotalCount(totalCount);
		
		ArrayList<BoardVo> blist = bs.boardSelectAll(scri);
		
		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardNoticeContent.do")
	public String boardContents(@RequestParam("bidx") int bidxInt, Model model) {
		
		int value = bs.boardViewCnt(bidxInt);
		BoardVo bv = bs.boardSelectOne(bidxInt);
		
		model.addAttribute("bv", bv);
		
		return "board/boardContents";
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
