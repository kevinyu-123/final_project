package com.dine.root.boardNotice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public interface BoardNoticeService {
	public String saveNotice(HttpServletRequest request);

}
