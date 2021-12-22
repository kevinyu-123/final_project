package com.dine.root.reviews.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dine.root.reviews.service.reviewsService;

@Controller
public class reviewsController {
	@Qualifier("reviewsService")
	@Autowired reviewsService rs;
	@RequestMapping("rest_reviews_form")
	public String restReviews(Model model) {
		model.addAttribute("att","rest");
		return "food/reviews_form";
	}
	@RequestMapping("food_reviews_form")
	public String Reviews(Model model) {
		model.addAttribute("att","food");
		return "food/reviews_form";
	}
	@RequestMapping("upload_rest_Review")
	public void upload(MultipartHttpServletRequest m, HttpServletResponse res) throws IOException {
		System.out.println("정보 1 : "+m.getParameter("rate"));
		System.out.println("정보 2 : "+m.getParameter("content"));
		List<MultipartFile> file = m.getFiles("restImgs");
		for(int i=0 ; i < file.size() ; i++) {
			System.out.println("파일 이름 : " + file.get(i).getOriginalFilename());
		}
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		try {
			rs.restReviewsUploadProcess(m);
			out.println("<script>alert('성공'); location.href='/root/rest_reviews_form';</script>");
		}catch(Exception e) {
			e.printStackTrace();
			out.println("<script>alert('실패'); location.href='/root/rest_reviews_form';</script>");
		}
	}
	@ResponseBody
	@RequestMapping(value = "file-upload", method = RequestMethod.POST)
	public String foodFileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		for(MultipartFile file : multipartFile) {
			System.out.println("오리지널 파일 이름 : "+file.getOriginalFilename());
		}
		System.out.println("정보 1 : "+request.getParameter("rate"));
		System.out.println("정보 2 : "+request.getParameter("content"));
		String att = request.getParameter("att");
		if(att.equals("food")) {
			rs.foodReviewsUploadProcess(multipartFile,request);
		}else if(att.equals("rest")) {
			rs.foodReviewsUploadProcess(multipartFile,request);
		}else {
			return "{ \\\"result\\\":\\\"NO\\\" }";
		}
		
		return "{ \\\"result\\\":\\\"OK\\\" }";
	}

	@RequestMapping("food")
	public String food() {
		return "/food/food_detail";
	}
	@RequestMapping("f")
	public String f() {
		return "/food/food";
	}
}
