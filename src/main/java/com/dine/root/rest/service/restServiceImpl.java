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
				if(!pic.equals("-")) {
					String[] picArray = pic.split(",");
					System.out.println("infoRest");

					System.out.println(picArray);
					System.out.println(dto.getHours());
					System.out.println(dto.getId());
					m.addAttribute("restPic",picArray);
				}
				else {
					String [] picArray = {"non.png","2","3"};
					m.addAttribute("restPic",picArray);
				}
				System.out.println("평점 dto 값 :"+dto.getRateAvr());
				System.out.println("평균 평점 :");
				double avr = Math.round(dto.getRateAvr()*100)/100.0;
				System.out.println(avr);
				System.out.println("===============");
				
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
		System.out.println("좋아요 서비수");
		try {
			String memId = (String) idMap.get("memId");
			int restId =  (int) idMap.get("rest");
			dao.updateLiked(memId, restId);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("좋아요 서비스 종료");
	}

	@Override
	public void updateUnLiked(Map<String, Object> idMap) {
		System.out.println("안좋아요 서비스");
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
			String upLike = like.replace(unLike+"/", "");
			System.out.println(upLike);
			
			dao.updateUnLike(upLike,memId );
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("안좋아요 서비스 종료");
		// TODO Auto-generated method stub
		
	}

	@Override
	public void infoLiked(Model m, String name,int id) {
		// TODO Auto-generated method stub
		Map liked = dao.infoLiked(name);
		System.out.println(liked);
		if(liked == null) {
			// 찜 아예 없다
		}else {
			if(liked.toString().contains(""+id)) {
				// 찜에 해당 레스토랑이 달려있다
				System.out.println("찜에 해당 레스토랑이 달려있다");
				m.addAttribute("liked","true");
			}else {
				System.out.println("찜이 널이 아니지만 해당 레스토랑이 없다.");
			}
			
		}
		
	}
	 @Override
	 public List<restDTO> getRestByname(String foodName) {
	      return dao.getRestByname(foodName);
	   }
}
