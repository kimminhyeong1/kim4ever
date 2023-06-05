package com.myezen.myapp.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PayController {
	
	private IamportClient api;
	
	public PayController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력 ,  토큰발급
		this.api = new IamportClient("7862328132623281","kDZZbKLnA05HdB4tKDk15FLYFkfbHqoIWedMTIKDUFXIkuibr9iIY6MqMUDaMxML3K5Z4bjtl6oMT1ID");
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	
}
