package com.dine.root.main.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.dine.root.common.session.MemberSession;
import com.dine.root.member.service.MemService;

@Controller
public class MainController implements MemberSession {

	@Autowired(required = false)
	MemService ms;

	@GetMapping("main")
	public String main() {
		return "main/mainPage";
	}
	
	@GetMapping("aboutus")
	public String aboutus() {
		return "default/aboutus";
	}
	@GetMapping("sitemap")
	public String sitemap() {
		return "default/sitemap";
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