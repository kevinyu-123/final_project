package com.dine.root.boardNotice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dine.root.boardNotice.dto.BoardDTO;
import com.dine.root.boardNotice.service.NoticeService;

@Controller
public class BoardNoticeController {
	@Autowired
	NoticeService service;

	
	@GetMapping("/news")
	public String news(Model model,@RequestParam(required=false, defaultValue = "1")int num) {
		service.boardAllList(model,num);
		return "boardNotice/newsPage";
	}
		
	@GetMapping("/writenews")
	public String writeForm() {
		return "boardNotice/writeNews";
	}
	
	@PostMapping("/saveNotice")
	public void save(BoardDTO dto, HttpServletResponse response) {
		int result = 0;
		result = service.saveNotice(dto);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		if(result == 1) {
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print("<script>" 
					+ " alert('등록이 완료되었습니다.');"
					+ "location.href='/news';"
					+ "</script>");
		}else {
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print("<script>" 
					+ " alert('등록 실패.');"
					+ "location.href='writeNews';"
					+ "</script>");
		}	
	}
	
	@GetMapping("/viewNotice")
	public String viewNotice(@RequestParam int board_no,Model model) {
		BoardDTO dto = service.viewNotice(board_no);
		model.addAttribute("form",dto);
		return "boardNotice/newsDetail";
	}
	@GetMapping("/modifyNotice")
	public String modNotice(@RequestParam int board_no,Model model) {
		BoardDTO dto = service.viewNotice(board_no);
		model.addAttribute("form",dto);
		return "boardNotice/modifyNotice";
	}
	
	@PostMapping("/saveModNotice")
	public void saveModNotice(BoardDTO dto, HttpServletResponse response) {
		int result = 0;
		result = service.saveModNotice(dto);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		if(result == 1) {
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print("<script>" 
					+ " alert('수정이 완료되었습니다.');"
					+ "location.href='/news';"
					+ "</script>");
		}else {
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print("<script>" 
					+ " alert('수정 실패.');"
					+ "location.href='/writenews';"
					+ "</script>");
			}
		}
}