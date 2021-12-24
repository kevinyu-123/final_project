package com.dine.root.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dine.root.search.Service.SearchService;
import com.dine.root.search.dto.SearchDTO;

@Controller
public class SearchController {
	@Autowired
	SearchService searchService;
	
	
	@GetMapping("search")
	public String search() {
		
		return "search/search";
	}
	
	@GetMapping("search_result")
	public String searchResult() {
		return "search/search_result";
	}
	
//	@RequestMapping("test")
//	public String test(Model model) {
//		model.addAttribute("viewAll", searchService.viewAll());
//		return "search/test";
//	}
	
//	@RequestMapping("search_result")
//	public String test(HttpServletRequest request, Model model) {
//		String keyword = request.getParameter("keyword");
//		model.addAttribute("keyword", keyword);
//		System.out.println("입력값: " + keyword);
//		
//		return "search/search_result";
//	}
	
//	@RequestMapping("list.do")
//	public String testKeyword(
//								@RequestParam(defaultValue = "foodName") String searchOption,
//								@RequestParam(defaultValue = "") String keyword ) throws Exception {
//		
//		List<SearchDTO> list = searchService.listAll(searchOption, keyword);
//		
//		ModelAndView mav = new ModelAndView();
//		Map<String, Object> map = new HashMap<>();
//		
//		map.put("list", list);
//		map.put("search_option", searchOption);
//		map.put("keyword", keyword);
//		mav.addObject("map", map);
//		
//		System.out.println("map" + map);
//		mav.setViewName("search/test");
//		
//		return "search/test";
//	}
}
