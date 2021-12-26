package com.dine.root.main.controller;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dine.root.common.session.MemberSession;
import com.dine.root.member.service.MemService;

@Controller
public class MainController implements MemberSession {

	@Autowired(required = false)
	MemService ms;

	@GetMapping("aboutus")
	public String aboutus() {
		return "default/aboutus";
	}
	@GetMapping("sitemap")
	public String sitemap() {
		return "default/sitemap";
	}
	
	
	@GetMapping("cookieChk")
	public void cookieChk(HttpServletResponse response) {
		Cookie cook = new Cookie("myCookie", "나의쿠키");
		cook.setMaxAge(60 * 60 * 24 );
		cook.setPath("/");
		response.addCookie(cook);
	
	}
	@GetMapping("popup")
	public String popup() {
		return "main/popup";
	}
	
	@GetMapping("main")
	public String myCookie(HttpServletResponse response, Model model,
			@CookieValue(value="myCookie",required=false) Cookie cook,
			HttpServletRequest request){

		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies )
				System.out.println(c.getName()+" : "+c.getValue());
		}

		if(cook != null )
			model.addAttribute("cook",cook.getValue());
		return "main/mainPage";
	}


}