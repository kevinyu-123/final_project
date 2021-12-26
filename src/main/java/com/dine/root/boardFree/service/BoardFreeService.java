package com.dine.root.boardFree.service;


import org.springframework.ui.Model;

import com.dine.root.boardFree.dto.BoardDTO;

public interface BoardFreeService {
	
	public void boardAllList(Model model,int num);
	
	public int selectBoardCount();
	
	public BoardDTO contentView(int board_no);
	
	public int saveWrite(BoardDTO dto);
}
