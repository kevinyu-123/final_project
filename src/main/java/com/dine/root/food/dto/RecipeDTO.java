package com.dine.root.food.dto;

/*		2021-12-22
 *		youtubeAddr 추가  
 */

public class RecipeDTO {
	private int id;
	private String foodName;
	private String cookTime;
	private String ingredients;
	private String recipe;
	private String youtubeAddr;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getCookTime() {
		return cookTime;
	}
	public void setCookTime(String cookTime) {
		this.cookTime = cookTime;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getRecipe() {
		return recipe;
	}
	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}
	public String getYoutubeAddr() {
		return youtubeAddr;
	}
	public void setYoutubeAddr(String youtubeAddr) {
		this.youtubeAddr = youtubeAddr;
	}
	
	
}
