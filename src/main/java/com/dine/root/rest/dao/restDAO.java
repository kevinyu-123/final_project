package com.dine.root.rest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dine.root.rest.dto.menuDTO;
import com.dine.root.rest.dto.restDTO;
import com.dine.root.reviews.dto.reviewsDTO;

@Mapper
public interface restDAO {
	public restDTO infoRest(int id);
	public ArrayList<menuDTO> infoMenu(int id);
	public ArrayList<reviewsDTO> infoReviews(int id);
	public void updateLiked(@Param("memId") String memId,@Param("restId") int restId);
	public Map infoMemLike(String memId);
	public void updateUnLike(@Param("upLike") String upLike ,@Param("memId") String memId);
	public List<restDTO> selectNationByRest(String nation);
	public Map infoLiked(String name);
}
