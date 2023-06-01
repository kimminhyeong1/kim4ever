package com.myezen.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.service.AdminService;
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
		int bkidxCount = as.getTotalBkidxCount();
        model.addAttribute("bkidxCount", bkidxCount);
        			
        int ridxCount = as.getTotalRidxCount();
        model.addAttribute("ridxCount", ridxCount);
 
        int errorCount = as.getTotalErrorCount();
        model.addAttribute("errorCount", errorCount);
        
        return "admin/adminPage";
        
	}

	

	
	//관리자 회원 관리 페이지	  
	@RequestMapping(value="/adminmemberList.do") 
	public String memberList(Model model) {
  
		ArrayList<BikeJoinVo> alist = as.memberList();
  
		model.addAttribute("alist",alist); //(model=requestsetattribute)에 담아서 가지고 간다
  
		return "admin/adminmemberList"; }
	
	//관리자 회원 상세정보
		@RequestMapping("/adminmemberListProfile.do")
		public String memberListProfile(@RequestParam("memberId") String memberId, Model model) {
		    BikeJoinVo mv = as.getMemberByMemberId(memberId);
		    model.addAttribute("mv", mv);
		    return "member/memberListProfile";
		}
	

	//회원 삭제	

	@RequestMapping(value="/adminmemberDelete.do")
	public String deleteMember(@RequestParam("memberId") String memberId) {
		//System.out.println("test1");
		as.deleteMember(memberId);
		//System.out.println("test2");
		return "redirect:/admin/adminmemberList.do"; 
	}	
	

	
	
	//관리자 게시판관리 페이지
		@RequestMapping(value="/adminboardList.do")
		public String adminboardList() {
				
			return "admin/adminboardList";
			}
	
	@RequestMapping(value="/adminbikeRegister.do")
	public String adminbikeRegister() {
			
			return "admin/adminbikeRegister";
		}


	//관리자 자전거 관리 페이지
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
	
	//관리자 대여소 등록 페이지
		@RequestMapping(value="/adminrentalshopRegisterAction.do", method = RequestMethod.POST)
		public String adminrentalshopRegisterAction(
				@RequestParam("rentalshopName") String rentalshopName,
				@RequestParam("rentalshopLocation") String rentalshopLocation
				) {
			int value = as.rentalshopInsert(rentalshopName, rentalshopLocation);
			
			return "redirect:/admin/adminrentalshopList.do";	
		}	
	
	//관리자 신고 내역 페이지
	@RequestMapping(value="/adminbikeError.do")
	public String errorList(Model model) {
		
		ArrayList<BikeJoinVo> elist = as.errorList();
		
		model.addAttribute("elist",elist);
		
		return "admin/adminbikeError";
	}

			

}
