package com.dine.root.map.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dine.root.map.dto.MapDTO;
import com.dine.root.map.service.MapService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("map")
public class MapController {	
	@Autowired
	MapService ms;
	
	@GetMapping("mapmain")
	public String mapMain() {
		return "map/main";
	}
	
	@GetMapping("country_info")
	public String flyMap() {
		return "map/country_info";
	}
	
	@GetMapping("restaurant_info")
	public String resInfo(@RequestParam String nation,Model model) {
		//System.out.println(nation);
		List<MapDTO> list = ms.info(nation);
		model.addAttribute("jsonlist",JSONArray.fromObject(list));
		return "map/restaurant_info";
	}
}
