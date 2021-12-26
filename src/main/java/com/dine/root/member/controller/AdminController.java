package com.dine.root.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dine.root.common.session.MemberSession;
import com.dine.root.member.service.AdService;

@Controller
public class AdminController implements MemberSession {
	@Autowired
	AdService service;

	@RequestMapping("adLogin")
	public String adLogin() {
		return "admin/adLogin";
	}

	@PostMapping("adloginChk")
	public String userCheck(@RequestParam String id,
			@RequestParam String pwd, RedirectAttributes rs) {

		int result = service.adloginChk(id, pwd);
		if (result == 0) {
			rs.addAttribute("id", id);
			return "redirect:successLogin";
		}
		return "admin/adLogin";

	}

	@GetMapping("/successLogin")
	public String successLogin(
			@RequestParam String id, 
			HttpSession session, 
			HttpServletResponse response) {

		int limitTime = 60 * 60 * 24 * 90;
		Cookie loginCookie = new Cookie("loginCookie", session.getId());
		loginCookie.setMaxAge(limitTime);
		loginCookie.setPath("/"); // 어느위치에서든 다 사용하겠다는 뜻 (위치:최상위)
		response.addCookie(loginCookie);
		session.setAttribute(LOGIN_ID,id);
		return "main/mainPage";
	}
	
	@GetMapping("writeNews")
		public String writeNews() {
		return "boardNotice/writeNews";
	}
	


}
