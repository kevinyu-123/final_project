package com.dine.root.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dine.root.member.service.MemberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;



@Controller
public class NaverLoginController {
	@Autowired
	MemberService service;
	
	private NaverLoginBO naverloginbo = new NaverLoginBO();
	
	@RequestMapping(value="/login")
	public String userLogin(Model model,HttpSession session) {
		System.out.println("userLogin");	
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naver", naverAuthUrl);
		return "member/login";
	}

}
