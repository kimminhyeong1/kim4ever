package com.myezen.myapp.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myezen.myapp.service.MyService;
import com.myezen.myapp.util.NaverCloudPlatformSmsSender;


@Controller
public class MyController {

	 private final MyService myService;

	 
	 	@Autowired
	    public MyController(MyService myService) {
	        this.myService = myService;
	    }
	
	
	
	
	 @ResponseBody
	 @PostMapping("/sendVerificationCode")
	    public void sendVerificationCode(@RequestParam("phoneNumber") String phoneNumber) {
		 String verificationCode = myService.generateVerificationCode(); // 인증 코드 생성 추가
		 
        NaverCloudPlatformSmsSender.sendVerificationCode(phoneNumber, verificationCode);
        // 휴대폰 인증 코드 발송 후 처리할 로직 작성
	    }
}
