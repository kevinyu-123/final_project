package com.dine.root.member.mapper;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.dine.root.boardFree.dto.BoardDTO;
import com.dine.root.boardFree_reply.dto.ReplyDTO;
import com.dine.root.member.dto.AdminDTO;
import com.dine.root.member.dto.MemDTO;
import com.dine.root.rest.dto.restDTO;

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
	public int nameCheck(String name);

	public List<MemDTO> findId(String email);
	public int findIdChk(String email);
	
	public List<MemDTO> findPwd(String email);
	public int findPwdChk(String email);
	
	public ArrayList<BoardDTO> getBoardInfo(String writer);
	public ArrayList<ReplyDTO> getReplyInfo(String writer);
	
	public int updatePassword(MemDTO dto);

	public int updateName(@Param("name") String name, @Param("session_id") String session_id);

	public int updatePwd(@Param("pwd") String pwd, @Param("session_id") String session_id);

	public int deleteMember(@Param("pwd") String pwd, @Param("session_id") String session_id);

	public AdminDTO getMember(String id);
	
	public MemDTO getLikes(String session_id);
	
	public restDTO getRest(String rest_name);

	






	

}