package com.dine.root.search.Service;

import java.util.List;

import org.springframework.ui.Model;

import com.dine.root.search.dto.SearchDTO;

public interface SearchService {
	// keyword searching
	public List<SearchDTO> viewAll(String keyword) throws Exception;
	public int countArticle(String keyword) throws Exception;
	
	//category searching
	public List<SearchDTO> categorise(String country, String addr, String food) throws Exception;
	public int countCategories(String country, String addr, String food);
}
