package com.dine.root.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("main")
	public String mainPage() {
		return "main/mainPage";
	}
	
	@GetMapping("aboutus")
	public String aboutUs() {
		return"default/aboutus";
	}
	
	
	
}
