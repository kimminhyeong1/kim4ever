package com.myezen.myapp.controller;

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
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.AdminService;
import com.myezen.myapp.service.BoardService;
import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired	
	AdminService as;
	@Autowired
	MemberService ms;
	
	
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
        //송천 일반 자전거 대여 가능 수
        int snorCount = as.getSNorCount();
        model.addAttribute("snorCount", snorCount);
        //송천 전기 자전거 대여 가능 수
        int seleCount = as.getSEleCount();
        model.addAttribute("seleCount", seleCount);
        //효자 일반 자전거 대여 가능 수
        int hnorCount = as.getHNorCount();
        model.addAttribute("hnorCount", hnorCount);
        //효자 전기 자전거 대여 가능 수
        int heleCount = as.getHEleCount();
        model.addAttribute("heleCount", heleCount);
        //덕진 일반 자전거 대여 가능 수
        int dnorCount = as.getDNorCount();
        model.addAttribute("dnorCount", dnorCount);
        //덕진 전기 자전거 대여 가능 수
        int deleCount = as.getDEleCount();
        model.addAttribute("deleCount", deleCount);
        //평화 일반 자전거 대여 가능 수
        int pnorCount = as.getPNorCount();
        model.addAttribute("pnorCount", pnorCount);
        //평화 전기 자전거 대여 가능 수
        int peleCount = as.getPEleCount();
        model.addAttribute("peleCount", peleCount);
        //오목 일반 자전거 대여 가능 수
        int onorCount = as.getONorCount();
        model.addAttribute("onorCount", onorCount);
        //오목 전기 자전거 대여 가능 수
        int oeleCount = as.getOEleCount();
        model.addAttribute("oeleCount", oeleCount);
        
        
        
             
        return "admin/adminPage";
	}
	
	//관리자 회원 관리 페이지	  
	@RequestMapping(value="/adminmemberList.do") 
	public String memberList(Model model) {
  
		ArrayList<BikeJoinVo> alist = as.memberList();
  
		model.addAttribute("alist",alist); //(model=requestsetattribute)에 담아서 가지고 간다
  
		return "admin/adminmemberList";
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
	public String adminbikeList(Model model) {
		
		ArrayList<BikeJoinVo> klist = as.bikeList();
		
		model.addAttribute("klist",klist);
		
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
	
	//대여소 등록 페이지
	@RequestMapping(value="/adminrentalshopRegisterAction.do", method = RequestMethod.POST)
	public String adminrentalshopRegisterAction(
		@RequestParam("rentalshopName") String rentalshopName,
		@RequestParam("rentalshopLocation") String rentalshopLocation
		) {
		int value = as.rentalshopInsert(rentalshopName, rentalshopLocation);
			
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
	public String errorList(Model model) {
		
		ArrayList<BikeJoinVo> elist = as.errorList();
		
		model.addAttribute("elist",elist);
		
		return "admin/adminbikeError";
	}

	//관리자 신고 내역 내용 상세페이지
	@RequestMapping("/adminbikeErrorContent.do")
	public String getErrorContent(@RequestParam("eidx") int eidx, Model model) {
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
	public String repairList(Model model) {
  
		ArrayList<BikeJoinVo> elist = as.repairList();
  
		model.addAttribute("elist",elist); 
  
		return "admin/adminbikeRepairList";
	}
	
	
	
	
	
	
////////////////	 		게시글 관리			///////////////// 	
	
	
	@Autowired
	BoardService bs;
		
	@Autowired(required=false)	
	PageMaker pm;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="/adminboardList.do")
	public String adminboardList(SearchCriteria scri,  Model model) {		
		
		int totalCount = bs.boardTotal(scri);
		pm.setScri(scri);
		pm.setTotalCount(totalCount);
		
		ArrayList<BoardVo> blist = bs.boardSelectAll(scri);
		
		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);
	
		return "admin/adminboardList";
	}


}
