package com.dine.root.member.dto;

public class MemDTO {
private String id;
private String pwd;
private String email;
private String email_auth;
private String name;
private String liked_rest;
private String session_id;
private java.sql.Date session_date;
private String naverlogin;
private String kakaologin;

public String getNaverlogin() {
	return naverlogin;
}
public void setNaverlogin(String naverlogin) {
	this.naverlogin = naverlogin;
}
public String getKakaologin() {
	return kakaologin;
}
public void setKakaologin(String kakaologin) {
	this.kakaologin = kakaologin;
}


public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getEmail_auth() {
	return email_auth;
}
public void setEmail_auth(String email_auth) {
	this.email_auth = email_auth;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getLiked_rest() {
	return liked_rest;
}
public void setLiked_rest(String liked_rest) {
	this.liked_rest = liked_rest;
}
public String getSession_id() {
	return session_id;
}
public void setSession_id(String session_id) {
	this.session_id = session_id;
}
public java.sql.Date getSession_date() {
	return session_date;
}
public void setSession_date(java.sql.Date session_date) {
	this.session_date = session_date;
}




}
