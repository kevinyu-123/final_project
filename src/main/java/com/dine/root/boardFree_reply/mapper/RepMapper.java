package com.dine.root.boardFree_reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dine.root.boardEvent_reply.dto.ReplyDTO;

@Mapper
public interface RepMapper {
	public void addRep(ReplyDTO dto);
	
	public List<ReplyDTO> getRepList(int post_group);
}
