package com.dine.root.boardFree_reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dine.root.boardFree_reply.dto.ReplyDTO;
import com.dine.root.boardFree_reply.mapper.RepMapper;

@Service
public class RepServiceImpl implements RepService {
	
	@Autowired
	RepMapper mapper;

	@Override
	public void addRep(ReplyDTO dto) {
		mapper.addRep(dto);
		
	}

	@Override
	public List<ReplyDTO> getRepList(int post_group) {
		
		return mapper.getRepList(post_group);
	}
}
