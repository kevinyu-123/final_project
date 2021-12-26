package com.dine.root.boardEvent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.dine.root.common.session.MemberSession;

@Controller
public class BoardEventController implements MemberSession {
	
	
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