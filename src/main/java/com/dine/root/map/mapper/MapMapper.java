package com.dine.root.map.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dine.root.map.dto.MapDTO;

@Mapper
public interface MapMapper {
	
	public List<MapDTO> info(String nation);
}
