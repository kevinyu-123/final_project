package com.dine.root.boardEvent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.dine.root.boardEvent.service.BoardEventService;
import com.dine.root.common.session.MemberSession;

@Controller
public class BoardEventController implements MemberSession {
	
	@Autowired
	BoardEventService service;
		
	@GetMapping("writeEvent")
	public String writeEvent() {
		return "boardEvent/writeEvent";
	}
	
	
	@GetMapping("event")
	public String event() {
		return "boardEvent/eventPage";
	}
	
	@GetMapping("eventDetail")
	public String eventDetail() {
		return "boardEvent/eventDetail";
	}
	


}



