package com.dine.root.reviews.dao;

import org.apache.ibatis.annotations.Param;

import com.dine.root.rest.dto.restDTO;
import com.dine.root.reviews.dto.reviewsDTO;

public interface reviewsDAO {
	public restDTO infoRest(int restId);
	public int insertRestReview(reviewsDTO dto);
	public int insertFoodReview(reviewsDTO dto);
	
	public int updateRestRate(@Param("restId") int restId, @Param("rate") int rate);
	public int updateFoodRate(String foodName,int rate);
	public int updateRestRateAvr(int restId);
	public void updateFoodRateAvr(String foodName);
}