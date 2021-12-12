package com.dine.root.member.service;

import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dine.root.member.dto.MemDTO;
import com.dine.root.member.mapper.MemMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemMapper mapper;
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public Map<String, Object> kakaoChk(Map<String, Object>paramMap) {
		return mapper.kakaoChk(paramMap); 
		}

	@Override
	public Map<String, Object> setKakaoConnection(Map<String, Object> paramMap) {
		return mapper.setKakaoConnection(paramMap);
	}

	@Override
	public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap) {
		return mapper.userKakaoLoginPro(paramMap);
	}
	
	private int sendMail(String to, String subject, String body) {
		int result = 0;
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(body,true);
			mailSender.send(message);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			
		}	
		return result;
	}

	@Override
	public boolean auth(Map<String, String>map,HttpServletRequest request) {
		int result;
		String name = map.get("name");
		String email = map.get("email");
		System.out.println("name: "+name);
		System.out.println("email: "+email);
		HttpSession session = request.getSession();
		String userKey = rand();
		session.setAttribute("emailChk", userKey);
		String body="<h2>안녕하세요</h2><hr>"
				  +"<h3>"+name+" 님</h3>"
				  +"<p>인증번호는 :   <b>"+userKey+"</b>   입니다.</p>";
		result = sendMail(email, "이메일인증입니다.", body);
		if(result == 1) {
			return true;
		}else {
			return false;
		}	
	}
	
	private String rand() {
		Random ran = new Random();
		String str = "";
		int num;
		while (str.length() != 20) {
			num = ran.nextInt(75) + 48;// 0~74 + 48 (숫자,소문자, 대문자)
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				str += (char) num;
			} else {
				continue;
			}
		}
		return str;
	}

	@Override
	public int checkVal(String authVal, HttpSession session) {
		int result = 0;
		if(session.getAttribute("emailChk").equals(authVal)) {
			session.invalidate();
			result = 1;
			return result;
		}else {
			return result;
		}
	}

	@Override
	public int memKakaoRegister(MemDTO dto) {
		int result = 0;
		try {
			result = mapper.memKakaoRegister(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	


}
