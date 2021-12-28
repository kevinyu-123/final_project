package com.dine.root.search.dto;

public class SearchDTO {
	private String keyword; // keyword from search page
	private String country, addr, food; // detail search dto
	private String foodName, foodComment, nation, intro, category_1, category_2; // sql 매치용 
	private int rate;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodComment() {
		return foodComment;
	}
	public void setFoodComment(String foodComment) {
		this.foodComment = foodComment;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getCategory_1() {
		return category_1;
	}
	public void setCategory_1(String category_1) {
		this.category_1 = category_1;
	}
	public String getCategory_2() {
		return category_2;
	}
	public void setCategory_2(String category_2) {
		this.category_2 = category_2;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
}
