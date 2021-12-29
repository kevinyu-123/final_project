package com.dine.root.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView searchResult(@RequestParam(defaultValue = "keyword") String keyword, Model model) 
							throws Exception {
		
		List<SearchDTO> kList = searchService.viewAll(keyword);
		int count = searchService.countArticle(keyword);
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kList", kList);
		map.put("count", count);
		map.put("keyword", keyword);
		mav.addObject("map", map);
		mav.setViewName("search/search_result");
		return mav;		
	}
	
//	@GetMapping("detail_search")
//	public ModelAndView detailSearch(HttpServletRequest request, Model model) {
//		String country = request.getParameter("country");
//		String addr = request.getParameter("addr");
//		String food = request.getParameter("food");
//
//		List<SearchDTO> list = searchService.categorise(country, addr, food);
//		ModelAndView mav = new ModelAndView();
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("list", list);
//		map.put("country", country);
//		map.put("addr", addr);
//		map.put("food", food);
//		mav.addObject("map", map);
//		mav.setViewName("search/test");
//		return mav;
//	}
	
	@GetMapping("detail_search")
	public String detailSearch() {
		return "search/detail_search";
	}
	
	@GetMapping("search_result_detail")
	public ModelAndView detailSearch(@RequestParam(defaultValue = "") String country, 
									 @RequestParam(defaultValue = "") String addr,
									 @RequestParam(defaultValue = "") String food,
									 Model model) throws Exception {
		
		List<SearchDTO> dList = searchService.categorise(country, addr, food);
		int count = searchService.countCategories(country, addr, food);
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dList", dList);
		map.put("count", count);
		map.put("country", country);
		map.put("addr", addr);
		map.put("food", food);
		mav.addObject("map", map);
		mav.setViewName("search/search_result");
		return mav;
	}
}
