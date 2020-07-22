package com.kh.chickenPeople.main.model.vo;

import java.io.Serializable;

public class BestMenu implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4594578459324624783L;

	private String menu_name;
	private String menu_pic;
	private String brand_name;
	private int mord_num;
	private String brand_code;
	public BestMenu() {
	}
	public BestMenu(String menu_name, String menu_pic, String brand_name, int mord_num, String brand_code) {
		this.menu_name = menu_name;
		this.menu_pic = menu_pic;
		this.brand_name = brand_name;
		this.mord_num = mord_num;
		this.brand_code = brand_code;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_pic() {
		return menu_pic;
	}
	public void setMenu_pic(String menu_pic) {
		this.menu_pic = menu_pic;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public int getMord_num() {
		return mord_num;
	}
	public void setMord_num(int mord_num) {
		this.mord_num = mord_num;
	}
	public String getBrand_code() {
		return brand_code;
	}
	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "BestMenu [menu_name=" + menu_name + ", menu_pic=" + menu_pic + ", brand_name=" + brand_name
				+ ", mord_num=" + mord_num + ", brand_code=" + brand_code + "]";
	}
	
	
	
	
}
