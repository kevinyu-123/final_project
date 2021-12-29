package com.dine.root.boardEvent.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EventService {
	public static final String IMAGE_REPO = "/Users/saetbyeol/Desktop/project1/final_project/src/main/webapp/resources/img/event";
	public String getFilePath(MultipartHttpServletRequest mul);
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void eventList(Model model);
	public void eventDetail(String img_url, Model model);
	
}