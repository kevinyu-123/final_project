package com.dine.root.boardEvent.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.dine.root.boardEvent.dto.BoardDTO;
import com.dine.root.boardEvent.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventMapper mapper;




	@Override
	public String getFilePath(MultipartHttpServletRequest mul) {
		MultipartFile file = mul.getFile("img_url");
		System.out.println(file);
		return saveImg(file);
	}

	private String saveImg(MultipartFile imgfile) {
		String fileName = "";
		if (imgfile.getSize() != 0) {
			SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");

			Calendar calendar = Calendar.getInstance();
			fileName = fo.format(calendar.getTime());
			fileName += imgfile.getOriginalFilename();
			File saveFile = new File(IMAGE_REPO + "/" + fileName);

			try {
				imgfile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			fileName = "nan";
		}
		return fileName;
	}

	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {

		BoardDTO dto = new BoardDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setWriter(mul.getParameter("writer"));
		MultipartFile file = mul.getFile("img_url");

		if (file.getSize() != 0) {
			dto.setImg_url(saveFile(file));
		} else {
			dto.setImg_url("nan");
		}
		int result = 0;
		String msg, url;
		try {
			result = mapper.writeSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == 1) {
			msg = "새글이 추가되었습니다";
			url = "/event";
		} else {
			msg = "문제가 발생되었습니다!!!";
			url = "/event";
		}
		return getMessage(request, msg, url);
	}
	

	public String saveFile(MultipartFile file) {
		SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		String sysFileName = simpl.format(calendar.getTime()) + file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO + "/" + sysFileName);
		try {
			file.transferTo(saveFile);// 해당 위치에 파일 저장
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sysFileName;
	}

	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";

		return message;
	}

	@Override
	public void eventList(Model model) {
		model.addAttribute("eventList", mapper.eventList());
	}

	@Override
	public void eventDetail(String img_url, Model model) {

		model.addAttribute("event", mapper.eventDetail(img_url));
		
	}

	
	
}