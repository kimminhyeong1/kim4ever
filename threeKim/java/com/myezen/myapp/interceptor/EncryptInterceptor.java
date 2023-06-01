package com.myezen.myapp.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myezen.myapp.util.AESUtil;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class EncryptInterceptor extends HandlerInterceptorAdapter {
	//암호화 인터셉터
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 요청이 들어오면 컨트롤러에 진입하기 전에 암호화 처리
		HttpSession session = request.getSession();
        
		//
		String bikeRentQR = request.getContextPath() + "/bikeRent/bikeRentQR.do";
		if (request.getRequestURI().equals(bikeRentQR)) {
			System.out.println("QR 암호화인터셉터 들어옴");
			//URL이 QR로만오면 암호화처리  
	        //String encryptedText = AESUtil.encrypt(request.getParameter("data")); // 데이터 암호화
			String encryptedText = AESUtil.encrypt("bkidx=1"); // 데이터 암호화
	        request.setAttribute("encryptedData", encryptedText); // 암호화된 데이터를 요청 속성에 저장
		}
			 
        
        
        
        //암호화되어있는 다른URL 다 복호화
        // 요청이 들어오면 컨트롤러에 진입하기 전에 복호화 처리
        //String decryptedText = AESUtil.decrypt((String) request.getAttribute("encryptedData")); // 암호화된 데이터 복호화
        //response.getWriter().write(decryptedText); // 복호화된 데이터를 응답으로 전송
        
        
        return true; // 컨트롤러로 진입
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 컨트롤러가 실행된 후, 응답 전에 암호화 처리

        //String encryptedText = AESUtil.encrypt(request.getParameter("data")); // 데이터 암호화
        //request.setAttribute("encryptedData", encryptedText); // 암호화된 데이터를 요청 속성에 저장
    }

	
	
	
	
	
	
}
