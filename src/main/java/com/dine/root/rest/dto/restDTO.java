package com.dine.root.rest.dto;

// 음식점 
public class restDTO {
   // 아이디 
   private Integer id;

   // 음식점이름 
   private String name;

   // 주소 
   private String addr;

   // 영업시간 
   private String hours;

   // 전화번호 
   private String tel;

   // 서브설명 
   private String subEx;

   // 주설명 
   private String mainEx;

   // 메뉴갯수 
   private int menuCnt;

   // 위치 위도,경도
   private String coordinate;

   // 총별점 
   private int rateAll;

   // 평가해준총인원 
   private int rateCnt;

   // 평균평점 
   private double rateAvr;
   // 국가
   private String nation;
   // 위도경도인듯
   private double lat;
   private double lng;
   // 메인사진 
   private String restPic;
   // rest_mainpic
   private String mainPic;
   // 카테고리 1
   private String category1;
   // 카테고리 2
   private String category2;
   
   public String getMainPic() {
      return mainPic;
   }

   public void setMainPic(String mainPic) {
      this.mainPic = mainPic;
   }

   public String getCategory1() {
      return category1;
   }

   public void setCategory1(String category1) {
      this.category1 = category1;
   }

   public String getCategory2() {
      return category2;
   }

   public void setCategory2(String category2) {
      this.category2 = category2;
   }

   public String getNation() {
      return nation;
   }

   public void setNation(String nation) {
      this.nation = nation;
   }

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

   public Integer getId() {
      return id;
   }

   public void setId(Integer id) {
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

   public String getHours() {
      return hours;
   }

   public void setHours(String hours) {
      this.hours = hours;
   }

   public String getTel() {
      return tel;
   }

   public void setTel(String tel) {
      this.tel = tel;
   }

   public String getSubEx() {
      return subEx;
   }

   public void setSubEx(String subEx) {
      this.subEx = subEx;
   }

   public String getMainEx() {
      return mainEx;
   }

   public void setMainEx(String mainEx) {
      this.mainEx = mainEx;
   }

   public int getMenuCnt() {
      return menuCnt;
   }

   public void setMenuCnt(int menuCnt) {
      this.menuCnt = menuCnt;
   }

   public String getCoordinate() {
      return coordinate;
   }

   public void setCoordinate(String coordinate) {
      this.coordinate = coordinate;
   }

   public int getRateAll() {
      return rateAll;
   }

   public void setRateAll(int rateAll) {
      this.rateAll = rateAll;
   }

   public int getRateCnt() {
      return rateCnt;
   }

   public void setRateCnt(int rateCnt) {
      this.rateCnt = rateCnt;
   }

   public double getRateAvr() {
      return rateAvr;
   }

   public void setRateAvr(double rateAvr) {
      this.rateAvr = rateAvr;
   }

   public String getRestPic() {
      return restPic;
   }

   public void setRestPic(String restPic) {
      this.restPic = restPic;
   }

}