package com.myezen.myapp.controller;

import java.net.InetAddress;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.BoardService;
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
	public String boardList() {
		
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardNoticeContent.do")
	public String boardContents() {
		
		
		
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
	


	@RequestMapping(value="/boardNoticeWriteAction.do")
	public String boardNoticeWriteAction(
			@RequestParam("writer") String writer,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam(value = "fileupload", required = false) MultipartFile fileupload,
			HttpSession session
			) throws Exception {	
		
			MultipartFile file = fileupload;
			System.out.println("파일업로드"+file.getOriginalFilename());
		
			String uploadedFileName="";
			if (!file.getOriginalFilename().equals("")) {
				uploadedFileName = UploadFileUtiles.uploadFile(
						uploadPath, 
						file.getOriginalFilename(), 
						file.getBytes());				
			}
			System.out.println("uploadedFileName"+uploadedFileName);
									
			int midx=0;
			if (session.getAttribute("midx") != null) {
				midx = Integer.parseInt(session.getAttribute("midx").toString());
			}
		
			BoardVo bv = new BoardVo();
			bv.setWriter(writer);
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setFileupload(uploadedFileName);
			
			int value = bs.boardInsert(bv);			
			
		return "redirect:/board/boardList.do";
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
