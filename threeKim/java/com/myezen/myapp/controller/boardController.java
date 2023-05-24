package com.myezen.myapp.controller;

import java.net.InetAddress;
import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.BoardService;
import com.myezen.myapp.service.MemberService;
import com.myezen.myapp.util.UploadFileUtiles;

@Controller
@RequestMapping(value="/board")
public class boardController {
	
	@Autowired
	BoardService bs;
		
	@Autowired(required=false)	
	PageMaker pm;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(SearchCriteria scri,  Model model) {		
		
		int totalCount = bs.boardTotal(scri);
		pm.setScri(scri);
		pm.setTotalCount(totalCount);
		
		ArrayList<BoardVo> blist = bs.boardSelectAll(scri);
		
		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);
	
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardNoticeContent.do")
	public String boardNoticeContent(@RequestParam("bidx") int bidxInt, Model model) {
		
		int value = bs.boardView(bidxInt);
		BoardVo bv = bs.boardSelectOne(bidxInt);
		
		model.addAttribute("bv", bv);
		
		return "board/boardNoticeContent";
	}
	
	@RequestMapping(value="/boardQnaContent.do")
	public String boardQnaContent(@RequestParam("bidx") int bidxInt, Model model) {
		
		int value = bs.boardView(bidxInt);
		BoardVo bv = bs.boardSelectOne(bidxInt);
		
		model.addAttribute("bv", bv);
		return "board/boardQnaContent";
	}
	
	@RequestMapping(value="/boardFaqContent.do")
	public String boardFaqContent(@RequestParam("bidx") int bidxInt, Model model) {
		
		int value = bs.boardView(bidxInt);
		BoardVo bv = bs.boardSelectOne(bidxInt);
		
		model.addAttribute("bv", bv);
		
		return "board/boardFaqContent";
	}
	
	@RequestMapping(value="/boardModify.do")
	public String boardModify(@RequestParam("bidx") int bidxInt, Model model) {
		
		BoardVo bv = bs.boardSelectOne(bidxInt);		
		model.addAttribute("bv", bv);		
		
		return "board/boardModify";
	}
	
	// 게시글수정 ---중...........
	@RequestMapping(value="/boardModifyAction.do")
	public String boardModifyAction(
			@RequestParam("bidx") int bidxInt,
			  @RequestParam("subject") String subject,
		        @RequestParam("content") String content,
		        @RequestParam("writer") String writer,
		        HttpSession session
		        ) throws Exception {    	                
		    int midx = 0;
		    if (session.getAttribute("midx") != null) {
		        midx = Integer.parseInt(session.getAttribute("midx").toString());
		    }
		    
		    BoardVo bv = new BoardVo();
			bv.setBidx(bidxInt);
		    bv.setSubject(subject);
		    bv.setContent(content);
		    bv.setWriter(writer);
		    bv.setMidx(midx);
		    
			int value = bs.boardModify(bv);	
			System.out.println("게시판수정"+value);

			String path ="";
			if (value==1) {
		        path = "redirect:/board/boardList.do"; 
			}else {
				path = "redirect:/board/boardModify.do?bidx="+bidxInt;
			}
			
		return path;
	}
	
	// 게시글 삭제 화면
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(@RequestParam("bidx") int bidx, Model model) {
	    BoardVo bv = bs.boardSelectOne(bidx);
	    model.addAttribute("bv", bv);
	    return "board/boardDelete";
	}

	// 게시글 삭제 액션
	@RequestMapping(value="/boardDeleteAction.do")
	public String boardDeleteAction(
	        @RequestParam("bidx") int bidx,
	        HttpSession session) throws Exception {
	    
	    int midx = 0;
	    if (session.getAttribute("midx") != null) {
	        midx = Integer.parseInt(session.getAttribute("midx").toString());
	    }
	    
	    BoardVo bv = new BoardVo();
	    bv.setBidx(bidx);
	    bv.setMidx(midx);

	    int value = bs.boardDelete(bv);
	    System.out.println("삭제값: " + value);

	    String path = "";
	    if (value == 1) {
	        path = "redirect:/board/boardList.do"; 

	    } else {
	        path =  "redirect:/board/boardDelete.do?bidx=" + bidx;
	    }
	    return path;
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
	
	
	
	//게시글쓰기
	@RequestMapping(value="/boardWriteAction.do")
	public String boardWriteAction(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam("writer") String writer,
			HttpSession session
			) throws Exception {			
		
			String ip = InetAddress.getLocalHost().getHostAddress();
						
			int midx=0;
			if (session.getAttribute("midx") != null) {
				midx = Integer.parseInt(session.getAttribute("midx").toString());
			}
		
			BoardVo bv = new BoardVo();
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setWriter(writer);
			bv.setMidx(midx);
			
			int value = bs.boardInsert(bv);			
			
		return "redirect:/board/boardList.do";
	}
	
	@RequestMapping(value="/boardWriteAction2.do")
	public String boardWriteAction2(
	        @RequestParam("subject") String subject,
	        @RequestParam("content") String content,
	        @RequestParam("writer") String writer, 
	        HttpSession session
	        ) throws Exception {    
	        
	    String ip = InetAddress.getLocalHost().getHostAddress();
	                
	    int midx = 0;
	    if (session.getAttribute("midx") != null) {
	        midx = Integer.parseInt(session.getAttribute("midx").toString());
	    }
	    
	    BoardVo bv = new BoardVo();
	    bv.setSubject(subject);
	    bv.setContent(content);
	    bv.setWriter(writer);
	    bv.setMidx(midx);
	    
	    int value = bs.boardInsert2(bv);  // boardInsert2 메서드 호출
	    
	    return "redirect:/board/boardList.do";
	}

	@RequestMapping(value="/boardWriteAction3.do")
	public String boardWriteAction3(
	        @RequestParam("subject") String subject,
	        @RequestParam("content") String content,
	        @RequestParam("writer") String writer,
	        HttpSession session
	        ) throws Exception {    
	        
	    String ip = InetAddress.getLocalHost().getHostAddress();
	                
	    int midx = 0;
	    if (session.getAttribute("midx") != null) {
	        midx = Integer.parseInt(session.getAttribute("midx").toString());
	    }
	    
	    BoardVo bv = new BoardVo();
	    bv.setSubject(subject);
	    bv.setContent(content);
	    bv.setWriter(writer);
	    bv.setMidx(midx);
	    
	    int value = bs.boardInsert3(bv);  // boardInsert3 메서드 호출
	    
	    return "redirect:/board/boardList.do";
	}
 

}


