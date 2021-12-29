package com.dine.root.search.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
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
	public List<SearchDTO> viewAll(String keyword) throws Exception {
		return mapper.viewAll(keyword);
	}

	@Override
	public int countArticle(String keyword) throws Exception {
		return mapper.countArticle(keyword);
	}

	@Override
	public List<SearchDTO> categorise(String country, String addr, String food) {
		return mapper.categorise(country, addr, food);
	}

	@Override
	public int countCategories(String country, String addr, String food) {
		return mapper.countCategories(country, addr, food);
	}
	

}
