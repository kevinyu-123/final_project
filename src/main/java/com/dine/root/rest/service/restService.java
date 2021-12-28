package com.dine.root.rest.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.dine.root.rest.dto.restDTO;

public interface restService {
	// restID -> getDTO
	public void infoRest(Model m,int id);
	public void infoMenu(Model m,int id);
	public void infoReviews(Model m,int id);
	public void updateLiked(Map<String, Object> idMap);
	public void updateUnLiked(Map<String, Object> idMap);
	
}
