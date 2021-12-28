package com.dine.root.food.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	public static final String IMAGE_REPO = "C:/Users/YeongSoo/git/final_project/src/main/webapp/resources/food2";

	public String getMessage(HttpServletRequest request, String msg, String url);

	public String saveFile(MultipartFile file);

	public void deleteImage(String parameter);

}
