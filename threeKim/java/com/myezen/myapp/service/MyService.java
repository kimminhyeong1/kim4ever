package com.myezen.myapp.service;

import org.springframework.stereotype.Service;

@Service
public class MyService {
	
	 public String generateVerificationCode() {
	        // 휴대폰 인증 코드를 생성하는 로직 작성
	        // 예: 랜덤한 6자리 숫자 생성 등

	        return "123456"; // 생성된 인증 코드 반환 (임시로 "123456"으로 설정)
	    }
}
