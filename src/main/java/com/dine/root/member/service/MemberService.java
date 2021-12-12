package com.dine.root.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dine.root.member.dto.MemDTO;

public interface MemberService {
	public Map<String, Object> kakaoChk(Map<String, Object>paramMap);
	
	public Map<String, Object> setKakaoConnection(Map<String, Object>paramMap);
	
	public Map<String, Object> userKakaoLoginPro(Map<String, Object>paramMap);
	
	public boolean auth(Map<String, String>map,HttpServletRequest request);
	
	public int checkVal(String authVal,HttpSession session);
	
	public int memKakaoRegister(MemDTO dto);
}
