package com.dine.root.food.dao;


import java.util.List;

import com.dine.root.food.dto.FoodDTO;
import com.dine.root.food.dto.NationDTO;
import com.dine.root.food.dto.RecipeDTO;

public interface FoodDAO {
	
	public FoodDTO detail(String foodName);

	public int register(FoodDTO dto);

	public RecipeDTO recipe(String foodName);

	public int recipeInsert(RecipeDTO dto);

	public int nationInsert(NationDTO dto);

	public NationDTO nation(String nation);

	public List<FoodDTO> selectFoodsByNaton(String nation);

	public int nationEdit(NationDTO dto);

	public int nationDelete(String nation);

	public int foodEdit(FoodDTO dto);

	public int foodDelete(String foodName);

	public int recipeEdit(RecipeDTO dto);


}
