package com.dine.root.rest.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value = "liked_click", method = RequestMethod.POST)
	public HashMap<String,String> likedClick(HttpServletRequest request){
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("result", "ok");
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "dliked_click", method = RequestMethod.POST)
	public HashMap<String,String> dlikedClick(HttpServletRequest request){
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("result", "no");
		return map;
	}
	
	
}
