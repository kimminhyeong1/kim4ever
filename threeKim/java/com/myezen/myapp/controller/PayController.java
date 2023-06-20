package com.myezen.myapp.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

	/*자전거 결제*/
@Controller
public class PayController {
	
	private IamportClient api;
	
	public PayController() {
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("7862328132623281","VdxBnSTJBqwo00ZuD3rlCC7skBjyEsjFf1XyOVQchbsSaGCJaLSg3m9ya6X4ucWxHM1moy9jLXZJP0ve");
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}/pay.do", method = RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(
			Model model,
			Locale locale,
			HttpSession session,
			@PathVariable(value= "imp_uid") String imp_uid
			) throws IamportResponseException, IOException {
		
		System.out.println("imp_uid: " + imp_uid);
		return api.paymentByImpUid(imp_uid);
	}
}


	
