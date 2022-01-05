package com.dine.root.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dine.root.common.session.MemberSession;

public class CommonInterceptor extends HandlerInterceptorAdapter implements MemberSession {
	
	//인터셉트를 bean으로 등록 
	// 등록은 servlet-context에다가 한다. 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("컨트롤러 실행 전");
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN_ID) == null) {
			//response.sendRedirect("/root/member/login");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>"
					+ "alert('접근 권한이 없습니다');"
					//+ "location.href='/root/member/login';"
					+"location.href='"+request.getContextPath()+"/main';"
					+"</script>");
			return false;
		}
		return true;
	}

	
	
}