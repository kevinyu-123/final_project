package com.dine.root.rest.dto;

public class menuDTO {
    // 아이디 
    private Integer id;

    // 음식점id 
    private Integer restId;

    // 메뉴이름 
    private String name;

    // 메뉴사진 
    private String pic;

    // 메뉴설명 
    private String ex;

    // 메뉴가격 
    private int price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRestId() {
        return restId;
    }

    public void setRestId(Integer restId) {
        this.restId = restId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getEx() {
        return ex;
    }

    public void setEx(String ex) {
        this.ex = ex;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
