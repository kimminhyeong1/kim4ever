package com.myezen.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.GatheringVo;
import com.myezen.myapp.domain.Gathering_BoardVO;
import com.myezen.myapp.domain.Gathering_CommentVO;
import com.myezen.myapp.domain.Gathering_DeclarationVO;
import com.myezen.myapp.domain.Gathering_ScheduleVO;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.ScheduleVo;
import com.myezen.myapp.domain.SearchCriteria;
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
		
		request.setAttribute("gidx", gjv.getGidx());
		 
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
//모임상세보기체크
	@RequestMapping(value="/gContentCheck.do")
	public String gContentCheck(
			@RequestParam("giidx") int giidx,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    int midx = (int)Omidx;
	    GatheringVo gmt = gs.gatheringMemberType(giidx,midx);
	    session.setAttribute("MGatheringMemberType", gmt.getGatheringMemberType());//회원타입세션에 담기
		session.setAttribute("giidx", giidx);//giidx세션에 담기
		System.out.println("모임상세보기체크 세션담기");


		return "redirect:/gathering/gContent.do";
	}
//모임상세보기페이지
	@RequestMapping(value="/gContent.do")
	public String gContent(
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
		Object Ogiidx = session.getAttribute("giidx");
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    int midx = (int)Omidx;
	    int giidx = (int)Ogiidx;
	    //사용자가 모임상세페이지를 들어갈수있는지 확인
	    int value = gs.gatheringMemberCheck(giidx,midx);
	    if (value == 1) {
	    	
	    	/*모임상세리스트 가져오기*/
	    	ArrayList<GatheringJoinVo> gjvlist = gs.gatheringOneListSelect(giidx);
	    	md.addAttribute("gjvlist", gjvlist);
	    	
	    	/*모임 멤버들 데이터 가져오기*/
	    	ArrayList<GatheringJoinVo> gjvmlist = gs.gatheringMemberListSelect(giidx);
	    	md.addAttribute("gjvmlist", gjvmlist);
	    	
	    	/*모임일정 데이터 가져오기*/
	    	ArrayList<Gathering_ScheduleVO> gsvlist = gs.gatheringScheduleListSelect(giidx);
	    	md.addAttribute("gsvlist", gsvlist);
	    	
	    	/*공지사항 데이터 가져오기*/
	    	ArrayList<Gathering_BoardVO> gbvlist = gs.gatheringNoticeListSelect(giidx);
	    	md.addAttribute("gbvlist", gbvlist);
	    	
		}
		


		return "gathering/gContent";
	}
//모임상세보기에서 일정 만들기 페이지
	@RequestMapping(value="/gScheduleMake.do")
	public String gScheduleMake() {
		
		return "gathering/gScheduleMake";
	}
	//일정 만들기 페이지에서 일정 만들기 버튼 클릭
		@RequestMapping(value="/gScheduleMakeAction.do", method = RequestMethod.POST)
		public String gScheduleMakeAction(
				@ModelAttribute Gathering_ScheduleVO gsv,
				HttpServletRequest request
				) {
			HttpSession session = request.getSession();
		    Object Omidx = session.getAttribute("midx");
		    Object Ogiidx = session.getAttribute("giidx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/gathering/gList.do";
			}
		    gsv.setMidx((int)Omidx);
		    gsv.setGiidx((int)Ogiidx);
		    System.out.println(gsv.getGiidx()+""+gsv.getMidx());
		    int value = gs.gatheringScheduleMake(gsv);

			return "redirect:/gathering/gContent.do";
		}
//모임상세보기에서 일정 보기 페이지
	@RequestMapping(value="/gScheduleDetails.do")
	public String gScheduleDetails(
			@RequestParam("gsidx") int gsidx,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Ogiidx = session.getAttribute("giidx");
	    int giidx = (int)Ogiidx;
		//일정가져오기 
	    Gathering_ScheduleVO gsv = gs.gatheringScheduleView(gsidx,giidx);
		//일정모델에담기
	    md.addAttribute("gsv", gsv);
		
		
		return "gathering/gScheduleDetails";
	}
	
	
	
	
	//모임 게시판
	@RequestMapping(value="/gBoardList.do")
	public String gBoardList(
			PageMaker pm,
			SearchCriteria scri,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Ogiidx = session.getAttribute("giidx");
	    int giidx=(int)Ogiidx;
	    
	    scri.setPerPageNum(5);//게시물갯수
	    
	    int totalCount = gs.gatheringBoardTotal(giidx,scri); //총 게시물 갯수 꺼내오기
		
	    ArrayList<GatheringJoinVo> gjvblist = gs.gatheringBoardListSelect(giidx,scri);
    	md.addAttribute("gjvblist", gjvblist);
    	
    	pm.setScri(scri);
    	pm.setTotalCount(totalCount);
    	md.addAttribute("pm", pm);
		
		
		
		
		return "gathering/gBoardList";
	}
	//모임 게시판 작성
	@RequestMapping(value="/gBoardWrite.do")
	public String gBoardWrite(
			) {
		
		return "gathering/gBoardWrite";
	}
	//모임 게시판 작성하기 버튼 클릭시
	@RequestMapping(value="/gBoardWriteAction.do")
	public String gBoardWriteAction(
			@ModelAttribute Gathering_BoardVO gbv,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    Object Ogiidx = session.getAttribute("giidx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    gbv.setMidx((int)Omidx);
	    gbv.setGiidx((int)Ogiidx);
	    
		System.out.println(gbv.getgBoardCategory());
		System.out.println(gbv.getgBoardTitle());
		System.out.println(gbv.getgBoardContents());
		
		int value = gs.gatheringBoardWrite(gbv);
		
		
		
		return "redirect:/gathering/gBoardList.do";
	}
	
	
	//모임 게시판 수정
	@RequestMapping(value="/gBoardModify.do")
	public String gBoardModify(
			@RequestParam("gbidx") int gbidx,//게시글 번호
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    int midx =(int)Omidx;
		//게시글 번호에 해당하는 게시물 가져오기
		Gathering_BoardVO gbv = gs.gatheringBoardModify(gbidx,midx);
		//담기 
		md.addAttribute("gbv", gbv);
		return "gathering/gBoardModify";
	}
	//모임 게시판 수정하기 버튼 클릭시
	@RequestMapping(value="/gBoardModifyAction.do")
	public String gBoardModifyAction(
			@ModelAttribute Gathering_BoardVO gbv,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    gbv.setMidx((int)Omidx);
	    //게시글 번호에 해당하는 게시물 업데이트 하기
	    int value = gs.gatheringBoardModifyUpdate(gbv);
		return "redirect:/gathering/gBoardList.do";
	}
	//모임 게시판 삭제
	@RequestMapping(value="/gBoardDelete.do")
	public String gBoardDelete(
			@RequestParam("gbidx") int gbidx,//게시글 번호
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    int midx =(int)Omidx;
	    
	    int value = gs.gatheringBoardDelete(gbidx,midx);
	    
		return "redirect:/gathering/gBoardList.do";
	}
	//모임 게시글 보기
	@RequestMapping(value="/gBoardContent.do")
	public String gBoardContent(
			@RequestParam("gbidx") int gbidx,//게시글 번호
			PageMaker pm,
			SearchCriteria scri,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Ogiidx = session.getAttribute("giidx");
	    int giidx=(int)Ogiidx;
	    
	    //게시물하나가져오기 
	    GatheringJoinVo gjv = gs.gatheringBoardOneSelect(giidx,gbidx);
	    md.addAttribute("gjv", gjv);//게시물 모델에 담기
	    
	    
	    
	    scri.setPerPageNum(5);//게시물갯수 !댓글부분
	    int totalCount = gs.gatheringBoardCommentTotal(gbidx,scri); //총 게시물 갯수 꺼내오기 !댓글부분
	    ArrayList<GatheringJoinVo> gjvclist = gs.gatheringBoardCommentListSelect(gbidx,scri); //!댓글 다 가져오기 
    	md.addAttribute("gjvclist", gjvclist);
    	
    	pm.setScri(scri);
    	pm.setTotalCount(totalCount);
    	md.addAttribute("pm", pm);
    	
    	md.addAttribute("commentTotal", totalCount);//댓글총갯수
	    md.addAttribute("gbidx", gbidx);
    	
		return "gathering/gBoardContent";
	}
	//모임 게시글 ajax로 댓글쓰기
	@RequestMapping(value="/gBoardComment.do")
	@ResponseBody
	public HashMap<String, Object> gBoardComment(
			@ModelAttribute Gathering_CommentVO gcv,
			HttpServletRequest request
			) {
		System.out.println("댓글달기 컨트롤러진입");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    gcv.setMidx((int)Omidx);
		
		//댓글 저장메소드
	    int value = gs.gatheringBoardCommentAdd(gcv);
	    hm.put("value",value); //0은 거짓 1은 참
		return hm;
	}
	
	//모임 게시글 ajax로 댓글삭제
	@RequestMapping(value="/gBoardDeleteComment.do")
	@ResponseBody
	public HashMap<String, Object> gBoardDeleteComment(
			@ModelAttribute Gathering_CommentVO gcv,
			HttpServletRequest request
			) {
		System.out.println("댓글삭제 컨트롤러진입");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    gcv.setMidx((int)Omidx);
		
		//댓글 삭제메소드
	    int value = gs.gatheringBoardCommentDelete(gcv);
	    hm.put("value",value); //0은 거짓 1은 참
		return hm;
	}
	//모임 게시글 ajax로 댓글확인
	@RequestMapping(value="/gBoardModifyComment.do")
	@ResponseBody
	public HashMap<String, Object> gBoardModifyComment(
			@ModelAttribute Gathering_CommentVO gcv,
			HttpServletRequest request
			) {
		System.out.println("댓글수정 확인 컨트롤러진입");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    gcv.setMidx((int)Omidx);
	    
	    //회원검증
	    int value = gs.gatheringBoardCommentMemberCheck(gcv);
		if (value == 1) {
			//댓글 쓴글가져오기메소드
			String gCommentContents = gs.gatheringBoardCommentModify(gcv);
			hm.put("gCommentContents",gCommentContents); //0은 거짓 1은 참
			
		}
	    hm.put("value",value); //0은 거짓 1은 참
		return hm;
	}
	//모임 게시글 ajax로 댓글수정
	@RequestMapping(value="/gBoardUpdateComment.do")
	@ResponseBody
	public HashMap<String, Object> gBoardUpdateComment(
			@ModelAttribute Gathering_CommentVO gcv,
			HttpServletRequest request
			) {
		System.out.println("댓글수정하기 컨트롤러진입");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    gcv.setMidx((int)Omidx);

		//댓글 수정메소드
	    int value = gs.gatheringBoardCommentUpdate(gcv);
	    hm.put("value",value); //0은 거짓 1은 참
		return hm;
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
	public String gSearch(SearchCriteria scri, Model model) {
		scri.setSearchType("GINFONAME"); // 검색 유형 설정
	    ArrayList<GatheringJoinVo> gjvmylist = gs.searchGatherings(scri);
	    model.addAttribute("gjvmylist", gjvmylist);
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
	
//모임 더 보기 멤버 리스트 보기	
	@RequestMapping(value="/gMemberList.do")
	public String gMemberList(HttpServletRequest request,
			Model md) {
		HttpSession session = request.getSession();
		Object Ogiidx = session.getAttribute("giidx");
		Object Omidx = session.getAttribute("midx");
		int giidx = (int)Ogiidx;
		int midx = (int)Omidx;
		
		GatheringVo gmt = gs.gatheringMemberType(giidx,midx);
		ArrayList<GatheringJoinVo> gjvsmlist = gs.gatheringSeeMoreMemberList(giidx);
    	md.addAttribute("gmt", gmt);
    	md.addAttribute("gjvsmlist", gjvsmlist);
    	
		return "gathering/gMemberList";
	}
	
//모임 더 보기 멤버 추방				
		@RequestMapping(value="/gMemberDelete.do")
		public String updateMemberDELYN(
				@RequestParam("midx") int midx, 
				HttpServletRequest request
				){
			HttpSession session = request.getSession();	
			Object Ogiidx = session.getAttribute("giidx");
			int giidx = (int)Ogiidx;
			gs.updateMemberDELYN(giidx, midx);
			return "redirect:/gathering/gMemberList.do"; 
		}	
	
	
	
//모임 더 보기 가입 대기 리스트 보기	
		@RequestMapping(value="/gMemberJoinWaitList.do")
		public String gMemberJoinWaitList() {
			
			return "gathering/gMemberJoinWaitList";
		}


		
		
//모임 권한위임 페이지 보기	
		@RequestMapping(value="/gPowerEntrustList.do")
		public String gPowerEntrustList() {
					
			return "gathering/gPowerEntrustList";
				}			
	
//모임 신고	
	@RequestMapping(value="/gDeclaration.do")
	public String gDeclaration(
			HttpServletRequest request,
			Model md) {
		HttpSession session = request.getSession();
		Object Ogiidx = session.getAttribute("giidx");
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/gathering/gList.do";
		}
	    int midx = (int)Omidx;
	    int giidx = (int)Ogiidx;
	    //사용자가 모임상세페이지를 들어갈수있는지 확인
	    int value = gs.gatheringMemberCheck(giidx,midx);
	    if (value == 1) {
	    	
	    	/*모임상세리스트 가져오기*/
	    	ArrayList<GatheringJoinVo> gjvlist = gs.gatheringOneListSelect(giidx);
	    	md.addAttribute("gjvlist", gjvlist);
	    	md.addAttribute("midx", midx);
	    	md.addAttribute("gidx", gjvlist.get(0).getGidx());
	    	
	    }
		return "gathering/gDeclaration";
	}	
//모임 신고	
	@RequestMapping(value="/gDeclarationAction.do", method=RequestMethod.POST)
	public String gDeclarationAction(HttpServletRequest request,
			 @RequestParam("gatheringReportContent") String gatheringReportContent) {
			System.out.println("신고하기 컨트롤러 들어옴");
		
			HttpSession session = request.getSession();
		    int giidx = (int) session.getAttribute("giidx");
		    int midx = (int)session.getAttribute("midx");
		    
		GatheringJoinVo gjv = new GatheringJoinVo();
	    gjv.setGatheringReportContent(gatheringReportContent);
	    gjv.setGiidx(giidx); 
	    gjv.setMidx(midx);
	    System.out.println("giidx는?"+giidx);
	    System.out.println("midx는?"+midx);
	    // Service의 insertDeclaration 메서드 호출
	    gs.insertDeclaration(gjv);
		System.out.println("gjv는??"+gjv);
		  
		
		return "gathering/gList";
	}	
	
	
//모임나가기
	@RequestMapping(value="/exitGathering.do", method=RequestMethod.POST)
	 public @ResponseBody boolean exitGathering(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	    int giidx = (int) session.getAttribute("giidx");
	    int midx = (int)session.getAttribute("midx");
	    System.out.println("giidx는?"+giidx);
	    System.out.println("midx는?"+midx);
	    
	    GatheringVo gmt = gs.gatheringMemberType(giidx,midx);
	    session.setAttribute("midx", midx);
	    session.setAttribute("giidx", giidx);
	  
		System.out.println("컨트롤러 들어옴 exit");

		boolean success = gs.exitGathering(midx, giidx);
		return success;
	}
}
