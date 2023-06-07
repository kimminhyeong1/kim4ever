//package com.myezen.myapp.controller;
//
//import java.io.IOException;
//import java.util.Locale;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.client.RestTemplate;
//
//import com.siot.IamportRestClient.IamportClient;
//import com.siot.IamportRestClient.exception.IamportResponseException;
//import com.siot.IamportRestClient.response.IamportResponse;
//import com.siot.IamportRestClient.response.Payment;
//
//
//
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.MediaType;
//
//
//@Controller
//public class PayController {	
//		
//		private IamportClient api;
//		
//		public  PayController() {
//	    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
//		this.api = new IamportClient("7862328132623281","kDZZbKLnA05HdB4tKDk15FLYFkfbHqoIWedMTIKDUFXIkuibr9iIY6MqMUDaMxML3K5Z4bjtl6oMT1ID");
//		}
//			
//		@ResponseBody
//		@RequestMapping(value="/verifyIamport/{imp_uid}")
//		public IamportResponse<Payment> paymentByImpUid(
//				Model model
//				, Locale locale
//				, HttpSession session
//				, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
//		{	
//				return api.paymentByImpUid(imp_uid);
//		}
//		
//	}

	
//	private IamportClient api;
//	private RestTemplate restTemplate;
//	
//	public PayController() {
//    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력 ,  토큰발급
//		this.api = new IamportClient("7862328132623281","kDZZbKLnA05HdB4tKDk15FLYFkfbHqoIWedMTIKDUFXIkuibr9iIY6MqMUDaMxML3K5Z4bjtl6oMT1ID");
//		this.restTemplate = new RestTemplate();
//	}
//		
//	@ResponseBody
//	@RequestMapping(value="/verifyIamport/{imp_uid}/view.do")
//	public IamportResponse<Payment> paymentByImpUid(
//			Model model
//			, Locale locale
//			, HttpSession session
//			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
//	{	
//			System.out.println("검증들어옴");
//			return api.paymentByImpUid(imp_uid);
//	}
//	
	
//	
//	 @RequestMapping(value = "/webhook/view.do", method = RequestMethod.POST)
//	    public void handleWebhook(HttpServletRequest request) {
//	        // 웹훅 수신 및 결제 결과 처리 로직 구현
//	        String impUid = request.getParameter("imp_uid"); // Iamport에서 제공하는 결제 거래 ID
//	        System.out.println(impUid);
//	        // ...
//	        // 결제 결과 처리 로직 작성
//	        // ...
//
//	        // 사용자에게 결제 화면을 보여주기 전에 서버 코드에서
//	        HttpHeaders headers = new HttpHeaders();
//	        headers.setContentType(MediaType.APPLICATION_JSON);
//
//	        String url = "https://api.iamport.kr/payments/prepare";
//	        String merchantUid = "..."; // 가맹점 주문번호
//	        int amount = 420000; // 결제 예정금액
//
//	        String requestBody = "{\"merchant_uid\":\"" + merchantUid + "\",\"amount\":" + amount + "}";
//	        HttpEntity<String> requestEntity = new HttpEntity<>(requestBody, headers);
//	        restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);
//	    }
//	 
//	 
//	 
//	 
//	 
//	 
//	 
//	 
//	 
//	}
//	



