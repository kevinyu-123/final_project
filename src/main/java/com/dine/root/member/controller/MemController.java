package com.dine.root.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dine.root.member.dto.MemDTO;
import com.dine.root.member.service.MemberService;

@Controller
@RequestMapping("mem")
public class MemController {
	@Autowired
	MemberService service;
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	@GetMapping("/register")
	public String register() {
		return "member/register";
	}
	@GetMapping("/mypage")
	public String myPage() {
		return "member/mypage";
	}
	@GetMapping("/mylikes")
	public String myLikes() {
		return "member/mylikes";
	}
	
	@PostMapping("/memKakaoRegitser")
	public String memKakaoRegister(MemDTO dto) {
		String securePw = encoder.encode(dto.getPwd());
		dto.setPwd(securePw);
		int result = service.memKakaoRegister(dto);
		if(result == 1 ) {
		return "/main/mainPage";
		}else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/setKakaoInfo")
	public String setKakaoInfo(Model model, HttpSession session,@RequestParam Map<String, Object> map) {
		model.addAttribute("email",map.get("email"));
		model.addAttribute("password",map.get("id"));
		model.addAttribute("name",map.get("name"));
		return "member/setKakaoInfo";
	}
}
