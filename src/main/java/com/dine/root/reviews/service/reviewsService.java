package com.dine.root.reviews.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface reviewsService {
	public static final String restReviewsImg = "C:\\spring_project\\final_project\\src\\main\\webapp\\resources\\rest_reviews_img";
	public static final String foodReviewsImg = "C:\\spring_project\\final_project\\src\\main\\webapp\\resources\\food_reviews_img";
	public void restReviewsUploadProcess(MultipartHttpServletRequest m);
	public void foodReviewsUploadProcess( List<MultipartFile> multipartFile,HttpServletRequest request);
}
