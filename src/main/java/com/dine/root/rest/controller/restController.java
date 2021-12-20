package com.dine.root.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dine.root.rest.service.restServiceImpl;

@Controller
public class restController {
	@Qualifier("restServiceImpl")
	@Autowired restServiceImpl rs;
	@RequestMapping("r")
	public String restDetail(Model m) {
		int id = 22;
		int check = rs.infoRest(m,id);
		return "/rest/rest_detail";
	}
}
