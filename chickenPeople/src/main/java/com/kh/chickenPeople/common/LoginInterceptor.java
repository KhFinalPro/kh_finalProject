package com.kh.chickenPeople.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		final HttpSession session = request.getSession();
		String path = request.getRequestURI();
		if(path.contains("/chickenPeople/home.do") || path.contains("/chickenPeople/doLoginView.do")) { //접근 경로가 main.do인 경우에인 interceptor 체크 예외
			return true;
		}else if (session.getAttribute("loginUserId") == null) {  //세션 로그인이 없으면 리다이렉트 처리
			
			
			response.sendRedirect("/chickenPeople/home.do");
			return false;
		}
		
		return true;
	}
}