package com.dine.root.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dine.root.common.session.MemberSession;

public class CommonInterceptor extends HandlerInterceptorAdapter implements MemberSession {


	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception { 
		HttpSession session = request.getSession();
	
		if (session.getAttribute(LOGIN_ID) == null) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('로그인 하세요');"
					+ "location.href='" + request.getContextPath() + "/naverlogin'; </script>");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("...");
	}

}


