package com.myezen.myapp.controller;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myezen.myapp.domain.BikeInfoVo;
import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.service.BikeRentService;
import com.myezen.myapp.service.MemberService;
import com.myezen.myapp.util.AESUtil;
import com.myezen.myapp.util.QRCodeUtil;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Controller
@RequestMapping(value="/bikeRent")
public class bikeRentController {
	
	@Autowired
	BikeRentService bs; //업캐스팅 부모만 지정
	@Autowired
	MemberService ms;
	
	/*자전거 소개글*/ 
	@RequestMapping(value="/bikeRentInfo.do")
	public String bikeRentInfo(Model model) {
			
		
	    ArrayList<BikeJoinVo> bikeList = bs.getBikeList();
	    
	    model.addAttribute("bikeList", bikeList);
	
		return "bikeRent/bikeRentInfo";
	}
	
	/*관리자페이지 자전거 등록*/
	@RequestMapping(value="/bikeRentWrite.do")
	public String bikeRentWrite() {
		
		return "bikeRent/bikeRentWrite";
	}
	
	/*자전거소개 페이지에서 자전거 추가 등록*/
	@RequestMapping(value = "/bikeRentWriteAction.do", method = RequestMethod.POST)
	    public String bikeRentWriteAction(
	    		@ModelAttribute BikeJoinVo bjv,
                @RequestParam("uploadfile") MultipartFile file, Model model,
                HttpServletRequest request,
                RedirectAttributes redirectAttributes) {

		 System.out.println("bjv는?"+bjv);
		 System.out.println("업로드파일?"+file);
		 
		 String savedFilePath = bs.processBikeRentWrite(file, bjv,request);
		   
		 	//등록된 자전거 정보를 다시 조회하여 모델에 추가
		    ArrayList<BikeJoinVo> bikeList = bs.getBikeList();
		    
		    //저장된 파일 경로를 모델에 추가
		    model.addAttribute("savedFilePath", "/resources/bikeImages/" + savedFilePath);
		    
		    return "redirect:/bikeRent/bikeRentInfo.do";
	    }
	
	 @RequestMapping(value = "/bikeRentDeleteAction.do", method = RequestMethod.GET)
	  public String bikeRentDeleteAction(@RequestParam("bikeType") String bikeType, RedirectAttributes redirectAttributes) {
	    bs.deleteBikeByType(bikeType);
	    redirectAttributes.addFlashAttribute("message", "자전거가 성공적으로 삭제되었습니다.");
	    return "redirect:/bikeRent/bikeRentInfo.do";
	  }
	 
	 
	 
	 
	 
	/*관리자페이지 자전거 고장/신고 내역*/
	@RequestMapping(value="/bikeRentFaultList.do")
	public String bikeRentFaultList() {
		
		return "bikeRent/bikeRentFaultList";
	}
	/*자전거 대여소 위치*/
	@RequestMapping(value="/bikeRentLocation.do")
	public String bikeRentLocation(Model md) {
		ArrayList<BikeJoinVo> bjvlist = bs.availableStations();
		ArrayList<HashMap<String, Object>> positions = new ArrayList<>();
		
		    for (BikeJoinVo bikeJoinVo : bjvlist) {
		    	HashMap<String, Object> position = new HashMap<>();
		        String content = "<div id=\"marker"+bikeJoinVo.getRsidx()+"\" class=\"infowindow\">";
		        content += "<span class=\"rs1\">" + bikeJoinVo.getRentalshopName() + "대여소</span></br>";
		        content += "<span class=\"rs2\">남은 갯수: " + bikeJoinVo.getRentalshopCnt() + "</span></div>";
		        
		        String latitude = bikeJoinVo.getRentalshopLatitude();
        		String longitude = bikeJoinVo.getRentalshopLongitude();
		        
		        position.put("content", content);
		        position.put("latitude", latitude);
		        position.put("longitude", longitude);

		        positions.add(position);
		    }

		    md.addAttribute("positions", positions);
		md.addAttribute("bjvlist", bjvlist);
		return "bikeRent/bikeRentLocation";
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
        String ebkidx71 = AESUtil.encrypt("71");
        String ebkidx81 = AESUtil.encrypt("81");
        String ebkidx91 = AESUtil.encrypt("91");
        
        // 모델로 전달
        md.addAttribute("ebkidx1", ebkidx1);
        md.addAttribute("ebkidx2", ebkidx2); 
        md.addAttribute("ebkidx3", ebkidx3);
        md.addAttribute("ebkidx71", ebkidx71);
        md.addAttribute("ebkidx81", ebkidx81);
        md.addAttribute("ebkidx91", ebkidx91);
        
        /*QR생성부분*/
        /*QR생성부분 서비스부분에서 실행*/
        ArrayList<String> QRList = bs.QRBikeCode();  

        // 모델로 전달
        md.addAttribute("QRCode1", QRList.get(0));
        md.addAttribute("QRCode2", QRList.get(1));
        md.addAttribute("QRCode3", QRList.get(2));
        md.addAttribute("QRCode71", QRList.get(3));
        md.addAttribute("QRCode81", QRList.get(4));
        md.addAttribute("QRCode91", QRList.get(5));
        
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
		 HttpSession session = request.getSession();
		 int midx = (int) session.getAttribute("midx");
		 
		 //사용자테이블에 휴대폰번호가없으면 
		 String memberPhone = ms.memberPhoneCheck(midx);
		 if (memberPhone.equals("0")) {
			return "redirect:/member/memberEditInformation.do";
		}
		 
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
			@ModelAttribute ErrorVo ev,
			//@RequestParam("errorLatitude") String errorLatitude, //위도
			//@RequestParam("longitude") String longitude, //경도
			//@RequestParam("address") String address, //주소
			//@RequestParam("errorContent") String errorContent,//고장메세지
			@RequestParam("errorImg") MultipartFile errorImage,
			HttpServletRequest request,
			Model md
			) {
		System.out.println("고장/신고페이지 에서 작성하기 클릭");
		//System.out.println("위도값"+latitude+"경도값"+longitude+"주소값"+address+"고장메세지"+errorContent+"이미지"+file);
		
		//세션값가져오기
		HttpSession session = request.getSession();
		int ridx = (int) session.getAttribute("ridx");
		int bkidx = (int) session.getAttribute("bkidx");
		ev.setRidx(ridx);
		ev.setBkidx(bkidx);

		//System.out.println("고장/신고페이지 에서 작성하기 클릭 메서드 실행"+ridx+""+errorContent);
		 int value = bs.bikeRentErrorInsert(ev,errorImage,request); 
			
			session.removeAttribute("ridx");
			session.removeAttribute("bkidx");
		 
		 //md.addAttribute("latitude",latitude);
		 //md.addAttribute("longitude",longitude);
		 //md.addAttribute("address",address);
		 //md.addAttribute("errorContent",errorContent);
		 
		 
		//접수되었다는 메세지 띄우기
		
		//홈페이지로 돌아가기  //임시로 고장페이지 결과보기 주소 설정
			return "redirect:/";
		
	}
	
	/*사용자가 대여이력보기*/
	@RequestMapping(value="/bikeRentHistory.do")
	public String bikeRentHistory(
			HttpSession session,
			Model md
			) {
		Object omidx = session.getAttribute("midx");
	    if (omidx == null) {//midx가 없으면 진입불가
	    	return "redirect:/member/memberLogin.do";
		}
	    int midx = (int)omidx;
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
	public String sendSMS(@RequestParam("phone") String userPhoneNumber, HttpSession session ) { // 휴대폰 문자보내기
	
		int randomNumber = (int)((Math.random()* (999999 - 100000 + 1)) + 100000);//난수 생성
		
		
		  // CoolSMS API 사용
		  String api_key = "NCSQ6K8YB71UK1Q5"; 
		  String api_secret ="RCJYGI0IER077RL27WSVXY75ZDIFKGFT"; 
		  Message coolsms = new Message(api_key, api_secret);
	  
		  HashMap<String, String> params = new HashMap<String, String>();
		  params.put("to", userPhoneNumber); // 수신전화번호
		  params.put("from","01056309412"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		  params.put("type","SMS"); params.put("text", "[타바] 인증번호는" + "["+randomNumber+"]" + "입니다.");
		
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
		System.out.println("페이들어옴");
	    return "bikeRent/pay";
	}
	
}






	
	
	
	

