package com.dine.root.boardEvent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.boardEvent.mapper.EventMapper;

@Service
public class BoardEventServiceImpl implements BoardEventService{

	@Autowired EventMapper mapper;
	
	
	@Override
	public void getEventList(Model model) {
		model.addAttribute("eventList", mapper.getEventList());
		System.out.println(model);
	}
	

}
