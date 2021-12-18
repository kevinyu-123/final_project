package com.dine.root.member.controller;

import java.util.ArrayList;

import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping("/login")
	public String login(@CookieValue(value = "idCookie", required = false) Cookie idCookie, Model model) {
		if (idCookie != null) {
			model.addAttribute("idCookie", idCookie.getValue());
		}
		return "member/login";
	}

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

	@GetMapping("/mypage")
	public String myPage() {
		return "member/mypage";
	}

	@GetMapping("/mylikes")
	public String myLikes() {
		return "member/mylikes";
	}

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

	@PostMapping("/setKakaoInfo")
	public String setKakaoInfo(Model model, HttpSession session, @RequestParam Map<String, Object> map) {
		model.addAttribute("email", map.get("email"));
		model.addAttribute("password", map.get("id"));
		model.addAttribute("name", map.get("name"));
		return "member/setKakaoInfo";
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

			session.setAttribute(LOGIN_ID, check.getId());
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

			session.setAttribute(LOGIN_ID, check.getId());
			return "/main/mainPage";
			// 자동 로그인만 설정
		} else if ((encoder.matches(dto.getPwd(), check.getPwd()) || dto.getPwd().equals(check.getPwd()))
				&& autoLogin != null && saveId == null) {

			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setMaxAge(60 * 60 * 24 * 90);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);

			session.setAttribute(LOGIN_ID, check.getId());

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
			session.setAttribute(LOGIN_ID, check.getId());
			if (Cook != null) {
				Cook.setMaxAge(0);
				Cook.setPath("/");
				response.addCookie(Cook);
			}
			return "/main/mainPage";

		} else {
			return "member/login";
		}
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

	
	@RequestMapping(value = "/findIdView", method = RequestMethod.GET)
	public String findIdView() {
		return "/member/findIdView";
	}
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String searchId(MemDTO dto, Model model) {

		if (service.findIdChk(dto.getEmail()) == 0) {
			model.addAttribute("msg", "이메일을 확인해주세요");
			return "/member/findIdView";

		} else {
			model.addAttribute("member", service.findId(dto.getEmail()));
			return "/member/findId";
		}
	}


	@RequestMapping(value = "/findPwdView", method = RequestMethod.GET)
	public String findPwdView() {
		return "member/findPwdView";
	}

	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	public String findPwd(MemDTO dto, Model model) {
		if(service.findPwdChk(dto)==0) {
			model.addAttribute("msg","아이디와 이메일을 확인해 주세요");
			return "/member/findPwdView";
		}else {
			service.findPwd(dto.getEmail(),dto.getId());
			model.addAttribute("member",dto.getEmail());
			return "member/findPwd";
		}
	//저장되어있는 이메일코드를 쏴주고 새로 코드를 리셋한다음에 
		
	}
	
	
	  @GetMapping("/myboard")
	   public String myBoardList(Model model,HttpSession session) {
	      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	      String writer = (String) session.getAttribute(LOGIN_ID);
	      list = service.getBoardInfo(writer);
	      model.addAttribute("boardInfo",list);
	      return "member/myboard";
	   }
	   
	   @GetMapping("/myreply")
	   public String myReplyList(Model model,HttpSession session) {
	      ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
	      String writer = (String) session.getAttribute(LOGIN_ID);
	      list = service.getReplyInfo(writer);
	      model.addAttribute("replyInfo",list);
	      return "member/myreply";
	   }
	
	
	   @GetMapping("newprofile")
		public String account() {
			return "member/newprofile";
		}

}