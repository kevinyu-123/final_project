package com.dine.root.food.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.dine.root.food.dto.NationDTO;
import com.dine.root.food.dto.RecipeDTO;
import com.dine.root.food.service.FoodService;

@Controller
public class FoodController {

	@Qualifier("foodServiceImpl")
	@Autowired
	FoodService fs;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("main")
	public String main() {
		return "main/mainPage";
	}
	
	@GetMapping("test")
	public String test() {
		return "food2/test";
	}
	
	@GetMapping("nation")
	public String test3(@RequestParam("nation") String nation, Model model) {
		model.addAttribute("nation", fs.nation(nation));
		model.addAttribute("foodList", fs.getFoodsByNation(nation));
		return "food2/nation";
	}
	@GetMapping("nationRegForm") 
	public String test4() {
		// 여기서 나라 이름 받아서 나라이름은 리드온니로 바꾸기
		return "food2/nationRegForm";
	}
	@PostMapping("nation")
	public String test5(NationDTO dto, Model model, MultipartHttpServletRequest mul) {
		
		String nationName = fs.getFilePath(mul);
		
		dto.setNationPicture(nationName);
		
//		MultipartFile file = mul.getFile("nationPicture2");
//		System.out.println(file.getOriginalFilename());
		
		int result =  fs.nationInsert(dto);	// 중복되는 아이디를 처리하기 위한 model값
		
		if (result == 1) {	
			return "redirect:nation?nation=" + dto.getNation();
		}
		return "redirect:nationRegForm";
	}
	
	
	@GetMapping("nationEditForm")
	public String nationEditForm(@RequestParam("nation") String nation, Model model) {
		
		model.addAttribute("nation", fs.nation(nation));
		return "food2/nationEditForm";
	}
	@PostMapping("nationEdit")
	public void nationEdit(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = fs.nationEdit(mul, request);
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
		
	}
	
	@GetMapping("nationDelete")
	public void nationDeleteForm(@RequestParam("nation") String nation, @RequestParam("nationPicture") String nationPicture,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
		String message = fs.nationDelete(nation ,nationPicture, request);
		PrintWriter out=null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
	}
	
	
	
	
	
	
	
	@GetMapping("food2")
	public String index(Model model , @RequestParam("foodName") String foodName) {

		model.addAttribute("detail", fs.detail(foodName));
		
		// 페이지 따로 할꺼니까 여기 부분 잘라서 recipe쪽에 넣어야 할 듯??
		RecipeDTO dto = fs.recipe(foodName);
		String addr = dto.getRecipe();
		String ingredients = dto.getIngredients();
		
		String [] split = addr.split("/");
		String [] split2 = ingredients.split("/");
		
		model.addAttribute("list", split);
		model.addAttribute("ingredients", split2);
	
		model.addAttribute("recipe", fs.recipe(foodName));

		return "food2/index";
	}
	
	@GetMapping("foodRegForm")
	public String foodRegForm() {
		return "food2/foodRegForm";
	}
	
	@GetMapping("foodEditForm")
	public String food2EditForm(@RequestParam("foodName") String foodName, Model model) {
		model.addAttribute("detail", fs.detail(foodName));
		return "food2/foodEditForm";
	}
	
	@PostMapping("foodEdit")
	public void foodEdit(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = fs.foodEdit(mul, request);
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("register")		
	public String register(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		MultipartFile file = mul.getFile("mainPic");
		MultipartFile file2 = mul.getFile("subPic");
		MultipartFile file3 = mul.getFile("mapPic");
		
//		System.out.println(file.getOriginalFilename());	
//		System.out.println(file2.getOriginalFilename());	
//		System.out.println(file3.getOriginalFilename());	
		
		
		int result =  fs.register2(mul);	
		String msg, url;
		
		if (result == 1) {	
			msg = "성공적으로 저장되었습니다. 바로 레시피를 저장해 주세요.";
			url = "/recipeForm";
//			return "food2/recipeForm";
		} else {
			msg = "저장 중 문제가 발생하였습니다.";
			url = "/foodRegForm";
		}
//		return "redirect:foodRegForm";
		String message = fs.getMessage(request, msg, url);
		return message;
	}
	
	@GetMapping("foodDelete")
	public void foodDelete(@RequestParam("foodName") String foodName, @RequestParam("mainPic") String mainPic,
			@RequestParam("subPic") String subPic,@RequestParam("mapPic") String mapPic,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
		String message = fs.foodDelete(foodName ,mainPic, subPic, mapPic, request);
		PrintWriter out=null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
	}
	
	
	
	
	@GetMapping("recipeForm")
	public String recipeForm() {
		return "food2/recipeForm";
	}
	
	//@RequestParam("foodName") String foodName, @RequestParam(value="recipe" , required=false) String recipe, 
	@PostMapping("recipe")
	public String register(RecipeDTO dto, Model model) {
		
		int result =  fs.recipeInsert(dto);	// 중복되는 아이디를 처리하기 위한 model값
		
		if (result == 1) {	
			return "redirect:food2?foodName=" + dto.getFoodName();
		}
		return "redirect:recipeForm";
	}
	
	@GetMapping("recipeEditForm")
	public String recipeEditForm(@RequestParam("foodName") String foodName, Model model) {
		
		model.addAttribute("recipe", fs.recipe(foodName));
		return "food2/recipeEditForm";
	}
	
	
}
