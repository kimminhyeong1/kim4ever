package com.myezen.myapp.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter {

		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			//컨트롤러가 실행 이전에 처리해야 할 작업이 있는 경우 or 요청정보를 가공하거나 추가하는경우 사용
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("midx")==null) {
				//로그인 후 이동할 주소를 담는다
				saveDest(request);
				
				//response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");
				//request.getRequestDispatcher("/member/memberLogin.do").forward(request, response);
				if (!response.isCommitted()) { // 응답이 커밋되지 않은 경우에만 리다이렉션 수행
		            try {
		                response.sendRedirect(request.getContextPath() + "/member/memberLogin.do");
		            } catch (IllegalStateException e) {
		                // 이미 응답이 커밋된 경우 처리
		                // 응답이 이미 커밋된 경우 예외를 다시 던지거나 로그에 기록하기
		                e.printStackTrace();
		            }
		        }
		        return false; // 처리 중단
				
			}else {
				if (session.getAttribute("memberType").equals("M")) {
					
					if (request.getRequestURI().indexOf("/admin") != -1) {
						response.sendRedirect(request.getContextPath()+"/index.jsp");
					}
				}
			}
	
			return  true; //boolean타입이어서 true로 설정해줌
	} 
		
		private void saveDest(HttpServletRequest request) {
			//void타입이니까 return 값 없음
			
			String root = request.getContextPath();
			String uri = request.getRequestURI().substring(root.length());
			String query = request.getQueryString();
			
			if(query == null || query.equals("null")) {
				query = "";
			}else {
				query = "?"+query;
			}
			//GET은 데이터를 읽거나 검색할 때 사용되는 메소드 //데이터 읽을 때만 사용하고 수정할 때는 사용 ㄴㄴ
			//POST는 생성/업데이트 하기 위해 데이터를 보내는 데 사용
			if(request.getMethod().equals("GET")) { 
				request.getSession().setAttribute("dest", uri+query);
			}
		}
	
	
	
	
	
	
}
