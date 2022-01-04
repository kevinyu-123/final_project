package com.dine.root.boardNotice.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dine.root.boardNotice.dto.BoardDTO;
@Mapper
public interface NoticeMapper {
	
	public int saveNotice(BoardDTO dto);
	
	public List<BoardDTO> boardAllList(@Param("s") int start,@Param("e")int end);
	
	public int selectBoardCount();
	
	public void upHit(int board_no);
	
	public BoardDTO viewNotice(int board_no);
	
	public int saveModNotice(BoardDTO dto);
}