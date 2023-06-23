package com.myezen.myapp.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.myezen.myapp.util.MediaUtils;
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
	
	// 게시글수정 
	@RequestMapping(value="/boardModifyAction.do")
	public String boardModifyAction(
			@RequestParam("bidx") int bidxInt,
			  @RequestParam("subject") String subject,
		        @RequestParam("content") String content,
		        @RequestParam("writer") String writer,
				@RequestParam("filename") MultipartFile filename,

		        HttpSession session
		        ) throws Exception {    	   
		MultipartFile file = filename;
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
			bv.setBidx(bidxInt);
		    bv.setSubject(subject);
		    bv.setContent(content);
		    bv.setWriter(writer);
		    bv.setMidx(midx);
			bv.setFilename(uploadedFileName);

		    
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


	
	@RequestMapping(value="/boardReply.do", method=RequestMethod.GET)
	public String boardReply(
	        @RequestParam("bidx") int bidx,
			@RequestParam("depth") int depth,
			@RequestParam("level_") int level_,
	        HttpSession session,
	        Model model
	) {
	    // rebidx에 bidx값을 세션에 저장 
	    session.setAttribute("bidx", bidx);
	    session.setAttribute("rebidx", bidx);

	    BoardVo bv = new BoardVo();
	    bv.setBidx(bidx);
	    bv.setRebidx(bidx);
		bv.setDepth(depth);
		bv.setLevel_(level_);
	    int rebidx = (int) session.getAttribute("rebidx");
	    System.out.println("rebidx: " + rebidx);
	    System.out.println("depth: " + depth);
	    System.out.println("level: " + level_);

	    
	    model.addAttribute("bv", bv);
	    return "board/boardReply";
	}



	@RequestMapping(value="/boardReplyAction.do", method=RequestMethod.POST)
	public String boardReplyAction(
	        @RequestParam("bidx") int bidx,
	        @RequestParam("depth") int depth,
	        @RequestParam("level_") int level_,
	        @RequestParam("subject") String subject,
	        @RequestParam("content") String content,
	        @RequestParam("writer") String writer,
			@RequestParam("filename") MultipartFile filename,


	        Model model,
	        HttpSession session
	) throws Exception {
	   

	    // 세션에서 rebidx 가져옴
	    int rebidx = 0;
	    if (session.getAttribute("rebidx") != null) {
	        rebidx = Integer.parseInt(session.getAttribute("rebidx").toString());
	    }
		MultipartFile file = filename;
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
	    bv.setDepth(depth);
	    bv.setLevel_(level_);
	    bv.setSubject(subject);
	    bv.setContent(content);
	    bv.setWriter(writer);
	    bv.setMidx(midx);
	    bv.setRebidx(rebidx);
		bv.setFilename(uploadedFileName);
	    int value = bs.boardReply(bv);

	    return "redirect:/board/boardList.do";
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
	
	
	
	//게시글쓰기 1.공지 2.qna 3.faq 
	@RequestMapping(value="/boardWriteAction.do")
	public String boardWriteAction(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam("writer") String writer,
			@RequestParam("filename") MultipartFile filename,
			HttpSession session
			) throws Exception {
		MultipartFile file = filename;
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
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setWriter(writer);
			bv.setMidx(midx);
			bv.setFilename(uploadedFileName);

			
			int value = bs.boardInsert(bv);			
			
		return "redirect:/board/boardList.do";
	}
	
	@RequestMapping(value="/boardWriteAction2.do")
	public String boardWriteAction2(
	        @RequestParam("subject") String subject,
	        @RequestParam("content") String content,
	        @RequestParam("writer") String writer, 
			@RequestParam("filename") MultipartFile filename,
	        HttpSession session
	        ) throws Exception {    
	        
			MultipartFile file = filename;
			System.out.println("파일업로드"+file.getOriginalFilename());
		
			String uploadedFileName="";
			if (!file.getOriginalFilename().equals("")) {
				uploadedFileName = UploadFileUtiles.uploadFile(
						uploadPath, 
						file.getOriginalFilename(), 
						file.getBytes());	
			}
			System.out.println("uploadedFileName"+uploadedFileName);
			
	    int midx = 0;
	    if (session.getAttribute("midx") != null) {
	        midx = Integer.parseInt(session.getAttribute("midx").toString());
	    }
	    
	    BoardVo bv = new BoardVo();
	    bv.setSubject(subject);
	    bv.setContent(content);
	    bv.setWriter(writer);
	    bv.setMidx(midx);
		bv.setFilename(uploadedFileName);

	    
	    int value = bs.boardInsert2(bv);  // boardInsert2 메서드 호출
	    
	    return "redirect:/board/boardList.do";
	}

	@RequestMapping(value="/boardWriteAction3.do")
	public String boardWriteAction3(
	        @RequestParam("subject") String subject,
	        @RequestParam("content") String content,
	        @RequestParam("writer") String writer,
	        @RequestParam("filename") MultipartFile filename,
	        HttpSession session
	        ) throws Exception {    
	        
			MultipartFile file = filename;
			System.out.println("파일업로드"+file.getOriginalFilename());
		
			String uploadedFileName="";
			if (!file.getOriginalFilename().equals("")) {
				uploadedFileName = UploadFileUtiles.uploadFile(
						uploadPath, 
						file.getOriginalFilename(), 
						file.getBytes());	
			}
			System.out.println("uploadedFileName"+uploadedFileName);			
	                
	    int midx = 0;
	    if (session.getAttribute("midx") != null) {
	        midx = Integer.parseInt(session.getAttribute("midx").toString());
	    }
	    
	    BoardVo bv = new BoardVo();
	    bv.setSubject(subject);
	    bv.setContent(content);
	    bv.setWriter(writer);
	    bv.setMidx(midx);
		bv.setFilename(uploadedFileName);

	    
	    int value = bs.boardInsert3(bv);  // boardInsert3 메서드 호출
	    
	    return "redirect:/board/boardList.do";
	}
 
	
//파일업로드
	@ResponseBody
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName,@RequestParam(value="down",defaultValue="0" ) int down ) throws Exception{
		
	System.out.println("file이름:"+fileName);
		
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
		
	//	logger.info("FILE NAME :"+fileName);
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+fileName);
			
			
			if(mType != null){
				
				if (down==1) {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
					
				}else {
					headers.setContentType(mType);	
				}
				
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	} 
	

	
}


