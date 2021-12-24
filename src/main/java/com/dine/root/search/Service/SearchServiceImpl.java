package com.dine.root.search.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.mybatis.search.SearchMapper;
import com.dine.root.search.dto.SearchDTO;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchMapper mapper;
	
	@Override
	public List<SearchDTO> viewAll() {
		return mapper.viewAll();
	}

}
