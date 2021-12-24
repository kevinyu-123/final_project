package com.dine.root.member.service;

import java.sql.Date;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dine.root.boardFree.dto.BoardDTO;
import com.dine.root.boardFree_reply.dto.ReplyDTO;
import com.dine.root.common.session.MemberSession;
import com.dine.root.member.dto.MemDTO;
import com.dine.root.member.mapper.MemMapper;

@Service
public class MemServiceImpl implements MemService, MemberSession {
	@Autowired
	MemMapper mapper;

	@Autowired
	JavaMailSender mailSender;

	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@Override
	public MemDTO kakaoChk(MemDTO dto) {
		return mapper.kakaoChk(dto);
	}

	@Override
	public MemDTO setKakaoConnection(MemDTO dto) {
		return mapper.setKakaoConnection(dto);
	}

	@Override
	public MemDTO userKakaoLoginPro(MemDTO dto) {
		return mapper.userKakaoLoginPro(dto);
	}

	private int sendMail(String to, String subject, String body) {
		int result = 0;
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(body, true);
			mailSender.send(message);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}

	@Override
	public boolean auth(Map<String, String> map, HttpServletRequest request) {
		int result;
		String name = map.get("name");
		String email = map.get("email");
		System.out.println("name: " + name);
		System.out.println("email: " + email);
		HttpSession session = request.getSession();
		String userKey = rand();
		session.setAttribute("emailChk", userKey);
		String body = "<h2>안녕하세요</h2><hr>" + "<h3>" + name + "님의</h3>" + "<p>인증번호는  <b>" + userKey
				+ "</b>   입니다.</p>";
		result = sendMail(email, "DinigLab 이메일인증입니다.", body);
		if (result == 1) {
			return true;
		} else {
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
		if (session.getAttribute("emailChk").equals(authVal)) {
			session.invalidate();
			result = 1;
			return result;
		} else {
			return result;
		}
	}

	@Override
	public int memKakaoRegister(MemDTO dto) {
		int result = 0;
		try {
			result = mapper.memKakaoRegister(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MemDTO getUserSessionId(String sessionId) {
		return mapper.getUserSessionId(sessionId);
	}

	@Override
	public void keepLogin(String session_id, Date session_date, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("session_id", session_id);
		map.put("session_date", session_date);
		map.put("id", id);
		mapper.keepLogin(map);
	}

	@Override
	public int register(MemDTO dto) {
		String securePwd = encoder.encode(dto.getPwd());
		dto.setPwd(securePwd);
		int result = 0;
		try {
			result = mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MemDTO loginChk(MemDTO dto) {
		return mapper.loginChk(dto);
	}

	/* 네이버 회원가입 */
	@Override
	public Integer userNaverRegisterPro(MemDTO dto) {
		String securePwd = encoder.encode(dto.getPwd());
		dto.setPwd(securePwd);
		Integer result = 0;
		try {
			result = mapper.userNaverRegisterPro(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 네이버 로그인관련 메소드 */
	@Override
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) {
		return mapper.naverConnectionCheck(apiJson);
	}

	@Override
	public Map<String, Object> setNaverConnection(Map<String, Object> apiJson) {
		return mapper.setNaverConnection(apiJson);
	}

	@Override
	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson) {
		return mapper.userNaverLoginPro(apiJson);
	}

	/* 아이디중복체크 */
	@Override
	public int idCheck(String id) {
		int cnt = mapper.idCheck(id);
		return cnt;
	}

	/* 이메일중복체크 */
	@Override
	public int emailCheck(String email) {
		int cnt = mapper.emailCheck(email);
		return cnt;
	}

	/* 닉네임중복체크 */
	@Override
	public int nameCheck(String name) {
		int cnt = mapper.nameCheck(name);
		return cnt;
	}

	/* 아이디찾기 */
	@Override
	public List<MemDTO> findId(String email) {
		return mapper.findId(email);
	}

	@Override
	public int findIdChk(String email) {
		return mapper.findIdChk(email);
	}

	/* 비밀번호찾기 */
	@Override
	public List<MemDTO> findPwd(String email) {
		return mapper.findPwd(email);
	}

	@Override
	public int findPwdChk(String email) {
		return mapper.findPwdChk(email);
	}

	/* 비밀번호찾을때 이메일코드비번으로세팅 */
	@Override
	public int updatePassword(MemDTO dto) {
		String newKey =rand();
		dto.setEmail_auth(newKey);
		
		int result = 0;
		try {
			result = mapper.updatePassword(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
	

	@Override
	public ArrayList<BoardDTO> getBoardInfo(String writer) {
		return mapper.getBoardInfo(writer);
	}

	@Override
	public ArrayList<ReplyDTO> getReplyInfo(String writer) {
		return mapper.getReplyInfo(writer);
	}

	/* 닉네임수정 */
	@Override
	public int updateName(String name, String session_id) {
		int result = 0;
		result = mapper.updateName(name, session_id);
		return result;
	}

	/* 비밀번호수정 */
	@Override
	public int updatePwd(String pwd, String session_id) {
		int result = 0;
		String securePwd = encoder.encode(pwd);
		result = mapper.updatePwd(securePwd, session_id);
		return result;
	}
	/*회원탈퇴*/

	@Override
	public int deleteMember(String pwd, String session_id) {
		int result = 0;
		result = mapper.deleteMember(pwd, session_id);
		System.out.println(result+"ser");
		return result;
	}

	
	
	@Override
	public int addLikes(String liked_rest, String session_id) {
		int result = 0;
		result = mapper.addLikes(liked_rest, session_id);
		return result;

	}
	
	
	
	

}