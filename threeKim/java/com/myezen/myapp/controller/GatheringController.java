package com.myezen.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.ScheduleVo;
import com.myezen.myapp.service.GatheringService;

@Controller
@RequestMapping(value="/gathering")
public class GatheringController {
	
	@Autowired
	GatheringService gs; //업캐스팅 부모만 지정
	
	
	
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
	@RequestMapping(value="/gCreateAction.do")
	public String gCreateAction(
			@ModelAttribute GatheringJoinVo gjv,
			@RequestParam("GTImg") MultipartFile GTImg,
			@RequestParam("GImg") List<MultipartFile> GImg
			) throws IOException, Exception {
		int value = gs.gatheringCreate(gjv,GTImg,GImg);
		
		return "gathering/gList";
	}
//모임간단소개페이지
	@RequestMapping(value="/gSimpleInfo.do")
	public String gSimpleInfo() {
		
		return "gathering/gSimpleInfo";
	}
//모임상세보기페이지
	@RequestMapping(value="/gContent.do")
	public String gContent(
			Model md
			) {
		//ArrayListList<Event> events = calendarService.getAllEvents(); //일정 가져오기
		//md.addAttribute("events", events);
		ScheduleVo event = new ScheduleVo();
		event.setTitle("제목");
		event.setStart("2023-06-01T10:00:00");
		event.setEnd("2023-06-02T12:00:00");
		
		ArrayList<ScheduleVo> events = new ArrayList<ScheduleVo>();
		events.add(event);
		System.out.println(events.get(0));
		


		md.addAttribute("events", events);
		return "gathering/gContent";
	}
//모임상세보기에서 일정 만들기 페이지
	@RequestMapping(value="/gScheduleMake.do")
	public String gScheduleMake() {
		
		return "gathering/gScheduleMake";
	}
	//일정 만들기 페이지에서 일정 만들기 버튼 클릭
		@RequestMapping(value="/gScheduleMakeAction.do")
		public String gScheduleMakeAction(
				@RequestParam("title") String title, @RequestParam("start") String start, @RequestParam("end") String end
				) {
			//calendarService.createEvent(title, start, end);
			
			return "gathering/gContent";
		}
//모임상세보기에서 일정 보기 페이지
	@RequestMapping(value="/gScheduleDetails.do")
	public String gScheduleDetails() {
		
		return "gathering/gScheduleDetails";
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
