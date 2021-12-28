package com.dine.root.boardNotice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dine.root.member.mapper.MemMapper;

@Service
public class BoardNoticeServiceImpl implements BoardNoticeService{

@Autowired
MemMapper mapper;

//	@Override
//	public int insertNotice(String title,String content) {
//	int result = mapper.insertNotice(title,content);
//	System.out.println(result);
//		return result;
//	}

	@Override
	public String saveNotice(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
