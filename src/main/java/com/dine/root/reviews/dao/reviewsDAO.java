package com.dine.root.reviews.dao;

import com.dine.root.rest.dto.restDTO;
import com.dine.root.reviews.dto.reviewsDTO;

public interface reviewsDAO {
	public restDTO infoRest(int restId);
	public int insertReview(reviewsDTO dto);
	public void updateRestRate(int restId,int rate);
	public void updateFoodRate(String foodName,int rate);
	public void updateRestRateAvr(int restId);
	public void updateFoodRateAvr(String foodName);
}
