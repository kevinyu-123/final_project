package com.dine.root.reviews.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class reviewController {
	@RequestMapping("reviews")
	public String reviews() {
		return "detail_view/food_reviews";
	}
	@RequestMapping("upload_rest_Review")
	public void upload(MultipartHttpServletRequest m) {
		System.out.println("정보 1 : "+m.getParameter("rate"));
		System.out.println("정보 2 : "+m.getParameter("content"));
		List<MultipartFile> file = m.getFiles("btnAtt");

		for(int i=0 ; i < file.size() ; i++) {
			System.out.println(file.get(i).getOriginalFilename());
		}

	}
}
