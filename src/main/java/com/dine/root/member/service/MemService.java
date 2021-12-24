package com.dine.root.member.service;

import java.util.ArrayList
;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dine.root.boardFree.dto.BoardDTO;
import com.dine.root.boardFree_reply.dto.ReplyDTO;
import com.dine.root.member.dto.MemDTO;

public interface MemService {

	public MemDTO kakaoChk(MemDTO dto);
	public MemDTO setKakaoConnection(MemDTO dto);
	public MemDTO userKakaoLoginPro(MemDTO dto);

	public boolean auth(Map<String, String> map, HttpServletRequest request);
	public int checkVal(String authVal, HttpSession session);

	public int memKakaoRegister(MemDTO dto);
	public MemDTO getUserSessionId(String sessionId);
	public void keepLogin(String session_id, java.sql.Date session_date, String id);

	public int register(MemDTO dto);

	public MemDTO loginChk(MemDTO dto);

	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);
	public Map<String, Object> setNaverConnection(Map<String, Object> apiJson);
	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson);

	public Integer userNaverRegisterPro(MemDTO dto);

	public int idCheck(String id);
	public int emailCheck(String email);
	public int nameCheck(String name);

	public List<MemDTO> findId(String email);
	public int findIdChk(String email);
	public List<MemDTO> findPwd(String email);
	public int findPwdChk(String email);
	
	public int updatePassword(MemDTO dto);
	
	public int updateName(String name,String session_id);
	public int updatePwd(String pwd, String session_id);
	
	
	public ArrayList<BoardDTO> getBoardInfo(String writer);
	public ArrayList<ReplyDTO> getReplyInfo(String writer);
	public int deleteMember(String pwd, String session_id);
	
	
	public int addLikes(String liked_rest, String session_id);

	
	


	

}