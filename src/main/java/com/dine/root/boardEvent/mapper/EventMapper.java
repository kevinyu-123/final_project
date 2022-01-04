package com.dine.root.boardEvent.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.dine.root.boardEvent.dto.BoardDTO;

@Mapper
public interface EventMapper {

	public BoardDTO event(String event);
	public int writeSave(BoardDTO dto);
	public ArrayList<BoardDTO> eventList();
	
	public BoardDTO eventDetail(String img_url);

}