package com.dine.root.member.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dine.root.common.session.MemberSession;
import com.dine.root.member.config.NaverLoginBO;
import com.dine.root.member.dto.MemDTO;
import com.dine.root.member.service.MemService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController implements MemberSession {

	@Autowired
	MemService service;
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "member/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam Map<String, Object> paramMap, @RequestParam String code,
			@RequestParam String state, HttpSession session, HttpServletRequest request, MemDTO dto

	) throws IOException {

		System.out.println("여기는 callback");
		System.out.println("paramMap:" + paramMap);
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		model.addAttribute("result", apiResult);
		System.out.println("result" + apiResult);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println("apiResult =>" + apiResult);
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		Map<String, Object> naverConnectionCheck = service.naverConnectionCheck(apiJson);

		if (naverConnectionCheck == null) { // 일치하는 이메일 없으면 가입
			model.addAttribute("email", apiJson.get("email"));
			model.addAttribute("nickname", apiJson.get("nickname"));
			model.addAttribute("pwd", apiJson.get(""));
			model.addAttribute("id", apiJson.get("id"));

			return "member/setNaverInfo";

		} else if (naverConnectionCheck.get("NAVERLOGIN") == null && naverConnectionCheck.get("EMAIL") != null) {
			// 이메일 가입 되어있고 네이버 연동 안되어 있을시
			service.setNaverConnection(apiJson);
			Map<String, Object> loginCheck = service.userNaverLoginPro(apiJson);
			session.setAttribute(LOGIN_ID, loginCheck);
		

		} else { // 모두 연동 되어있을시
			Map<String, Object> loginCheck = service.userNaverLoginPro(apiJson);
			String name=(String) loginCheck.toString();
			String name1=name.substring(name.lastIndexOf("=")+1);
			String replace=name1.replace("}","");
		
			System.out.println(replace);
			session.setAttribute(LOGIN_ID,replace);

		}

		return "main/mainPage";
	}

	@PostMapping("/naverRegister")
	public String naverReg(MemDTO dto) {
		int result = service.userNaverRegisterPro(dto);
		if (result == 1) {
			return "main/mainPage";
		} else {
			return "redirect:/login";
		}
	}

}