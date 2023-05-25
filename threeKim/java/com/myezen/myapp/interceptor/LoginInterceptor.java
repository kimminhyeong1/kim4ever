package com.myezen.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override																							//담아서 화면까지 가져가는 용도
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
		
		Object midx = modelAndView.getModel().get("midx");
		Object memberName = modelAndView.getModel().get("memberName");
		
		if(midx != null) {
			request.getSession().setAttribute("midx", midx);
			request.getSession().setAttribute("memberName", memberName);
			 
		} 
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("midx") != null) {
			session.removeAttribute("midx");
			session.removeAttribute("memberName");
			session.invalidate(); //초기화(제일 중요)
		}
		
		return true;
	}
}
