package com.dine.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dine.root.member.dto.AdminDTO;
import com.dine.root.member.mapper.MemMapper;


@Service
public class AdServiceImpl implements AdService {
   @Autowired
   MemMapper mapper;
   
   @Override
   public AdminDTO adloginChk(String id) {
      return mapper.getMember(id);
   }
   

}