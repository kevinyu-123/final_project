package com.dine.root.boardEvent.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public interface BoardEventService {
	public void getEventList(Model model);

}
