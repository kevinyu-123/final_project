package com.dine.root.member.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.dine.root.member.dto.MemDTO;

@Mapper
public interface MemMapper {
	
	
	public Map<String, Object> kakaoChk(Map<String, Object>paramMap);
	
	public Map<String, Object> setKakaoConnection(Map<String, Object> paramMap);
	
	public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap);
	
	public int memKakaoRegister(MemDTO dto);
	
}
