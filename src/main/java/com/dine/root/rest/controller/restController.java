package com.dine.root.rest.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dine.root.rest.service.restService;

@Controller
public class restController {
	
	@Qualifier("restServiceImpl")
	@Autowired restService rs;
	
	@RequestMapping("v")
	public String restDetail2(Model m, @RequestParam int id) {
		//int id = 41;
		rs.infoRest(m,id);
		rs.infoMenu(m,id);
		rs.infoReviews(m,id);
		
		return "/rest/val2";

	}
	
	@ResponseBody
	@RequestMapping(value = "liked_click", method = RequestMethod.POST, produces ="application/json; charset=UTF8;" )
	public HashMap<String,String> likedClick(@RequestBody Map<String, Object> idMap){
		HashMap<String,String> map = new HashMap<String, String>();
		System.out.println("멤버 아이디 : "+idMap.get("memId"));
		System.out.println(idMap.toString());
		rs.updateLiked(idMap);
		map.put("result", "ok");
		System.out.println("좋아요 컨트롤러");
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "dliked_click", method = RequestMethod.POST)
	public HashMap<String,String> dlikedClick(@RequestBody Map<String, Object> idMap){
		HashMap<String,String> map = new HashMap<String, String>();
		rs.updateUnLiked(idMap);
		map.put("result", "no");
		System.out.println("안좋아요 컨트롤러");
		return map;
	}
	
	
}
