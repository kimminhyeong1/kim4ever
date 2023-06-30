package com.myezen.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.GatheringVo;
import com.myezen.myapp.domain.Gathering_BoardVO;
import com.myezen.myapp.domain.Gathering_CommentVO;
import com.myezen.myapp.domain.Gathering_DeclarationVO;
import com.myezen.myapp.domain.Gathering_PhotoAlbumVO;
import com.myezen.myapp.domain.Gathering_ScheduleVO;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.ScheduleVo;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.GatheringService;
import com.myezen.myapp.util.IPUtil;
import com.myezen.myapp.util.UploadFileUtiles;

@Controller
@RequestMapping(value="/gathering")
public class GatheringController {
	
	@Autowired
	GatheringService gs; //업캐스팅 부모만 지정
	@Autowired(required=false)	
	PageMaker pm;
	
	
//모임메인페이지
	@RequestMapping(value="/gList.do")
	public String gList(
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object omidx = session.getAttribute("midx");
	    Integer midx =null;
	    if (omidx != null) {
	    	midx = (Integer)omidx;
		}else {
			midx = (Integer)omidx;			
		}
	    ArrayList<GatheringJoinVo> gjvlist = gs.gatheringListSelect(midx);
	    md.addAttribute("gjvlist", gjvlist);
		

		return "gathering/gList";
	}
//모임 추천리스트 더보기 
    @RequestMapping("/more.do")
    @ResponseBody
    public ArrayList<GatheringJoinVo> getMoreGjvList(
    		@RequestParam("offset") int offset,
    		@RequestParam("URI") String URI,
    		SearchCriteria scri,
    		HttpServletRequest request
    		) {
		System.out.println("더보기"+URI);
		ArrayList<GatheringJoinVo> moreGjvList = gs.getMoreGjvList(offset,request,URI,scri);
		return moreGjvList;
		
		
		
    }
 // 이전 데이터를 제외한 새로운 데이터 가져오기
    @PostMapping("/getNewData.do")
    @ResponseBody
    public ArrayList<GatheringJoinVo> getNewData(
    		@RequestParam("excludedData") ArrayList<Integer> excludedData,
    		@RequestParam("offset") int offset,
    		HttpServletRequest request
    		) {
    	System.out.println("랜덤값 더보기");
        return gs.getNewData(excludedData,offset,request); 
    }
//모임만들기페이지	
	@RequestMapping(value="/gCreate.do")
	public String gCreate(
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
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
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    gjv.setMidx((int)Omidx);
	   
	    System.out.println(gjv.getgInfoJoinType());
	    
		int value = gs.gatheringCreate(gjv,GTImg,GImg,request);
		 
		return "redirect:/gathering/gList.do";
	}
//모임수정하기페이지	
	@RequestMapping(value="/gModify.do")
	public String gModify(
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
		Object Ogiidx = session.getAttribute("giidx");
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int giidx = (int)Ogiidx;
		//모임수정리스트가져오기 
		ArrayList<GatheringJoinVo> gjvlist = gs.gatheringModifyList(giidx);
		md.addAttribute("gjvlist", gjvlist);
		return "gathering/gModify";
	}
	@RequestMapping(value="/gModifyAction.do")
	public String gModifyAction(
			@ModelAttribute GatheringJoinVo gjv,
			@RequestParam("GTImg") MultipartFile GTImg,//업데이트
			@RequestParam("GImgU") ArrayList<MultipartFile> GImgU,//업데이트
			@RequestParam("GImgI") ArrayList<MultipartFile> GImgI,//인설트
			HttpServletRequest request
			) throws IOException, Exception {
		HttpSession session = request.getSession();
		Object Ogiidx = session.getAttribute("giidx");
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    gjv.setGiidx((int)Ogiidx);
	   
	    System.out.println(gjv.getgInfoJoinType());
	    
		int value = gs.gatheringModify(gjv,GTImg,GImgU,GImgI,request); //업데이트 메소드로 바꾸기
		
		 
		return "redirect:/gathering/gList.do";
	}	
//모임명 중복체크
	@ResponseBody
	@RequestMapping(value = "/gInfoNameCheck.do")
	public HashMap<String, Object> gInfoNameCheck(@RequestParam("gInfoName") String gInfoName) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("이름체크"+gInfoName);
		int value = gs.gInfoNameCheck(gInfoName);
		System.out.println(value);
		hm.put("value",value);//0은 거짓 1은 참
		return hm; 
	}
	
//모임간단소개페이지
	@RequestMapping(value="/gSimpleInfo.do")
	public String gSimpleInfo(
			@RequestParam("giidx") int giidx,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object omidx = session.getAttribute("midx");
	    if (omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)omidx;
	    String gatheringApprovalType = gs.gatheringOneSimpleListCheck(giidx,midx); // 사용자의 모임 승인 값 
		ArrayList<GatheringJoinVo> gjvlist = gs.gatheringOneSimpleListSelect(giidx);
		md.addAttribute("gatheringApprovalType", gatheringApprovalType);
		md.addAttribute("gjvlist", gjvlist);
		md.addAttribute("giidx", giidx);

		return "gathering/gSimpleInfo";
	}
	//모임간단소개페이지에서 모임 가입하기
	@RequestMapping(value="/gSimpleInfoAction.do")
	public ResponseEntity<String> gSimpleInfoAction(
	        @RequestParam("giidx") int giidx,
	        HttpServletRequest request,
	        Model md
	) {
	    HttpSession session = request.getSession();
	    Object omidx = session.getAttribute("midx");
	    if (omidx == null) {
	        return ResponseEntity.ok("redirect:/member/memberLogin.do");
	    }
	    int midx = (int) omidx;
	    
	    int capacityCheck = gs.gatheringJoinCheck(giidx);
	    if (capacityCheck == 0) {
	        return ResponseEntity.ok("redirect:/gathering/gList.do");
	    } else {
	        int value = gs.gatheringJoin(giidx, midx);
	        if (value > 0) {
	            return ResponseEntity.ok("success");
	        } else {
	            return ResponseEntity.ok("error");
	        }
	    }
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
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;
	    GatheringVo gmt = gs.gatheringMemberType(giidx,midx);
	    session.setAttribute("MGatheringMemberType", gmt.getGatheringMemberType());//회원타입세션에 담기
		session.setAttribute("giidx", giidx);//giidx세션에 담기
		System.out.println("모임상세보기체크 세션담기");
		
		 if ("관리자".equals(gmt.getGatheringMemberType())) {
		        return "redirect:/gathering/adminGContent.do?giidx=" + giidx;
		    }

		    return "redirect:/gathering/gContent.do?giidx=" + giidx;
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
	    	return "redirect:/member/memberLogin.do";
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
	    	
	    	/*승인대기중인사람 가져오기 */
	    	String WaitCNT = gs.gatheringMemberWaitCNT(giidx);
	    	md.addAttribute("WaitCNT", WaitCNT);
	    	
	    	/*모임일정 데이터 가져오기*/
	    	ArrayList<Gathering_ScheduleVO> gsvlist = gs.gatheringScheduleListSelect(giidx);
	    	md.addAttribute("gsvlist", gsvlist);
	    	
	    	/*공지사항 데이터 가져오기*/
	    	ArrayList<Gathering_BoardVO> gbvlist = gs.gatheringNoticeListSelect(giidx);
	    	md.addAttribute("gbvlist", gbvlist);
	    	
		}else {
			return "redirect:/gathering/gList.do";
		}

		return "gathering/gContent";
	}
	
	
	
//모임상세보기에서 일정 만들기 페이지
	@RequestMapping(value="/gScheduleMake.do")
	public String gScheduleMake(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}

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
		    	return "redirect:/member/memberLogin.do";
			}
		    gsv.setMidx((int)Omidx);
		    gsv.setGiidx((int)Ogiidx);
		    System.out.println(gsv.getGiidx()+""+gsv.getMidx());
		    int value = gs.gatheringScheduleMake(gsv);

			return "redirect:/gathering/gContent.do";
		}
		//모임상세보기에서 일정 보기 페이지 에서 일정 삭제하기 버튼 클릭
		@RequestMapping(value="/gScheduleDel.do")
		public String gScheduleDel(
				@RequestParam("gsidx") int gsidx,
				HttpServletRequest request
				) {
			HttpSession session = request.getSession();
		    Object Omidx = session.getAttribute("midx");
		    Object Ogiidx = session.getAttribute("giidx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int giidx =(int)Ogiidx;
		    int value = gs.gatheringScheduleDel(giidx,gsidx);

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
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;
	    int giidx = (int)Ogiidx;
		//일정가져오기 
	    Gathering_ScheduleVO gsv = gs.gatheringScheduleView(gsidx,giidx);
		//일정모델에담기
	    md.addAttribute("gsv", gsv);
	    
	    //모임참여이력이있으면 gsjidx가져오기 
	    String gsjidx = gs.gatheringScheduleViewCheck(gsidx,midx);
	    md.addAttribute("gsjidx", gsjidx);
	    
	    //참여인원 가지고오기
	    String joinCNT = gs.gatheringScheduleViewJoinCNT(gsidx);
	    md.addAttribute("joinCNT", joinCNT);
		
		return "gathering/gScheduleDetails";
	}
	//모임상세보기에서 일정 수정하기 페이지
		@RequestMapping(value="/gScheduleModify.do")
		public String gScheduleModify(
				@RequestParam("gsidx") int gsidx,
				HttpServletRequest request,
				Model md
				) {
			HttpSession session = request.getSession();
		    Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int midx = (int)Omidx;
		    int giidx = (int)Ogiidx;
			//일정가져오기 
		    Gathering_ScheduleVO gsv = gs.gatheringScheduleView(gsidx,giidx);
			//일정모델에담기
		    md.addAttribute("gsv", gsv);
		    
		    //모임참여이력이있으면 gsjidx가져오기 
		    String gsjidx = gs.gatheringScheduleViewCheck(gsidx,midx);
		    md.addAttribute("gsjidx", gsjidx);
		    
		    //참여인원 가지고오기
		    String joinCNT = gs.gatheringScheduleViewJoinCNT(gsidx);
		    md.addAttribute("joinCNT", joinCNT);
			
			return "gathering/gScheduleModify";
		}
		//일정 만들기 페이지에서 일정 수정하기 버튼 클릭
		@RequestMapping(value="/gScheduleModifyAction.do", method = RequestMethod.POST)
		public String gScheduleModifyAction(
				@ModelAttribute Gathering_ScheduleVO gsv,
				HttpServletRequest request
				) {
			HttpSession session = request.getSession();
		    Object Omidx = session.getAttribute("midx");
		    Object Ogiidx = session.getAttribute("giidx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    gsv.setMidx((int)Omidx);
		    gsv.setGiidx((int)Ogiidx);
		    System.out.println(gsv.getGiidx()+""+gsv.getMidx());
		    int value = gs.gatheringScheduleModify(gsv);

			return "redirect:/gathering/gContent.do";
		}
		
		
		
		
//모임상세보기에서 일정 참여하기
	@RequestMapping(value="/gScheduleJoin.do")
	public String gScheduleJoin(
			@RequestParam("gsidx") int gsidx,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    Object Ogiidx = session.getAttribute("giidx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;
	    int giidx = (int)Ogiidx;

	    int value = gs.gatheringScheduleJoin(gsidx,midx,giidx);
	    if (value == 1) {
	    	md.addAttribute("gsidx", gsidx);
	    	return "redirect:/gathering/gScheduleDetails.do";
		}
		return "redirect:/gathering/gContent.do";
	}
//모임상세보기에서 일정 참여취소하기
	@RequestMapping(value="/gScheduleJoinExit.do")
	public String gScheduleJoinExit(
			@RequestParam("gsidx") int gsidx,
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;

	    int value = gs.gatheringScheduleJoinExit(gsidx,midx);
	    if (value == 1) {
	    	md.addAttribute("gsidx", gsidx);
	    	return "redirect:/gathering/gScheduleDetails.do";
		}
		return "redirect:/gathering/gContent.do";
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
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int giidx = (int)Ogiidx;
	    System.out.println("보드리스트진입");
	    scri.setPerPageNum(10);//게시물갯수
	    
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
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}

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
	    	return "redirect:/member/memberLogin.do";
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
	    	return "redirect:/member/memberLogin.do";
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
	    	return "redirect:/member/memberLogin.do";
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
	    	return"redirect:/member/memberLogin.do";
		}
	    int midx =(int)Omidx;
	    
	    int value = gs.gatheringBoardDelete(gbidx,midx);
	    
		return "redirect:/gathering/gBoardList.do";
	}
	//모임 게시글 보기
	@RequestMapping(value="/gBoard/{gbidx}/Content.do")
	public String gBoardContent(
			@PathVariable("gbidx") int gbidx,//게시글 번호
			PageMaker pm,
			SearchCriteria scri,
			HttpServletRequest request,
			HttpServletResponse response,
			Model md
			) {
		HttpSession session = request.getSession();
		Object Ogiidx = session.getAttribute("giidx");
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;
	    int giidx = (int)Ogiidx;
	    // 게시물 조회 전 쿠키 확인
	    String cookieName = "viewedPosts"+ gbidx;
	    Cookie[] cookies = request.getCookies();
	    //조회수 증가부분
        System.out.println(cookies);
        
        
        if (!gs.isDuplicated(cookies,cookieName, midx)) {
            // 중복된 사용자가 아닌 경우 조회수를 증가시킴
            gs.increaseViewCount(gbidx);
            // 중복 조회 방지를 위해 쿠키를 생성하고 응답에 추가
            Cookie viewedPostsCookie = new Cookie(cookieName, String.valueOf(midx));
            viewedPostsCookie.setMaxAge(1 * 60 * 60); // 쿠키의 유효 기간 설정 (예: 24시간)
            viewedPostsCookie.setPath("/"); // 쿠키의 경로 설정
            response.addCookie(viewedPostsCookie);
        }
	    
	    
	    
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
	//모임 게시글 ajax로 답글달기
	@RequestMapping(value="/gBoardReplyComment.do")
	@ResponseBody
	public HashMap<String, Object> gBoardReplyComment(
			@ModelAttribute Gathering_CommentVO gcv,
			HttpServletRequest request
			) {
		System.out.println("답글달기하기 컨트롤러진입");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    gcv.setMidx((int)Omidx);

		//답글 달기 메소드
	    int value = gs.gatheringBoardReplyComment(gcv);
	    hm.put("value",value); //0은 거짓 1은 참
		return hm;
	}
	//모임 게시글 ajax로 좋아요 누르기
	@RequestMapping(value="/gBoardLike.do")
	@ResponseBody
	public HashMap<String, Object> gBoardLike(
			@ModelAttribute Gathering_BoardVO gbv,
			HttpServletRequest request
			) {
		System.out.println("좋아요 컨트롤러진입");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    gbv.setMidx((int)Omidx);
	    System.out.println(gbv.getGbidx());

		//좋아요 메소드
	    int value = gs.gatheringBoardLike(gbv);
	    hm.put("value",value); //0은 거짓 1은 참
		return hm;
	}
	
		//모임 사진첩
		@RequestMapping(value="/gPhotoAlbumList.do")
		public String gPhotoAlbumList(
				SearchCriteria scri,
				HttpServletRequest request,
				Model md) {
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			int giidx = (int) session.getAttribute("giidx");
			System.out.println("컨트롤러 giidx는?"+giidx);
			scri.setPerPageNum(12);//게시물갯수
			
			//게시글 총갯수
			int totalCount = gs.gatheringPhotoAlbumListSelectAll(scri,giidx); //총 게시물 갯수 꺼내오기
			  
			ArrayList<HashMap<String, Object>> gPhotoList = gs.gatheringPhotoAlbumListSelect(scri,giidx);
			
			pm.setScri(scri);
	    	pm.setTotalCount(totalCount);
	    	
	    	md.addAttribute("pm", pm);
	    	md.addAttribute("gPhotoList", gPhotoList);
	    	md.addAttribute("giidx", giidx);
	    	
			return "gathering/gPhotoAlbumList";
		}
	
	
	
		//모임 사진첩내용
		@RequestMapping(value="/gPhotoAlbumContent.do")
		public String gPhotoAlbumContent(
				HttpServletRequest request,
				Model md) {
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			int giidx = (int) session.getAttribute("giidx");
			int gpaidx = Integer.parseInt(request.getParameter("gpaidx"));
			
			/*모임상세리스트 가져오기*/
			ArrayList<GatheringJoinVo> gjvList = gs.gatheringPhotoAlbumListSelectOne(gpaidx);

			//gatheringMemberType 값 가져오기
	        GatheringVo gjv = gs.gatheringMemberType(giidx, midx);
	        String gatheringMemberType = gjv.getGatheringMemberType();
	     
			System.out.println("gatheringMemberType는???!!"+ gatheringMemberType);
			
		    md.addAttribute("gjvList", gjvList);
		    md.addAttribute("gatheringMemberType", gatheringMemberType);
		    
		    session.setAttribute("gpaidx", gpaidx);
			return "gathering/gPhotoAlbumContent";
		}
		
		
		//사진첩 상세보기 좋아요
		@RequestMapping(value="/gPhotoAlbumLike.do",method=RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object> gPhotoAlbumLike(
				@ModelAttribute GatheringJoinVo gjv,
				HttpServletRequest request
				) {
			System.out.println("사진첩 좋아요  컨트롤러진입");
			HashMap<String, Object> hm = new HashMap<String, Object>();
			HttpSession session = request.getSession();
		    Object Omidx = session.getAttribute("midx");
		    gjv.setMidx((int)Omidx);
		   

			//좋아요 메소드
		    int value = gs.gatheringPhotoAlbumLike(gjv);
		    hm.put("value",value); //0은 거짓 1은 참
			return hm;
		}

		
		//모임 사진첩작성
		@RequestMapping(value="/gPhotoAlbumWriteCheck.do")
		public String gPhotoAlbumWriteCheck(
				 RedirectAttributes redirectAttributes,
				 HttpServletRequest request,
				 Model md) {
			
			System.out.println("check 컨트롤러 들어옴");
			HttpSession session = request.getSession();
		    int midx = (int) session.getAttribute("midx");
		    int giidx = (int) session.getAttribute("giidx");
		    
		    System.out.println("midx는?"+midx);
		    System.out.println("giidx는?"+giidx);
		    GatheringVo gmt = gs.gatheringMemberType(giidx, midx); 
		    String gatheringMemberType = gmt.getGatheringMemberType();
		    System.out.println("멤버타입은?"+gmt.getGatheringMemberType());
		    
		    if (gatheringMemberType.equals("TM")) {
		    	redirectAttributes.addFlashAttribute("alertMessage", "모임장 또는 부모임장만 사진첩을 작성할 수 있습니다.");
		    	return "redirect:/gathering/gPhotoAlbumList.do";
		    } else {
		    	return "redirect:/gathering/gPhotoAlbumWrite.do";
		    }
		}
		
		
		//모임 사진첩작성 페이지 들어가기
		@RequestMapping(value="/gPhotoAlbumWrite.do")
		public String gPhotoAlbumWrite() {
			
			return "gathering/gPhotoAlbumWrite";
		}
		
		//모임 사진첩작성 수행
		@RequestMapping(value="/gPhotoAlbumWriteAction.do", method=RequestMethod.POST)
		public String gPhotoAlbumWriteAction(
		        @ModelAttribute GatheringJoinVo gjv,
		        @RequestParam("GATImg") MultipartFile GATImg,
		        @RequestParam("GAImg") ArrayList<MultipartFile> GAImg,
		       
		        Model md,
		        HttpServletRequest request
		) throws IOException, Exception {

		    HttpSession session = request.getSession();
		    int midx = (int) session.getAttribute("midx");
		    int giidx = (int) session.getAttribute("giidx");

		    gjv.setMidx(midx);
		    gjv.setGiidx(giidx);
		    
		    int value = gs.gatheringPhotoAlbumWrite(gjv, GATImg, GAImg,request);

		    System.out.println("midx는? " + midx);
		    System.out.println("giidx는? " + giidx);
		    System.out.println(gjv.getgPhotoAlbumTitle());
		   
		    

		    return "redirect:/gathering/gPhotoAlbumList.do";
		}
				
					
			
		//모임 사진첩수정 페이지 들어가기
		@RequestMapping(value="/gPhotoAlbumModifiy.do")
		public String gPhotoAlbumModifiy(
				HttpServletRequest request,
				Model md) {
			
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			int giidx = (int) session.getAttribute("giidx");
			int gpaidx = Integer.parseInt(request.getParameter("gpaidx"));
			System.out.println("gpaidx"+gpaidx);
			ArrayList<GatheringJoinVo> gmist = gs.gatheringPhotoAlbumModify(gpaidx);
			md.addAttribute("gmist", gmist);
				
			return "gathering/gPhotoAlbumModifiy";
		}
	
		//모임 사진첩 수정 업데이트
		@RequestMapping(value="/gPhotoAlbumModifyAction.do", method=RequestMethod.POST)
		public String gPhotoAlbumModifiyAction(
				@ModelAttribute GatheringJoinVo gjv,
				@RequestParam("GATImg") MultipartFile GATImg,
				@RequestParam("GAImg") ArrayList<MultipartFile> GAImg,
				Model md,
				@RequestParam("gpaidx") int gpaidx,
				HttpServletRequest request
				)throws IOException, Exception {
			HttpSession session = request.getSession();
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    gjv.setMidx((int)Omidx);
		    
		    System.out.println("수정이미지파일"+GAImg);
		  
		    int value = gs.gatheringPhotoAlbumModifyUpdate(gjv, GATImg, GAImg,request);
		    
		    if (value > 0) {
		        return "redirect:/gathering/gPhotoAlbumList.do";
		    } else {
		        // 수정 실패 처리
		        return "errorPage";
		    }	
		}
	
		//모임 사진첩삭제
		@RequestMapping(value="/gPhotoAlbumDelete.do",method=RequestMethod.POST)
		public String gPhotoAlbumDelete(
				HttpServletRequest request,
				Model md
				) {		
				HttpSession session = request.getSession();
			    int giidx = (int) session.getAttribute("giidx");
			    int midx = (int)session.getAttribute("midx");
			    int gpaidx = (int)session.getAttribute("gpaidx");
				
				gs.deletePhotoAlbum(midx,gpaidx);
				
			return "gathering/gPhotoAlbumList";
		}	
	
	
	

	//내 모임 정보
	@RequestMapping(value="/gMyPage.do")
	public String gMyPage(
		HttpServletRequest request,
		Model md
		) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;
    	ArrayList<GatheringJoinVo> gjvmylist = gs.gatheringMyListSelect(midx);
    	md.addAttribute("gjvmylist", gjvmylist);
		
	

		return "gathering/gMyPage";
	}
//찜한 모임 정보
	@RequestMapping(value="/gMyWish.do")
	public String gMyWish(
			HttpServletRequest request,
			Model md
			) {
		HttpSession session = request.getSession();
	    Object Omidx = session.getAttribute("midx");
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;
	    	
	    	ArrayList<GatheringJoinVo> gjvmywishlist = gs.gatheringMyWishListSelect(midx);
	    	md.addAttribute("gjvmywishlist", gjvmywishlist);
	    
	  
		
		return "gathering/gMyWish";
	}
//모임 검색
	@RequestMapping(value="/gSearch.do")
	public String gSearch(SearchCriteria scri, Model model,HttpServletRequest request) {
		scri.setSearchType("GINFONAME"); // 검색 유형 설정
		HttpSession session = request.getSession();
	    Object omidx = session.getAttribute("midx");
	    Integer midx =null;
	    if (omidx != null) {
	    	midx = (Integer)omidx;
		}else {
			midx = (Integer)omidx;			
		}
	    ArrayList<GatheringJoinVo> gjvlist = gs.searchGatherings(scri,midx);
	    model.addAttribute("gjvlist", gjvlist);
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
	    if (Omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)Omidx;
	    int giidx = (int)Ogiidx;
		
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
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int giidx = (int)Ogiidx;
			int value = gs.updateMemberDELYN(midx, giidx); 
			return "redirect:/gathering/gMemberList.do"; 
		}	
	
//모임 더 보기 모임원 > 부모임장으로 위임
		@RequestMapping(value="/gMemberEntrust.do")
		public String updateTLD(
				@RequestParam("midx") int midx, 
				HttpServletRequest request
				){
			HttpSession session = request.getSession();
			Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int giidx = (int)Ogiidx;
			System.out.println("권한주기"+midx);
			int value = gs.updateTLD(midx, giidx);
			System.out.println("권한메소드");
			return "redirect:/gathering/gPowerEntrustList.do"; 
		}	

//모임 더 보기 부모임장> 모임원으로 강등
		@RequestMapping(value="/gMemberDownTM.do")
		public String updateTM(
				@RequestParam("midx") int midx,
				HttpServletRequest request
				){
			HttpSession session = request.getSession();
			Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int giidx = (int)Ogiidx;
			int value = gs.updateTM(midx, giidx);
			return "redirect:/gathering/gPowerEntrustList.do"; 
		}	

//모임 더 보기 모임장 > 부모임장으로 강등
		@RequestMapping(value = "/gMemberDownTLD.do")
		public String updateDownTLD(
		        @RequestParam("midx") int midx,
		        HttpServletRequest request
		) {
			HttpSession session = request.getSession();
			Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int giidx = (int)Ogiidx;
		    int value = gs.updateDownTLD(midx, giidx);
		    return "redirect:/gathering/gMemberList.do";
		}

//모임 더 보기 부모임장 > 모임장으로 위임	
		@RequestMapping(value="/gMemberEntrustTL.do")
		public String updateTL(
		        @RequestParam("midx") int midx,
		        HttpServletRequest request
		) {
			HttpSession session = request.getSession();
			Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int giidx = (int)Ogiidx;
		    int value = gs.updateTL(midx, giidx);
		    return "redirect:/gathering/gPowerEntrustList.do";
		}
		
		
//모임 더 보기 가입 대기 리스트 보기	
		@RequestMapping(value="/gMemberJoinWaitList.do")
		public String gMemberJoinWaitList(
				HttpServletRequest request,
				Model md
				) {
			HttpSession session = request.getSession();
			Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int midx = (int)Omidx;
		    int giidx = (int)Ogiidx;
			
			GatheringVo gmt = gs.gatheringMemberType(giidx,midx);
			ArrayList<GatheringJoinVo> gjvsmlist = gs.gatheringSeeMoreMemberList(giidx);
	    	md.addAttribute("gmt", gmt);
	    	md.addAttribute("gjvsmlist", gjvsmlist);
	    	
			return "gathering/gMemberJoinWaitList";
		}
		//모임 더 보기 가입 대기 승낙	
		@RequestMapping(value="/processJoinAccess.do")
		@ResponseBody
		public String processJoinAccess(
				@RequestBody HashMap<String, ArrayList<Integer>> requestMidx,
				HttpServletRequest request
				) {
			try {
				HttpSession session = request.getSession();
				Object Ogiidx = session.getAttribute("giidx");
			    Object Omidx = session.getAttribute("midx");
			    if (Omidx == null) {//midx가 없으면 진입불가
			    	return "redirect:/member/memberLogin.do";
				}
			    int giidx = (int)Ogiidx;
				ArrayList<Integer> selectedMembers = requestMidx.get("selectedMembers");
		        // 선택된 멤버의 가입 승인 처리
		        if (selectedMembers != null && !selectedMembers.isEmpty()) {
		        	System.out.println("배열로 들어옴"+selectedMembers);
		        	int value = gs.gatheringApproveMembers(selectedMembers,giidx); 

		        }
				
				// 성공 응답 반환
				return "Success";
			} catch (Exception e) {
				// 실패 응답 반환
				return "Error";
			}
		}
		//모임 더 보기 가입 대기 거절
		@RequestMapping(value="/processJoinRefuse.do")
		@ResponseBody
		public String processJoinRefuse(
				@RequestBody HashMap<String, ArrayList<Integer>> requestMidx,
				HttpServletRequest request
				) {
			try {
				HttpSession session = request.getSession();
				Object Ogiidx = session.getAttribute("giidx");
			    Object Omidx = session.getAttribute("midx");
			    if (Omidx == null) {//midx가 없으면 진입불가
			    	return "redirect:/member/memberLogin.do";
				}
			    int giidx = (int)Ogiidx;
				ArrayList<Integer> selectedMembers = requestMidx.get("selectedMembers");
		        // 선택된 멤버의 가입 승인 처리
		        if (selectedMembers != null && !selectedMembers.isEmpty()) {
		        	System.out.println("배열로 들어옴"+selectedMembers);
		        	int value = gs.gatheringRefuseMembers(selectedMembers,giidx); 

		        }
				
				// 성공 응답 반환
				return "Success";
			} catch (Exception e) {
				// 실패 응답 반환
				return "Error";
			}
		}


		
		
//모임 권한위임 페이지 보기	
		@RequestMapping(value="/gPowerEntrustList.do")
		public String gPowerEntrustList(HttpServletRequest request,
				Model md) {
			HttpSession session = request.getSession();
			Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int midx = (int)Omidx;
		    int giidx = (int)Ogiidx;
			
			GatheringVo gmt = gs.gatheringMemberType(giidx,midx);
			ArrayList<GatheringJoinVo> gjvsmlist = gs.gatheringSeeMoreMemberList(giidx);
	    	md.addAttribute("gmt", gmt);
	    	md.addAttribute("gjvsmlist", gjvsmlist);
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
	    	return "redirect:/member/memberLogin.do";
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
			Object Ogiidx = session.getAttribute("giidx");
		    Object Omidx = session.getAttribute("midx");
		    if (Omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/member/memberLogin.do";
			}
		    int midx = (int)Omidx;
		    int giidx = (int)Ogiidx;
		    
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
	    
	    //모임의 권한 조회(TL=모임장, TLD=부모임장 , TM=모임원)
	    GatheringVo gmt = gs.gatheringMemberType(giidx,midx);
	    session.setAttribute("midx", midx);
	    session.setAttribute("giidx", giidx);
	  
		System.out.println("컨트롤러 들어옴 exit");

		//모임에서 나가기
		boolean success = gs.exitGathering(midx, giidx);
		
		return success;
	}
}
