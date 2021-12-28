package com.dine.root.boardFree.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dine.root.boardFree.dto.BoardDTO;
import com.dine.root.boardFree.service.BoardFreeService;
import com.dine.root.common.session.MemberSession;
import com.google.gson.JsonObject;


@Controller
public class BoardFreeController implements MemberSession  {
	@Qualifier("boardFreeServiceImpl")
	@Autowired
   BoardFreeService service;

   
   @GetMapping("/boardAllList")
   public String boardAllList(Model model,@RequestParam(required=false, defaultValue = "1")int num) {
      service.boardAllList(model,num);
      return "boardFree/freeMain";
   }
   
   @GetMapping("/writeform")
   public String writeForm() {
      return "boardFree/writeForm";
   }
   
   @PostMapping("/saveWrite")
   public void save(BoardDTO dto, HttpServletResponse response) {
      int result = 0;
      System.out.println(dto.getTitle());
      System.out.println(dto.getWriter());
      result = service.saveWrite(dto);
      PrintWriter out = null;
      response.setContentType("text/html; charset=utf-8");
      if(result == 1) {
         try {
            out = response.getWriter();
         } catch (IOException e) {
            e.printStackTrace();
         }
         out.print("<script>" 
               + " alert('등록이 완료되었습니다.');"
               + "location.href='boardAllList';"
               + "</script>");
      }else {
         try {
            out = response.getWriter();
         } catch (IOException e) {
            e.printStackTrace();
         }
         out.print("<script>" 
               + " alert('등록 실패.');"
               + "location.href='writeForm';"
               + "</script>");
      }
      
   }
   
   @GetMapping("/modifyForm")
   public String modifyForm() {
      return "boardFree/viewModify";
   }
   
   @GetMapping("/viewContent")
   public String viewCont(@RequestParam int board_no,Model model) {
      BoardDTO dto = service.contentView(board_no);
      String imgUrl = dto.getImg_url();
      if(imgUrl == null) {
         model.addAttribute("form",dto);
      }else {
         String [] splitUrl = imgUrl.split(",");
         model.addAttribute("url",splitUrl);
         model.addAttribute("form",dto);
      }
      return "boardFree/listview";
   }
   
   @PostMapping(value="/uploadSummernoteImageFile",produces = "application/json; charset=utf8")
   @ResponseBody
   public String uploadSummernoteImageFile(@RequestPart(value="file",required = false) MultipartFile multipartFile,
            HttpServletRequest request) {
      
      JsonObject jsonObject = new JsonObject();
            
      String contextRoot = request.getSession().getServletContext().getRealPath("/");
      String fileRoot = contextRoot+"resources/fileupload/";
      System.out.println(fileRoot);
      String originalFileName = multipartFile.getOriginalFilename();
      String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
      
      String saveFileName = UUID.randomUUID()+extension;
      
      File file = new File(fileRoot+ saveFileName);
      System.out.println(fileRoot + saveFileName);
      try {
         InputStream fileStream = multipartFile.getInputStream();
         FileUtils.copyInputStreamToFile(fileStream, file);
         jsonObject.addProperty("url","resources/fileupload/"+saveFileName);
         jsonObject.addProperty("responseCode", "success");
      }catch (Exception e) {
         e.printStackTrace();
      }
      String json = jsonObject.toString();
      return json;
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}