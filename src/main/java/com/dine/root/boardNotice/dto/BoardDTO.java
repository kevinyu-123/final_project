package com.dine.root.boardNotice.dto;

import java.sql.Date;

public class BoardDTO {
	private int comment_no;
	private int origin_no;
	private int group_ord;
	private int group_layer;
	private String title;
	private String content;
	private String writer;
	private Date reg_time;
	private int views;
	private String board_category;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getOrigin_no() {
		return origin_no;
	}
	public void setOrigin_no(int origin_no) {
		this.origin_no = origin_no;
	}
	public int getGroup_ord() {
		return group_ord;
	}
	public void setGroup_ord(int group_ord) {
		this.group_ord = group_ord;
	}
	public int getGroup_layer() {
		return group_layer;
	}
	public void setGroup_layer(int group_layer) {
		this.group_layer = group_layer;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
}

