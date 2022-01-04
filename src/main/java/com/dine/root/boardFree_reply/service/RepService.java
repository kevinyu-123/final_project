package com.dine.root.boardFree_reply.service;

import java.util.List;

import com.dine.root.boardFree_reply.dto.ReplyDTO;

public interface RepService {
	
	public void addRep(ReplyDTO dto);
	
	public List<ReplyDTO> getRepList(int post_group);
}