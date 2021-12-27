package com.dine.root.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dine.root.common.session.MemberSession;
import com.dine.root.member.dto.AdminDTO;
import com.dine.root.member.service.AdService;

@Controller
public class AdminController implements MemberSession {
	@Autowired
	AdService service;

	@RequestMapping("adLogin")
	public String adLogin() {
		return "admin/adLogin";
	}
	
	@PostMapping("adloginChk")
	public String userCheck(AdminDTO dto,HttpSession session) {
		AdminDTO chk = service.adloginChk(dto.getId());
		if (chk.getId().equals(dto.getId()) && chk.getPwd().equals(dto.getPwd())) {
			session.setAttribute(LOGIN_ID, chk.getName());
			return "redirect:/main";
		}
		return "admin/adLogin";

	}

	

}