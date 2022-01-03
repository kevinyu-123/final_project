package com.dine.root.reviews.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.dine.root.reviews.service.reviewsServiceImpl;

@Controller
public class reviewsController {
	
	@Qualifier("reviewsServiceImpl")
	@Autowired reviewsServiceImpl rs;
	
	@RequestMapping("rest_reviews_form")
	public String restReviews(Model model ,@RequestParam("rest") int restId,HttpSession session) {
		String name = (String) session.getAttribute("session_user");
		model.addAttribute("att","rest");
		model.addAttribute("memId","aa");
		rs.infoRest(model,restId);
		return "review/reviews_form";
	}
	
	@RequestMapping("food_reviews_form")
	public String Reviews(Model model) {
		model.addAttribute("att","food");
		return "review/reviews_form";
	}
	
	@ResponseBody
	@RequestMapping(value = "file-upload", method = RequestMethod.POST)
	public HashMap<String,String> FileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		HashMap<String,String> msg = new HashMap<String, String>();
		int check = 0;
		for(MultipartFile file : multipartFile) {
			System.out.println("오리지널 파일 이름 : "+file.getOriginalFilename());
		}
		System.out.println("정보 1 : "+request.getParameter("rate"));
		System.out.println("정보 2 : "+request.getParameter("content"));
		String att = request.getParameter("att");
		System.out.println("att : "+att);
		System.out.println("멀티파트파일" + multipartFile);
		System.out.println("회원 이름" + request.getParameter("memId"));
		
		if(multipartFile.size() == 0) {
			check = rs.reviewsUploadNonFile(request);
		}else {
			check = rs.reviewsUploadProcess(multipartFile,request);
		}
		if(check == 1) {
			msg.put("result","OK");
			//return "{ \\\"result\\\":\\\'OK\\\' }";
		}else {
			msg.put("result","NO");
			//return "{ \\\"result\\\":\\\"NO\\\" }";
		}
		return msg;
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
			//rs.restReviewsUploadProcess(m);
			out.println("<script>alert('성공'); location.href='/root/rest_reviews_form';</script>");
		}catch(Exception e) {
			e.printStackTrace();
			out.println("<script>alert('실패'); location.href='/root/rest_reviews_form';</script>");
		}
	}
}
