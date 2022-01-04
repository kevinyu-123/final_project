package com.dine.root.boardNotice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.boardNotice.dto.BoardDTO;
import com.dine.root.boardNotice.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeMapper mapper;
	
	@Override
	public int saveNotice(BoardDTO dto) {
		return mapper.saveNotice(dto); 
	}
	
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
	
	private void upHit(int Board_no) {
		mapper.upHit(Board_no);
	}
	
	@Override
	public BoardDTO viewNotice(int board_no) {
		upHit(board_no);
		return mapper.viewNotice(board_no);
	}
	
	@Override
	public int saveModNotice(BoardDTO dto) {
		return mapper.saveModNotice(dto);
	}
}