package com.dine.root.search.Service;

import java.util.List;

import org.springframework.ui.Model;

import com.dine.root.search.dto.SearchDTO;

public interface SearchService {
	public List<SearchDTO> viewAll();

}
