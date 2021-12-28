package com.dine.root.search.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dine.root.search.dto.SearchDTO;
@Mapper
public interface SearchMapper {
	public List<SearchDTO> viewAll();

}
