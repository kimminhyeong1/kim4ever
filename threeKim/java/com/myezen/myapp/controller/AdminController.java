package com.myezen.myapp.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.Gathering_BoardVO;
import com.myezen.myapp.domain.Gathering_ScheduleVO;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.AdminService;
import com.myezen.myapp.service.BoardService;
import com.myezen.myapp.service.GatheringService;
import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired	
	AdminService as;
	@Autowired
	MemberService ms;
	@Autowired
	GatheringService gs;
	@Autowired(required=false)	
	PageMaker pm;
	
	//관리자 메인 페이지
	@RequestMapping(value="/adminPage.do", method = RequestMethod.GET)
	public String adminPage(Model model) {
		//자전거 총 갯수
		int bkidxCount = as.getTotalBkidxCount();
        model.addAttribute("bkidxCount", bkidxCount);
        //대여중인 자전거			
        int ridxCount = as.getTotalRidxCount();
        model.addAttribute("ridxCount", ridxCount);
        //고장 난 자전거
        int errorCount = as.getTotalErrorCount();
        model.addAttribute("errorCount", errorCount);
        //대여 가능한 자전거
        int rentCount = as.getTotalRentCount();
        model.addAttribute("rentCount", rentCount);
        //자전거 대여소 별 대여 가능 자전거 수
        ArrayList<BikeJoinVo> rblist = as.canRentBike();

			for (BikeJoinVo bikeJoinVo : rblist) {
		    	
		        String content = bikeJoinVo.getRentalshopName();
		        content += bikeJoinVo.getBikeNorCnt();
		        content += bikeJoinVo.getBikeEleCnt();		       		       
		   }		
		model.addAttribute("rblist", rblist);		
		
		//이용 현황 자전거 개수		
	

		ArrayList<BikeJoinVo> rbclist = as.getRentalCountByDateRange();
		System.out.println(rbclist.get(0).getRentNorCount());
		model.addAttribute("rbclist", rbclist);	
	
        
		return "admin/adminPage";
	}
        
       
	
	//관리자 회원 관리 페이지	  
	@RequestMapping(value="/adminmemberList.do") 
	public String memberList(SearchCriteria scri, Model model) {
		
		int totalCount = as.memberListCount(scri); //전체 게시물 갯수 조회
	    pm.setScri(scri); //
	    pm.setTotalCount(totalCount); 
	    
  
		ArrayList<BikeJoinVo> alist = as.memberList(scri);
  
		model.addAttribute("alist",alist); //(model=requestsetattribute)에 담아서 가지고 간다
		model.addAttribute("pm", pm);
  
		return "admin/adminmemberList";
	}
	
	//관리자 탈퇴 회원 관리 페이지	  
	@RequestMapping(value="/adminmemberOutList.do") 
	public String adminmemberOutList(SearchCriteria scri, Model model) {
		
		int totalCount = as.memberOutListCount(scri); //전체 게시물 갯수 조회
	    pm.setScri(scri); //
	    pm.setTotalCount(totalCount); 
	    
		
		ArrayList<BikeJoinVo> alist = as.memberOutList(scri);
  
		model.addAttribute("alist",alist);
		model.addAttribute("pm", pm);
		
		return "admin/adminmemberOutList";
	}
	
	
	//관리자 회원 상세정보
		@RequestMapping("/adminmemberListProfile.do")
		public String memberListProfile(@RequestParam("memberId") String memberId, Model model) {
		    BikeJoinVo bjv = as.getMemberByMemberId(memberId);
		    model.addAttribute("bjv", bjv);
		    return "admin/adminmemberListProfile";
		}
	
	//회원 삭제	
	@RequestMapping(value="/adminmemberDelete.do")
	public String deleteMember(@RequestParam("memberId") String memberId) {
		//System.out.println("test1");
		as.deleteMember(memberId);
		//System.out.println("test2");
		return "redirect:/admin/adminmemberList.do"; 
	}	
		

		
	//자전거 등록페이지	
	@RequestMapping(value="/adminbikeRegister.do")
	public String adminbikeRegister() {
			
			return "admin/adminbikeRegister";
		}

	// 자전거 관리 페이지
	@RequestMapping(value="/adminbikeList.do")
	public String adminbikeList(SearchCriteria scri,Model model) {
		
		int totalCount = as.bikeListCount(scri);
		pm.setScri(scri);
		pm.setTotalCount(totalCount);
		
		ArrayList<BikeJoinVo> klist = as.bikeList(scri);
		pm.setScri(scri);
		
		model.addAttribute("klist",klist);
		model.addAttribute("pm", pm);
		

			
		
		return "admin/adminbikeList";
	}
	
	//관리자 대여소 관리 페이지
	@RequestMapping(value="/adminrentalshopList.do")
	public String adminrentalshopList(Model model) {
			
		ArrayList<BikeJoinVo> rlist = as.rentalshopList();
		
		model.addAttribute("rlist", rlist);
			
		return "admin/adminrentalshopList";
		}

	//관리자 대여소 등록 페이지
	@RequestMapping(value="/adminrentalshopRegister.do")
	public String adminrentalshopRegister() {
		
		return "admin/adminrentalshopRegister";
	}	

	//대여소 등록 이름 체크
	@ResponseBody
	@RequestMapping(value = "/adminrentalshopRegisterNameCheck.do")
	public HashMap<String, Object> adminrentalshopRegisterNameCheck(@RequestParam("rentalshopName") String rentalshopName) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("이름체크"+rentalshopName);
		int value = as.adminrentalshopNameCheck(rentalshopName);
		System.out.println(value);
		hm.put("value",value);//0은 거짓 1은 참
		return hm; 
	}
	
	//대여소 등록 페이지 //등록하면 bikeRentController에 bikeRentLocation.do에 보여줌 
		@RequestMapping(value="/adminrentalshopRegisterAction.do", method = RequestMethod.POST)
		public String adminrentalshopRegisterAction(
			@RequestParam("rentalshopName") String rentalshopName,//대여소 이름
			@RequestParam("rentalshopLocation") String rentalshopLocation,//대여소 주소
			@RequestParam("latitude") String latitude, //위도
			@RequestParam("longitude") String longitude //경도
			) {
			int value = as.rentalshopInsert(rentalshopName, rentalshopLocation ,latitude ,longitude);
				
			return "redirect:/admin/adminrentalshopList.do";	
			}	
	
	//대여소 삭제
		@RequestMapping(value="/adminrentalshopDelete.do")
		public String deleteRentalshop(@RequestParam("rentalshopName") String rentalshopName) {
			//System.out.println("test1");
			as.deleteRentalshop(rentalshopName);
			//System.out.println("test2");
			return "redirect:/admin/adminrentalshopList.do"; 
		}		
		
	//관리자 신고 내역 페이지
	@RequestMapping(value="/adminbikeError.do")
	public String errorList(SearchCriteria scri, Model model) {
		
		int totalCount = as.searchBikeErrorsCount(scri); //전체 게시물 갯수 조회
	    pm.setScri(scri); //
	    pm.setTotalCount(totalCount); 
		
		ArrayList<BikeJoinVo> elist = as.searchBikeErrors(scri); //전체 게시물 조회
		
		model.addAttribute("elist",elist);
		model.addAttribute("pm", pm); 
		
		return "admin/adminbikeError";
	}

	//관리자 신고 내역 내용 상세페이지
	@RequestMapping("/adminbikeErrorContent.do")
	public String getErrorContent(
	@RequestParam("eidx") int eidx, Model model) {
	 
		BikeJoinVo ejv = as.getErrorContent(eidx);	 
	 
		model.addAttribute("ejv", ejv);
	 

		
		
		
		
		
		return "admin/adminbikeErrorContent";
	 	 
	}
	
	//수리센터 버튼 누를 시 bikeState E로 변경
	@RequestMapping("/adminbikeRepairAction.do")
	public String UpdateBikeState(int eidx) {
		//System.out.println("test1");
		as.updateBikeState(eidx);
		//System.out.println("test2");
		return "redirect:/admin/adminbikeError.do";
	}	
	
	//관리자 수리 내역 페이지
	@RequestMapping(value="/adminbikeRepairList.do") 
	public String repairList(SearchCriteria scri,Model model) {
  
		int totalCount = as.searchBikerepairListCount(scri); //전체 게시물 갯수 조회
	    pm.setScri(scri); //
	    pm.setTotalCount(totalCount); 
	    
		ArrayList<BikeJoinVo> elist = as.searchBikerepairList(scri);
  
		model.addAttribute("elist",elist); 
		model.addAttribute("pm", pm); 
  
		return "admin/adminbikeRepairList";
	}

	//수리완료 버튼 누를 시 bikeState Y로 변경
	@RequestMapping("/adminbikeRepairYesAction.do")
	public String UpdateBikeStateY(int eidx) {
		System.out.println("자전거 상태 테스트중");
		as.updateBikeStateY(eidx);
		System.out.println("자전거 상태 테스트중2");
		return "redirect:/admin/adminbikeRepairList.do";
	}
	
	//관리자 모임 리스트 페이지	
		@RequestMapping(value="/admingatheringList.do")
		public String admingatheringList(Model model) {
			ArrayList<GatheringJoinVo> gjlist = as.gatheringList();
					
			model.addAttribute("gjlist", gjlist);	
			
				return "admin/admingatheringList";
			}	
	//관리자 모임 리스트 상세 페이지	
			@RequestMapping(value="/admingatheringDetail.do")
			public String admingatheringDetail(Model model, int giidx) {
				GatheringJoinVo gtrdv = as.gatheringDetail(giidx);							
					model.addAttribute("gtrdv", gtrdv);						
						return "admin/admingatheringDetail";
					}	
		
	//관리자 모임 신고 내역 페이지	
		@RequestMapping(value="/adminGReportList.do")
		public String adminGReportList(Model model) {
			ArrayList<GatheringJoinVo> gdlist = as.gatheringDeclaration();					
			model.addAttribute("gdlist", gdlist);
			
				return "admin/adminGReportList";
					}	
	
	//관리자 모임 신고 상세 내역 페이지
		@RequestMapping(value="/adminGReportDetail.do")
		public String adminGReportDetail(Model model, int gdix) {
			GatheringJoinVo gdtv = as.DeclarationDetail(gdix);			
		    model.addAttribute("gdtv", gdtv);
			return "admin/adminGReportDetail";
		}
	
////////////////	 		게시글 관리			///////////////// 	
	
	
	@Autowired
	BoardService bs;
		

	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="/adminboardList.do")
	public String adminboardList(SearchCriteria scri,  Model model) {		
		
		int totalCount2 = bs.boardTotal2(scri);
		pm.setScri(scri);
		pm.setTotalCount(totalCount2);
		
		ArrayList<BoardVo> blist = bs.boardSelectAll2(scri);
		
		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);
	
		return "admin/adminboardList";
	}


	// 관리자게시글 삭제 액션
	@RequestMapping(value = "/adminboardDeleteAction.do")
	public String adminboardDeleteAction(@RequestParam("bidx") int bidx, HttpSession session) throws Exception {

		BoardVo bv = new BoardVo();
		bv.setBidx(bidx);
		System.out.println(bidx + "관리게시판bidx");
		int value = bs.adminboardDelete(bv);
		System.out.println("삭제값: " + value);

		String path = "";
		if (value == 1) {
			path = "redirect:/admin/adminboardList.do";
			System.out.println("관리자게시판삭제 성공");

		} else {
			path = "redirect:/admin/adminboardList.do";
			System.out.println("관리자게시판삭제 오류");
		}
		return path;
	}

	
	
	// 관리자게시글 복구 액션	  
	  @RequestMapping(value="/adminboardBackAction.do") public String
	  adminboardBackAction(
	  
	  @RequestParam("bidx") int bidx, HttpSession session) throws Exception {
	  
	  
	  BoardVo bv = new BoardVo(); bv.setBidx(bidx); System.out.println(bidx
	  +"관리게시판bidx"); int value = bs.adminboardBack(bv); 
	  System.out.println("삭제값: "+ value);
	  
	  String path = ""; if (value == 1)
	  { path = "redirect:/admin/adminboardList.do"; 
	  System.out.println("관리자게시판복구 성공");
	  
	  
	  } else { path = "redirect:/admin/adminboardList.do";
	  System.out.println("관리자게시판복구 오류"); } return path; }
	 

	  
}
