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
import com.dine.root.member.dto.MemDTO;
import com.dine.root.member.service.MemService;

@RestController
public class KakaoLoginController implements MemberSession {
	@Autowired
	MemService service;

		@PostMapping("/kakaoLoginChk")
		public Map<String, Object> kakaoChk(MemDTO dto, HttpSession session) throws Exception{
			System.out.println(dto);
			Map<String, Object> result = new HashMap<String, Object>();
			MemDTO kakaoConChk = service.kakaoChk(dto);
			if(kakaoConChk == null) { //일치하는 이메일 없으면 가입
				result.put("JavaData", "register");
			}else if(kakaoConChk.getKakaologin() == null && kakaoConChk.getEmail() != null) {
				//이메일 가입 되어있고 카카오 연동 안되어 있을시
				service.setKakaoConnection(dto);
				MemDTO loginCheck =  service.userKakaoLoginPro(dto);
				session.setAttribute(LOGIN_ID, loginCheck.getName());
				result.put("JavaData", "success");
			}else{
				MemDTO loginCheck = service.userKakaoLoginPro(dto);
				session.setAttribute(LOGIN_ID, loginCheck.getName());
				result.put("JavaData", "success");
			}
			return result;
		}
	

			
}
