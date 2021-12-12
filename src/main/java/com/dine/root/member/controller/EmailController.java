package com.dine.root.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dine.root.member.service.MemberService;

@RestController
public class EmailController {
	@Autowired
	MemberService service;
	
	@PostMapping(value="mem/auth", produces="application/json; charset=utf-8")
	public boolean auth(@RequestBody Map<String , String> map,HttpServletRequest request) {
		System.out.println();
		boolean msg = service.auth(map,request);
		return msg;

	}
	
	@PostMapping(value="mem/email_auth/{email_val}",produces="application/json; charset=utf-8")
	public int auth_chk(@PathVariable String email_val, HttpSession session ) {
		int result = service.checkVal(email_val,session);
		return result;
	}
	
	
}
