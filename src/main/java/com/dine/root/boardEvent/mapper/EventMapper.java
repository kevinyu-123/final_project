package com.dine.root.boardEvent.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.dine.root.boardFree.dto.BoardDTO;

@Mapper
public interface EventMapper {

	public ArrayList<BoardDTO> getEventList();

}
