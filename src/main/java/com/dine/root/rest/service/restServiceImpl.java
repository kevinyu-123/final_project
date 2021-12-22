package com.dine.root.rest.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.rest.dao.restDAO;
import com.dine.root.rest.dto.menuDTO;
import com.dine.root.rest.dto.restDTO;

@Service
public class restServiceImpl implements restService{
	@Qualifier("restDAO")
	@Autowired restDAO dao;

	@Override
	public void infoRest(Model m, int id) {
		// TODO Auto-generated method stub
		try {
			restDTO dto = dao.infoRest(id);
			System.out.println(dto);
			if(dto != null) {
				m.addAttribute("restDTO",dto);
				String pic = dto.getRestPic();
				System.out.println(pic);
				String[] picArray = pic.split(",");
				System.out.println(picArray);
				System.out.println(picArray[0]);
				System.out.println(picArray[1]);
				System.out.println(picArray[2]);
				System.out.println(picArray[3]);
				System.out.println(dto.getHours());
				System.out.println(dto.getId());
				
				m.addAttribute("restPic",picArray);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void infoMenu(Model m, int id) {
		// TODO Auto-generated method stub
		try {
			ArrayList<menuDTO> menuDTO = dao.infoMenu(id);
			m.addAttribute("menuDTO",menuDTO);
			System.out.println(menuDTO.get(0).getPic());
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
