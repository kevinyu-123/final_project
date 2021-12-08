package com.dine.root.reviews.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dine.root.reviews.service.reviewsService;

@Controller
public class reviewsController {
	@Autowired reviewsService rs;
	@RequestMapping("rest_reviews_form")
	public String restReviews() {
		return "rest/rest_reviews_form";
	}
	@RequestMapping("food_reviews_form")
	public String foodReviews() {
		return "food/food_reviews_form";
	}
	@RequestMapping("upload_rest_Review")
	public String upload(MultipartHttpServletRequest m) {
		System.out.println("정보 1 : "+m.getParameter("rate"));
		System.out.println("정보 2 : "+m.getParameter("content"));
		List<MultipartFile> file = m.getFiles("restImgs");
		for(int i=0 ; i < file.size() ; i++) {
			System.out.println("파일 이름 : " + file.get(i).getOriginalFilename());
		}
		try {
			rs.uploadProcess(m);
			return "rest/rest_reviews_form";
		}catch(Exception e) {
			e.printStackTrace();
			return "rest/rest_reviews_form";
		}
	}
	@ResponseBody
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		for(MultipartFile file : multipartFile) {
			System.out.println("오리지널 파일 이름 : "+file.getOriginalFilename());
		}

		return "{ \\\"result\\\":\\\"OK\\\" }";
	}
}
