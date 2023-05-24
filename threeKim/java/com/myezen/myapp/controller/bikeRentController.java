package com.myezen.myapp.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myezen.myapp.domain.BikeVo;
import com.myezen.myapp.service.BikeRentService;


@Controller
@RequestMapping(value="/bikeRent")
public class bikeRentController {
	
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
	public String bikeRentQR(Model model) {
		
		
	 	BikeVo bike1 = bs.getBikeDetails(1);
	    model.addAttribute("bike1", bike1);
	    System.out.println("bike1"+bike1);
	    BikeVo bike2 = bs.getBikeDetails(2);
	    model.addAttribute("bike2", bike2);
	    System.out.println("bike2"+bike2);
	    BikeVo bike3 = bs.getBikeDetails(3);
	    model.addAttribute("bike3", bike3);
	    System.out.println("bike3"+bike3);
	    return "bikeRent/bikeRentQR";
	}



	
	/*자전거상세보기*/	
	@RequestMapping(value="/bikeRentDetail.do")
	public String bikeRentDetail() {
		
		
		
		
		
		
		
		return "bikeRent/bikeRentDetail";
	}
	
	
	
	
	
	
	
	
	/*이용중인내역*/
	@RequestMapping(value="/bikeRentUseList.do")
	public String bikeRentUseList() {
		
		
		
		
		
		
		
		return "bikeRent/bikeRentUseList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
	/*반납하기*/
	@RequestMapping(value="/bikeRentReturn.do")
	public String bikeRentReturn() {
		
		
		
		
		
		
		
		
		
		
		
		return "bikeRent/bikeRentReturn";
	}

	/*자전거 대여 이력*/
	@RequestMapping(value="/bikeRentHistory.do")
	public String bikeRentHistory() {
		
		
		
		
		
		
		
		
		
		
		return "bikeRent/bikeRentHistory";
	}
	
	/*자전거 고장/신고 접수*/
	@RequestMapping(value="/bikeRentFault.do")
	public String bikeRentFault() {
		
		
		
		
		
		
		
		
		
		
		
		return "bikeRent/bikeRentFault";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

