package com.dine.root.boardFree.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.boardFree.dto.BoardDTO;
import com.dine.root.boardFree.mapper.BoardMapper;

@Service
public class BoardFreeServiceImpl implements BoardFreeService {

	
	@Autowired
	BoardMapper mapper;
	
	@Override
	public void boardAllList(Model model,int num) {
		int pageLetter = 15; // 페이지당 보여질 개수
		int allCount = mapper.selectBoardCount(); // 총 개수
		int repeat = allCount/pageLetter; // 반복 횟수
		
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		
		int end = num * pageLetter;
		int start = end +1 - pageLetter;
		
		model.addAttribute("repeat",repeat);
		model.addAttribute("list",mapper.boardAllList(start,end));
	}
	
	@Override
	public int selectBoardCount() {
		return mapper.selectBoardCount();
	}
		
	@Override
	public BoardDTO contentView(int board_no) {
		upHit(board_no);
		return mapper.contentView(board_no);
	}
	
	private void upHit(int Board_no) {
		mapper.upHit(Board_no);
	}

	@Override
	public int saveWrite(BoardDTO dto) {
		return mapper.saveWrite(dto);
	}

	@Override
	public int deleteCont(int board_no) {
		return mapper.deleteCont(board_no);	
	}

	@Override
	public int saveModForm(BoardDTO dto) {
		return mapper.saveModForm(dto);
	}
	
}
