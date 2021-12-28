package com.dine.root.boardFree_reply.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dine.root.boardFree_reply.dto.ReplyDTO;
import com.dine.root.boardFree_reply.service.RepService;

@RestController
public class FreeReplyController {
	
	@Autowired
	RepService service;
	
	@PostMapping(value="saveRep",produces="application/json;charset=utf-8")
	public String addRep(@RequestBody Map<String, Object>map) {
		ReplyDTO dto = new ReplyDTO();
		dto.setWriter((String)map.get("writer"));
		dto.setContent((String)map.get("content"));
		dto.setPost_group(Integer.parseInt((String)map.get("post_group")));
		service.addRep(dto);
		return "{\"result\" : true}";
	}
	
    @GetMapping(value="replyData/{post_group}", produces="application/json;charset=utf-8")
    public List<ReplyDTO> replyData(@PathVariable int post_group) {
    	return service.getRepList(post_group);
    	}

}
