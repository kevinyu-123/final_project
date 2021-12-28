package com.dine.root.boardFree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dine.root.boardFree.dto.BoardDTO;

@Mapper
public interface BoardMapper {
   
   public List<BoardDTO> boardAllList(@Param("s") int start,@Param("e")int end);
   
   public int selectBoardCount();
   
   public void upHit(int board_no);
   
   public BoardDTO contentView(int board_no);
   
   public int saveWrite(BoardDTO dto);
   
   public int deleteCont(int board_no);
   
   public int saveModForm(BoardDTO dto);

   
}