package com.dine.root.reviews.dto;

import java.sql.Date;

public class foodReviewsDTO {
	private String memId;
	private String foodName;
	private String rate;
	private String review;
	private String Imgs;
	private Date revDate;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getImgs() {
		return Imgs;
	}
	public void setImgs(String imgs) {
		Imgs = imgs;
	}
	public Date getRevDate() {
		return revDate;
	}
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	
}
