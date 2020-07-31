package com.kh.chickenPeople.menu.model.vo;

import java.io.Serializable;

public class Menu implements Serializable{

	private static final long serialVersionUID = 6609241075928010141L;
	
	//VIEW NAME - ADMIN_MENU
	private int menu_Num;			//메뉴 번호
	private String brand_Name;		//브랜드 이름
	private String brand_Code;		//브랜드 코드
	private String menu_Name;		//메뉴 이름
	private String menu_Price;		//메뉴 가격
	private String menu_Exp;		//메뉴 설명
	private String menu_Yn;			//메뉴 등재 여부
	private String cat_Name;		//카테고리 이름
	private String cat_Code;		//카테고리 코드
	private String menu_Pic;		//메뉴 사진
		
	public Menu() {}

	public Menu(int menu_Num, String brand_Name, String brand_Code, String menu_Name, String menu_Price,
			String menu_Exp, String menu_Yn, String cat_Name, String cat_Code, String menu_Pic) {
		super();
		this.menu_Num = menu_Num;
		this.brand_Name = brand_Name;
		this.brand_Code = brand_Code;
		this.menu_Name = menu_Name;
		this.menu_Price = menu_Price;
		this.menu_Exp = menu_Exp;
		this.menu_Yn = menu_Yn;
		this.cat_Name = cat_Name;
		this.cat_Code = cat_Code;
		this.menu_Pic = menu_Pic;
	}

	public int getMenu_Num() {
		return menu_Num;
	}

	public void setMenu_Num(int menu_Num) {
		this.menu_Num = menu_Num;
	}

	public String getBrand_Name() {
		return brand_Name;
	}

	public void setBrand_Name(String brand_Name) {
		this.brand_Name = brand_Name;
	}

	public String getBrand_Code() {
		return brand_Code;
	}

	public void setBrand_Code(String brand_Code) {
		this.brand_Code = brand_Code;
	}

	public String getMenu_Name() {
		return menu_Name;
	}

	public void setMenu_Name(String menu_Name) {
		this.menu_Name = menu_Name;
	}

	public String getMenu_Price() {
		return menu_Price;
	}

	public void setMenu_Price(String menu_Price) {
		this.menu_Price = menu_Price;
	}

	public String getMenu_Exp() {
		return menu_Exp;
	}

	public void setMenu_Exp(String menu_Exp) {
		this.menu_Exp = menu_Exp;
	}

	public String getMenu_Yn() {
		return menu_Yn;
	}

	public void setMenu_Yn(String menu_Yn) {
		this.menu_Yn = menu_Yn;
	}

	public String getCat_Name() {
		return cat_Name;
	}

	public void setCat_Name(String cat_Name) {
		this.cat_Name = cat_Name;
	}

	public String getCat_Code() {
		return cat_Code;
	}

	public void setCat_Code(String cat_Code) {
		this.cat_Code = cat_Code;
	}

	public String getMenu_Pic() {
		return menu_Pic;
	}

	public void setMenu_Pic(String menu_Pic) {
		this.menu_Pic = menu_Pic;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Menu [menu_Num=" + menu_Num + ", brand_Name=" + brand_Name + ", brand_Code=" + brand_Code
				+ ", menu_Name=" + menu_Name + ", menu_Price=" + menu_Price + ", menu_Exp=" + menu_Exp + ", menu_Yn="
				+ menu_Yn + ", cat_Name=" + cat_Name + ", cat_Code=" + cat_Code + ", menu_Pic=" + menu_Pic + "]";
	}

	
		
	

}
