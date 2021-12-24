package com.dine.root.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dine.root.rest.service.restService;
import com.dine.root.rest.service.restServiceImpl;

@Controller
public class restController {
	
	@Qualifier("restServiceImpl")
	@Autowired restService rs;
	
	@RequestMapping("v")
	public String restDetail2(Model m) {
		int id = 41;
		rs.infoRest(m,id);
		rs.infoMenu(m,id);
		rs.infoReviews(m,id);
		
		return "/rest/val2";
		
		
	}
}
