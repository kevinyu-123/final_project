package com.dine.root.map.dto;

public class MapDTO {
   private int id;
   private String name;
   private String addr;
   private String open_hours;
   private String tel;
   private String sub_ex;
   private String main_ex;
   private int menu_cnt;
   private String coordinate;
   private String nation;
   private int rate_all;
   private int rate_cnt;
   private int rate_avr;
   private double lat;
   private double lng; 
   
   public double getLat() {
      return lat;
   }
   public void setLat(double lat) {
      this.lat = lat;
   }
   public double getLng() {
      return lng;
   }
   public void setLng(double lng) {
      this.lng = lng;
   }
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getAddr() {
      return addr;
   }
   public void setAddr(String addr) {
      this.addr = addr;
   }
   public String getOpen_hours() {
      return open_hours;
   }
   public void setOpen_hours(String open_hours) {
      this.open_hours = open_hours;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   public String getSub_ex() {
      return sub_ex;
   }
   public void setSub_ex(String sub_ex) {
      this.sub_ex = sub_ex;
   }
   public String getMain_ex() {
      return main_ex;
   }
   public void setMain_ex(String main_ex) {
      this.main_ex = main_ex;
   }
   public int getMenu_cnt() {
      return menu_cnt;
   }
   public void setMenu_cnt(int menu_cnt) {
      this.menu_cnt = menu_cnt;
   }
   public String getCoordinate() {
      return coordinate;
   }
   public void setCoordinate(String coordinate) {
      this.coordinate = coordinate;
   }
   public String getNation() {
      return nation;
   }
   public void setNation(String nation) {
      this.nation = nation;
   }
   public int getRate_all() {
      return rate_all;
   }
   public void setRate_all(int rate_all) {
      this.rate_all = rate_all;
   }
   public int getRate_cnt() {
      return rate_cnt;
   }
   public void setRate_cnt(int rate_cnt) {
      this.rate_cnt = rate_cnt;
   }
   public int getRate_avr() {
      return rate_avr;
   }
   public void setRate_avr(int rate_avr) {
      this.rate_avr = rate_avr;
   }
   
   
}