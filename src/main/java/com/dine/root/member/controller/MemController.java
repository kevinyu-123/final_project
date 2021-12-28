package com.dine.root.member.controller;

import java.util.ArrayList;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dine.root.boardFree.dto.BoardDTO;
import com.dine.root.boardFree_reply.dto.ReplyDTO;
import com.dine.root.common.session.MemberSession;
import com.dine.root.member.dto.MemDTO;
import com.dine.root.member.service.MemService;

@Controller
public class MemController implements MemberSession {
	@Autowired
	MemService service;

	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

///////////////* 로그인 체크 *///////////////////

	@GetMapping("/login")
	public String login(@CookieValue(value = "idCookie", required = false) Cookie idCookie, Model model) {
		if (idCookie != null) {
			model.addAttribute("idCookie", idCookie.getValue());
		}
		return "member/login";
	}

	@PostMapping("/loginChk")
	public String loginChk(MemDTO dto, HttpSession session, HttpServletResponse response,
			@RequestParam(required = false) String autoLogin, Model model,
			@RequestParam(required = false) String saveId,
			@CookieValue(value = "idCookie", required = false) Cookie Cook) {
		MemDTO check = service.loginChk(dto);
		System.out.println("auto: " + autoLogin);
		System.out.println("id:" + saveId);
		if (check == null) {
			return "/member/login";
			// 자동로그인, 아이디저장 둘다 설정
		} else if ((encoder.matches(dto.getPwd(), check.getPwd()) || dto.getPwd().equals(check.getPwd()))
				&& autoLogin != null && saveId != null) {

			session.setAttribute(LOGIN_ID, check.getName());
			model.addAttribute("autologin", autoLogin);

			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setMaxAge(60 * 60 * 24 * 90);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);

			Cookie idCookie = new Cookie("idCookie", check.getId());
			idCookie.setMaxAge(60 * 60 * 24 * 90);
			idCookie.setPath("/");
			response.addCookie(idCookie);

			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date()); // 현재 날짜를 얻어옴
			cal.add(Calendar.MONTH, 3); // 현재 날짜에서 3개월 뒤로 설정

			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
			service.keepLogin(session.getId(), limitDate, check.getId());

			return "/main/mainPage";
			// 아이디 저장만 설정
		} else if ((encoder.matches(dto.getPwd(), check.getPwd()) || dto.getPwd().equals(check.getPwd()))
				&& autoLogin == null && saveId != null) {

			Cookie idCookie = new Cookie("idCookie", check.getId());
			idCookie.setMaxAge(60 * 60 * 24 * 90);
			idCookie.setPath("/");
			response.addCookie(idCookie);

			session.setAttribute(LOGIN_ID, check.getName());
			return "/main/mainPage";
			// 자동 로그인만 설정
		} else if ((encoder.matches(dto.getPwd(), check.getPwd()) || dto.getPwd().equals(check.getPwd()))
				&& autoLogin != null && saveId == null) {

			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setMaxAge(60 * 60 * 24 * 90);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);

			session.setAttribute(LOGIN_ID, check.getName());

			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date()); // 현재 날짜를 얻어옴
			cal.add(Calendar.MONTH, 3); // 현재 날짜에서 3개월 뒤로 설정

			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
			service.keepLogin(session.getId(), limitDate, check.getId());
			if (Cook != null) {
				Cook.setMaxAge(0);
				Cook.setPath("/");
				response.addCookie(Cook);
			}
			return "/main/mainPage";
			// 둘다 설정하지 않음
		} else if ((encoder.matches(dto.getPwd(), check.getPwd()) || dto.getPwd().equals(check.getPwd()))
				&& autoLogin == null && saveId == null) {
			session.setAttribute(LOGIN_ID, check.getName());
			if (Cook != null) {
				Cook.setMaxAge(0);
				Cook.setPath("/");
				response.addCookie(Cook);
			}
			return "redirect:/main";

		} else {
			return "member/login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response,
			@CookieValue(value = "loginCookie", required = false) Cookie loginCookie) {
		if (LOGIN_ID != null) {
			if (loginCookie != null) {
				loginCookie.setMaxAge(0);
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
				service.keepLogin("nan", new java.sql.Date(System.currentTimeMillis()),
						(String) session.getAttribute(LOGIN_ID));
			}
			session.invalidate();
		}
		return "redirect:/main";
	}

	/* 카카오 가입 */
	@PostMapping("/memKakaoRegitser")
	public String memKakaoRegister(MemDTO dto) {
		String securePw = encoder.encode(dto.getPwd());
		dto.setPwd(securePw);
		int result = service.memKakaoRegister(dto);
		if (result == 1) {
			return "/main/mainPage";
		} else {
			return "redirect:/naverlogin";
		}
	}

	/* 카카오 세팅 */
	@PostMapping("/setKakaoInfo")
	public String setKakaoInfo(Model model, HttpSession session, @RequestParam Map<String, Object> map) {
		model.addAttribute("email", map.get("email"));
		model.addAttribute("password", map.get("id"));
		model.addAttribute("name", map.get("name"));
		return "member/setKakaoInfo";
	}
///////////////* 회원가입할때 *///////////////////

	@GetMapping("/register_form")
	public String registerForm() {
		return "member/register";
	}

	@RequestMapping(value = "/register", method = { RequestMethod.GET, RequestMethod.POST })
	public String register(MemDTO dto) {
		int result = service.register(dto);
		if (result == 1) {
			return "redirect:login";
		}
		return "redirect:register_form";
	}

	/* 회원가입 아이디 중복체크 */
	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam String id) {
		int cnt = service.idCheck(id);
		return cnt;
	}

	/* 회원가입 이메일 중복체크 */
	@PostMapping("emailCheck")
	@ResponseBody
	public int emailChk(@RequestParam String email) {
		int cnt = service.emailCheck(email);
		return cnt;
	}

	/* 회원가입 닉네임 중복체크 */
	@PostMapping("nameCheck")
	@ResponseBody
	public int nameChk(@RequestParam String name) {
		int cnt = service.nameCheck(name);
		return cnt;
	}
///////////////* 아이디 비번찾기 *///////////////////

	/* 아이디찾기 */
	@RequestMapping(value = "/findIdView", method = RequestMethod.GET)
	public String findIdView() {
		return "/member/findIdView";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(MemDTO dto, Model model) {

		if (service.findIdChk(dto.getEmail()) == 0) {
			model.addAttribute("msg", "이메일을 확인해주세요");
			return "/member/findIdView";
		} else {
			model.addAttribute("member", service.findId(dto.getEmail()));
			return "/member/findId";
		}
	}

	/* 비밀번호찾기 */
	@RequestMapping(value = "/findPwdView", method = RequestMethod.GET)
	public String findPwdView() {
		return "/member/findPwdView";
	}

	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	public String findPwd(MemDTO dto, Model model) {
		if (service.findPwdChk(dto.getEmail()) == 0) {
			model.addAttribute("msg", "이메일을 확인해 주세요");
			return "/member/findPwdView";

		} else {
			model.addAttribute("member", service.findPwd(dto.getEmail()));

			return "/member/findPwd";
		}

	}

	/* 비밀번호찾을때 이메일코드 비번으로 업뎃하기 */
	@RequestMapping(value = "updatePassword", method = RequestMethod.POST)
	public String updatePassword(MemDTO dto) {
		dto.setPwd(dto.getEmail_auth());
		System.out.println(dto.getPwd());

		int result = service.updatePassword(dto);
		if (result == 1) {
			return "member/login";
		}
		return "main";
	}

///////////////*account settings *///////////////////

	@GetMapping("newprofile")
	public String account() {
		return "member/newprofile";
	}

	/* 이름수정 */
	@RequestMapping(value = "updateName/{name}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int updateName(@PathVariable String name, HttpSession session) {
		String session_id = (String) session.getAttribute(LOGIN_ID);
		int result = service.updateName(name, session_id);
		return result;
	}

	/* 비밀번호수정 */
	@RequestMapping(value = "updatePwd/{pwd}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int updatePwd(@PathVariable String pwd, HttpSession session) {
		String session_id = (String) session.getAttribute(LOGIN_ID);
		int result = service.updatePwd(pwd, session_id);
		return result;
	}

	/* 비밀번호수정 */
	@RequestMapping(value = "deleteMember/{pwd}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int deleteMember(@PathVariable String pwd, HttpSession session) {
		String session_id = (String) session.getAttribute(LOGIN_ID);
		int result = service.deleteMember(pwd, session_id);
		System.out.println(result);
		session.invalidate();
		return result;
	}

///////////////*mypage이동*///////////////////

	@GetMapping("/mypage")
	public String myPage() {
		return "member/mypage";
	}

	/* 내가쓴글 */
	@GetMapping("/myboard")
	public String myBoardList(Model model, HttpSession session) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String writer = (String) session.getAttribute(LOGIN_ID);
		list = service.getBoardInfo(writer);
		model.addAttribute("boardInfo", list);
		return "member/myboard";
	}

	/* 내가쓴댓글 */
	@GetMapping("/myreply")
	public String myReplyList(Model model, HttpSession session) {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		String writer = (String) session.getAttribute(LOGIN_ID);
		list = service.getReplyInfo(writer);
		model.addAttribute("replyInfo", list);
		return "member/myreply";
	}



	@GetMapping("/likeList")
	public String likeList(MemDTO dto, Model model, HttpSession session) {
		String session_id = (String) session.getAttribute(LOGIN_ID);
		ArrayList<MemDTO> list = new ArrayList<MemDTO>();
		list= service.getLikes(session_id);
		model.addAttribute("likes",list);
		System.out.println(list);
		
		return "member/mylikes";
	}

}