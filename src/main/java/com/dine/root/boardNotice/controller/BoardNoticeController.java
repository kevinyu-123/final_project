package com.dine.root.boardNotice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardNoticeController {

	@GetMapping("/news")
	public String news(HttpServletRequest request) {
		return "boardNotice/newsPage";
	}
	
	@GetMapping("/newsDetail")
	public String newsDetail() {
		return "boardNotice/newsDetail";
	}
}
