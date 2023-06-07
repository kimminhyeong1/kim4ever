package com.myezen.myapp.controller;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.service.BikeRentService;
import com.myezen.myapp.util.AESUtil;
import com.myezen.myapp.util.QRCodeUtil;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



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
	public String bikeRentLocation(Model md) {
		ArrayList<Integer> alist = bs.availableStations();
		md.addAttribute("alist", alist);
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
	public String bikeRentQR(
			HttpServletRequest request,
			Model md
			)throws Exception {
		
		/*암호화부분*/
        /*URL파라미터값 암호화*/
        String ebkidx1 = AESUtil.encrypt("1");
        String ebkidx2 = AESUtil.encrypt("2");
        String ebkidx3 = AESUtil.encrypt("3");
        // 모델로 전달
        md.addAttribute("ebkidx1", ebkidx1);
        md.addAttribute("ebkidx2", ebkidx2); 
        md.addAttribute("ebkidx3", ebkidx3);
        
        
        /*QR생성부분*/
        /*QR생성부분 서비스부분에서 실행*/
        ArrayList<String> QRList = bs.QRBikeCode();  

        // 모델로 전달
        md.addAttribute("QRCode1", QRList.get(0));
        md.addAttribute("QRCode2", QRList.get(1));
        md.addAttribute("QRCode3", QRList.get(2));
        
	    return "bikeRent/bikeRentQR";
	}

	//BikeJoinVo로 bike관련 Vo들 join시킴
	/*자전거상세보기*/	 
	@RequestMapping(value="/bikeRentDetail/{key}/view.do")//.do로 끝나야 경로가 맞는다 
	public String bikeRentDetail(
			@PathVariable("key") String ebkidx, // bkidx 으로 받는이유는 암호화할때 value로 받으면 +같은 특수문자도 들어가있어서 가져올때 잘못 보여준다
			HttpServletRequest request,
			Model md) throws Exception {
		 System.out.println("암호화된키"+ebkidx);
		 //복호화
		 String dbkidx = AESUtil.decrypt(ebkidx);
		 int bkidx = Integer.parseInt(dbkidx);
		 System.out.println("복호화한키"+bkidx);
		 
		 
		  BikeJoinVo bjv = bs.RentDetail(bkidx);
		  
		  md.addAttribute("bjv", bjv);
		  
		return "bikeRent/bikeRentDetail";
	}
	
	
	
	
	//자전거대여정보업데이트
	@RequestMapping(value="/bikeRentUpdate.do", method=RequestMethod.POST)
	public String bikeRentUpdate(
			@ModelAttribute("bjv") BikeJoinVo bjv,
			HttpServletRequest request,
			Model md
			){
	    HttpSession session = request.getSession();
	    int midx = (int) session.getAttribute("midx");
	    bjv.setMidx(midx);
	    
	    // 자전거 상태 업데이트
	    bs.updateBikeState(bjv.getBkidx());
		
	    System.out.println("자전거 상태 업데이트");
	    
	    //rsidx가져오기	    
	    int rsidx = bs.bikeGetRsidx(bjv.getBkidx());
	    
		// 대여 정보 삽입
	    int value = bs.insertRentInfo(bjv, rsidx);
		
		System.out.println("insertInfo 실행"+bjv.getRidx());
		session.setAttribute("ridx", bjv.getRidx());//세션값에 저장
		session.setAttribute("bkidx", bjv.getBkidx());//세션값에 저장
			
		return "redirect:/bikeRent/bikeRentUseList.do";
	}
	

	/*이용중인내역*/
	@RequestMapping(value="/bikeRentUseList.do") 
	public String bikeRentUseList(
			HttpServletRequest request,
			Model md
			) {
		//세션값가져오기
		HttpSession session = request.getSession();
		int ridx = (int) session.getAttribute("ridx");
		int bkidx = (int) session.getAttribute("bkidx");
		
		//대여 내역 조회		
		BikeJoinVo bjv = bs.RentUseList(bkidx);
				 
		md.addAttribute("bjv", bjv);
		md.addAttribute("ridx", ridx);
				

		 return "bikeRent/bikeRentUseList"; 
	}
	
	/*대여소 QR 반납하기*/
	@RequestMapping(value="/bikeReturnQR.do")
	public String bikeReturnQR(
			HttpServletRequest request,
			Model md
			) throws Exception {
		//세션값가져오기
		HttpSession session = request.getSession();
		int ridx = (int) session.getAttribute("ridx");
		
		/*암호화부분*/
        /*URL파라미터값 암호화*/
        String ersidx1 = AESUtil.encrypt("1");
        String ersidx2 = AESUtil.encrypt("2");
        String ersidx3 = AESUtil.encrypt("3");
        // 모델로 전달
        md.addAttribute("ersidx1", ersidx1);
        md.addAttribute("ersidx2", ersidx2); 
        md.addAttribute("ersidx3", ersidx3);
		
		
		
		
		
        /*QR생성부분*/
        /*QR생성부분 서비스부분에서 실행*/
        ArrayList<String> QRList = bs.QRRentalShopCode();  

        // JSP로 전달할 데이터 설정
        md.addAttribute("QRCode1", QRList.get(0));
        md.addAttribute("QRCode2", QRList.get(1));
        md.addAttribute("QRCode3", QRList.get(2));
	  
        md.addAttribute("ridx", ridx);
        
	    return "bikeRent/bikeReturnQR";
	}

	
	/*----------------------------------------------*/
	
	/*반납하기*/
	@RequestMapping(value="/bikeRentReturn/{key}/view.do")
	public String bikeRentReturn(
			@PathVariable("key") String ersidx,//반납하는 대여소 주소 번호
			HttpServletRequest request,
			Model md
			) throws Exception {
			//이용중인 내역에서 사용자가 반납하러가기를 누르고 반납소 QR을 찍으면 이쪽으로 넘어온다
			//그래서 자전거 번호를 그 전에 가져와야한다
		//세션값가져오기
		
		 System.out.println("암호화된키"+ersidx);
		 //복호화
		 String drsidx = AESUtil.decrypt(ersidx);
		 int rsidx = Integer.parseInt(drsidx);
		 System.out.println("복호화한키"+rsidx);
		
		HttpSession session = request.getSession();
		int ridx = (int) session.getAttribute("ridx");//대여번호
		System.out.println("반납하기 자전거번호"+ridx+"반납소 번호"+rsidx);
	

		BikeJoinVo bjv = bs.bikeRentReturnCheck(ridx,rsidx); 

		//대여한 위치
		//반납할 위치
		//자전거 이용요금

		//이걸 가져오고 모델로 보내준다
		md.addAttribute("bjv",bjv);
		md.addAttribute("ridx", ridx);
		md.addAttribute("rsidx", rsidx);
		
		return "bikeRent/bikeRentReturn";
	}
	/*최종 반납하기*/
	/*반납하기페이지에서 최종반납하기 클릭시*/
	@RequestMapping(value="/bikeRentReturnAction.do")
	public String bikeRentReturnAction(
			@RequestParam(value = "rsidx") int rsidx,//반납하는 대여소 주소 번호
			HttpServletRequest request
			) {
		//세션값
		HttpSession session = request.getSession();
		int ridx = (int) session.getAttribute("ridx");//대여번호
		System.out.println("최종반납 자전거번호"+ridx);
		System.out.println("최종반납 대여소 주소 번호"+rsidx);


		int value = bs.bikeRentReturn(ridx,rsidx); 

			//자전거테이블
			//자전거 상태 N으로 바꾸기
			//자전거 위치 바꾸기


			//반납테이블 데이터 생성하기

		System.out.println("출력");
		session.removeAttribute("ridx");
		session.removeAttribute("bkidx");
		
		return "redirect:/bikeRent/bikeRentHistory.do";
	}
	
	/*자전거 고장/신고 접수*/
	/*자전거 고장/신고페이지*/
	@RequestMapping(value="/bikeRentFault.do")
	public String bikeRentFault(
			HttpServletRequest request,
			Model md
			) {
		System.out.println("고장/신고페이지 들어옴");
		//세션값가져오기
		HttpSession session = request.getSession();
		int ridx = (int) session.getAttribute("ridx");
			
			
			
			
			
			
			md.addAttribute("ridx", ridx);


		return "bikeRent/bikeRentFault";
	}
	/*자전거 고장/신고페이지에서 등록 클릭시*/
	@RequestMapping(value="/bikeRentFaultAction.do")
	public String bikeRentFaultAction(
			@RequestParam("latitude") String latitude, //위도
			@RequestParam("longitude") String longitude, //경도
			@RequestParam("address") String address, //주소
			@RequestParam("errorContent") String errorContent,//고장메세지
			HttpServletRequest request,
			Model md
			) {
		System.out.println("고장/신고페이지 에서 작성하기 클릭");
		System.out.println("위도값"+latitude+"경도값"+longitude+"주소값"+address);
		
		//세션값가져오기
		HttpSession session = request.getSession();
		int ridx = (int) session.getAttribute("ridx");

		System.out.println("고장/신고페이지 에서 작성하기 클릭 메서드 실행"+ridx+""+errorContent);
		 int value = bs.bikeRentErrorInsert(errorContent,ridx);
			
		 
		 
		 md.addAttribute("latitude",latitude);
		 md.addAttribute("longitude",longitude);
		 md.addAttribute("address",address);
		 md.addAttribute("errorContent",errorContent);
		 
		 
		//접수되었다는 메세지 띄우기
		
		//홈페이지로 돌아가기  //임시로 고장페이지 결과보기 주소 설정
			return "bikeRent/bikeRentFaultResult";
		
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
		
	//휴대폰 인증
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber, HttpSession session) { // 휴대폰 문자보내기
		
	
		int randomNumber = (int)((Math.random()* (999999 - 100000 + 1)) + 100000);//난수 생성
		
		
		  // CoolSMS API 사용
		  String api_key = "NCSQ6K8YB71UK1Q5"; 
		  String api_secret ="RCJYGI0IER077RL27WSVXY75ZDIFKGFT"; 
		  Message coolsms = new Message(api_key, api_secret);
	  
		  HashMap<String, String> params = new HashMap<String, String>();
		  params.put("to", userPhoneNumber); // 수신전화번호
		  params.put("from","01056309412"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		  params.put("type","SMS"); params.put("text", "[타다] 인증번호는" + "["+randomNumber+"]" + "입니다.");
		
		  try {
		        JSONObject obj = (JSONObject) coolsms.send(params);
		        System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		        System.out.println(e.getMessage());
		        System.out.println(e.getCode());
		    }
		
		System.out.println("userPhoneNumber는?"+userPhoneNumber);
		System.out.println("Received phone number: " + userPhoneNumber);
		
		//로그인한 사용자의 midx 값을 가져옴
	    int midx = (int) session.getAttribute("midx");
	    
	    //회원의 휴대폰 번호를 데이터베이스에서 가져옴
	    MemberVo mv = bs.getMemberPhoneByMidx(midx);
	    
	    //가져온 휴대폰 번호를 memberPhoneNumber로 정의
	    String memberPhoneNumber = mv.getMemberPhone();
	    System.out.println("회원가입 시 가입한 휴대폰번호는? " + memberPhoneNumber);
	    
	    //memberPhoneNumber와 userPhoneNumber가 일치하면 인증번호 전송
	    if (userPhoneNumber.equals(memberPhoneNumber)) {
	    	
		// 휴대폰 인증 정보를 데이터베이스에 저장
		BikeJoinVo bjv = new BikeJoinVo();
		bjv.setPhoneNumber(userPhoneNumber);
		bjv.setVerificationCode(Integer.toString(randomNumber));
		bs.savePhoneNumberVerification(bjv);
	  
		return Integer.toString(randomNumber);
		
	    }else {
	        return "error";
	    }
	}
	//인증번호 대조 확인
	@RequestMapping(value = "/verifyPhoneNumber.do", method = RequestMethod.POST)
	@ResponseBody
	public String verifyPhoneNumber(@RequestParam("phoneNumber") String phoneNumber,
	                               @RequestParam("verificationCode") String verificationCode) {
		boolean isVerified = bs.verifyPhoneNumber(phoneNumber, Integer.parseInt(verificationCode));

	    if (isVerified) {
	        // 인증번호 일치
	        return "success";
	    } else {
	        // 인증번호 불일치
	        return "failure";
	    }
	}
	
	// 저장된 인증번호 가져오기
	@RequestMapping(value = "/getSavedRandomNumber.do", method = RequestMethod.GET)
	@ResponseBody
	public int getSavedRandomNumber(@RequestParam("phoneNumber") String phoneNumber) {
	    int savedRandomNumber = bs.getSavedRandomNumber(phoneNumber);
	    return savedRandomNumber;
	}

	// 인증번호 수정
	@RequestMapping(value = "/updateVerificationStatus.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateVerificationStatus(@RequestParam("phoneNumber") String phoneNumber) {
	    bs.updateVerificationStatus(phoneNumber);
	    return "success";
	}
	
	
	/* ******************************************************************/
	/*자전거 결제*/
	@RequestMapping(value="/pay.do")
	public String pay()
	{	  
	    return "bikeRent/pay";
	}

	
	
	
	
	
	
	
	
	
	
	
}

