package com.dine.root.rest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.rest.dao.restDAO;
import com.dine.root.rest.dto.restDTO;

@Service
public class restServiceImpl implements restService{
	@Qualifier("restDAO")
	@Autowired restDAO dao;

	@Override
	public int infoRest(Model m, int id) {
		// TODO Auto-generated method stub
		int check = 0;
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
				check = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
			check = 0;
		}
		
		
		return check;
	}
}
