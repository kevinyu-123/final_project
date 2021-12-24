package com.dine.root.mybatis.search;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dine.root.search.dto.SearchDTO;

@Repository
public interface SearchMapper {
	public List<SearchDTO> viewAll();
}
