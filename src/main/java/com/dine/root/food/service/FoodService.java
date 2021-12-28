package com.dine.root.food.service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dine.root.food.dto.FoodDTO;
import com.dine.root.food.dto.NationDTO;
import com.dine.root.food.dto.RecipeDTO;

public interface FoodService {
	public static final String IMAGE_REPO = "C:/Users/YeongSoo/git/final_project/src/main/webapp/resources/food2";
	
	public FoodDTO detail(String foodName);

	public RecipeDTO recipe(String foodName);
	
	public int register(FoodDTO dto, Model model);

	public int register2(MultipartHttpServletRequest mul);

	public int recipeInsert(RecipeDTO dto);

	public int nationInsert(NationDTO dto);

	public NationDTO nation(String nation);

	public List<FoodDTO> getFoodsByNation(String nation);

	public String getFilePath(MultipartHttpServletRequest mul);

	public String nationEdit(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String getMessage(HttpServletRequest request, String msg, String url);

	public String nationDelete(String nation, String nationPicture, HttpServletRequest request);

	public String foodEdit(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String foodDelete(String foodName, String mainPic, String subPic, String mapPic, HttpServletRequest request);

	public String recipeEdit(MultipartHttpServletRequest mul, HttpServletRequest request);






	


}
