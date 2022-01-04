package com.dine.root.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dine.root.map.dto.MapDTO;
import com.dine.root.map.mapper.MapMapper;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	MapMapper mapper;
	
	
	@Override
	public List<MapDTO> info(String nation) {
		return mapper.info(nation);
	}

}