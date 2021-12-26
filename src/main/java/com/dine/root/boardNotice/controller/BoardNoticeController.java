package com.dine.root.boardNotice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dine.root.boardNotice.service.BoardNoticeService;
import com.dine.root.common.session.MemberSession;

@Controller

public class BoardNoticeController implements MemberSession{
	@Autowired
	BoardNoticeService service;
	

	@PostMapping("saveNotice")
	public void saveNotice( 
			HttpServletResponse response, 
			HttpServletRequest request) throws IOException {
		String message = service.saveNotice(request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
	}
	
	
	@GetMapping("news")
	public String news(HttpServletRequest request) {
		return "boardNotice/newsPage";
	}
	
	@GetMapping("newsDetail")
	public String newsDetail() {
		return "boardNotice/newsDetail";
	}
	
	
	
	
	
	
	



}
