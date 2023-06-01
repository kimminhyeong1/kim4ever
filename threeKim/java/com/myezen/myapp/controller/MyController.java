package com.myezen.myapp.controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myezen.myapp.service.MyService;
import com.myezen.myapp.util.NaverCloudPlatformSmsSender;

public class MyController {

	 private final MyService myService;

	    public MyController(MyService myService) {
	        this.myService = myService;
	    }
	
	
	
	
	
	 @PostMapping("/sendVerificationCode")
	    public void sendVerificationCode(@RequestParam("phoneNumber") String phoneNumber) {
	        String verificationCode = myService.generateVerificationCode();
	        NaverCloudPlatformSmsSender.sendVerificationCode(phoneNumber, verificationCode);
	        // 휴대폰 인증 코드 발송 후 처리할 로직 작성
	    }
}
