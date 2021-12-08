package com.dine.root.reviews.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface reviewsService {
	public static final String IMAGE_REPO = "C:\\spring_project\\final_project\\src\\main\\webapp\\resources\\rest_reviews_img";
	public void uploadProcess(MultipartHttpServletRequest m);
}
