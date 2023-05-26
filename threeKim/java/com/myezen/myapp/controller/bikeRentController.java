package com.myezen.myapp.controller;







import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
			Model md) {
		
		
		  BikeJoinVo bjv = bs.RentDetail(bkidx);
		  
		  md.addAttribute("bjv", bjv);
		  
		return "bikeRent/bikeRentDetail";
	}
	

	
	/*이용중인내역*/
	
	@RequestMapping(value="/bikeRentUseList.do") 
	public String bikeRentUseList(
			  @RequestParam("bkidx") int bkidx,
			  Model md) {
			
			//업데이트
			//컬럽삽입
		    //조회
			// 대여 상태 변경 및 정보 이동
			bs.RentUseListAction(bkidx);
	    
			 // 대여 내역 조회
		  	BikeJoinVo bjv = bs.RentUseList(bkidx);
		    
		    
		  	md.addAttribute("bjv", bjv);

		  return "bikeRent/bikeRentUseList"; 
	}
	
	

	
	/*----------------------------------------------*/
	
	/*반납하기*/
	/*반납하기 클릭시 반납하기페이지로이동*/
	@RequestMapping(value="/bikeRentReturn.do")
	public String bikeRentReturn(
			@RequestParam(value = "ridx" ,required = false) Integer ridx,//자전거 번호
			@RequestParam(value = "rsidx" ,required = false) Integer rsidx,//반납하는 대여소 주소 번호
			Model md
			) {
			//이용중인 내역에서 사용자가 반납하러가기를 누르고 반납소 QR을 찍으면 이쪽으로 넘어온다
			//그래서 자전거 번호를 그 전에 가져와야한다
		
		ridx = (int)1;
		rsidx= (int)1;
		
		System.out.println("반납하기메소드결과");
		//대여한 위치
		//반납할 위치
		//사용자 이름
		//자전거 고유번호
		//대여한 시간
		//반납할 시간
		//자전거 이용요금
		
		//이걸 가져오고 모델로 보내준다
		
		
		
		
		
		
		
		
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
	
	/*사용자가 대여이력보기*/
	@RequestMapping(value="/bikeRentHistory.do")
	public String bikeRentHistory(
			HttpSession session,
			Model md
			) {
		 int midx = (int) session.getAttribute("midx");
		//로그인한 회원번호를 담아서 대여이력을 보여준다
		 
		 System.out.println("midx는:"+midx);
		 
		 ArrayList<BikeJoinVo> bjvlist = bs.bikeRentHistoryList(midx);
		 
		 System.out.println("결과는"+bjvlist);
		 
		 md.addAttribute("bjvlist", bjvlist);
			return "bikeRent/bikeRentHistory";
		}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

