package com.dine.root.mybatis.search;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.dine.root.search.dto.SearchDTO;

@Repository
public interface SearchMapper {
	// keyword searching
	public List<SearchDTO> viewAll(String keyword) throws Exception;
	public int countArticle(String keyword) throws Exception;
	
	// category searching
	public List<SearchDTO> categorise(@Param("country") String country, @Param("addr") String addr, @Param("food") String food);
	public int countCategories(@Param("country") String country, @Param("addr") String addr, @Param("food") String food);
}
