package com.kh.chickenPeople.storeMenu.model.vo;

import java.io.Serializable;

public class StoreMenu implements Serializable{
	
	private String menuCode;
	private String brandCode;
	private String brandName;
	private String menuPic;
	private String catName;
	private String menuName;
	private int menuPrice;
	private String menuExp;
	
	
	
	
	public StoreMenu() {
		super();
	}




	public StoreMenu(String menuCode, String brandCode, String brandName, String menuPic, String catName,
			String menuName, int menuPrice, String menuExp) {
		super();
		this.menuCode = menuCode;
		this.brandCode = brandCode;
		this.brandName = brandName;
		this.menuPic = menuPic;
		this.catName = catName;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuExp = menuExp;
	}




	public String getMenuCode() {
		return menuCode;
	}




	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}




	public String getBrandCode() {
		return brandCode;
	}




	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}




	public String getBrandName() {
		return brandName;
	}




	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}




	public String getMenuPic() {
		return menuPic;
	}




	public void setMenuPic(String menuPic) {
		this.menuPic = menuPic;
	}




	public String getCatName() {
		return catName;
	}




	public void setCatName(String catName) {
		this.catName = catName;
	}




	public String getMenuName() {
		return menuName;
	}




	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}




	public int getMenuPrice() {
		return menuPrice;
	}




	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}




	public String getMenuExp() {
		return menuExp;
	}




	public void setMenuExp(String menuExp) {
		this.menuExp = menuExp;
	}




	@Override
	public String toString() {
		return "StoreMenu [menuCode=" + menuCode + ", brandCode=" + brandCode + ", brandName=" + brandName
				+ ", menuPic=" + menuPic + ", catName=" + catName + ", menuName=" + menuName + ", menuPrice="
				+ menuPrice + ", menuExp=" + menuExp + "]";
	}








	
	
	

}
