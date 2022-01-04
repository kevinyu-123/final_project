package com.dine.root.boardEvent.controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dine.root.boardEvent.service.EventService;

@Controller
public class BoardEventController{

	@Autowired
	EventService service;

	@GetMapping("event")
	public String eventList(Model model)
	{
		service.eventList(model);
		  return "boardEvent/eventPage";
	} 

	@PostMapping("writeSave")
	public void writeSave(
			MultipartHttpServletRequest mul, 
			HttpServletResponse response, 
			HttpServletRequest request) throws IOException {
		String message = service.writeSave(mul, request);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
	}

	@GetMapping("writeEvent")
	public String writeEvent() {
		return "boardEvent/writeEvent";
	}
	

	@GetMapping("eventDetail")
	public String eventDetail(@RequestParam String img_url, Model model ) {
		service.eventDetail(img_url, model);
		return "boardEvent/eventDetail";
	}
	

}