package com.myezen.myapp.controller;





import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.service.BikeRentService;


@Controller
@RequestMapping(value="/bikeRent")
public class bikeRentController {
	@Autowired
	BikeRentService bs; //업캐스팅 부모만 지정
	
	
	/*관리자페이지 자전거 등록*/
	@RequestMapping(value="/bikeRentWrite.do")
	public String bikeRentWrite() {
		
		return "bikeRent/bikeRentWrite";
	}
	/*관리자페이지 자전거 고장/신고 내역*/
	@RequestMapping(value="/bikeRentFaultList.do")
	public String bikeRentFaultList() {
		
		return "bikeRent/bikeRentFaultList";
	}
	/*자전거 대여소 위치*/
	@RequestMapping(value="/bikeRentLocation.do")
	public String bikeRentLocation() {
		
		return "bikeRent/bikeRentLocation";
	}
	/*자전거 소개글*/ 
	@RequestMapping(value="/bikeRentInfo.do")
	public String bikeRentInfo() {
		
		return "bikeRent/bikeRentInfo";
	}
	/*----------------------------------------------*/
	
	/*자전거 QR대여*/
	@RequestMapping(value="/bikeRentQR.do")
	public String bikeRentQR() {
		
		
	 	
	  
	    return "bikeRent/bikeRentQR";
	}

	//BikeJoinVo로 bike관련 Vo들 join시킴
	/*자전거상세보기*/	
	@RequestMapping(value="/bikeRentDetail.do")
	public String bikeRentDetail(
			@RequestParam("bkidx") int bkidx,
			Model model) {
		
		
		  BikeJoinVo bjv = bs.getBikeRentDetail(bkidx);
		  
		  model.addAttribute("bjv", bjv);
		  
		return "bikeRent/bikeRentDetail";
	}
	

	
	/*이용중인내역*/
	@RequestMapping(value="/bikeRentUseList.do")
	public String bikeRentUseList(
			Model model) {
		
		ArrayList<BikeJoinVo> rentalList = bs.getRentalList();
		
		model.addAttribute("rentalList", rentalList);
		

		
	
		
		
		
		return "bikeRent/bikeRentUseList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
	/*반납하기*/
	/*반납하기 클릭시 반납하기페이지로이동*/
	@RequestMapping(value="/bikeRentReturn.do")
	public String bikeRentReturn() {
		
		
		
		
		
		
		
		
		
		
		
		return "bikeRent/bikeRentReturn";
	}
	/*최종 반납하기*/
	/*반납하기페이지에서 최종반납하기 클릭시*/
	@RequestMapping(value="/bikeRentReturnAction.do")
	public String bikeRentReturnAction() {
		
			
		
		
		
		
		
		
		
		
		
		return "redirect:/bikeRent/bikeRentHistory.do";
	}
	
	/*자전거 고장/신고 접수*/
	/*자전거 고장/신고페이지*/
	@RequestMapping(value="/bikeRentFault.do")
	public String bikeRentFault( //!required = false null값 받기! !Integer 선언 널 떄문에! 차후에 int형으로 바꿈
			@RequestParam(value = "ridx" ,required = false) Integer ridx,
			@RequestParam(value = "URL1" ,required = false) Integer URL1,//이용내역에서온 URL
			@RequestParam(value = "URL2" ,required = false) Integer URL2,//반납하기에서온 URL
			Model md
			) {
		System.out.println("고장/신고페이지 들어옴");
		//임시로 ridx 번호는 1로 지정
			ridx=(int)1;
			URL1=(int)2;
			URL2=(int)2;
			
			md.addAttribute("ridx", ridx);
			md.addAttribute("URL1", URL1);
			md.addAttribute("URL2", URL2);

		return "bikeRent/bikeRentFault";
	}
	/*자전거 고장/신고페이지에서 등록 클릭시*/
	@RequestMapping(value="/bikeRentFaultAction.do")
	public String bikeRentFaultAction(
			@RequestParam("ridx") int ridx,
			@RequestParam("URL1") int URL1,
			@RequestParam("URL2") int URL2,
			@RequestParam("errorContent") String errorContent
			) {
		System.out.println("고장/신고페이지 에서 작성하기 클릭");

		System.out.println("고장/신고페이지 에서 작성하기 클릭 메서드 실행"+ridx+""+errorContent);
		 //int value = bs.bikeRentErrorInsert(errorContent,ridx);
			
		//접수되었다는 메세지 띄우기
		
		//전페이지로 돌아가기 
		 if (URL1==1) {
			return "redirect:/bikeRent/bikeRentUseList.do";
		}if (URL2==1) {
			return "redirect:/bikeRent/bikeRentReturn.do";
		}
		else {	
			return "redirect:/";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

