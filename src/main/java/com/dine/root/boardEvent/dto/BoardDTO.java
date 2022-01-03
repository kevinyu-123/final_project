package com.dine.root.boardEvent.dto;

import java.sql.Date;

public class BoardDTO {
   private int board_no;
   private String title;
   private String content;
   private String writer;
   private Date reg_time;
   private String img_url;
   
   public int getBoard_no() {
      return board_no;
   }
   public void setBoard_no(int board_no) {
      this.board_no = board_no;
   }
  
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public Date getReg_time() {
      return reg_time;
   }
   public void setReg_time(Date reg_time) {
      this.reg_time = reg_time;
   }

   public String getImg_url() {
      return img_url;
   }
   public void setImg_url(String img_url) {
      this.img_url = img_url;
   }
   
}