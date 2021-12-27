package com.dine.root.boardNotice.service;

import org.springframework.ui.Model;

import com.dine.root.boardNotice.dto.BoardDTO;

public interface NoticeService {
	
	public void boardAllList(Model model,int num);

	public int saveNotice(BoardDTO dto);
	
	public BoardDTO viewNotice(int board_no);
	
	public int saveModNotice(BoardDTO dto);
}
