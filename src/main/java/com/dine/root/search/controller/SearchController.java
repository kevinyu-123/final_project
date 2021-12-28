package com.dine.root.search.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dine.root.search.Service.SearchService;
import com.dine.root.search.dto.SearchDTO;

@Controller
public class SearchController {
	@Autowired
	SearchService searchService;
	
	
	@GetMapping("search")
	public String search(HttpServletRequest request, Model model) {
		String keyword = request.getParameter("keyword");
		model.addAttribute("keyword", keyword);
		
		return "search/search";
	}
	
	@GetMapping("search_result")
	public String searchResult() {
		return "search/search_result";
	}
	
	@GetMapping("detail_search")
	public String detailSearch(HttpServletRequest request, Model model) {
		String country = request.getParameter("country");
		String addr = request.getParameter("addr");
		String food = request.getParameter("food");
		
		model.addAttribute("country", country);
		model.addAttribute("addr", addr);
		model.addAttribute("food", food);
		
		return "search/detail_search";
	}
	
	
}
