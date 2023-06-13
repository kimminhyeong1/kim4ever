package com.myezen.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String gList(
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object omidx = session.getAttribute("midx");
	    if (omidx != null) {
	    int midx = (int)omidx;
	    	ArrayList<GatheringJoinVo> gjvmylist = gs.gatheringMyListSelect(midx);
	    	md.addAttribute("gjvmylist", gjvmylist);
			
		}
	    ArrayList<GatheringJoinVo> gjvlist = gs.gatheringListSelect();
	    md.addAttribute("gjvlist", gjvlist);
		

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
			@RequestParam("GImg") ArrayList<MultipartFile> GImg,
			HttpServletRequest request
			) throws IOException, Exception {
		HttpSession session = request.getSession();
	    int midx = (int) session.getAttribute("midx");
	    gjv.setMidx(midx);
	    System.out.println(gjv.getgInfoJoinType());
	   
	    
	    
		int value = gs.gatheringCreate(gjv,GTImg,GImg);
		
		return "redirect:/gathering/gList.do";
	}
//모임간단소개페이지
	@RequestMapping(value="/gSimpleInfo.do")
	public String gSimpleInfo(
			@RequestParam("giidx") int giidx,
			Model md
			) {
		
		ArrayList<GatheringJoinVo> gjvlist = gs.gatheringOneSimpleListSelect(giidx);
		md.addAttribute("gjvlist", gjvlist);
		md.addAttribute("giidx", giidx);

		return "gathering/gSimpleInfo";
	}
	//모임간단소개페이지에서 모임 가입하기
		@RequestMapping(value="/gSimpleInfoAction.do")
		public String gSimpleInfoAction(
				@RequestParam("giidx") int giidx,
				HttpServletRequest request
				) {
			HttpSession session = request.getSession();
		    Object omidx = session.getAttribute("midx");
		    if (omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/gathering/gList.do";
			}
		    int midx = (int)omidx;
		    
		    //모임가입하기
		    int value = gs.gatheringJoin(giidx,midx);

			return "redirect:/gathering/gList.do";
		}
//모임상세보기페이지
	@RequestMapping(value="/gContent.do")
	public String gContent(
			@RequestParam("giidx") int giidx,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object omidx = session.getAttribute("midx");
	    if (omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    int midx = (int)omidx;
	    //사용자가 모임상세페이지를 들어갈수있는지 확인
	    int value = gs.gatheringMemberCheck(giidx,midx);
	    if (value == 1) {
	    	//모임상세리스트 가져오기
	    	ArrayList<GatheringJoinVo> gjvlist = gs.gatheringOneListSelect(giidx);
	    	md.addAttribute("gjvlist", gjvlist);
	    	//모임 멤버들 데이터 가져오기 
	    	
	    	//모임일정 데이터 가져오기
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
	    	
	    	//공지사항 데이터 가져오기
			
		}
		


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
	public String gMyPage(
		HttpServletRequest request,
		Model md
		) {
	HttpSession session = request.getSession();
    Object omidx = session.getAttribute("midx");
    if (omidx != null) {
    	int midx = (int)omidx;
    	ArrayList<GatheringJoinVo> gjvmylist = gs.gatheringMyListSelect(midx);
    	md.addAttribute("gjvmylist", gjvmylist);
		
	}

		return "gathering/gMyPage";
	}
//찜한 모임 정보
	@RequestMapping(value="/gMyWish.do")
	public String gMyWish(
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object omidx = session.getAttribute("midx");
	    if (omidx != null) {
	    	int midx = (int)omidx;
	    	
	    	ArrayList<GatheringJoinVo> gjvmywishlist = gs.gatheringMyWishListSelect(midx);
	    	md.addAttribute("gjvmywishlist", gjvmywishlist);
	    
	    }
		
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
//찜하기
	@ResponseBody
	@RequestMapping(value="/Wish.do")
	public HashMap<String, Object> Wish(@RequestParam("giidx") int giidx,@RequestParam("midx") int midx ) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("찜체크");
		//찜이 되어있는지 확인하기
		
		//찜하기
		int value = gs.gatheringWish(giidx,midx);
		//찜삭제하기
		
		hm.put("value",value);//0은 거짓 1은 참
		return hm;
	}
//찜삭제
	@ResponseBody
	@RequestMapping(value="/WishDel.do")
	public HashMap<String, Object> WishDel(@RequestParam("giidx") int giidx,@RequestParam("midx") int midx ) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("찜체크");
		//찜이 되어있는지 확인하기
		
		//찜하기
		int value = gs.gatheringWishDel(giidx,midx);
		//찜삭제하기
		
		hm.put("value",value);//0은 거짓 1은 참
		return hm;
	}
}
