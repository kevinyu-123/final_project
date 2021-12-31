package com.dine.root.food.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dine.root.food.dto.FoodDTO;
import com.dine.root.food.dto.NationDTO;
import com.dine.root.food.dto.RecipeDTO;
import com.dine.root.food.service.FoodService;
import com.dine.root.rest.dto.restDTO;
import com.dine.root.rest.service.restService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class FoodController {
   
   @Autowired
   FoodService fs;
   @Autowired
   restService rs;
   
   public void printWriter(String message, HttpServletRequest request, HttpServletResponse response) throws IOException {
      
      PrintWriter out = null;
      response.setContentType("text/html; charset=utf-8");
      out = response.getWriter();
      out.println(message);
   }
   
   @GetMapping("nationRegForm") 
   public String test4() {
      
      return "food2/nationRegForm";
   }

   @GetMapping("nation")
   public String test3(@RequestParam("nation") String nation, Model model) {
      model.addAttribute("nation", fs.nation(nation));
      model.addAttribute("foodList", fs.getFoodsByNation(nation));
      return "food2/nation";
   }

   @PostMapping("nation")
   public void test5(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
      MultipartFile file = mul.getFile("nationPicture2");
      
      printWriter(fs.nationInsert(mul, request), request, response);
      
   }
   
   @GetMapping("nationEditForm")
   public String nationEditForm(@RequestParam("nation") String nation, Model model) {
      
      model.addAttribute("nation", fs.nation(nation));
      return "food2/nationEditForm";
   }
   
   @PostMapping("nationEdit")
   public void nationEdit(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
      
      printWriter(fs.nationEdit(mul, request), request, response);
   }
   
   @GetMapping("nationDelete")
   public void nationDeleteForm(@RequestParam("nation") String nation, @RequestParam("nationPicture") String nationPicture,
         HttpServletRequest request, HttpServletResponse response) throws IOException {
       
      printWriter(fs.nationDelete(nation, nationPicture, request), request, response);
   }
   
   @GetMapping("foodRegForm")
   public String foodRegForm() {
      return "food2/foodRegForm";
   }
   
   @PostMapping("foodReg")      
   public void register(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
      
      MultipartFile file = mul.getFile("mainPic");
      MultipartFile file2 = mul.getFile("subPic");
      MultipartFile file3 = mul.getFile("mapPic");
      
      printWriter(fs.register2(mul, request), request, response);
      
   }
   @GetMapping("food2")
   public String index(Model model , @RequestParam String foodName) {
      model.addAttribute("detail", fs.detail(foodName));
      
      // 페이지 따로 할꺼니까 여기 부분 잘라서 recipe쪽에 넣어야 할 듯??
  
      RecipeDTO dto = fs.recipe(foodName);
      List<restDTO> rdto = rs.getRestByname(foodName);
      System.out.println(rdto.size());
      String addr = dto.getRecipe();
      String ingredients = dto.getIngredients();
      
      String [] split = addr.split("/");
      String [] split2 = ingredients.split("/");
      
      model.addAttribute("list", split);
      model.addAttribute("ingredients", split2);
   
      model.addAttribute("recipe", fs.recipe(foodName));
      model.addAttribute("foodList", fs.getFoodsByNation(foodName));
      
      model.addAttribute("restList", rdto);
      
      return "food2/index";
   }
   
   @GetMapping("foodEditForm")
   public String food2EditForm(@RequestParam("foodName") String foodName, Model model) {
      model.addAttribute("detail", fs.detail(foodName));
      return "food2/foodEditForm";
   }
   
   @PostMapping("foodEdit")
   public void foodEdit(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
      
      printWriter(fs.foodEdit(mul, request), request, response);
      
   }
   
   @GetMapping("foodDelete")
   public void foodDelete(@RequestParam("foodName") String foodName, @RequestParam("mainPic") String mainPic,
         @RequestParam("subPic") String subPic,@RequestParam("mapPic") String mapPic,
         HttpServletRequest request, HttpServletResponse response) throws IOException {
      
      printWriter(fs.foodDelete(foodName, mainPic, subPic, mapPic, request), request, response);
   }
   
   
   @GetMapping("recipeForm")
   public String recipeForm() {
      return "food2/recipeForm";
   }
   
   //@RequestParam("foodName") String foodName, @RequestParam(value="recipe" , required=false) String recipe, 
   @PostMapping("recipe")
   public String register(RecipeDTO dto, Model model) {
      
      int result =  fs.recipeInsert(dto);   // 중복되는 아이디를 처리하기 위한 model값
      
      if (result == 1) {   
         return "redirect:main";
      }
      return "redirect:recipeForm";
   }
   
   @GetMapping("recipeEditForm")
   public String recipeEditForm(@RequestParam("foodName") String foodName, Model model) {
      
      model.addAttribute("recipe", fs.recipe(foodName));
      
      return "food2/recipeEditForm";
      
   }
   
   @PostMapping("recipeEdit")
   public void recipeEdit(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
      
      printWriter(fs.recipeEdit(mul, request), request, response);
      
   }
   
}