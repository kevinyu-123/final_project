package com.dine.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.member.dto.AdminDTO;
import com.dine.root.member.mapper.MemMapper;


@Service
public class AdServiceImpl implements AdService {
	@Autowired
	MemMapper mapper;
	


	@Override
	public int adloginChk(String id, String pwd) {
		AdminDTO dto = mapper.getMember(id);
		if (dto != null) {
			if (pwd.equals(dto.getPwd()))
				return 0;
		}
		return 1;
	}

	

}