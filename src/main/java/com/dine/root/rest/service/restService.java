package com.dine.root.rest.service;

import org.springframework.ui.Model;

import com.dine.root.rest.dto.restDTO;

public interface restService {
	// restID -> getDTO
	public int infoRest(Model m,int id);
}
