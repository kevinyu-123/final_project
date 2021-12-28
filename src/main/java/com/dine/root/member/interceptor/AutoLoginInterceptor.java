package com.dine.root.member.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.dine.root.common.session.MemberSession;
import com.dine.root.member.dto.MemDTO;
import com.dine.root.member.service.MemService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter implements MemberSession {

	@Autowired
	MemService ms;

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if (loginCookie != null) {

			MemDTO dto = ms.getUserSessionId(loginCookie.getValue());
			
			if (dto != null) {
				request.getSession().setAttribute(LOGIN_ID, dto.getId());
			}
		}

		return true;
	}

}
