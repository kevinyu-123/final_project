package com.dine.root.rest.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dine.root.rest.dao.restDAO;
import com.dine.root.rest.dto.menuDTO;
import com.dine.root.rest.dto.restDTO;
import com.dine.root.reviews.dto.reviewsDTO;

@Service
public class restServiceImpl implements restService{
	
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
				
				
				double avr = Math.round(dto.getRateAvr()*100)/100.0;
				System.out.println(avr);
						
				m.addAttribute("restPic",picArray);
				m.addAttribute("avr",avr);
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

	@Override
	public void infoReviews(Model m, int id) {
		// TODO Auto-generated method stub
		try {
			ArrayList<reviewsDTO> reviewsDTO = new ArrayList<reviewsDTO>();
			reviewsDTO = dao.infoReviews(id);
			for(reviewsDTO d : reviewsDTO) {
				System.out.println("1"+d.getFoodName());
				System.out.println("2"+d.getImgs());
				System.out.println("3"+d.getMemId());
				System.out.println("4"+d.getRate());
				System.out.println("5"+d.getRestId());
				System.out.println("6"+d.getReview());
				System.out.println("7"+d.getRevDate());

			}
			System.out.println("reviewsDTO.size()" + reviewsDTO.size());
			System.out.println("reviewsDTO" + reviewsDTO);
			
			if(reviewsDTO.size() != 0) {
				m.addAttribute("reviewsDTO", reviewsDTO);
				m.addAttribute("restId", id);
				m.addAttribute("reviews_size", reviewsDTO.size());
			}else {
				m.addAttribute("reviewsDTO", "non");
				m.addAttribute("reviews_size", 0);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateLiked(Map<String, Object> idMap) {
		// TODO Auto-generated method stub
		try {
			String memId = (String) idMap.get("memId");
			int restId =  (int) idMap.get("rest");
			dao.updateLiked(memId, restId);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUnLiked(Map<String, Object> idMap) {
		try {
			String memId = (String) idMap.get("memId");
			Map memLike = dao.infoMemLike(memId);
			System.out.println(memLike);
			int unLike1 = (int) idMap.get("rest") ;
			String unLike = ""+unLike1;
			System.out.println(unLike);
			System.out.println(memLike.get("LIKED_REST"));
			String like = (String) memLike.get("LIKED_REST");
			System.out.println(like);
			String upLike = like.replace("/"+"식당2", "");
			System.out.println(upLike);
			
			dao.updateUnLike(upLike,memId );
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<restDTO> selectByName(String name) {
		
		return dao.selectByName(name);
	}
}