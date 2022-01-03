package com.dine.root.rest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("restaurant")
	public String restaurant(Model m, @RequestParam int id, HttpSession session) {
		String name = (String) session.getAttribute("session_user");
		
		/* session 에 있는 id 정보와 db에 저장 되어있는 레스토랑 PrimaryKey 를 사용하여 
			찜 등록 정보 , 
			레스토랑 정보, 
			레스토랑에 등록된 메뉴 정보,
			레스토랑에 적힌 메뉴 정보 불러오기
		*/
		if(name != null) {
			rs.infoLiked(m,name,id);
		}
		rs.infoRest(m,id);
		rs.infoMenu(m,id);
		rs.infoReviews(m,id);
		
		return "/rest/rest_detail";

	}
	
	@ResponseBody
	@RequestMapping(value = "liked_click", method = RequestMethod.POST, produces ="application/json; charset=UTF8;" )
	public HashMap<String,String> likedClick(@RequestBody Map<String, Object> idMap){
		HashMap<String,String> map = new HashMap<String, String>();
		
		/* 
		 회원 아이디와 레스토랑 아이디를 ajax로 가지고 와 등록
		 */
		if(idMap.get("memId").equals("")) {
			map.put("result","no");
			return map;
		}else {
			rs.updateLiked(idMap);
			map.put("result", "ok");
			System.out.println("좋아요 컨트롤러");
			return map;
		}

	}
	@ResponseBody
	@RequestMapping(value = "dliked_click", method = RequestMethod.POST)
	public HashMap<String,String> dlikedClick(@RequestBody Map<String, Object> idMap){
		HashMap<String,String> map = new HashMap<String, String>();
		rs.updateUnLiked(idMap);
		map.put("result", "no");
		return map;
	}
	
	
}
