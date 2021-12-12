package com.dine.root.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dine.root.common.session.MemberSession;
import com.dine.root.member.service.MemberService;

@RestController
public class KakaoLoginController implements MemberSession {
	@Autowired
	MemberService service;

		@PostMapping("/mem/kakaoLoginChk")
		public Map<String, Object> kakaoChk(@RequestParam Map<String,Object> paramMap, HttpSession session) throws Exception{
			System.out.println(paramMap);
			Map<String, Object> result = new HashMap<String, Object>();
			Map<String, Object> kakaoConChk = service.kakaoChk(paramMap);
			if(kakaoConChk == null) { //일치하는 이메일 없으면 가입
				result.put("JavaData", "register");
			}else if(kakaoConChk.get("kakaologin") == null && kakaoConChk.get("email") != null) {
				//이메일 가입 되어있고 카카오 연동 안되어 있을시
				System.out.println("kakaoLogin");
				service.setKakaoConnection(paramMap);
				Map<String, Object> loginCheck =  service.userKakaoLoginPro(paramMap);
				session.setAttribute("userInfo", loginCheck);
				session.setAttribute(LOGIN_ID,loginCheck);

				result.put("JavaData", "success");
			}else{
				Map<String, Object> loginCheck = service.userKakaoLoginPro(paramMap);
				session.setAttribute("userInfo", loginCheck);
				session.setAttribute(LOGIN_ID,loginCheck);

				result.put("JavaData", "success");
			}
			return result;
		}
	

			
}
