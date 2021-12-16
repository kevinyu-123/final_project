package com.dine.root.member.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.dine.root.boardFree.dto.BoardDTO;
import com.dine.root.boardFree_reply.dto.ReplyDTO;
import com.dine.root.member.dto.MemDTO;

@Mapper
public interface MemMapper {
	
	public MemDTO kakaoChk(MemDTO dto);
	
	public MemDTO setKakaoConnection(MemDTO dto);
	
	public MemDTO userKakaoLoginPro(MemDTO dto);
	
	public int memKakaoRegister(MemDTO dto);
	
	public MemDTO getUserSessionId(String sessionId);
	
	public void keepLogin(Map<String, Object> map);
	
	public int register(MemDTO dto);

	public MemDTO loginChk(MemDTO dto);
	
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);
	
	public Map<String, Object> setNaverConnection(Map<String, Object> apiJson);
	
	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson);
	
	public int userNaverRegisterPro(MemDTO dto);
	
	public int idCheck(String id);
	
	public int emailCheck(String email);
	
	public ArrayList<BoardDTO> getBoardInfo(String writer);
	
	public ArrayList<ReplyDTO> getReplyInfo(String writer);

}
