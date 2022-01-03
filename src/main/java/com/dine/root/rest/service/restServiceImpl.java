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
			if(dto != null) {
				m.addAttribute("restDTO",dto);
				String pic = dto.getRestPic();
				if(!pic.equals("-")) {
					String[] picArray = pic.split(",");
					m.addAttribute("restPic",picArray);
				}
				else {
					String [] picArray = {"non.png","2","3"};
					m.addAttribute("restPic",picArray);
				}
				double avr = Math.round(dto.getRateAvr()*100)/100.0;
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
			int unLike1 = (int) idMap.get("rest") ;
			String unLike = ""+unLike1;
			String like = (String) memLike.get("LIKED_REST");
			String upLike = like.replace(unLike+"/", "");
			
			dao.updateUnLike(upLike,memId );
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}
	 @Override
	   public List<restDTO> getRestByNation(String nation) {
	      return dao.selectNationByRest(nation);
	   }

	@Override
	public void infoLiked(Model m, String name,int id) {
		// TODO Auto-generated method stub
		Map liked = dao.infoLiked(name);
		if(liked == null) {
			// 찜 아예 없다
		}else {
			if(liked.toString().contains(""+id)) {
				// 찜에 해당 레스토랑이 달려있다
				m.addAttribute("liked","true");
			}else {
			}
		}
	}
}
